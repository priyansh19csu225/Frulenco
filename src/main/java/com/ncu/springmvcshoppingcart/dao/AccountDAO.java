package com.ncu.springmvcshoppingcart.dao;
 
import com.ncu.springmvcshoppingcart.entity.Account;
import com.ncu.springmvcshoppingcart.model.AccountInfo;
 
public interface AccountDAO {
 
    
    public Account findAccount(String userName );
    public Account addAccount(AccountInfo account);
    
    
    
}
