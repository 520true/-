package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TRuzhuDAO;
import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
    private int userId;
	private String userName;
	private String userPw;
	private String userRealname;
	
	private String userAddress;
	private String userSex;
	private String userTel;
	private String userEmail;
	
	private String userQq;
	private String fujian;
	
   
	
	
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	private TRuzhuDAO ruzhuDAO;
	
	
	public String userReg()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TUser where userName='"+userName.trim()+"'";
		List list=userDAO.getHibernateTemplate().find(sql);
		if(list.size()>0)
		{
			request.put("msg", "用户名重复。请重新输入");
		}
		else
		{
			TUser user=new TUser();
			
			user.setUserName(userName.trim());
			user.setUserPw(userPw);
			user.setUserAddress(userAddress);
			user.setUserTel(userTel);
			
			user.setUserRealname(userRealname);
			user.setUserEmail(userEmail);
			user.setUserSex(userSex);
			user.setUserQq(userQq);
			
			user.setFujian(fujian.equals("")==true?"/img/none.gif":fujian);
			user.setUserType("普通会员");
			user.setUserDel("no");
			
			userDAO.save(user);
			
			
			request.put("msg", "注册成功。请登录");
		}
		
		return "msg";
	}
	
	public String userEdit()
	{
		TUser user=userDAO.findById(userId);
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserSex(userSex);
		user.setUserQq(userQq);
		user.setFujian(fujian);
		
		userDAO.getHibernateTemplate().update(user);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功");
		return "msg";
		
	}
	
	
	public String userinfo()
	{
		TUser user=userDAO.findById(userId);
		
		String sql="from TRuzhu where userId=? and tuifangshijian !=''";
		Object[] o={userId};
		List ruzhuList=ruzhuDAO.getHibernateTemplate().find(sql,o);
		
		
		//会员设置按照住宿次数超过3次为一级会员	，5次为二级会员 ， 10次为三级会员,3次以下为初级会员
		String s="";
		int i=ruzhuList.size();
		if(i<3)
		{
			s="您住宿次数是："+i+","+"会员级别是初级会员";
		}
		if(i>=3 && i<=5)
		{
			s="您住宿次数是："+i+","+"会员级别是一级会员";
		}
		if(i>5)
		{
			s="您住宿次数是："+i+","+"会员级别是二级会员";
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		request.put("s", s);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userEditPre()
	{
		TUser user=userDAO.findById(userId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		session.remove("userType");
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.attachDirty(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	public TRuzhuDAO getRuzhuDAO()
	{
		return ruzhuDAO;
	}

	public void setRuzhuDAO(TRuzhuDAO ruzhuDAO)
	{
		this.ruzhuDAO = ruzhuDAO;
	}

	public String userDetail()
	{
		String sql = "from TUser where userId="+userId;
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userMana()
	{
		String sql = "from TUser where userDel='no' and userType='普通会员'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String getUserAddress()
	{
		return userAddress;
	}

	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}

	public String getFujian()
	{
		return fujian;
	}
	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}
	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public String getUserQq()
	{
		return userQq;
	}

	public void setUserQq(String userQq)
	{
		this.userQq = userQq;
	}

	public String getUserRealname()
	{
		return userRealname;
	}

	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}

	public String getUserSex()
	{
		return userSex;
	}

	public void setUserSex(String userSex)
	{
		this.userSex = userSex;
	}

	public String getUserTel()
	{
		return userTel;
	}

	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}

	public int getUserId()
	{
		return userId;
	}


	public void setUserId(int userId)
	{
		this.userId = userId;
	}


	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public String getMessage()
	{
		return message;
	}


	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	
}
