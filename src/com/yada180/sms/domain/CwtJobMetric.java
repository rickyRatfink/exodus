package com.yada180.sms.domain;

// Generated Sep 23, 2013 4:16:44 PM by Hibernate Tools 3.4.0.CR1

/**
 * CwtJobMetric generated by hbm2java
 */
public class CwtJobMetric implements java.io.Serializable {

	private Long metricJobId;
	private Long metricId;
	private Long jobId;

	public CwtJobMetric() {
	}

	public CwtJobMetric(Long metricId, Long jobId) {
		this.metricId = metricId;
		this.jobId = jobId;
	}

	public Long getMetricJobId() {
		return this.metricJobId;
	}

	public void setMetricJobId(Long metricJobId) {
		this.metricJobId = metricJobId;
	}

	public Long getMetricId() {
		return this.metricId;
	}

	public void setMetricId(Long metricId) {
		this.metricId = metricId;
	}

	public Long getJobId() {
		return this.jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

}
