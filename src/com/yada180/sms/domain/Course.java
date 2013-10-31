package com.yada180.sms.domain;

// Generated Sep 19, 2013 1:34:58 PM by Hibernate Tools 3.4.0.CR1

/**
 * Course generated by hbm2java
 */
public class Course implements java.io.Serializable {

	private Long courseId;
	private String title;
	private String description;
	private String beginDate;
	private String endDate;
	private String beginTime;
	private String endTime;
	private String meetingDays;
	private String creationDate;
	private String createdBy;

	public Course() {
	}

	public Course(String title, String description, String beginDate,
			String endDate, String beginTime, String endTime,
			String meetingDays, String creationDate, String createdBy) {
		this.title = title;
		this.description = description;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.meetingDays = meetingDays;
		this.creationDate = creationDate;
		this.createdBy = createdBy;
	}

	public Long getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBeginDate() {
		return this.beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return this.endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMeetingDays() {
		return this.meetingDays;
	}

	public void setMeetingDays(String meetingDays) {
		this.meetingDays = meetingDays;
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

}
