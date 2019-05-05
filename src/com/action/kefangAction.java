package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TKefangDAO;
import com.model.TKefang;
import com.model.TMendian;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class kefangAction extends ActionSupport
{
	private int id;
	private int mendianId;
	private String kefangleixing;
	private String fangjianhao;
	private String area;
	private String jieshao;
	private String fujian;
	private int qianshu;
	
	private TKefangDAO kefangDAO;
	
	
	
	public String kefangAdd()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		Map session=ActionContext.getContext().getSession();
		Object o=session.get("mendian");
		if(o==null)
		{
			request.put("msg", "session过期，请重新登录");
		}
		else
		{
			TMendian mendian=(TMendian)(o);
			TKefang kefang=new TKefang();
			
			kefang.setMendianId(mendian.getId());
			kefang.setKefangleixing(kefangleixing);
			kefang.setFangjianhao(fangjianhao);
			kefang.setArea(area);
			
			kefang.setJieshao(jieshao);
			kefang.setFujian(fujian);
			kefang.setQianshu(qianshu);
			kefang.setZhuangtai("空闲");
			kefang.setDel("no");
			
			kefangDAO.save(kefang);
			request.put("msg", "门店添加成功");
		}
		return "msg";
	}
	
	public String kefangMana()
	{
		Map session=ActionContext.getContext().getSession();
		Object o=session.get("mendian");
		TMendian mendian=(TMendian)(o);
		
		String sql="from TKefang where del='no' and mendianId="+mendian.getId();
		List kefangList=kefangDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("kefangList", kefangList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	public String kefangDel()
	{
		
		TKefang kefang=kefangDAO.findById(id);
		kefang.setDel("yes");
		kefangDAO.attachDirty(kefang);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	public String kefang_all_mendian()
	{
		String sql="from TKefang where del='no' and mendianId="+mendianId;
		List kefangList=kefangDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("kefangList", kefangList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String kefangDetailQian()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");

        TKefang kefang=kefangDAO.findById(id);
        request.put("kefang", kefang);
		return ActionSupport.SUCCESS;
			
	}

	public String getArea()
	{
		return area;
	}

	public void setArea(String area)
	{
		this.area = area;
	}

	public String getFangjianhao()
	{
		return fangjianhao;
	}

	public void setFangjianhao(String fangjianhao)
	{
		this.fangjianhao = fangjianhao;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getJieshao()
	{
		return jieshao;
	}

	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}

	public TKefangDAO getKefangDAO()
	{
		return kefangDAO;
	}

	public void setKefangDAO(TKefangDAO kefangDAO)
	{
		this.kefangDAO = kefangDAO;
	}

	public int getMendianId()
	{
		return mendianId;
	}

	public void setMendianId(int mendianId)
	{
		this.mendianId = mendianId;
	}

	public int getQianshu()
	{
		return qianshu;
	}

	public void setQianshu(int qianshu)
	{
		this.qianshu = qianshu;
	}

	public String getKefangleixing()
	{
		return kefangleixing;
	}

	public void setKefangleixing(String kefangleixing)
	{
		this.kefangleixing = kefangleixing;
	}
	
}
