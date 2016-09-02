package com.mycrud.myoper.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mycrud.myoper.model.Student;

@Repository
public class StudentDaoImpl implements StudentDao {

	@Resource
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void insertUpdate(Student student) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(student);
	}

	@Override
	@Transactional
	public void deleteRec(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Student student = (Student) session.get(Student.class, id);
		session.delete(student);
	}

	@Override
	public Student get(Long id) {
		Session session = sessionFactory.openSession();
		Student student = (Student) session.get(Student.class, id);
		session.close();
		return student;
	}

	@Override
	public List<Student> getAll() {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Student.class);
		criteria.setFirstResult(0);
		criteria.setMaxResults(10);
		List<Student> studentList = (List<Student>) criteria.list();
		session.close();
		return studentList;
	}

	@Override
	public List<Student> getSelected(int offset) {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Student.class);
		criteria.setFirstResult(offset * 10);
		criteria.setMaxResults(10);
		List<Student> studentList = (List<Student>) criteria.list();
		return studentList;
	}

	@Override
	public Long pageCount() {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Student.class);
		Long count = (Long) (((Long) criteria.setProjection(Projections.rowCount()).uniqueResult()) / 10) + 1;
		session.close();
		return count;
	}

}
