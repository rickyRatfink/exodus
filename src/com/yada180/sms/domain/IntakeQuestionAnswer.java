package com.yada180.sms.domain;

// Generated Sep 19, 2013 1:34:58 PM by Hibernate Tools 3.4.0.CR1

/**
 * IntakeQuestionAnswer generated by hbm2java
 */
public class IntakeQuestionAnswer implements java.io.Serializable {

	private Long intakeQuestionAnswerId;
	private long questionId;
	private String answer;
	private long intakeId;
	private String detail;
	private String dates;

	public IntakeQuestionAnswer() {
	}

	public IntakeQuestionAnswer(long questionId, long intakeId) {
		this.questionId = questionId;
		this.intakeId = intakeId;
	}

	public IntakeQuestionAnswer(long questionId, String answer, long intakeId,
			String detail, String dates) {
		this.questionId = questionId;
		this.answer = answer;
		this.intakeId = intakeId;
		this.detail = detail;
		this.dates = dates;
	}

	public Long getIntakeQuestionAnswerId() {
		return this.intakeQuestionAnswerId;
	}

	public void setIntakeQuestionAnswerId(Long intakeQuestionAnswerId) {
		this.intakeQuestionAnswerId = intakeQuestionAnswerId;
	}

	public long getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(long questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public long getIntakeId() {
		return this.intakeId;
	}

	public void setIntakeId(long intakeId) {
		this.intakeId = intakeId;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getDates() {
		return this.dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

}
