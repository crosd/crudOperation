package com.mycrud.myoper.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycrud.myoper.dao.StudentDao;
import com.mycrud.myoper.model.Student;

@Controller
@RequestMapping(value="/stud")
public class StudentController {

	@Autowired
	StudentDao studentDao;

	@RequestMapping( method = RequestMethod.GET)
	public String StudentGET(Model model) {
		model.addAttribute("student", new Student());
		model.addAttribute("studentList", studentDao.getAll());
		return "studentForm";
	}

	@RequestMapping( method = RequestMethod.POST)
	public String StudentPOST(Model model, @ModelAttribute Student student) {
		System.out.println(student.getCollegeName());
		System.out.println(student.getFirstName());
		studentDao.insertUpdate(student);
		model.addAttribute("studentList", studentDao.getAll());
		return "redirect:/profile";
	}
	
	@RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
	public String editStudent(Model model, @PathVariable("id") Long id) {
		//Show Student DB Record for that id.
		model.addAttribute("student", studentDao.get(id));
		List<Student> studList = studentDao.getAll();
		model.addAttribute("studentList", studList);
		return "studentForm";
	}
	
	@RequestMapping(value = "{id}/edit", method = RequestMethod.POST)
	public String editStudentPOST(Model model, @ModelAttribute Student student) {
		studentDao.insertUpdate(student);
		return "redirect:/profile";
	}


}
