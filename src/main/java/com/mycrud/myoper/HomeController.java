package com.mycrud.myoper;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycrud.myoper.dao.StudentDao;
import com.mycrud.myoper.dao.UsersDao;
import com.mycrud.myoper.model.Users;

/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {

	@Autowired
	UsersDao userDao;

	@Autowired
	StudentDao studentDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profileGET(@ModelAttribute Users users, Model model) {
		model.addAttribute("pageCount", studentDao.pageCount());
		model.addAttribute("studentList", studentDao.getAll());
		return "profile";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profilePOST(@ModelAttribute Users users, Model model, HttpSession session) {

		if (userDao.validateUser(users)) {
			session.setAttribute("activeUser", users.getUsername());
			session.setMaxInactiveInterval(10 * 60);
			model.addAttribute("studentList", studentDao.getAll());
			model.addAttribute("pageCount", studentDao.pageCount());

			return "profile";
		} else {
			model.addAttribute("loginError", "error in username/ password:");
			return "login";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/login";
	}

	@RequestMapping(value = "{id}/delete", method = RequestMethod.GET)
	public String deleteStudent(Model model, @PathVariable("id") Long id) {
		studentDao.deleteRec(id);
		return "redirect:/profile";
	}

	@RequestMapping(value = "/liststudent", method = RequestMethod.GET)
	public String offsetCheck(Model model, @RequestParam("offset") String offset) {

		model.addAttribute("studentList", studentDao.getSelected(Integer.parseInt(offset)));
		model.addAttribute("pageCount", studentDao.pageCount());
		return "profile";
	}
}
