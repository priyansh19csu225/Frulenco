package com.ncu.springmvcshoppingcart.dao.impl;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ncu.springmvcshoppingcart.dao.ProductDAO;
import com.ncu.springmvcshoppingcart.entity.Product;
import com.ncu.springmvcshoppingcart.model.PaginationResult;
import com.ncu.springmvcshoppingcart.model.ProductInfo;
 

@Transactional
public class ProductDAOImpl implements ProductDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    @Override
    public Product findProduct(String code) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Product.class);
        crit.add(Restrictions.eq("code", code));
        return (Product) crit.uniqueResult();
    }
     
    @Override
    public ProductInfo findProductInfo(String code) {
        Product product = this.findProduct(code);
        if (product == null) {
            return null;
        }
        return new ProductInfo(product.getCode(), product.getName(), product.getPrice(), product.getLocation(), product.getCategory());
    }
 
    @Override
	public String delete(String code) {
    	Session session = sessionFactory.getCurrentSession();
    	Product product = this.findProduct(code);
    	try {
    	this.sessionFactory.getCurrentSession().delete(product);
    	}
    	catch(Exception e) {
    		
    	}
    	return "redirect:/productList";
	}

	@Override
    public void save(ProductInfo productInfo) {
        String code = productInfo.getCode();
 
        Product product = null;
 
        boolean isNew = false;
        if (code != null) {
            product = this.findProduct(code);
        }
        if (product == null) {
            isNew = true;
            product = new Product();
            product.setCreateDate(new Date());
        }
        product.setCode(code);
        product.setName(productInfo.getName());
        product.setPrice(productInfo.getPrice());
        product.setLocation(productInfo.getLocation());
        product.setCategory(productInfo.getCategory());
 
        if (productInfo.getFileData() != null) {
            byte[] image = productInfo.getFileData().getBytes();
            if (image != null && image.length > 0) {
                product.setImage(image);
            }
        }
        if (isNew) {
            this.sessionFactory.getCurrentSession().persist(product);
        }
        // If error in DB, Exceptions will be thrown out immediately
        // Nếu có lỗi tại DB, ngoại lệ sẽ ném ra ngay lập tức
        this.sessionFactory.getCurrentSession().flush();
    }
 
  
    @Override
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.code, p.name, p.price) " + " from "//
                + Product.class.getName() + " p " + " Where p.location = " + " '" + com.ncu.springmvcshoppingcart.controller.MainController.loc + "' "   ;
        if(com.ncu.springmvcshoppingcart.controller.MainController.cat != null) {
        	sql += " and p.category = " + " '" + com.ncu.springmvcshoppingcart.controller.MainController.cat + "' "   ;
        }
        if (likeName != null && likeName.length() > 0) {
            sql += " and lower(p.name) like :likeName ";
        }
        sql += " order by p.createDate desc ";
        //
        Session session = sessionFactory.getCurrentSession();
 
        Query query = session.createQuery(sql);
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    @Override
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage) {
        return queryProducts(page, maxResult, maxNavigationPage, null);
    }
    
}