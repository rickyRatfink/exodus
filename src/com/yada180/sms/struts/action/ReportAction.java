package com.yada180.sms.struts.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yada180.sms.application.Constants;
import com.yada180.sms.domain.CourseRotationHistory;
import com.yada180.sms.domain.CwtJob;
import com.yada180.sms.domain.CwtMaster;
import com.yada180.sms.domain.CwtSupervisor;
import com.yada180.sms.domain.Intake;
import com.yada180.sms.domain.StudentHistory;
import com.yada180.sms.domain.SystemUser;
import com.yada180.sms.hibernate.dao.CourseRotationHistoryDao;
import com.yada180.sms.hibernate.dao.CwtJobDao;
import com.yada180.sms.hibernate.dao.CwtSupervisorDao;
import com.yada180.sms.hibernate.dao.IntakeDao;
import com.yada180.sms.hibernate.dao.StudentHistoryDao;
import com.yada180.sms.struts.form.ReportForm;
import com.yada180.sms.util.HtmlDropDownBuilder;
import com.yada180.sms.util.Validator;

public class ReportAction extends Action {
	
	private final static Logger LOGGER = Logger.getLogger(LoginAction.class.getName());
	private final static HtmlDropDownBuilder html = new HtmlDropDownBuilder();
	private final static Validator v8r = new Validator();
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {		
		LOGGER.setLevel(Level.INFO);

		 HttpSession session = request.getSession(false);
		 
		 String action=request.getParameter("action");
		 SystemUser user = (SystemUser) session.getAttribute("system_user");
		 
		 IntakeDao intakeDao = new IntakeDao ();
		 CwtSupervisorDao sDao = new CwtSupervisorDao();
		 CwtJobDao jDao = new CwtJobDao();
		 StudentHistoryDao hDao = new StudentHistoryDao();
		
		 CourseRotationHistoryDao historyDao = new CourseRotationHistoryDao();
		 
		 List<Intake> intakeList = new ArrayList<Intake>();
		 
		 ReportForm reportForm = (ReportForm)form;
		 
		 String report=request.getParameter("rpt");
		 String farm=request.getParameter("farm");
		 
		 
		 
		 if ("FastFind".equals(action)) {
			 reportForm.setReportTitle("Class List");
			 farm=user.getFarmBase();
			 reportForm.setFarmBase(farm);
			 this.buildFastFindList(reportForm, farm);
			 return mapping.findForward(Constants.FAST_FIND); 
		 }
		 if ("Rotate".equals(action)) {
			 List<CourseRotationHistory> list=historyDao.listCourseRotationHistoryByFarm(farm);
			 for (Iterator iterator=list.iterator();iterator.hasNext();) {
				 	CourseRotationHistory obj = (CourseRotationHistory)iterator.next();
				 	reportForm.setLastRotatedBy(obj.getCreatedBy());
				 	reportForm.setLastRotationDate(v8r.convertEpoch(new Long(obj.getRotationDate())));
				 	reportForm.setFarmBase(obj.getFarmBase());
			 }
				 
			  
		 }
		 if ("ClassList".equals(report)||"Rotate".equals(action)) {
			 reportForm.setReportTitle("Class List");
			 reportForm.setFarmBase(farm);
			 java.util.Date sDate = new java.util.Date();
			 reportForm.setRunDate(v8r.convertDate(sDate.toString()));
			 reportForm.setClass0List(intakeDao.listClass("Orientation", farm));
			 reportForm.setClass1List(intakeDao.listClass("1", farm));
			 reportForm.setClass2List(intakeDao.listClass("2", farm));
			 reportForm.setClass3List(intakeDao.listClass("3", farm));
			 reportForm.setClass4List(intakeDao.listClass("4", farm));
			 reportForm.setClass5List(intakeDao.listClass("5", farm));
			 reportForm.setClass6List(intakeDao.listClass("6", farm));
			 reportForm.setClass7List(intakeDao.listClass("Fresh Start", farm));
			 reportForm.setClass8List(intakeDao.listClass("SLS", farm));
			 reportForm.setClass9List(intakeDao.listClass("Intern", farm));
			 reportForm.setClass10List(intakeDao.listClass("Student Teacher", farm));			 
			 reportForm.setClass0flag(new String[100]);
			 reportForm.setClass1flag(new String[100]);
			 reportForm.setClass2flag(new String[100]);
			 reportForm.setClass3flag(new String[100]);
			 reportForm.setClass4flag(new String[100]);
			 reportForm.setClass5flag(new String[100]);
			 reportForm.setClass6flag(new String[100]);
			 
			 if ("Rotate".equals(action))
				 return mapping.findForward(Constants.ROTATE); 
			 else
				 return mapping.findForward(Constants.CLASS_REPORT); 
		 }
		 else if ("Rotate Students".equals(action)) {
			 this.rotateClasses(reportForm);
			 CourseRotationHistory obj = new CourseRotationHistory();
			 obj.setCreatedBy(user.getUsername());
			 obj.setRotationDate(Validator.getEpoch()+"");
			 obj.setFarmBase(user.getFarmBase());
			 historyDao.addCourseRotationHistory(obj);
			 return mapping.findForward("rotatesuccess");
		 }
		 else
			 return mapping.findForward(Constants.SUCCESS);
	}
	
