package model;


import lombok.Data;

@Data
public class Order {
	private int od_uid;
	private String od_id;
	private String mb_id;
	private int od_price;
	private int od_point;
	private String od_status;
	private String od_name;
	private String od_phone;
	private String od_zip;
	private String od_addr1;
	private String od_addr2;
	private String od_addr3;
	private String od_addr4;
	private String od_b_name;
	private String od_b_phone;
	private String od_b_zip;
	private String od_b_addr1;
	private String od_b_addr2;
	private String od_b_addr3;
	private String od_b_addr4;
	private String require1;
	private String signdate;
	private String id;
	private String non_id;
	private int use_point;
	private String subject;
	private String ct_order_status;

	
	
}
