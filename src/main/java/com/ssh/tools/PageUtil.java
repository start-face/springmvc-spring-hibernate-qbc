package com.ssh.tools;

import com.ssh.model.News;

import java.util.List;

/**
 * @author FaceFeel
 * @Created 2018-05-12 22:36
 */

public class PageUtil {


    public static <T> Page<T> getPage(PageInfo pageInfo, int totalCount) {

        Page<T> newsPage = new Page<>();
        newsPage.setTotalCount(totalCount)
                .setCurrentPage(currentPage(pageInfo.getPageSize(), pageInfo.getCurrentPage()))
                .setPageSize(pageInfo.getPageSize())
                .setTotalPage(countTotalPage(pageInfo.getPageSize(), totalCount));
        return newsPage;
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
