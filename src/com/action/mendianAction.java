package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TGonggaoDAO;
import com.dao.TMendianDAO;
import com.model.TAdmin;
import com.model.TGonggao;
import com.model.TMendian;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class mendianAction extends ActionSupport
{
	private Integer id;
	private String sheng;
	private String shi;
	private String mingcheng;

	private String dizhi;
	private String dianhua;
	private String jianjie;
	private String xingming;

	private String loginname;
	private String loginpw;
	
		
	private TMendianDAO mendianDAO;
	
	public String mendianAdd()
	{
		TMendian mendian=new TMendian();
		
		mendian.setSheng(sheng);
		mendian.setShi(shi);
		mendian.setMingcheng(mingcheng);
		mendian.setDizhi(dizhi);
		
		mendian.setDianhua(dianhua);
		mendian.setJianjie(jianjie);
		mendian.setXingming(xingming);
		mendian.setLoginname(loginname);
		
		mendian.setLoginpw(loginpw);
		mendian.setDel("no");
		
		mendianDAO.save(mendian);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "门店添加成功");
		return "msg";
	}
	
	
	public String mendianMana()
	{
		String sql="from TMendian where del='no' order by sheng,shi";
		List mendianList =mendianDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("mendianList", mendianList);
		return ActionSupport.SUCCESS;
	}
	
	public String mendianDel()
	{
		TMendian mendian=mendianDAO.findById(id);
		mendian.setDel("yes");
		mendianDAO.attachDirty(mendian);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "门店删除成功");
		return "msg";
	}
	
	public String mendianSearch()
	{
		String sql="from TMendian where del='no' and sheng=? and shi=?";
		Object[] con={sheng,shi};
		List mendianList =mendianDAO.getHibernateTemplate().find(sql,con);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("mendianList", mendianList);
		return ActionSupport.SUCCESS;
	}
		
	public String mendianDetailQian()
	{
		TMendian mendian=mendianDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("mendian", mendian);
		return ActionSupport.SUCCESS;
	}


	public String getDianhua()
	{
		return dianhua;
	}


	public void setDianhua(String dianhua)
	{
		this.dianhua = dianhua;
	}


	public String getDizhi()
	{
		return dizhi;
	}


	public void setDizhi(String dizhi)
	{
		this.dizhi = dizhi;
	}


	public Integer getId()
	{
		return id;
	}


	public void setId(Integer id)
	{
		this.id = id;
	}


	public String getJianjie()
	{
		return jianjie;
	}


	public void setJianjie(String jianjie)
	{
		this.jianjie = jianjie;
	}


	public String getLoginname()
	{
		return loginname;
	}


	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}


	public String getLoginpw()
	{
		return loginpw;
	}


	public void setLoginpw(String loginpw)
	{
		this.loginpw = loginpw;
	}


	public TMendianDAO getMendianDAO()
	{
		return mendianDAO;
	}


	public void setMendianDAO(TMendianDAO mendianDAO)
	{
		this.mendianDAO = mendianDAO;
	}


	public String getMingcheng()
	{
		return mingcheng;
	}


	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}


	public String getSheng()
	{
		return sheng;
	}


	public void setSheng(String sheng)
	{
		this.sheng = sheng;
	}


	public String getShi()
	{
		return shi;
	}


	public void setShi(String shi)
	{
		this.shi = shi;
	}


	public String getXingming()
	{
		return xingming;
	}


	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}
	
}
