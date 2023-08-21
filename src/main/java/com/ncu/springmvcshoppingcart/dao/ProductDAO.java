package com.ncu.springmvcshoppingcart.dao;

import com.ncu.springmvcshoppingcart.entity.Product;
import com.ncu.springmvcshoppingcart.model.PaginationResult;
import com.ncu.springmvcshoppingcart.model.ProductInfo;
 
public interface ProductDAO {
 
    
    
    public Product findProduct(String code);
    
    public ProductInfo findProductInfo(String code) ;
  
    
    public PaginationResult<ProductInfo> queryProducts(int page,
                       int maxResult, int maxNavigationPage  );
    
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
                       int maxNavigationPage, String likeName);
 
    public void save(ProductInfo productInfo);

	public String delete(String code);
    
    
    
}