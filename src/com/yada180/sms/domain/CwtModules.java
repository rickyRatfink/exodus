package com.yada180.sms.domain;

// Generated Sep 23, 2013 2:58:31 PM by Hibernate Tools 3.4.0.CR1

/**
 * CwtModules generated by hbm2java
 */
public class CwtModules implements java.io.Serializable {

	private Long moduleId;
	private Long programId;
	private String moduleName;
	private String description;
	private String status;
	private String creationDate;
	private String createdBy;
	private String meetingDays;
	private String meetingTimes;
	private Long instructorId;
	private String meetingLocation;

	public CwtModules() {
	}

	public CwtModules(Long programId, String moduleName, String description, String status,
			String creationDate, String createdBy, String meetingDays,
			String meetingTimes, Long instructorId, String meetingLocation) {
		this.programId = programId;
		this.moduleName = moduleName;
		this.description = description;
		this.status = status;
		this.creationDate = creationDate;
		this.createdBy = createdBy;
		this.meetingDays = meetingDays;
		this.meetingTimes = meetingTimes;
		this.instructorId = instructorId;
		this.meetingLocation = meetingLocation;
	}

	public Long getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreationDate() {
		return this.creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
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

	public Long getInstructorId() {
		return this.instructorId;
	}

	public void setInstructorId(Long instructorId) {
		this.instructorId = instructorId;
	}

	public String getMeetingLocation() {
		return this.meetingLocation;
	}

	public void setMeetingLocation(String meetingLocation) {
		this.meetingLocation = meetingLocation;
	}

	public Long getProgramId() {
		return programId;
	}

	public void setProgramId(Long programId) {
		this.programId = programId;
	}
	

}
