package com.yada180.sms.domain;

// Generated Sep 19, 2013 1:34:58 PM by Hibernate Tools 3.4.0.CR1

/**
 * IntakeJobAssignment generated by hbm2java
 */
public class IntakeJobAssignment implements java.io.Serializable {

	private long intakeJobAssignmentId;
	private long jobAssignmentId;
	private long intakeId;
	private String creationDate;
	private String createdBy;

	public IntakeJobAssignment() {
	}

	public IntakeJobAssignment(long intakeJobAssignmentId,
			long jobAssignmentId, long intakeId) {
		this.intakeJobAssignmentId = intakeJobAssignmentId;
		this.jobAssignmentId = jobAssignmentId;
		this.intakeId = intakeId;
	}

	public IntakeJobAssignment(long intakeJobAssignmentId,
			long jobAssignmentId, long intakeId, String creationDate,
			String createdBy) {
		this.intakeJobAssignmentId = intakeJobAssignmentId;
		this.jobAssignmentId = jobAssignmentId;
		this.intakeId = intakeId;
		this.creationDate = creationDate;
		this.createdBy = createdBy;
	}

	public long getIntakeJobAssignmentId() {
		return this.intakeJobAssignmentId;
	}

	public void setIntakeJobAssignmentId(long intakeJobAssignmentId) {
		this.intakeJobAssignmentId = intakeJobAssignmentId;
	}

	public long getJobAssignmentId() {
		return this.jobAssignmentId;
	}

	public void setJobAssignmentId(long jobAssignmentId) {
		this.jobAssignmentId = jobAssignmentId;
	}

	public long getIntakeId() {
		return this.intakeId;
	}

	public void setIntakeId(long intakeId) {
		this.intakeId = intakeId;
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