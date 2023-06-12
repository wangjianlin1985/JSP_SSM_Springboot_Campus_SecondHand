﻿package com.chengxusheji.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.chengxusheji.po.BookSell;
import com.chengxusheji.po.UserInfo;
import com.chengxusheji.po.BookOrder;

import com.chengxusheji.mapper.BookOrderMapper;
@Service
public class BookOrderService {

	@Resource BookOrderMapper bookOrderMapper;
    /*每页显示记录数目*/
    private int rows = 10;;
    public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加图书订单记录*/
    public void addBookOrder(BookOrder bookOrder) throws Exception {
    	bookOrderMapper.addBookOrder(bookOrder);
    }

    /*按照查询条件分页查询图书订单记录*/
    public ArrayList<BookOrder> queryBookOrder(BookSell bookSellObj,UserInfo userObj,String addTime,int currentPage) throws Exception { 
     	String where = "where 1=1";
    	if(null != bookSellObj && bookSellObj.getSellId()!= null && bookSellObj.getSellId()!= 0)  where += " and t_bookOrder.bookSellObj=" + bookSellObj.getSellId();
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_bookOrder.userObj='" + userObj.getUser_name() + "'";
    	if(!addTime.equals("")) where = where + " and t_bookOrder.addTime like '%" + addTime + "%'";
    	int startIndex = (currentPage-1) * this.rows;
    	return bookOrderMapper.queryBookOrder(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<BookOrder> queryBookOrder(BookSell bookSellObj,UserInfo userObj,String addTime) throws Exception  { 
     	String where = "where 1=1";
    	if(null != bookSellObj && bookSellObj.getSellId()!= null && bookSellObj.getSellId()!= 0)  where += " and t_bookOrder.bookSellObj=" + bookSellObj.getSellId();
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_bookOrder.userObj='" + userObj.getUser_name() + "'";
    	if(!addTime.equals("")) where = where + " and t_bookOrder.addTime like '%" + addTime + "%'";
    	return bookOrderMapper.queryBookOrderList(where);
    }

    /*查询所有图书订单记录*/
    public ArrayList<BookOrder> queryAllBookOrder()  throws Exception {
        return bookOrderMapper.queryBookOrderList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(BookSell bookSellObj,UserInfo userObj,String addTime) throws Exception {
     	String where = "where 1=1";
    	if(null != bookSellObj && bookSellObj.getSellId()!= null && bookSellObj.getSellId()!= 0)  where += " and t_bookOrder.bookSellObj=" + bookSellObj.getSellId();
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_bookOrder.userObj='" + userObj.getUser_name() + "'";
    	if(!addTime.equals("")) where = where + " and t_bookOrder.addTime like '%" + addTime + "%'";
        recordNumber = bookOrderMapper.queryBookOrderCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取图书订单记录*/
    public BookOrder getBookOrder(int orderId) throws Exception  {
        BookOrder bookOrder = bookOrderMapper.getBookOrder(orderId);
        return bookOrder;
    }

    /*更新图书订单记录*/
    public void updateBookOrder(BookOrder bookOrder) throws Exception {
        bookOrderMapper.updateBookOrder(bookOrder);
    }

    /*删除一条图书订单记录*/
    public void deleteBookOrder (int orderId) throws Exception {
        bookOrderMapper.deleteBookOrder(orderId);
    }

    /*删除多条图书订单信息*/
    public int deleteBookOrders (String orderIds) throws Exception {
    	String _orderIds[] = orderIds.split(",");
    	for(String _orderId: _orderIds) {
    		bookOrderMapper.deleteBookOrder(Integer.parseInt(_orderId));
    	}
    	return _orderIds.length;
    }
}
