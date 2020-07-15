package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommonService;

public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 프로퍼티 파일 경로 구하기
		ServletContext sc = config.getServletContext();
		String path = sc.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		Properties prop = new Properties();
		
		try {
			// 프로퍼티 파일과 입력 스트림 연결
			FileInputStream fis = new FileInputStream(path);
			// 입력 스트림으로 프로퍼티 파일 읽어서 prop객체에 Key-Map 저장
			prop.load(fis);
			// 입력 스트림 해제
			fis.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		// prop 객체를 가지고 동적 Model 객체를 Map에 저장
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			String k = iter.next().toString();
			String v = prop.getProperty(k); 
			
			try {
				Class obj = Class.forName(v);	// v: model.HelloService, model.WelcomeService, model.GreetingService, model.HeyService
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getContextPath(); // /Ch18
		String uri 	= req.getRequestURI();	// /Ch18/hello.do
		
		String action = uri.substring(path.length());	// /hello.do, /welcome.do, /greeting.do, /hey.do
		
		CommonService instance = (CommonService)instances.get(action);
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// 리다이렉트
			String redirectURL = result.substring(9);
			resp.sendRedirect(redirectURL);
		} else {
			// view 포워드
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
		
	}
}
