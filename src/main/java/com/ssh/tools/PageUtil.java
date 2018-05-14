package com.ssh.tools;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;

import java.util.List;

/**
 * 分页实体工具
 *
 * @author FaceFeel
 * @Created 2018-05-12 22:36
 */
public class PageUtil {

    /**
     * 获取分页实体
     *
     * @param clazz             查询条件
     * @param orderType         是否是倒序
     * @param hibernateTemplate hibernate模版
     * @param pageInfo          分页实体
     * @param <T>               泛型
     * @return Page
     */
    @SuppressWarnings("unchecked")
    public static <T> Page<T> getPage(T clazz,String orderType, HibernateTemplate hibernateTemplate, PageInfo pageInfo) {

        Session session = HibernateFactory.getSession(hibernateTemplate);
        Criteria criteria = session.createCriteria(clazz.getClass());
        criteria.setProjection(Projections.rowCount());
        int totalCount = Integer.valueOf(criteria.uniqueResult().toString());
        Criteria pageCriteria = HibernateFactory.getPageCriteria(criteria, pageInfo, session);

        Example example = Example.create(clazz);
        //排序类型
        criteria.add(example).addOrder(Order.desc(orderType));
        return PageUtil.getPage(pageInfo, totalCount, (List<T>) pageCriteria.list());
    }

    /**
     * 拼装Page实体
     *
     * @param pageInfo   分页实体
     * @param totalCount 总页数
     * @param list       获取到的数据
     * @param <T>        泛型
     * @return Page"
     */
    public static <T> Page<T> getPage(PageInfo pageInfo, int totalCount, List<T> list) {
        int currentPage = currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage());
        int countTotalPage = countTotalPage(pageInfo.getPageSize(), totalCount);
        return new Page<>(pageInfo.getPageSize(), currentPage, totalCount, countTotalPage, list);
    }

    /**
     * 计算当前页开始记录
     *
     * @param pageSize    每页记录数
     * @param currentPage 当前第几页
     * @return 当前页开始记录号
     */
    public static int currentPage(final int pageSize, final int currentPage) {
        return pageSize * (currentPage - 1);
    }

    /**
     * 计算总页数,静态方法,供外部直接通过类名调用
     *
     * @param pageSize   每页记录数
     * @param totalCount 总记录数
     * @return 总页数
     */
    private static int countTotalPage(final int pageSize, final int totalCount) {
        return totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
    }
}
