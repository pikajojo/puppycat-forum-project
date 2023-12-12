package com.yajwang.forum.dto;


import java.util.List;

/**
 * 泛型 generic
 * 分页对象 the object of PageDTO
 */
public class PageDTO<T> {

    /**
     * 当前页码
     * the page number
     */
    private int pageNumber;



    /**
     * 每页显示的记录数
     * the records every page has
     */
    private int pageSize;

    /**
     * 总条数
     * total number of records
     */
    private int totalRecord;

    /**
     * 总页数
     * total number of pages
     */
    private int totalPages;

    /**
     * 数据集合
     * the data collection
     */
    private List<T> list;


    public PageDTO(int pageNumber, int pageSize, int totalRecord){
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;

        //计算总页数
        //calculate the total page numbers

        if(totalRecord % pageSize == 0){

            totalPages = totalRecord/pageSize;
        }
        else{
            totalPages = totalRecord/pageSize + 1;
        }
    }




    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageDTO{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPages=" + totalPages +
                ", list=" + list +
                '}';
    }
}
