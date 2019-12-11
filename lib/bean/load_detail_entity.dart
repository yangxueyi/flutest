class LoadDetailEntity {
	LoadDetailBusinessobject businessObject;
	bool success;
	bool failure;
	String resultCode;
	String resultCodeMsg;

	LoadDetailEntity({this.businessObject, this.success, this.failure, this.resultCode, this.resultCodeMsg});

	LoadDetailEntity.fromJson(Map<String, dynamic> json) {
		businessObject = json['businessObject'] != null ? new LoadDetailBusinessobject.fromJson(json['businessObject']) : null;
		success = json['success'];
		failure = json['failure'];
		resultCode = json['resultCode'];
		resultCodeMsg = json['resultCodeMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.businessObject != null) {
      data['businessObject'] = this.businessObject.toJson();
    }
		data['success'] = this.success;
		data['failure'] = this.failure;
		data['resultCode'] = this.resultCode;
		data['resultCodeMsg'] = this.resultCodeMsg;
		return data;
	}
}

class LoadDetailBusinessobject {
	String earlyRepayment;
	String loanType;
	String cashCouponFlag;
	LoadDetailBusinessobjectStartmoney startMoney;
	String termCount;
	String yearRate;
	String failureTime;
	String loanTitle;
	String redMoneyUse;
	String redUsePercent;
	String loanStatus;
	String openTime;
	String termUnit;
	String loanHint;
	String repayDesc;
	LoadDetailBusinessobjectIncreasemoney increaseMoney;
	String increaseInterestCouponFlag;
	String addRate;
	LoadDetailBusinessobjectSurplusmoney surplusMoney;
	String progressRate;
	LoadDetailBusinessobjectBiddingamount biddingAmount;
	LoadDetailBusinessobjectLoanamount loanAmount;
	String profitType;
	LoadDetailBusinessobjectProfitper profitPer;
	String protocolTempId;
	LoadDetailBusinessobjectLimitamount limitAmount;
	String loanStatusDesc;
	String endInterest;
	String borrowType;
	String openDate;
	String loanId;
	String startInterest;

	LoadDetailBusinessobject({this.earlyRepayment, this.loanType, this.cashCouponFlag, this.startMoney, this.termCount, this.yearRate, this.failureTime, this.loanTitle, this.redMoneyUse, this.redUsePercent, this.loanStatus, this.openTime, this.termUnit, this.loanHint, this.repayDesc, this.increaseMoney, this.increaseInterestCouponFlag, this.addRate, this.surplusMoney, this.progressRate, this.biddingAmount, this.loanAmount, this.profitType, this.profitPer, this.protocolTempId, this.limitAmount, this.loanStatusDesc, this.endInterest, this.borrowType, this.openDate, this.loanId, this.startInterest});

