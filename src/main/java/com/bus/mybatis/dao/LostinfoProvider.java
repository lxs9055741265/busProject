package com.bus.mybatis.dao;

import org.apache.ibatis.jdbc.SQL;

import com.bus.bean.Lostinfo;

public class LostinfoProvider {

	public String select(Lostinfo param) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM("lostinfo");

				if (param.getId() != null && !"".equals(param.getId())) {
					WHERE("id=#{id}");
				}

				if (param.getUsername() != null && !"".equals(param.getUsername())) {
					WHERE("username = #{username}");
				}

				if (param.getLosttype() != null && !"".equals(param.getLosttype())) {
					WHERE("losttype like '%" + param.getLosttype() + "%'");
				}

				if (param.getTitle() != null && !"".equals(param.getTitle())) {
					WHERE("title like '%" + param.getTitle() + "%'");
				}

				if (param.getDesc() != null && !"".equals(param.getDesc())) {
					WHERE("`desc` like '%" + param.getDesc() + "%'");
				}

				if (param.getLosttime() != null && !"".equals(param.getLosttime())) {
					String[] s = param.getLosttime().split("-");
					WHERE("losttime >= '" + s[0].trim() + "'");
					WHERE("losttime <= '" + s[1].trim() + "'");
				}
			}
		}.toString();
		return sql;
	}
}
