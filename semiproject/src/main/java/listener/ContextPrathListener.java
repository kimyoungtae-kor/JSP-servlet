package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextPrathListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//properties 는 키와 값이 스트링으로만 이루어진 hash map이다
		sce.getServletContext().setAttribute("cp", sce.getServletContext().getContextPath()+"/");
	}
		
}
