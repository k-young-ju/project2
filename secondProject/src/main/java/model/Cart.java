package model;

import lombok.Data;

@Data
public class Cart {
	int ct_uid;
	String o_id;
	String m_id;
	String id;
	int uid;
	int price1;
	int mileage;
	int qty;
	
	String ct_status;
	String ct_date;
	String subject;
	String image;
	String n_writer;
	int qtys;
	String kind_big;
	String ct_order_status;
}
