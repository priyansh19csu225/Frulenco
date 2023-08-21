package com.ncu.springmvcshoppingcart.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;
 
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;

import com.ncu.springmvcshoppingcart.dao.AccountDAO;
import com.ncu.springmvcshoppingcart.dao.OrderDAO;
import com.ncu.springmvcshoppingcart.dao.ProductDAO;
import com.ncu.springmvcshoppingcart.entity.Account;
import com.ncu.springmvcshoppingcart.entity.Order;
import com.ncu.springmvcshoppingcart.entity.OrderDetail;
import com.ncu.springmvcshoppingcart.entity.Product;
import com.ncu.springmvcshoppingcart.model.CartInfo;
import com.ncu.springmvcshoppingcart.model.CartLineInfo;
import com.ncu.springmvcshoppingcart.model.CustomerInfo;
import com.ncu.springmvcshoppingcart.model.OrderDetailInfo;
import com.ncu.springmvcshoppingcart.model.OrderInfo;
import com.ncu.springmvcshoppingcart.model.PaginationResult;
 
//Transactional for Hibernate
@Transactional
public class OrderDAOImpl implements OrderDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    @Autowired
    private ProductDAO productDAO;
    
    String username;
    private int getMaxOrderNum() {
        String sql = "Select max(o.orderNum) from " + Order.class.getName() + " o ";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(sql);
        Integer value = (Integer) query.uniqueResult();
        if (value == null) {
            return 0;
        }
        return value;
    }
 
    @Override
    public void saveOrder(CartInfo cartInfo) {
        Session session = sessionFactory.getCurrentSession();
 
        int orderNum = this.getMaxOrderNum() + 1;
        System.out.println("ordernum =" + orderNum);
        Order order = new Order();
 
        order.setId(UUID.randomUUID().toString());
        order.setOrderNum(orderNum);
        order.setOrderDate(new Date());
        order.setAmount(cartInfo.getAmountTotal());
 
        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if ( principal instanceof UserDetails) {
        	 username = ((UserDetails)principal).getUsername();
        }
        else {
        	username = principal.toString();
        }
        order.setCustomerName( username + "_" +customerInfo.getName() );
        order.setCustomerEmail(customerInfo.getEmail());
        order.setCustomerPhone(customerInfo.getPhone());
        order.setCustomerAddress(customerInfo.getAddress());
               
 
        session.persist(order);
 
        List<CartLineInfo> lines = cartInfo.getCartLines();
 
        for (CartLineInfo line : lines) {
            OrderDetail detail = new OrderDetail();
            detail.setId(UUID.randomUUID().toString());
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());
            detail.setQuantity(line.getQuantity());
 
            String code = line.getProductInfo().getCode();
            Product product = this.productDAO.findProduct(code);
            detail.setProduct(product);
 
            session.persist(detail);
        }
 
        // Set OrderNum for report.
        // Set OrderNum để thông báo cho người dùng.
        cartInfo.setOrderNum(orderNum);
    }
 
    // @page = 1, 2, ...
    @Override
    public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage) {
    	 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
         if ( principal instanceof UserDetails) {
         	 username = ((UserDetails)principal).getUsername();
         }
         else {
         	username = principal.toString();
         }
         String sql;
    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	 boolean hasUserRole = authentication.getAuthorities().stream()
    			 .anyMatch(r -> r.getAuthority().equals("ROLE_USER"));
    	 if(hasUserRole == true)
    	 {
    		 System.out.print("in order save ehhg");
    		 sql = "Select new " + OrderInfo.class.getName()//
    	                + "(ord.id, ord.orderDate, ord.orderNum, ord.amount, "
    	                +" ord.customerName, ord.customerAddress, ord.customerEmail, ord.customerPhone) " + " from "
    	                + Order.class.getName() + " ord " + "Where ord.customerName LIKE CONCAT('"+username+"','%')";
    	 }
    	 else {
         sql = "Select new " + OrderInfo.class.getName()//
                + "(ord.id, ord.orderDate, ord.orderNum, ord.amount, "
                +" ord.customerName, ord.customerAddress, ord.customerEmail, ord.customerPhone) " + " from "
                + Order.class.getName() + " ord "//
                + " order by ord.orderNum desc";
    	 }
        Session session = this.sessionFactory.getCurrentSession();
 
        Query query = session.createQuery(sql);
 
        return new PaginationResult<OrderInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public Order findOrder(String orderId) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Order.class);
        crit.add(Restrictions.eq("id", orderId));
        return (Order) crit.uniqueResult();
    }
 
    @Override
    public OrderInfo getOrderInfo(String orderId) {
        Order order = this.findOrder(orderId);
        if (order == null) {
            return null;
        }
        return new OrderInfo(order.getId(), order.getOrderDate(), //
                order.getOrderNum(), order.getAmount(), order.getCustomerName(), //
                order.getCustomerAddress(), order.getCustomerEmail(), order.getCustomerPhone());
    }
 
    @Override
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId) {
        String sql = "Select new " + OrderDetailInfo.class.getName() //
                + "(d.id, d.product.code, d.product.name , d.quantity,d.price,d.amount) "//
                + " from " + OrderDetail.class.getName() + " d "//
                + " where d.order.id = :orderId ";
 
        Session session = this.sessionFactory.getCurrentSession();
 
        Query query = session.createQuery(sql);
        query.setParameter("orderId", orderId);
 
        return query.list();
    }
 
}