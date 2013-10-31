<%@ page import="org.dispatch.faithfarm.domain.Intake" %>
<%@ page import="org.dispatch.faithfarm.domain.CourseRotationHistory" %>
<%@ page import="org.dispatch.faithfarm.util.Validator" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="../../includes/header.jsp" flush="true"/>

<%
	 Validator v8r = new Validator();
	 String farm=request.getParameter("farm");
	 java.util.Date sDate = new java.util.Date();
	 String runDate = v8r.convertDate(sDate.toString());
	 
	 CourseRotationHistory history = null;
	 history = (CourseRotationHistory)session.getAttribute("history_stats");
	 if (history==null)
		 history=new CourseRotationHistory();
	 
	 Integer iTotal = (Integer)session.getAttribute("total_students");
	 int totalCount = iTotal.intValue();
%>


<div align="center">
<form method="POST" action="<%=request.getContextPath()%>/student">

<table width="850">
	<tr>
		<td><h1>Class Roster</h1></td>
	</tr>
	<tr>
		<td><b>Last Rotated</b>:&nbsp;&nbsp;<%=history.getRotationDate()%> by <%=history.getCreatedBy() %><br/>
		<b>Moved</b>:&nbsp;&nbsp;0/<%=history.getMoved_course_0_to_1() %>&nbsp;&nbsp;
		1/<%=history.getMoved_course_1_to_2() %>&nbsp;&nbsp;
		2/<%=history.getMoved_course_2_to_3() %>&nbsp;&nbsp;
		3/<%=history.getMoved_course_3_to_4() %>&nbsp;&nbsp;
		4/<%=history.getMoved_course_4_to_5() %>&nbsp;&nbsp;
		5/<%=history.getMoved_course_5_to_6() %><br/>
		<b>Held:&nbsp;&nbsp;</b>0/<%=history.getHeld_course_0() %>&nbsp;&nbsp;
		1/<%=history.getHeld_course_1() %>&nbsp;&nbsp;
		2/<%=history.getHeld_course_2() %>&nbsp;&nbsp;
		3/<%=history.getHeld_course_3() %>&nbsp;&nbsp;
		4/<%=history.getHeld_course_4() %>&nbsp;&nbsp;
		5/<%=history.getHeld_course_5() %>&nbsp;&nbsp;
		6/<%=history.getHeld_course_6() %><br/>
		<b>Graduated:&nbsp;&nbsp;</b>
		<%=history.getGraduated() %><br/>
		<b>Total Enrolled Students:&nbsp;&nbsp;</b>
		<%=totalCount %>
		
		</td>
	</tr>
</table>
<table width="850" class="report">
	<% 
	
	
	String title="";
	
	for (int c=0;c<7;c++) {
		 ArrayList results = (ArrayList) session.getAttribute("classlist_"+c);
		 if (results==null)
		 	results=new ArrayList();
    if (c==0) title="Orientation";
    else if (c==7) title="Fresh Start";
    else if (c==8) title="Interns";
    else if (c==9) title="SLS";
    else if (c==10) title="Student Teacher";
    else title="0"+c;
	%>
	<tr>
		<td colspan="16" class="reportHeader"><b>Class:&nbsp;<%=title %></b></td>
	</tr>
	<%
	
	try { 
	
	Intake intake1 = new Intake();
	Intake intake2 = new Intake();
	Intake intake3 = new Intake();
	Intake intake4 = new Intake();
		
	if (results.size()==0) { %>
		<tr>
			<td class="reportRow">No students enrolled.</td>
	    </tr>
	<%
	} else
	
	for (int i=0;i<results.size();i+=4) { 
		try { intake1 = (Intake)results.get(i); } catch (Exception e) { intake1=new Intake(); }
		try { intake2 = (Intake)results.get(i+1); } catch (Exception e) { intake2=new Intake(); }
		try { intake3 = (Intake)results.get(i+2); } catch (Exception e) { intake3=new Intake(); }
		try { intake4 = (Intake)results.get(i+3); } catch (Exception e) { intake4=new Intake(); }
	%>
	<tr>
    	<% if (!intake1.getIntakeId().equals(new Long("0"))) { %>
    	<td><input type="checkbox" name="key_<%=intake1.getIntakeId()%>" value="YES" checked/></td>
    	<td width="100" class="reportRow"><%=intake1.getFirstName().toLowerCase() %>&nbsp;<%=intake1.getLastName().toLowerCase() %></td>
    	<td width="70" class="reportRow"><%=v8r.convertDate(intake1.getEntryDate()) %></td>
    	<td width="20" class="reportRow"></td>
    	<% } %>
        
        <% if (!intake2.getIntakeId().equals(new Long("0"))) { %>
        <td><input type="checkbox" name="key_<%=intake2.getIntakeId()%>" value="YES" checked ></td>
    	<td width="100" class="reportRow"><%=intake2.getFirstName().toLowerCase() %>&nbsp;<%=intake2.getLastName().toLowerCase() %></td>
    	<td width="70" class="reportRow"><%=v8r.convertDate(intake2.getEntryDate()) %></td>
    	<td width="20" class="reportRow"></td>
    	<% } %>
        <% if (!intake3.getIntakeId().equals(new Long("0"))) { %>
        <td><input type="checkbox" name="key_<%=intake3.getIntakeId()%>" value="YES" checked/></td>
    	<td width="100" class="reportRow"><%=intake3.getFirstName().toLowerCase() %>&nbsp;<%=intake3.getLastName().toLowerCase() %></td>
    	<td width="70" class="reportRow"><%=v8r.convertDate(intake3.getEntryDate()) %></td>
    	<td width="20" class="reportRow"></td>
    	<% } %>
        <% if (!intake4.getIntakeId().equals(new Long("0"))) { %>
    	<td><input type="checkbox" name="key_<%=intake4.getIntakeId()%>" value="YES" checked/></td>
    	<td width="100" class="reportRow"><%=intake4.getFirstName().toLowerCase() %>&nbsp;<%=intake4.getLastName().toLowerCase() %></td>
    	<td width="70" class="reportRow"><%=v8r.convertDate(intake4.getEntryDate()) %></td>
    	<td width="20" class="reportRow"></td>
    	<% } %>
    </tr>
    <% } 
	} catch (Exception e) {}
	
	} //end of class loop
    %>
 
    </table>
    <br/><br/>
	  <input type="hidden" name="farm" value="<%=request.getParameter("farm")%>"/>
   	  <input type="submit" name="action" value="Rotate Students" class="imageButtonSave" title="Rotate" />
</form>
  </div>

 
</div>