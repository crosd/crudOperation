package com.mycrud.myoper.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycrud.myoper.model.Student;

@Service
public interface StudentDao {
	public void insertUpdate(Student student);
	public void deleteRec(Long id);
	public Student get(Long id);
	public List<Student> getAll();
	public List<Student> getSelected(int offset);
	public Long pageCount();
	

}
