package com.bus.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sqlite.date.DateFormatUtils;

import com.bus.bean.Balance;
import com.bus.bean.Balancedetail;
import com.bus.mybatis.dao.AccountDao;
import com.bus.service.inter.BalanceService;

@Service
public class BalanceServiceImpl implements BalanceService {

	@Autowired
	private AccountDao accountDao;

	@Override
	public int addMoney(String username, String money, String detail) {
		Balance b = accountDao.select(username);
		if (b == null) {
			b = new Balance();
			b.setUsername(username);
			b.setMoney(money);
			accountDao.insertBalance(b);
		} else {
			b.setMoney(String.valueOf(Double.parseDouble(b.getMoney()) + Double.parseDouble(money)));
			accountDao.updateBalance(b);
		}

		Balancedetail bd = new Balancedetail();
		bd.setUsername(username);
		bd.setMoney(b.getMoney());
		bd.setAcct(money);
		bd.setAcctime(DateFormatUtils.format(new Date(), "yyyy/MM/dd HH:mm:ss"));
		bd.setDetail(detail);

		accountDao.insertBalancedetail(bd);
		return 1;
	}
	
	@Override
	public List<Balancedetail> queryDetail(String username) {
		return accountDao.selectBalancedetail(username);
	}
	
	@Override
	public Balance queryBalance(String username) {
		return accountDao.select(username);
	}
}
