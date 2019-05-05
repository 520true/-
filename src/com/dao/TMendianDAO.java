package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TMendian;

/**
 * Data access object (DAO) for domain model class TMendian.
 * 
 * @see com.model.TMendian
 * @author MyEclipse Persistence Tools
 */

public class TMendianDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TMendianDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TMendian transientInstance)
	{
		log.debug("saving TMendian instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TMendian persistentInstance)
	{
		log.debug("deleting TMendian instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TMendian findById(java.lang.Integer id)
	{
		log.debug("getting TMendian instance with id: " + id);
		try
		{
			TMendian instance = (TMendian) getHibernateTemplate().get(
					"com.model.TMendian", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TMendian instance)
	{
		log.debug("finding TMendian instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TMendian instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TMendian as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TMendian instances");
		try
		{
			String queryString = "from TMendian";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TMendian merge(TMendian detachedInstance)
	{
		log.debug("merging TMendian instance");
		try
		{
			TMendian result = (TMendian) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TMendian instance)
	{
		log.debug("attaching dirty TMendian instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TMendian instance)
	{
		log.debug("attaching clean TMendian instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TMendianDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TMendianDAO) ctx.getBean("TMendianDAO");
	}
}