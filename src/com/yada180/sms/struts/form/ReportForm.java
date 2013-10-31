package com.yada180.sms.struts.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;

import com.yada180.sms.domain.CwtMaster;
import com.yada180.sms.domain.Intake;

public class ReportForm extends ActionForm {
	
	private List<Intake> class0List = new ArrayList<Intake>();
	private List<Intake> class1List = new ArrayList<Intake>();
	private List<Intake> class2List = new ArrayList<Intake>();
	private List<Intake> class3List = new ArrayList<Intake>();
	private List<Intake> class4List = new ArrayList<Intake>();
	private List<Intake> class5List = new ArrayList<Intake>();
	private List<Intake> class6List = new ArrayList<Intake>();
	private List<Intake> class7List = new ArrayList<Intake>();
	private List<Intake> class8List = new ArrayList<Intake>();
	private List<Intake> class9List = new ArrayList<Intake>();
	private List<Intake> class10List = new ArrayList<Intake>();

	private List<CwtMaster> class0CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class1CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class2CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class3CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class4CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class5CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class6CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class7CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class8CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class9CwtMasterList = new ArrayList<CwtMaster>();
	private List<CwtMaster> class10CwtMasterList = new ArrayList<CwtMaster>();

	private String farmBase="";
	private String reportTitle="";
	private String runDate="";	
	
	private String classTitle0="Orientation";
	private String classTitle1="Class 1";
	private String classTitle2="Class 2";
	private String classTitle3="Class 3";
	private String classTitle4="Class 4";
	private String classTitle5="Class 5";
	private String classTitle6="Class 6";
	private String classTitle7="Fresh Start";
	private String classTitle8="Interns";
	private String classTitle9="SLS";
	private String classTitle10="Student Teacher";	
	
	private String [] class0flag = new String[100];
	private String [] class1flag = new String[100];
	private String [] class2flag = new String[100];
	private String [] class3flag = new String[100];
	private String [] class4flag = new String[100];
	private String [] class5flag = new String[100];
	private String [] class6flag = new String[100];
	
	String program0[] = new String[200];
	String program1[] = new String[200];
	String program2[] = new String[200];
	String program3[] = new String[200];
	String program4[] = new String[200];
	String program5[] = new String[200];
	String program6[] = new String[200];
	String program7[] = new String[200];
	String program8[] = new String[200];
	String program9[] = new String[200];
	String program10[] = new String[200];
	
