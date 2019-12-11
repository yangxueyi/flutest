class LoanBeanEntity {
	String earlyRepayment;
	String loanType;
	String cashCouponFlag;
	LoanBeanStartmoney startMoney;
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
	LoanBeanIncreasemoney increaseMoney;
	String increaseInterestCouponFlag;
	String addRate;
	LoanBeanSurplusmoney surplusMoney;
	String progressRate;
	LoanBeanBiddingamount biddingAmount;
	LoanBeanLoanamount loanAmount;
	String profitType;
	LoanBeanProfitper profitPer;
	String protocolTempId;
	LoanBeanLimitamount limitAmount;
	String loanStatusDesc;
	String endInterest;
	String borrowType;
	String openDate;
	String loanId;
	String startInterest;

	LoanBeanEntity({this.earlyRepayment, this.loanType, this.cashCouponFlag, this.startMoney, this.termCount, this.yearRate, this.failureTime, this.loanTitle, this.redMoneyUse, this.redUsePercent, this.loanStatus, this.openTime, this.termUnit, this.loanHint, this.repayDesc, this.increaseMoney, this.increaseInterestCouponFlag, this.addRate, this.surplusMoney, this.progressRate, this.biddingAmount, this.loanAmount, this.profitType, this.profitPer, this.protocolTempId, this.limitAmount, this.loanStatusDesc, this.endInterest, this.borrowType, this.openDate, this.loanId, this.startInterest});

	LoanBeanEntity.fromJson(Map<String, dynamic> json) {
		earlyRepayment = json['earlyRepayment'];
		loanType = json['loanType'];
		cashCouponFlag = json['cashCouponFlag'];
		startMoney = json['startMoney'] != null ? new LoanBeanStartmoney.fromJson(json['startMoney']) : null;
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
		increaseMoney = json['increaseMoney'] != null ? new LoanBeanIncreasemoney.fromJson(json['increaseMoney']) : null;
		increaseInterestCouponFlag = json['increaseInterestCouponFlag'];
		addRate = json['addRate'];
		surplusMoney = json['surplusMoney'] != null ? new LoanBeanSurplusmoney.fromJson(json['surplusMoney']) : null;
		progressRate = json['progressRate'];
		biddingAmount = json['biddingAmount'] != null ? new LoanBeanBiddingamount.fromJson(json['biddingAmount']) : null;
		loanAmount = json['loanAmount'] != null ? new LoanBeanLoanamount.fromJson(json['loanAmount']) : null;
		profitType = json['profitType'];
		profitPer = json['profitPer'] != null ? new LoanBeanProfitper.fromJson(json['profitPer']) : null;
		protocolTempId = json['protocolTempId'];
		limitAmount = json['limitAmount'] != null ? new LoanBeanLimitamount.fromJson(json['limitAmount']) : null;
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

class LoanBeanStartmoney {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanStartmoney({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanStartmoney.fromJson(Map<String, dynamic> json) {
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

class LoanBeanIncreasemoney {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanIncreasemoney({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanIncreasemoney.fromJson(Map<String, dynamic> json) {
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

class LoanBeanSurplusmoney {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanSurplusmoney({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanSurplusmoney.fromJson(Map<String, dynamic> json) {
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

class LoanBeanBiddingamount {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanBiddingamount({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanBiddingamount.fromJson(Map<String, dynamic> json) {
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

class LoanBeanLoanamount {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanLoanamount({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanLoanamount.fromJson(Map<String, dynamic> json) {
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

class LoanBeanProfitper {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanProfitper({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanProfitper.fromJson(Map<String, dynamic> json) {
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

class LoanBeanLimitamount {
	double amount;
	int centFactor;
	int cent;
	String currency;

	LoanBeanLimitamount({this.amount, this.centFactor, this.cent, this.currency});

	LoanBeanLimitamount.fromJson(Map<String, dynamic> json) {
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
