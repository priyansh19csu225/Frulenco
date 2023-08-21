package com.ncu.springmvcshoppingcart.dao;
 
import java.util.List;

import com.ncu.springmvcshoppingcart.model.CartInfo;
import com.ncu.springmvcshoppingcart.model.OrderDetailInfo;
import com.ncu.springmvcshoppingcart.model.OrderInfo;
import com.ncu.springmvcshoppingcart.model.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public OrderInfo getOrderInfo(String orderId);
    
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
 
}