	LoadDetailBusinessobject.fromJson(Map<String, dynamic> json) {
		earlyRepayment = json['earlyRepayment'];
		loanType = json['loanType'];
		cashCouponFlag = json['cashCouponFlag'];
		startMoney = json['startMoney'] != null ? new LoadDetailBusinessobjectStartmoney.fromJson(json['startMoney']) : null;
		termCount = json['termCount'];
		yearRate = json['yearRate'];
		failureTime = json['failureTime'];
		loanTitle = json['loanTitle'];
		redMoneyUse = json['redMoneyUse'];
		redUsePercent = json['redUsePercent'];
		loanStatus = json['loanStatus'];
		openTime = json['openTime'];
		termUnit = json['termUnit'];
		loanHint = json['loanHint'];
		repayDesc = json['repayDesc'];
		increaseMoney = json['increaseMoney'] != null ? new LoadDetailBusinessobjectIncreasemoney.fromJson(json['increaseMoney']) : null;
		increaseInterestCouponFlag = json['increaseInterestCouponFlag'];
		addRate = json['addRate'];
		surplusMoney = json['surplusMoney'] != null ? new LoadDetailBusinessobjectSurplusmoney.fromJson(json['surplusMoney']) : null;
		progressRate = json['progressRate'];
		biddingAmount = json['biddingAmount'] != null ? new LoadDetailBusinessobjectBiddingamount.fromJson(json['biddingAmount']) : null;
		loanAmount = json['loanAmount'] != null ? new LoadDetailBusinessobjectLoanamount.fromJson(json['loanAmount']) : null;
		profitType = json['profitType'];
		profitPer = json['profitPer'] != null ? new LoadDetailBusinessobjectProfitper.fromJson(json['profitPer']) : null;
		protocolTempId = json['protocolTempId'];
		limitAmount = json['limitAmount'] != null ? new LoadDetailBusinessobjectLimitamount.fromJson(json['limitAmount']) : null;
		loanStatusDesc = json['loanStatusDesc'];
		endInterest = json['endInterest'];
		borrowType = json['borrowType'];
		openDate = json['openDate'];
		loanId = json['loanId'];
		startInterest = json['startInterest'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['earlyRepayment'] = this.earlyRepayment;
		data['loanType'] = this.loanType;
		data['cashCouponFlag'] = this.cashCouponFlag;
		if (this.startMoney != null) {
      data['startMoney'] = this.startMoney.toJson();
    }
		data['termCount'] = this.termCount;
		data['yearRate'] = this.yearRate;
		data['failureTime'] = this.failureTime;
		data['loanTitle'] = this.loanTitle;
		data['redMoneyUse'] = this.redMoneyUse;
		data['redUsePercent'] = this.redUsePercent;
		data['loanStatus'] = this.loanStatus;
		data['openTime'] = this.openTime;
		data['termUnit'] = this.termUnit;
		data['loanHint'] = this.loanHint;
		data['repayDesc'] = this.repayDesc;
		if (this.increaseMoney != null) {
      data['increaseMoney'] = this.increaseMoney.toJson();
    }
		data['increaseInterestCouponFlag'] = this.increaseInterestCouponFlag;
		data['addRate'] = this.addRate;
		if (this.surplusMoney != null) {
      data['surplusMoney'] = this.surplusMoney.toJson();
    }
		data['progressRate'] = this.progressRate;
		if (this.biddingAmount != null) {
      data['biddingAmount'] = this.biddingAmount.toJson();
    }
		if (this.loanAmount != null) {
      data['loanAmount'] = this.loanAmount.toJson();
    }
		data['profitType'] = this.profitType;
		if (this.profitPer != null) {
      data['profitPer'] = this.profitPer.toJson();
    }
		data['protocolTempId'] = this.protocolTempId;
		if (this.limitAmount != null) {
      data['limitAmount'] = this.limitAmount.toJson();
    }
		data['loanStatusDesc'] = this.loanStatusDesc;
		data['endInterest'] = this.endInterest;
		data['borrowType'] = this.borrowType;
		data['openDate'] = this.openDate;
		data['loanId'] = this.loanId;
		data['startInterest'] = this.startInterest;
		return data;
	}
}

class LoadDetailBusinessobjectStartmoney {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectStartmoney({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectStartmoney.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}

class LoadDetailBusinessobjectIncreasemoney {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectIncreasemoney({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectIncreasemoney.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}

class LoadDetailBusinessobjectSurplusmoney {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectSurplusmoney({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectSurplusmoney.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}

class LoadDetailBusinessobjectBiddingamount {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectBiddingamount({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectBiddingamount.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}

class LoadDetailBusinessobjectLoanamount {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectLoanamount({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectLoanamount.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}

class LoadDetailBusinessobjectProfitper {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectProfitper({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectProfitper.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}

class LoadDetailBusinessobjectLimitamount {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoadDetailBusinessobjectLimitamount({this.amount, this.centFactor, this.cent, this.currency});

	LoadDetailBusinessobjectLimitamount.fromJson(Map<String, dynamic> json) {
		amount = json['amount'];
		centFactor = json['centFactor'];
		cent = json['cent'];
		currency = json['currency'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = this.amount;
		data['centFactor'] = this.centFactor;
		data['cent'] = this.cent;
		data['currency'] = this.currency;
		return data;
	}
}