	private String lastRotationDate="";
	private String lastRotatedBy="";
	
	
	public List<CwtMaster> getClass0CwtMasterList() {
		return class0CwtMasterList;
	}
	public void setClass0CwtMasterList(List<CwtMaster> class0CwtMasterList) {
		this.class0CwtMasterList = class0CwtMasterList;
	}
	public List<CwtMaster> getClass1CwtMasterList() {
		return class1CwtMasterList;
	}
	public void setClass1CwtMasterList(List<CwtMaster> class1CwtMasterList) {
		this.class1CwtMasterList = class1CwtMasterList;
	}
	public List<CwtMaster> getClass2CwtMasterList() {
		return class2CwtMasterList;
	}
	public void setClass2CwtMasterList(List<CwtMaster> class2CwtMasterList) {
		this.class2CwtMasterList = class2CwtMasterList;
	}
	public List<CwtMaster> getClass3CwtMasterList() {
		return class3CwtMasterList;
	}
	public void setClass3CwtMasterList(List<CwtMaster> class3CwtMasterList) {
		this.class3CwtMasterList = class3CwtMasterList;
	}
	public List<CwtMaster> getClass4CwtMasterList() {
		return class4CwtMasterList;
	}
	public void setClass4CwtMasterList(List<CwtMaster> class4CwtMasterList) {
		this.class4CwtMasterList = class4CwtMasterList;
	}
	public List<CwtMaster> getClass5CwtMasterList() {
		return class5CwtMasterList;
	}
	public void setClass5CwtMasterList(List<CwtMaster> class5CwtMasterList) {
		this.class5CwtMasterList = class5CwtMasterList;
	}
	public List<CwtMaster> getClass6CwtMasterList() {
		return class6CwtMasterList;
	}
	public void setClass6CwtMasterList(List<CwtMaster> class6CwtMasterList) {
		this.class6CwtMasterList = class6CwtMasterList;
	}
	public List<CwtMaster> getClass7CwtMasterList() {
		return class7CwtMasterList;
	}
	public void setClass7CwtMasterList(List<CwtMaster> class7CwtMasterList) {
		this.class7CwtMasterList = class7CwtMasterList;
	}
	public List<CwtMaster> getClass8CwtMasterList() {
		return class8CwtMasterList;
	}
	public void setClass8CwtMasterList(List<CwtMaster> class8CwtMasterList) {
		this.class8CwtMasterList = class8CwtMasterList;
	}
	public List<CwtMaster> getClass9CwtMasterList() {
		return class9CwtMasterList;
	}
	public void setClass9CwtMasterList(List<CwtMaster> class9CwtMasterList) {
		this.class9CwtMasterList = class9CwtMasterList;
	}
	public List<CwtMaster> getClass10CwtMasterList() {
		return class10CwtMasterList;
	}
	public void setClass10CwtMasterList(List<CwtMaster> class10CwtMasterList) {
		this.class10CwtMasterList = class10CwtMasterList;
	}
	public String getLastRotationDate() {
		return lastRotationDate;
	}
	public void setLastRotationDate(String lastRotationDate) {
		this.lastRotationDate = lastRotationDate;
	}
	public String getLastRotatedBy() {
		return lastRotatedBy;
	}
	public void setLastRotatedBy(String lastRotatedBy) {
		this.lastRotatedBy = lastRotatedBy;
	}
	public String[] getClass1flag() {
		return class1flag;
	}
	public void setClass1flag(String[] class1flag) {
		this.class1flag = class1flag;
	}
	public String[] getClass2flag() {
		return class2flag;
	}
	public void setClass2flag(String[] class2flag) {
		this.class2flag = class2flag;
	}
	public String[] getClass3flag() {
		return class3flag;
	}
	public void setClass3flag(String[] class3flag) {
		this.class3flag = class3flag;
	}
	public String[] getClass4flag() {
		return class4flag;
	}
	public void setClass4flag(String[] class4flag) {
		this.class4flag = class4flag;
	}
	public String[] getClass5flag() {
		return class5flag;
	}
	public void setClass5flag(String[] class5flag) {
		this.class5flag = class5flag;
	}
	public String[] getClass6flag() {
		return class6flag;
	}
	public void setClass6flag(String[] class6flag) {
		this.class6flag = class6flag;
	}
	public String[] getClass0flag() {
		return class0flag;
	}
	public void setClass0flag(String[] class0flag) {
		this.class0flag = class0flag;
	}
	public String getClassTitle0() {
		return classTitle0;
	}
	public void setClassTitle0(String classTitle0) {
		this.classTitle0 = classTitle0;
	}
	public String getClassTitle1() {
		return classTitle1;
	}
	public void setClassTitle1(String classTitle1) {
		this.classTitle1 = classTitle1;
	}
	public String getClassTitle2() {
		return classTitle2;
	}
	public void setClassTitle2(String classTitle2) {
		this.classTitle2 = classTitle2;
	}
	public String getClassTitle3() {
		return classTitle3;
	}
	public void setClassTitle3(String classTitle3) {
		this.classTitle3 = classTitle3;
	}
	public String getClassTitle4() {
		return classTitle4;
	}
	public void setClassTitle4(String classTitle4) {
		this.classTitle4 = classTitle4;
	}
	public String getClassTitle5() {
		return classTitle5;
	}
	public void setClassTitle5(String classTitle5) {
		this.classTitle5 = classTitle5;
	}
	public String getClassTitle6() {
		return classTitle6;
	}
	public void setClassTitle6(String classTitle6) {
		this.classTitle6 = classTitle6;
	}
	public String getClassTitle7() {
		return classTitle7;
	}
	public void setClassTitle7(String classTitle7) {
		this.classTitle7 = classTitle7;
	}
	public String getClassTitle8() {
		return classTitle8;
	}
	public void setClassTitle8(String classTitle8) {
		this.classTitle8 = classTitle8;
	}
	public String getClassTitle9() {
		return classTitle9;
	}
	public void setClassTitle9(String classTitle9) {
		this.classTitle9 = classTitle9;
	}
	public String getClassTitle10() {
		return classTitle10;
	}
	public void setClassTitle10(String classTitle10) {
		this.classTitle10 = classTitle10;
	}
	public List<Intake> getClass0List() {
		return class0List;
	}
	public void setClass0List(List<Intake> class0List) {
		this.class0List = class0List;
	}
	public List<Intake> getClass1List() {
		return class1List;
	}
	public void setClass1List(List<Intake> class1List) {
		this.class1List = class1List;
	}
	public List<Intake> getClass2List() {
		return class2List;
	}
	public void setClass2List(List<Intake> class2List) {
		this.class2List = class2List;
	}
	public List<Intake> getClass3List() {
		return class3List;
	}
	public void setClass3List(List<Intake> class3List) {
		this.class3List = class3List;
	}
	public List<Intake> getClass4List() {
		return class4List;
	}
	public void setClass4List(List<Intake> class4List) {
		this.class4List = class4List;
	}
	public List<Intake> getClass5List() {
		return class5List;
	}
	public void setClass5List(List<Intake> class5List) {
		this.class5List = class5List;
	}
	public List<Intake> getClass6List() {
		return class6List;
	}
	public void setClass6List(List<Intake> class6List) {
		this.class6List = class6List;
	}
	public List<Intake> getClass7List() {
		return class7List;
	}
	public void setClass7List(List<Intake> class7List) {
		this.class7List = class7List;
	}
	public List<Intake> getClass8List() {
		return class8List;
	}
	public void setClass8List(List<Intake> class8List) {
		this.class8List = class8List;
	}
	public List<Intake> getClass9List() {
		return class9List;
	}
	public void setClass9List(List<Intake> class9List) {
		this.class9List = class9List;
	}
	public List<Intake> getClass10List() {
		return class10List;
	}
	public void setClass10List(List<Intake> class10List) {
		this.class10List = class10List;
	}
	public String getFarmBase() {
		return farmBase;
	}
	public void setFarmBase(String farmBase) {
		this.farmBase = farmBase;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getRunDate() {
		return runDate;
	}
	public void setRunDate(String runDate) {
		this.runDate = runDate;
	}
	public String[] getProgram0() {
		return program0;
	}
	public void setProgram0(String[] program0) {
		this.program0 = program0;
	}
	public String[] getProgram1() {
		return program1;
	}
	public void setProgram1(String[] program1) {
		this.program1 = program1;
	}
	public String[] getProgram2() {
		return program2;
	}
	public void setProgram2(String[] program2) {
		this.program2 = program2;
	}
	public String[] getProgram3() {
		return program3;
	}
	public void setProgram3(String[] program3) {
		this.program3 = program3;
	}
	public String[] getProgram4() {
		return program4;
	}
	public void setProgram4(String[] program4) {
		this.program4 = program4;
	}
	public String[] getProgram5() {
		return program5;
	}
	public void setProgram5(String[] program5) {
		this.program5 = program5;
	}
	public String[] getProgram6() {
		return program6;
	}
	public void setProgram6(String[] program6) {
		this.program6 = program6;
	}
	public String[] getProgram7() {
		return program7;
	}
	public void setProgram7(String[] program7) {
		this.program7 = program7;
	}
	public String[] getProgram8() {
		return program8;
	}
	public void setProgram8(String[] program8) {
		this.program8 = program8;
	}
	public String[] getProgram9() {
		return program9;
	}
	public void setProgram9(String[] program9) {
		this.program9 = program9;
	}
	public String[] getProgram10() {
		return program10;
	}
	public void setProgram10(String[] program10) {
		this.program10 = program10;
	}
	
	
	
	
}
