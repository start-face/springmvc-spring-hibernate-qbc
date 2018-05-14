package com.ssh.tools;

import com.google.common.base.MoreObjects;

/**
 * @author FaceFeel
 * @Created 2018-05-12 14:44
 */

public class PageInfo implements java.io.Serializable {

    private int currentPage;
    private int endPage;
    private int pageSize = 2;
    private long totalPage;

    public PageInfo() {
    }

    @Override
    public String toString() {
        return MoreObjects.toStringHelper(this)
                .add("currentPage", currentPage)
                .add("endPage", endPage)
                .add("pageSize", pageSize)
                .add("totalPage", totalPage)
                .toString();
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public PageInfo setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        return this;
    }

    public int getEndPage() {
        return endPage;
    }

    public PageInfo setEndPage(int endPage) {
        this.endPage = endPage;
        return this;
    }

    public int getPageSize() {
        return pageSize;
    }

    public PageInfo setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    public long getTotalPage() {
        return totalPage;
    }

    public PageInfo setTotalPage(long totalPage) {
        this.totalPage = totalPage;
        return this;
    }
}
