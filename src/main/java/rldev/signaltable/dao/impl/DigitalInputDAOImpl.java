package rldev.signaltable.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import rldev.signaltable.dao.AbstractDao;
import rldev.signaltable.dao.DigitalInputDao;
import rldev.signaltable.entity.DigitalInput;

import java.util.List;

@Repository("digitalInputDao")
@Transactional
public class DigitalInputDaoImpl extends AbstractDao<DigitalInput> implements DigitalInputDao {


    public void save(DigitalInput persistent) {
        getSessionFactory().save(persistent);
    }

    public void update(DigitalInput persistent) {
        getSessionFactory().update(persistent);
    }

    public void deleteById(Long id) {
        getSessionFactory().delete(getById(id));
    }

    public void delete(DigitalInput persistent) {
        getSessionFactory().delete(persistent);
    }

    public DigitalInput getById(Long id) {
        return (DigitalInput) getSessionFactory().get(DigitalInput.class, id);
    }

    @SuppressWarnings("unchecked")
    public List getAll() {
        return getSessionFactory().createQuery("from rldev.signaltable.entity.DigitalInput").list();
    }

    @SuppressWarnings("unchecked")
    public List<DigitalInput> getByProcessControlObjectId(Long id) {
        String hql = "from DigitalInput as di where di.processControlObject.id = :id";
        Query query = getSessionFactory().createQuery(hql);
        query.setParameter("id", id);
        return query.list();
    }

    public DigitalInput getByName(String name) {
        return null;
    }

    public DigitalInput getBySymbol(String symbol) {
        String hql = "from DigitalInput as di where di.symbol = :symbol";
        Query query = getSessionFactory().createQuery(hql);
        query.setParameter("symbol", symbol);
        return (DigitalInput) query.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<DigitalInput> getByProcessControlObjectName(String name) {
        String hql = "from DigitalInput as di where di.processControlObject.name = :name";
        Query query = getSessionFactory().createQuery(hql);
        query.setParameter("name", name);
        return query.list();
    }
}
