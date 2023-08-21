package com.ncu.springmvcshoppingcart.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.ncu.springmvcshoppingcart.validator.IsValidPassword;

public class AccountInfo {
	
	public static final String ROLE_MANAGER = "MANAGER";
    public static final String ROLE_EMPLOYEE = "EMPLOYEE";
    public static final String ROLE_USER = "USER";
    
    @NotEmpty
	@Size(min=4, message="Minimum four characters are required")
	private String userName;
	
    @NotEmpty(message="is required")
	@IsValidPassword
	private String password;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	 private boolean active;
	    private String userRole;


		public boolean isActive() {
			return active;
		}
		public void setActive(boolean active) {
			this.active = active;
		}
		public String getUserRole() {
			return userRole;
		}
		public void setUserRole(String userRole) {
			this.userRole = userRole;
		}
	    


	

}
