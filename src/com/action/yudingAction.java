package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TKefangDAO;
import com.dao.TUserDAO;
import com.dao.TYudingDAO;
import com.model.TKefang;
import com.model.TMendian;
import com.model.TUser;
import com.model.TYuding;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.liuService;

public class yudingAction extends ActionSupport
{
	private Integer id;
	private Integer userId;
	private Integer kefangId;
	private Integer mendianId;
	
	private String ruzhushiian;
	private String lidianshiian;
	private String yudingzheTel;
	
	private TYudingDAO yudingDAO;
	private TKefangDAO kefangDAO;
	
	public String yudingAdd()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=(Map)ActionContext.getContext().getSession();
		
		TUser user=(TUser)session.get("user");
		
		
		TYuding yuding=new TYuding();
		
		yuding.setUserId(user.getUserId());
		yuding.setKefangId(kefangId);
		yuding.setMendianId(mendianId);
		yuding.setRuzhushiian(ruzhushiian);
		
		yuding.setLidianshiian(lidianshiian);
		yuding.setYudingzheTel(yudingzheTel);
		yuding.setYudingshijian(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		
		yudingDAO.save(yuding);
		request.put("msg", "预订成功");
		
		TKefang kefang=kefangDAO.findById(kefangId);
		kefang.setZhuangtai("已预订");
		kefangDAO.attachDirty(kefang);
		
		return "msg";
		
	}
	
	
	public String yudingMana()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=(Map)ActionContext.getContext().getSession();
		TMendian mendian=(TMendian)session.get("mendian");
		
		String sql="from TYuding where mendianId="+mendian.getId()+"order by id desc";
		List yudingList=yudingDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yudingList.size();i++)
		{
			TYuding yuding=(TYuding)yudingList.get(i);
			yuding.setKefang(kefangDAO.findById(yuding.getKefangId()));
		}
		request.put("yudingList", yudingList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yudingDel()
	{
		TYuding yuding=yudingDAO.findById(id);
		yudingDAO.delete(yuding);
		
		
		TKefang kefang=kefangDAO.findById(yuding.getKefangId());
		kefang.setZhuangtai("空闲");
		kefangDAO.attachDirty(kefang);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}


	public Integer getId()
	{
		return id;
	}


	public void setId(Integer id)
	{
		this.id = id;
	}


	public Integer getKefangId()
	{
		return kefangId;
	}


	public TKefangDAO getKefangDAO()
	{
		return kefangDAO;
	}


	public void setKefangDAO(TKefangDAO kefangDAO)
	{
		this.kefangDAO = kefangDAO;
	}


	public void setKefangId(Integer kefangId)
	{
		this.kefangId = kefangId;
	}


	public String getLidianshiian()
	{
		return lidianshiian;
	}


	public void setLidianshiian(String lidianshiian)
	{
		this.lidianshiian = lidianshiian;
	}


	public Integer getMendianId()
	{
		return mendianId;
	}


	public void setMendianId(Integer mendianId)
	{
		this.mendianId = mendianId;
	}


	public String getRuzhushiian()
	{
		return ruzhushiian;
	}


	public void setRuzhushiian(String ruzhushiian)
	{
		this.ruzhushiian = ruzhushiian;
	}


	public Integer getUserId()
	{
		return userId;
	}


	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}


	public TYudingDAO getYudingDAO()
	{
		return yudingDAO;
	}


	public void setYudingDAO(TYudingDAO yudingDAO)
	{
		this.yudingDAO = yudingDAO;
	}


	public String getYudingzheTel()
	{
		return yudingzheTel;
	}


	public void setYudingzheTel(String yudingzheTel)
	{
		this.yudingzheTel = yudingzheTel;
	}

}
