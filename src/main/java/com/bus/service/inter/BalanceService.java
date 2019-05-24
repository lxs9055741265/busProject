package com.bus.service.inter;

import java.util.List;

import com.bus.bean.Balance;
import com.bus.bean.Balancedetail;

public interface BalanceService {

	int addMoney(String username, String money, String detail);

	List<Balancedetail> queryDetail(String username);

	Balance queryBalance(String username);

}
