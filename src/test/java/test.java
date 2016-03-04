import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.druid.pool.DruidDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:spring*.xml" })
public class test {
	@Autowired
	private DruidDataSource masterDataSource ;
	
	/*@Resource
	private DruidDataSource dataSource  ;
	*/
	@Test
	public void test1(){
		System.out.println(this.masterDataSource.getUrl());
	}

}
