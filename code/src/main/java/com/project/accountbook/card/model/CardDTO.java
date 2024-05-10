package com.project.accountbook.card.model;

public class CardDTO {

	//카드 정보
	private String ciName;
	private String explanation;
	private int annualFee;
	private String overseasUse;
	private String cardCompany;
	private String fileLink;
	private int seqCardType;
	
	//카드 혜택 목록
	private int lcbseqCardCategory;
	private int seqCardInformation;

	

	public int getSeqCardInformation() {
		return seqCardInformation;
	}

	public void setSeqCardInformation(int seqCardInformation) {
		this.seqCardInformation = seqCardInformation;
	}

	//카드 혜택 카테고리
	private String ccName;
	
	//카드/가계부 카테고리 연결
	private int caaSeqCardCategory;
	private int seqAccCategory;
	
	//카드 할인율
	private int discountRate;
	private int seq;
	private String name;
	
	//카드정보
	private String cardNumber;
	private String alias;
	private String enddate;
	

	
	
    public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	private String category;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
	public int getSeq() {
	    return seq;
	}

	public void setSeq(int seq) {
	    this.seq = seq;
	}

	public String getName() {
	    return name;
	}

	public void setName(String name) {
	    this.name = name;
	}
	public int getDiscountRate() {
	    return discountRate;
	}

	public void setDiscountRate(int discountRate) {
	    this.discountRate = discountRate;
	}
	
	
	public String getCiName() {
		return ciName;
	}
	
	public void setCiName(String ciName) {
		this.ciName = ciName;
	}
	
	public String getExplanation() {
		return explanation;
	}
	
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	
	public int getAnnualFee() {
		return annualFee;
	}
	
	public void setAnnualFee(int annualFee) {
		this.annualFee = annualFee;
	}
	
	public String getOverseasUse() {
		return overseasUse;
	}
	
	public void setOverseasUse(String overseasUse) {
		this.overseasUse = overseasUse;
	}
	
	public String getCardCompany() {
		return cardCompany;
	}
	
	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}
	
	public String getFileLink() {
		return fileLink;
	}
	
	public void setFileLink(String fileLink) {
		this.fileLink = fileLink;
	}
	
	public int getSeqCardType() {
		return seqCardType;
	}
	
	public void setSeqCardType(int seqCardType) {
		this.seqCardType = seqCardType;
	}
	
	public int getLcbseqCardCategory() {
		return lcbseqCardCategory;
	}
	
	public void setLcbseqCardCategory(int lcbseqCardCategory) {
		this.lcbseqCardCategory = lcbseqCardCategory;
	}
	
	
	public String getCcName() {
		return ccName;
	}
	
	public void setCcName(String ccName) {
		this.ccName = ccName;
	}
	
	public int getCaaSeqCardCategory() {
		return caaSeqCardCategory;
	}
	
	public void setCaaSeqCardCategory(int caaSeqCardCategory) {
		this.caaSeqCardCategory = caaSeqCardCategory;
	}
	
	public int getSeqAccCategory() {
		return seqAccCategory;
	}
	
	public void setSeqAccCategory(int seqAccCategory) {
		this.seqAccCategory = seqAccCategory;
	}

	@Override
	public String toString() {
		return "CardDTO [ciName=" + ciName + ", explanation=" + explanation + ", annualFee=" + annualFee
				+ ", overseasUse=" + overseasUse + ", cardCompany=" + cardCompany + ", fileLink=" + fileLink
				+ ", seqCardType=" + seqCardType + ", lcbseqCardCategory=" + lcbseqCardCategory
				+ ", seqCardInformation=" + seqCardInformation + ", ccName=" + ccName + ", caaSeqCardCategory="
				+ caaSeqCardCategory + ", seqAccCategory=" + seqAccCategory + ", discountRate=" + discountRate
				+ ", seq=" + seq + ", name=" + name + ", category=" + category + "]";
	}

	
	
	
}