package daos.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionFactory {

	protected static final SqlSessionFactory FACTORY;
	
	static{
		try{
			Reader reader=Resources.getResourceAsReader(
					"daos/mybatis/config/mybatis-config.xml");
			FACTORY=new SqlSessionFactoryBuilder().build(reader);
		}catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory(){
		return FACTORY;
	}
}
