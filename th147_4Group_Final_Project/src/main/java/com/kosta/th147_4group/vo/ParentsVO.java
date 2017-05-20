package com.kosta.th147_4group.vo;

<<<<<<< HEAD
public class ParentsVO {
	
	private String paId;			// 학부모 아이디
	private String paPw;			// 학부모 비밀번호
	private String paName;			// 학부모 이름
	private String paTel;			// 학부모 핸드폰번호
	private String paSite;			// 학부모 주소
	private String paEmail;			// 학부모 이메일
	private String paSms;			// 학부모 SMS 동의여부 
	private String paLevel;			// 값 : 학부모
	private String paStName;		// 학부모의 자녀 이름
=======
import java.sql.Timestamp;

public class ParentsVO {
	
	private int PANUM; // auto_increment [테스트]
	private String PAID;			// 학부모 아이디
	private String PAPW;			// 학부모 비밀번호
	private Timestamp PADATE; // 현재시간 컬럼추가  [테스트]
	private String PANM;			// 학부모 이름
	private String PATEL;			// 학부모 핸드폰번호
	private String PASITE;			// 학부모 주소
	private String PAEM;			// 학부모 이메일
	private String PASMS;			// 학부모 SMS 동의여부 
	private String PALEV;			// 값 : 학부모
	private String PANM_ST;		// 학부모의 자녀 이름
>>>>>>> 0b4db116b6643780de43675333371159706cd6cd
	
	public ParentsVO(){
		
	}

<<<<<<< HEAD
	public ParentsVO(String paId, String paPw, String paName, String paTel, String paSite, String paEmail, String paSms,
			String paLevel, String paStName) {

		this.paId = paId;
		this.paPw = paPw;
		this.paName = paName;
		this.paTel = paTel;
		this.paSite = paSite;
		this.paEmail = paEmail;
		this.paSms = paSms;
		this.paLevel = paLevel;
		this.paStName = paStName;
	}

	public String getPaId() {
		return paId;
	}

	public void setPaId(String paId) {
		this.paId = paId;
	}

	public String getPaPw() {
		return paPw;
	}

	public void setPaPw(String paPw) {
		this.paPw = paPw;
	}

	public String getPaName() {
		return paName;
	}

	public void setPaName(String paName) {
		this.paName = paName;
	}

	public String getPaTel() {
		return paTel;
	}

	public void setPaTel(String paTel) {
		this.paTel = paTel;
	}

	public String getPaSite() {
		return paSite;
	}

	public void setPaSite(String paSite) {
		this.paSite = paSite;
	}

	public String getPaEmail() {
		return paEmail;
	}

	public void setPaEmail(String paEmail) {
		this.paEmail = paEmail;
	}

	public String getPaSms() {
		return paSms;
	}

	public void setPaSms(String paSms) {
		this.paSms = paSms;
	}

	public String getPaLevel() {
		return paLevel;
	}

	public void setPaLevel(String paLevel) {
		this.paLevel = paLevel;
	}

	public String getPaStName() {
		return paStName;
	}

	public void setPaStName(String paStName) {
		this.paStName = paStName;
	}

	@Override
	public String toString() {
		return "ParentsVO [paId=" + paId + ", paPw=" + paPw + ", paName=" + paName + ", paTel=" + paTel + ", paSite="
				+ paSite + ", paEmail=" + paEmail + ", paSms=" + paSms + ", paLevel=" + paLevel + ", paStName="
				+ paStName + "]";
	}

=======
	public int getPANUM() {
		return PANUM;
	}

	public void setPANUM(int pANUM) {
		PANUM = pANUM;
	}

	public String getPAID() {
		return PAID;
	}

	public void setPAID(String pAID) {
		PAID = pAID;
	}

	public String getPAPW() {
		return PAPW;
	}

	public void setPAPW(String pAPW) {
		PAPW = pAPW;
	}

	public Timestamp getPADATE() {
		return PADATE;
	}

	public void setPADATE(Timestamp pADATE) {
		PADATE = pADATE;
	}

	public String getPANM() {
		return PANM;
	}

	public void setPANM(String pANM) {
		PANM = pANM;
	}

	public String getPATEL() {
		return PATEL;
	}

	public void setPATEL(String pATEL) {
		PATEL = pATEL;
	}

	public String getPASITE() {
		return PASITE;
	}

	public void setPASITE(String pASITE) {
		PASITE = pASITE;
	}

	public String getPAEM() {
		return PAEM;
	}

	public void setPAEM(String pAEM) {
		PAEM = pAEM;
	}

	public String getPASMS() {
		return PASMS;
	}

	public void setPASMS(String pASMS) {
		PASMS = pASMS;
	}

	public String getPALEV() {
		return PALEV;
	}

	public void setPALEV(String pALEV) {
		PALEV = pALEV;
	}

	public String getPANM_ST() {
		return PANM_ST;
	}

	public void setPANM_ST(String pANM_ST) {
		PANM_ST = pANM_ST;
	}

	

	

	

>>>>>>> 0b4db116b6643780de43675333371159706cd6cd
}
