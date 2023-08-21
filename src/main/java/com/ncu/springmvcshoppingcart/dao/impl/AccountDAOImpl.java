package com.ncu.springmvcshoppingcart.dao.impl;



import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ncu.springmvcshoppingcart.dao.AccountDAO;
import com.ncu.springmvcshoppingcart.entity.Account;
import com.ncu.springmvcshoppingcart.entity.Order;
import com.ncu.springmvcshoppingcart.model.AccountInfo;
 
// Transactional for Hibernate
@Transactional
public class AccountDAOImpl implements AccountDAO {
    
   
	@Autowired
    private SessionFactory sessionFactory;
 
    @Override
    public Account findAccount(String userName ) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Account.class);
        crit.add(Restrictions.eq("userName", userName));
        return (Account) crit.uniqueResult();
    }

    @Override
	public Account addAccount(AccountInfo account) {
    	 Session session = sessionFactory.getCurrentSession();
    	 
        
         Account a = new Account();
         
         a.setUserName(account.getUserName());
         a.setPassword(account.getPassword());
         a.setActive(account.isActive());
         a.setUserRole(account.getUserRole());
         
         this.sessionFactory.getCurrentSession().persist(a);
		return null;
	}
 
}