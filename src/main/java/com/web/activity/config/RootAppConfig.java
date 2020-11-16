package com.web.activity.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration //之前在main寫context.scan("")-->掃描@Confiuration 現在spring自己做
@EnableTransactionManagement
public class RootAppConfig {
	
	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser("sa");
		ds.setPassword("passw0rd");
		try {
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		
		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=trip");
		ds.setInitialPoolSize(4);
		ds.setMaxPoolSize(8);
		return ds;
		
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] { //就是<context:componet-scan base
			"com.web.activity.model"});
		factory.setHibernateProperties(additionalProperties());
		return factory;
		}
	

	@Bean(name="transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
	
	private Properties additionalProperties() {
		Properties properties=new Properties();
        properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
        properties.put("hibernate.show_sql", Boolean.FALSE);
        properties.put("hibernate.format_sql", Boolean.TRUE);
        properties.put("default_batch_fetch_size", 10);
        properties.put("hibernate.hbm2ddl.auto", "update");
        return properties;
		
	}

}
