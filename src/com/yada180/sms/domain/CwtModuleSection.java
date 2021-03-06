package com.yada180.sms.domain;

// Generated Sep 28, 2013 1:04:42 PM by Hibernate Tools 3.4.0.CR1

/**
 * CwtModuleSection generated by hbm2java
 */
public class CwtModuleSection implements java.io.Serializable {

	private Long moduleOfferingId;
	private Long moduleId;
	private String meetingDays;
	private String meetingTimes;
	private String creditHours;
	private Long instructorId;
	private String status;
	private String effectiveDate;
	private String expirationDate;
	private String location;
	private String farmBase;

	public CwtModuleSection() {
	}

	public CwtModuleSection(Long moduleId, String meetingDays,
			String meetingTimes, String creditHours, Long instructorId,
			String status, String effectiveDate, String expirationDate,
			String location, String farmBase) {
		this.moduleId = moduleId;
		this.meetingDays = meetingDays;
		this.meetingTimes = meetingTimes;
		this.creditHours = creditHours;
		this.instructorId = instructorId;
		this.status = status;
		this.effectiveDate = effectiveDate;
		this.expirationDate = expirationDate;
		this.location = location;
		this.farmBase = farmBase;
	}

	public Long getModuleOfferingId() {
		return this.moduleOfferingId;
	}

	public void setModuleOfferingId(Long moduleOfferingId) {
		this.moduleOfferingId = moduleOfferingId;
	}

	public Long getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public String getMeetingDays() {
		return this.meetingDays;
	}

	public void setMeetingDays(String meetingDays) {
		this.meetingDays = meetingDays;
	}

	public String getMeetingTimes() {
		return this.meetingTimes;
	}

	public void setMeetingTimes(String meetingTimes) {
		this.meetingTimes = meetingTimes;
	}

	public String getCreditHours() {
		return this.creditHours;
	}

	public void setCreditHours(String creditHours) {
		this.creditHours = creditHours;
	}

	public Long getInstructorId() {
		return this.instructorId;
	}

	public void setInstructorId(Long instructorId) {
		this.instructorId = instructorId;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEffectiveDate() {
		return this.effectiveDate;
	}

	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getExpirationDate() {
		return this.expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFarmBase() {
		return this.farmBase;
	}

	public void setFarmBase(String farmBase) {
		this.farmBase = farmBase;
	}

}
