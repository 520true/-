package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TKefangDAO;
import com.dao.TRuzhuDAO;
import com.dao.TUserDAO;
import com.dao.TYudingDAO;
import com.model.TKefang;
import com.model.TMendian;
import com.model.TRuzhu;
import com.model.TUser;
import com.model.TYuding;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ruzhuAction extends ActionSupport
{
	private TRuzhuDAO ruzhuDAO;
	private TKefangDAO kefangDAO;
	private TYudingDAO yudingDAO;
	
	public String ruzhuAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		TRuzhu ruzhu=new TRuzhu();
		
		ruzhu.setUserId(Integer.parseInt(request.getParameter("userId")));
		ruzhu.setKefangId(Integer.parseInt(request.getParameter("kefangId")));
		ruzhu.setMendianId(Integer.parseInt(request.getParameter("mendianId")));
		ruzhu.setDengjixingming(request.getParameter("dengjixingming"));
		
		ruzhu.setShenfenzheng(request.getParameter("shenfenzheng"));
		ruzhu.setRuzhushijian(request.getParameter("ruzhushijian"));
		ruzhu.setTuifangshijian("");
		ruzhu.setZongfeiyong(0);
		
		ruzhuDAO.save(ruzhu);
		
		TKefang kefang=kefangDAO.findById(Integer.parseInt(request.getParameter("kefangId")));
		kefang.setZhuangtai("已入住");
		kefangDAO.attachDirty(kefang);
		
		TYuding yuding=yudingDAO.findById(Integer.parseInt(request.getParameter("yudingId")));
		yudingDAO.delete(yuding);
		
		
		request.setAttribute("msg", "操作成功");
		return "msg";
	}
	
	
	public String ruzhuMana()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=(Map)ActionContext.getContext().getSession();
		TMendian mendian=(TMendian)session.get("mendian");
		
		String sql="from TRuzhu where mendianId="+mendian.getId()+"order by tuifangshijian";
		List ruzhuList=ruzhuDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<ruzhuList.size();i++)
		{
			TRuzhu ruzhu=(TRuzhu)ruzhuList.get(i);
			ruzhu.setKefang(kefangDAO.findById(ruzhu.getKefangId()));
		}
		request.put("ruzhuList", ruzhuList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String tuifangPre()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		
		TRuzhu ruzhu=ruzhuDAO.findById(id);
		int userId=ruzhu.getUserId();
		
		
		String sql="from TRuzhu where userId=? and tuifangshijian !=''";
		Object[] o={userId};
		List ruzhuList=ruzhuDAO.getHibernateTemplate().find(sql,o);
		
		
		//会员设置按照住宿次数超过3次为一级会员	，5次为二级会员 ， 10次为三级会员,3次以下为初级会员
		String s="";
		int i=ruzhuList.size();
		if(i<3)
		{
			s="该会员住宿次数是："+i+","+"会员级别是初级会员，不打折";
		}
		if(i>=3 && i<=5)
		{
			s="该会员住宿次数是："+i+","+"会员级别是一级会员，打9折";
		}
		if(i>5)
		{
			s="该会员住宿次数是："+i+","+"会员级别是二级会员，打8折";
		}
		
		
		
		request.setAttribute("s", s);
		request.setAttribute("id", id);
		return ActionSupport.SUCCESS;
	}
	
	
	public String tuifang()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int id=Integer.parseInt(request.getParameter("id"));
		
		TRuzhu ruzhu=ruzhuDAO.findById(id);
		ruzhu.setTuifangshijian(request.getParameter("tuifangshijian"));
		ruzhu.setZongfeiyong(Integer.parseInt(request.getParameter("zongfeiyong")));
		
		ruzhuDAO.attachDirty(ruzhu);
		
		TKefang kefang=kefangDAO.findById(ruzhu.getKefangId());
		kefang.setZhuangtai("空闲");
		kefangDAO.attachDirty(kefang);
		
		request.setAttribute("msg", "操作成功");
		return "msg";
	}
	
	
	public String ruzhu_my()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=(Map)ActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		String sql="from TRuzhu where userId="+user.getUserId()+"order by tuifangshijian";
		List ruzhuList=ruzhuDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<ruzhuList.size();i++)
		{
			TRuzhu ruzhu=(TRuzhu)ruzhuList.get(i);
			ruzhu.setKefang(kefangDAO.findById(ruzhu.getKefangId()));
		}
		request.put("ruzhuList", ruzhuList);
		return ActionSupport.SUCCESS;
	}
	


	public TKefangDAO getKefangDAO()
	{
		return kefangDAO;
	}


	public void setKefangDAO(TKefangDAO kefangDAO)
	{
		this.kefangDAO = kefangDAO;
	}


	public TRuzhuDAO getRuzhuDAO()
	{
		return ruzhuDAO;
	}


	public void setRuzhuDAO(TRuzhuDAO ruzhuDAO)
	{
		this.ruzhuDAO = ruzhuDAO;
	}


	public TYudingDAO getYudingDAO()
	{
		return yudingDAO;
	}


	public void setYudingDAO(TYudingDAO yudingDAO)
	{
		this.yudingDAO = yudingDAO;
	}
	
}