	private void rotateClasses(ReportForm reportForm) {
		
		 IntakeDao dao = new IntakeDao();
		 int i=0;
		 
		 //Rotate Class 6
		 String flag6[] = reportForm.getClass6flag();
		 for (Iterator iterator =
				 reportForm.getClass6List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag6[i])) { 
				 intake.setClass_("");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass6flag(flag6);
		 
		 
		 //Rotate Class 5
		 i=0;
		 String flag5[] = reportForm.getClass5flag();
		 for (Iterator iterator =
				 reportForm.getClass5List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag5[i])) { 
				 intake.setClass_("6");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass5flag(flag5);

		 
		 //Rotate Class 4
		 i=0;
		 String flag4[] = reportForm.getClass4flag();
		 for (Iterator iterator =
				 reportForm.getClass4List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag4[i])) { 
				 intake.setClass_("5");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass4flag(flag4);

		 //Rotate Class 3
		 i=0;
		 String flag3[] = reportForm.getClass3flag();
		 for (Iterator iterator =
				 reportForm.getClass3List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag3[i])) { 
				 intake.setClass_("4");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass3flag(flag3);

		 
		 //Rotate Class 2
		 i=0;
		 String flag2[] = reportForm.getClass2flag();
		 for (Iterator iterator =
				 reportForm.getClass2List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag2[i])) { 
				 intake.setClass_("3");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass2flag(flag2);

		 
		 //Rotate Class 1
		 i=0;
		 String flag1[] = reportForm.getClass1flag();
		 for (Iterator iterator =
				 reportForm.getClass1List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag1[i])) { 
				 intake.setClass_("2");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass1flag(flag1);

		 
		 //Rotate Class 0
		 i=0;
		 String flag0[] = reportForm.getClass0flag();
		 for (Iterator iterator =
				 reportForm.getClass0List().iterator(); iterator.hasNext();){
			 Intake intake = (Intake)iterator.next();
			 if ("Yes".equals(flag0[i])) { 
				 intake.setClass_("1");
				 dao.updateIntake(intake);
			 }
		 i++;
		 }
		 reportForm.setClass0flag(flag0);
	}
	
	
	private void buildFastFindList (ReportForm reportForm, String farm) {
		
		 IntakeDao intakeDao = new IntakeDao ();
		 CwtSupervisorDao sDao = new CwtSupervisorDao();
		 CwtJobDao jDao = new CwtJobDao();
		 StudentHistoryDao hDao = new StudentHistoryDao();
		
		 CourseRotationHistoryDao historyDao = new CourseRotationHistoryDao();

		 /*
		  * Class 0
		  * 
		  */
		 List<Intake> list = intakeDao.listClass("Orientation", farm);
		 List<CwtMaster> masterList = new ArrayList<CwtMaster>();
		 String program0[] = new String[200];
		 
		 int index=0;
		 for (Iterator iterator=list.iterator();iterator.hasNext();) {
			 Intake intake = (Intake)iterator.next();
			 
			 CwtSupervisor supervisor = new CwtSupervisor();
			 if (intake.getSupervisorId()!=null) {
				 supervisor = sDao.findById(intake.getSupervisorId());
				 if (supervisor==null)
					 supervisor=new CwtSupervisor();
			 }
			 CwtJob job =new CwtJob();
			 if (intake.getJobId()!=null) {
				  job = jDao.findById(intake.getJobId());
				  if (job==null)
					  job=new CwtJob();
			 }
			 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
			 	StudentHistory studentHistory = null;
			 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
			 		 studentHistory = (StudentHistory)iterator2.next();
			 	
			 	if (studentHistory!=null)
			 		program0[index]=studentHistory.getPhase();
			 	else
			 		program0[index]="";
		 index++;
		 
		 CwtMaster master = new CwtMaster();
		 master.setIntake(intake);
		 master.setCwtJob(job);
		 master.setCwtSupervisor(supervisor);
		 masterList.add(master);
		 }
		 reportForm.setClass0CwtMasterList(masterList);
		 reportForm.setProgram0(program0);
		 
		 /*
		  * 
		  * Class 1
		  */
		 List<Intake> list1 = intakeDao.listClass("1", farm);
		 List<CwtMaster> masterList1 = new ArrayList<CwtMaster>();
		 String program1[] = new String[200];
		 
		 index=0;
		 for (Iterator iterator=list1.iterator();iterator.hasNext();) {
			 Intake intake = (Intake)iterator.next();
			 CwtSupervisor supervisor = new CwtSupervisor();
			 if (intake.getSupervisorId()!=null) {
				 supervisor = sDao.findById(intake.getSupervisorId());
				 if (supervisor==null)
					 supervisor=new CwtSupervisor();
			 }
			 
			 CwtJob job = new CwtJob();
			 if (intake.getJobId()!=null) {
				 job = jDao.findById(intake.getJobId());
				 if (job==null)
					 job=new CwtJob();
		 	 }
		 
			 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
			 	StudentHistory studentHistory = null;
			 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
			 		 studentHistory = (StudentHistory)iterator2.next();
			 	if (studentHistory!=null)
			 		program1[index]=studentHistory.getPhase();
			 	else
			 		program1[index]="";
		 index++;
		 
		 CwtMaster master1 = new CwtMaster();
		 master1.setIntake(intake);
		 master1.setCwtJob(job);
		 master1.setCwtSupervisor(supervisor);
		 masterList1.add(master1);
		 }
		 reportForm.setClass1CwtMasterList(masterList1);
		 reportForm.setProgram1(program1);
		 
		 
		 /*
		  * 
		  * Class 2
		  */
		 List<Intake> list2 = intakeDao.listClass("2", farm);
		 List<CwtMaster> masterList2 = new ArrayList<CwtMaster>();
		 String program2[] = new String[200];
		 
		 index=0;
		 for (Iterator iterator=list2.iterator();iterator.hasNext();) {
			 Intake intake = (Intake)iterator.next();
			 CwtSupervisor supervisor = new CwtSupervisor();
			 if (intake.getSupervisorId()!=null) {
				 supervisor = sDao.findById(intake.getSupervisorId());
				 if (supervisor==null)
					 supervisor=new CwtSupervisor();
			 }
			 
			 CwtJob job = new CwtJob();
			 if (intake.getJobId()!=null) {
				 job = jDao.findById(intake.getJobId());
				 if (job==null)
					 job=new CwtJob();
		 	 }
			 
			 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
			 	StudentHistory studentHistory = null;
			 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
			 		 studentHistory = (StudentHistory)iterator2.next();
			 	if (studentHistory!=null)
			 		program2[index]=studentHistory.getPhase();
			 	else
			 		program2[index]="";
		 index++;
		 
		 CwtMaster master2 = new CwtMaster();
		 master2.setIntake(intake);
		 master2.setCwtJob(job);
		 master2.setCwtSupervisor(supervisor);
		 masterList2.add(master2);
		 }
		 reportForm.setClass2CwtMasterList(masterList2);
		 reportForm.setProgram2(program2);

		 /*
		  * 
		  * Class 3
		  */
		 List<Intake> list3 = intakeDao.listClass("3", farm);
		 List<CwtMaster> masterList3 = new ArrayList<CwtMaster>();
		 String program3[] = new String[200];
		 
		 index=0;
		 for (Iterator iterator=list3.iterator();iterator.hasNext();) {
			 Intake intake = (Intake)iterator.next();
			 CwtSupervisor supervisor = new CwtSupervisor();
			 if (intake.getSupervisorId()!=null) {
				 supervisor = sDao.findById(intake.getSupervisorId());
				 if (supervisor==null)
					 supervisor=new CwtSupervisor();
			 }
			 
			 CwtJob job = new CwtJob();
			 if (intake.getJobId()!=null) {
				 job = jDao.findById(intake.getJobId());
				 if (job==null)
					 job=new CwtJob();
		 	 }
			 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
			 	StudentHistory studentHistory = null;
			 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
			 		 studentHistory = (StudentHistory)iterator2.next();
			 	if (studentHistory!=null)
			 		program3[index]=studentHistory.getPhase();
			 	else
			 		program3[index]="";
		 index++;
		 
		 CwtMaster master3 = new CwtMaster();
		 master3.setIntake(intake);
		 master3.setCwtJob(job);
		 master3.setCwtSupervisor(supervisor);
		 masterList3.add(master3);
		 }
		 reportForm.setClass3CwtMasterList(masterList3);
		 reportForm.setProgram3(program3);

	
	 /*
	  * 
	  * Class 4
	  */
	 List<Intake> list4 = intakeDao.listClass("4", farm);
	 List<CwtMaster> masterList4 = new ArrayList<CwtMaster>();
	 String program4[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list4.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program4[index]=studentHistory.getPhase();
		 	else
		 		program4[index]="";
	 index++;
	 
	 CwtMaster master4 = new CwtMaster();
	 master4.setIntake(intake);
	 master4.setCwtJob(job);
	 master4.setCwtSupervisor(supervisor);
	 masterList4.add(master4);
	 }
	 reportForm.setClass4CwtMasterList(masterList4);
	 reportForm.setProgram4(program4);

	
	 /*
	  * 
	  * Class 5
	  */
	 List<Intake> list5 = intakeDao.listClass("5", farm);
	 List<CwtMaster> masterList5 = new ArrayList<CwtMaster>();
	 String program5[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list5.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program5[index]=studentHistory.getPhase();
		 	else
		 		program5[index]="";
	 index++;
	 
	 CwtMaster master5 = new CwtMaster();
	 master5.setIntake(intake);
	 master5.setCwtJob(job);
	 master5.setCwtSupervisor(supervisor);
	 masterList5.add(master5);
	 }
	 reportForm.setClass5CwtMasterList(masterList5);
	 reportForm.setProgram5(program5);

	 /*
	  * 
	  * Class 6
	  */
	 List<Intake> list6 = intakeDao.listClass("6", farm);
	 List<CwtMaster> masterList6 = new ArrayList<CwtMaster>();
	 String program6[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list6.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program6[index]=studentHistory.getPhase();
		 	else
		 		program6[index]="";
	 index++;
	 
	 CwtMaster master6 = new CwtMaster();
	 master6.setIntake(intake);
	 master6.setCwtJob(job);
	 master6.setCwtSupervisor(supervisor);
	 masterList6.add(master6);
	 }
	 reportForm.setClass6CwtMasterList(masterList6);
	 reportForm.setProgram6(program6);

	 /*
	  * 
	  * Class 7
	  */
	 List<Intake> list7 = intakeDao.listClass("Fresh Start", farm);
	 List<CwtMaster> masterList7 = new ArrayList<CwtMaster>();
	 String program7[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list7.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program7[index]=studentHistory.getPhase();
		 	else
		 		program7[index]="";
	 index++;
	 
	 CwtMaster master7 = new CwtMaster();
	 master7.setIntake(intake);
	 master7.setCwtJob(job);
	 master7.setCwtSupervisor(supervisor);
	 masterList7.add(master7);
	 }
	 reportForm.setClass7CwtMasterList(masterList7);
	 reportForm.setProgram7(program7);
	 
	 
	 /*
	  * 
	  * Class 8
	  */
	 List<Intake> list8 = intakeDao.listClass("Intern", farm);
	 List<CwtMaster> masterList8 = new ArrayList<CwtMaster>();
	 String program8[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list8.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program8[index]=studentHistory.getPhase();
		 	else
		 		program8[index]="";
	 index++;
	 
	 CwtMaster master8 = new CwtMaster();
	 master8.setIntake(intake);
	 master8.setCwtJob(job);
	 master8.setCwtSupervisor(supervisor);
	 masterList8.add(master8);
	 }
	 reportForm.setClass8CwtMasterList(masterList8);
	 reportForm.setProgram8(program8);

	 
	 /*
	  * 
	  * Class 9
	  */
	 List<Intake> list9 = intakeDao.listClass("SLS", farm);
	 List<CwtMaster> masterList9 = new ArrayList<CwtMaster>();
	 String program9[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list9.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program9[index]=studentHistory.getPhase();
		 	else
		 		program9[index]="";
	 index++;
	 
	 CwtMaster master9 = new CwtMaster();
	 master9.setIntake(intake);
	 master9.setCwtJob(job);
	 master9.setCwtSupervisor(supervisor);
	 masterList9.add(master9);
	 }
	 reportForm.setClass9CwtMasterList(masterList9);
	 reportForm.setProgram9(program9);

	 
	 /*
	  * 
	  * Class 10
	  */
	 List<Intake> list10 = intakeDao.listClass("Student Teacher", farm);
	 List<CwtMaster> masterList10 = new ArrayList<CwtMaster>();
	 String program10[] = new String[200];
	 
	 index=0;
	 for (Iterator iterator=list10.iterator();iterator.hasNext();) {
		 Intake intake = (Intake)iterator.next();
		 CwtSupervisor supervisor = new CwtSupervisor();
		 if (intake.getSupervisorId()!=null) {
			 supervisor = sDao.findById(intake.getSupervisorId());
			 if (supervisor==null)
				 supervisor=new CwtSupervisor();
		 }
		 
		 CwtJob job = new CwtJob();
		 if (intake.getJobId()!=null) {
			 job = jDao.findById(intake.getJobId());
			 if (job==null)
				 job=new CwtJob();
	 	 }
		 
		 List<StudentHistory> history = hDao.findByIntakeId(intake.getIntakeId());
		 	StudentHistory studentHistory = null;
		 	for (Iterator iterator2=history.iterator();iterator2.hasNext();)
		 		 studentHistory = (StudentHistory)iterator2.next();
		 	if (studentHistory!=null)
		 		program10[index]=studentHistory.getPhase();
		 	else
		 		program10[index]="";
	 index++;
	 
	 CwtMaster master10 = new CwtMaster();
	 master10.setIntake(intake);
	 master10.setCwtJob(job);
	 master10.setCwtSupervisor(supervisor);
	 masterList10.add(master10);
	 }
	 reportForm.setClass10CwtMasterList(masterList10);
	 reportForm.setProgram10(program10);

	}
	
	
}
