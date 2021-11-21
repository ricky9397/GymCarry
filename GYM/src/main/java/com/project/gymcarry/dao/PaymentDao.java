package com.project.gymcarry.dao;

import com.project.gymcarry.payment.PaymentDto;

public interface PaymentDao {

	// 결제 정보 출력
	int savePayment(PaymentDto paymenDto);

}
