package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TAdminDAO;
import com.dao.TMendianDAO;
import com.dao.TUserDAO;
import com.model.TAdmin;
import com.model.TMendian;
import com.model.TUser;

public class loginService
{
	private TAdminDAO adminDAO;
	private TUserDAO userDAO;
	private TMendianDAO mendianDAO;
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}
	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	
	public TMendianDAO getMendianDAO()
	{
		return mendianDAO;
	}
	public void setMendianDAO(TMendianDAO mendianDAO)
	{
		this.mendianDAO = mendianDAO;
	}
	public String login(String userName,String userPw,int userType)
	{
		System.out.println("userType"+userType);
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		
		if(userType==0)//系统管理员登陆
		{
			String sql="from TAdmin where userName=? and userPw=?";
			Object[] con={userName,userPw};
			List adminList=adminDAO.getHibernateTemplate().find(sql,con);
			if(adminList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TAdmin admin=(TAdmin)adminList.get(0);
				 session.setAttribute("userType", 0);
	             session.setAttribute("admin", admin);
	             result="yes";
			}
		}
		if(userType==1)
		{
			String sql="from TUser where userName=? and userPw=?";
			Object[] con={userName,userPw};
			List userList=userDAO.getHibernateTemplate().find(sql,con);
			if(userList.size()==0)
			{
				result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TUser user=(TUser)userList.get(0);
				 session.setAttribute("userType", 1);
	             session.setAttribute("user", user);
	             result=user.getUserId().toString();
			}
		}
		if(userType==2)
		{
			String sql="from TMendian where del='no' and loginname=? and loginpw=?";
			Object[] con={userName.trim(),userPw.trim()};
			List mendianList =mendianDAO.getHibernateTemplate().find(sql,con);
			if(mendianList.size()==0)
			{
				result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TMendian mendian=(TMendian)mendianList.get(0);
				 session.setAttribute("userType", 2);
	             session.setAttribute("mendian", mendian);
	             result="yes";
			}
		}
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		admin.setUserPw(userPwNew);
		
		adminDAO.getHibernateTemplate().update(admin);
		session.setAttribute("admin", admin);
		
		return "yes";
    }
	
    
    public String mendianPwEdit(String loginpw1)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TMendian mendian=(TMendian)session.getAttribute("mendian");
		mendian.setLoginpw(loginpw1);
		
		mendianDAO.getHibernateTemplate().update(mendian);
		session.setAttribute("mendian", mendian);
		
		return "yes";
    }
}
