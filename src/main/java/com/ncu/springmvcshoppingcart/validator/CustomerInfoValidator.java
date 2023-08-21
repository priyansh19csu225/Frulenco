package com.ncu.springmvcshoppingcart.validator;

import java.util.regex.Pattern;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ncu.springmvcshoppingcart.model.CustomerInfo;
 
// @Component: As a Bean.
@Component
public class CustomerInfoValidator implements Validator {
 
    private EmailValidator emailValidator = EmailValidator.getInstance();
 
    // This Validator support CustomerInfo class.
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == CustomerInfo.class;
    }
 
    @Override
    public void validate(Object target, Errors errors) {
        CustomerInfo custInfo = (CustomerInfo) target;
 
        // Check the fields of CustomerInfo class.
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.customerForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.customerForm.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty.customerForm.address");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty.customerForm.phone");
        
        
        Pattern pattern1 = Pattern.compile("[a-z]{3,30}", Pattern.CASE_INSENSITIVE);
        
        if ((custInfo.getName()!="")&& (!(pattern1.matcher(custInfo.getName()).matches()))){
            errors.rejectValue("name", "Pattern.customerForm.name");
         }
        
        if ((custInfo.getEmail()!="")&& (!emailValidator.isValid(custInfo.getEmail()))) {
            errors.rejectValue("email", "Pattern.customerForm.email");
        }
        
        Pattern pattern = Pattern.compile("^[0-9]{10,10}$",Pattern.CASE_INSENSITIVE);
        
          if ((custInfo.getPhone()!="") && (!(pattern.matcher(custInfo.getPhone()).matches()))) {
             errors.rejectValue("phone", "Pattern.customerForm.phone");
          
        }
    }
 
}