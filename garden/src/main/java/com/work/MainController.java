package com.work;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.work.bean.Article;
import com.work.bean.User;
import com.work.controller.LoginController;
import com.work.mapper.ArticleDao;
import com.work.mapper.FileDao;
import com.work.mapper.TieziDao;
import com.work.mapper.UserDao;
import com.work.util.M;

@Controller
@SpringBootApplication
public class MainController extends SpringBootServletInitializer{
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(MainController.class);
	}
	@RequestMapping("/")
	public String index(){
		
		return "index";
	}
	
	
	@Resource
	private UserDao userDao;
	@Resource
	private ArticleDao articleDao;
	@Resource
	private FileDao fileDao;
	@Resource
	private TieziDao tieziDao;
	
	public final static String ME = "me";

	/**login page
	 * @return
	 */
	@RequestMapping(value="/app/login",method=RequestMethod.GET)
	public String login() {

		return "login";
	}
	
	/**获取当前登录对象
	 * @param req
	 * @return
	 */
	public static User getCurrentUser(HttpServletRequest req){
		
		return (User)WebUtils.getSessionAttribute(req, ME);
	}
	
	@RequestMapping("/app/frame")
	public String frame(){
		
		return "frame";
	}
	
	public static void main(String[] args) throws Exception {
		SpringApplication.run(MainController.class, args);
	}

	@RequestMapping("/art")
	public String art(Model model){
		List<Article> data = articleDao.list(M.make("type", 1).asMap());
		
		model.addAttribute("data", data);
		return "art";
	}
	@RequestMapping("/art/detail")
	public String artdetail(String id,Model model){
		Article data = articleDao.load(M.make("id", id).asMap());
		model.addAttribute("data", data);
		
		model.addAttribute("list",articleDao.list(M.make("type", 2).asMap()));
		return "artdetail";
	}
	@RequestMapping("/plants")
	public String plants(Model model){
		model.addAttribute("list",articleDao.list(M.make("type", 2).asMap()));
		return "plants";
	}
	@RequestMapping("/file")
	public String file(Model model){
		model.addAttribute("data", fileDao.list(null)
				);
		return "file";
	}
	@RequestMapping("/tiezi")
	public String tiezi(Model model,HttpServletRequest request){
		User u = LoginController.loginUser(request);
		if(null == u){
			return "redirect:/app/login";
		}
		
		model.addAttribute("list",articleDao.list(M.make("type", 2).asMap()));
		model.addAttribute("data", tieziDao.list(M.make("myId", u.getId()).asMap()));
		
		Random r = new Random();
		model.addAttribute("r1", r.nextInt(5));
		model.addAttribute("r2", r.nextInt(5));
		return "tiezi";
	}
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	
}
