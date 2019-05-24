package com.bus.bean;

import java.util.List;

public class Busbaseinfo {
	private String id;
	private String busname;
	private String money;
	private String time;
	private String begtime;
	private String endtime;
	private List<String> spot;
	private List<String> drivername;
	private List<String> driverid;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getBegtime() {
		return begtime;
	}

	public void setBegtime(String begtime) {
		this.begtime = begtime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getBusname() {
		return busname;
	}

	public void setBusname(String busname) {
		this.busname = busname;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public List<String> getSpot() {
		return spot;
	}

	public void setSpot(List<String> spot) {
		this.spot = spot;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<String> getDrivername() {
		return drivername;
	}

	public void setDrivername(List<String> drivername) {
		this.drivername = drivername;
	}

	public List<String> getDriverid() {
		return driverid;
	}

	public void setDriverid(List<String> driverid) {
		this.driverid = driverid;
	}
}
