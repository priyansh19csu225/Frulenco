package com.ncu.springmvcshoppingcart.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ncu.springmvcshoppingcart.dao.ProductDAO;
import com.ncu.springmvcshoppingcart.entity.Product;
import com.ncu.springmvcshoppingcart.model.ProductInfo;
 
// @Component: As a Bean.
@Component
public class ProductInfoValidator implements Validator {
 
    @Autowired
    private ProductDAO productDAO;
 
    // This Validator support ProductInfo class.
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == ProductInfo.class;
    }
 
    @Override
    public void validate(Object target, Errors errors) {
        ProductInfo productInfo = (ProductInfo) target;
 
        // Check the fields of ProductInfo class.
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.productForm.code");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.productForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty.productForm.price");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location", "NotEmpty.productForm.location");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category", "NotEmpty.productForm.category");
        String code = productInfo.getCode();
        if (code != null && code.length() > 0) {
            if (code.matches("\\s+")) {
                errors.rejectValue("code", "Pattern.productForm.code");
            } else if(productInfo.isNewProduct()) {
                Product product = productDAO.findProduct(code);
                if (product != null) {
                    errors.rejectValue("code", "Duplicate.productForm.code");
                }
            }
        }
    }
 
}