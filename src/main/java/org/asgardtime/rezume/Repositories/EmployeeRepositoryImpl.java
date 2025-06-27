package org.asgardtime.rezume.Repositories;

import org.asgardtime.rezume.model.Education;
import org.asgardtime.rezume.model.Employee;
import org.asgardtime.rezume.model.Project;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@Primary
public class EmployeeRepositoryImpl implements EmployeeRepository {

    private SessionFactory sessionFactory;
    EmployeeRepositoryImpl() {
        try {
            sessionFactory = new Configuration()
                    .configure()
                    .addAnnotatedClass(Employee.class)
                    .addAnnotatedClass(Project.class)
                    .addAnnotatedClass(Education.class)
                    .buildSessionFactory();
        } catch(Exception e){
            e.printStackTrace();
        }
    }



    // Метод для получения текущей сессии Hibernate
    private Session openSession() {
        return sessionFactory.openSession();
    }

    @Override
    public List<Employee> findAll() {
        try (Session session = openSession()) {
            Query<Employee> query = session.createQuery("FROM Employee", Employee.class); // Запрос на получение всех записей
            return query.list();
        }
    }

    @Override
    public Optional<Employee> findById(long id) {
        try (Session session = openSession()) {
            return Optional.ofNullable(session.get(Employee.class, id)); // Получаем запись по ID
        }
    }

    @Override
    public Employee save(Employee employee) {
        try (Session session = openSession()) {
            Transaction transaction = session.beginTransaction(); // Начинаем транзакцию
            session.merge(employee); // Сохраняем или обновляем запись
            transaction.commit(); // Завершаем транзакцию
            return employee;
        }
    }

    @Override
    public void deleteById(Long id) {
        try (Session session = openSession()) {
            Transaction transaction = session.beginTransaction();
            Employee employee = session.get(Employee.class, id); // Находим запись по ID
            if (employee != null) {
                session.remove(employee); // Удаляем запись
            }
            transaction.commit();
        }
    }
}