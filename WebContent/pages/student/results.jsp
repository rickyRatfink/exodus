<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@ page import="java.util.ArrayList" %>

<jsp:include page="../../includes/header.jsp" flush="true"/>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="mainBkgr">
			<jsp:include page="../../includes/menu.jsp" flush="true"/>
		</td>
		<td width="100%" align="left" valign="top" class="mainBkgr" >
			<div id="boxContent"> 
				<div id="breadcrumb">
					&nbsp;&nbsp;Home > Residents > Search > Results
				</div>
 
 <script language="javascript">
	toggleVisibility('Residents');
</script>
 
        <html:form action="/Intake">
        
        <div class="styledForm">
        
       		<table width="600" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="header1">Resident Search Results</td>
				</tr>
				<tr>
				<% int x=0; %>
				<logic:notEmpty name="intakeForm" property="intakeList">
					<logic:iterate id="loop" name="intakeForm" property="intakeList">
						<% x++; %>
					</logic:iterate>
						<td class="instructions">There were <%=x %> result(s) returned.  <a href="<%=request.getContextPath()%>/Intake.do?action=Search">Click here</a> to search again.</br></br></td>
				</logic:notEmpty>	
				<logic:empty name="intakeForm" property="intakeList">
						<td class="instructions">No result(s) matching your criteria was returned.  <a href="<%=request.getContextPath()%>/Intake.do?action=Search">Click here</a> to search again.</br></br></td>
				</logic:empty>
				</tr>
			</table>
        
<% int count=0; %>
  <logic:notEmpty name="intakeForm" property="intakeList">
     <table width="900" cellpadding="0" cellspacing="0" border="0">
     <tr>
           <td width="5" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader"></td>
           <td width="90" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">RESIDENT ID</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="150" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">LAST NAME</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="50" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">MI</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="150" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">FIRSTNAME</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="70" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">SSN</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="70" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">DOB</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="100" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">ENTRY DATE</td>
           <td width="3" height="18" background="<%=request.getContextPath() %>/images/searchHeaderSpacer.png"></td>
           <td width="130" height="18" background="<%=request.getContextPath() %>/images/searchHeaderBk.png" class="searchFieldHeader">STATUS</td>
       </tr>
    
	    <logic:iterate id="loop" name="intakeForm" property="intakeList">
	    <% count++; 
	    String style="Odd";
	    if (count%2==0) style="Even"; %>
	    <tr>
	       <td colspan="2" class="searchFieldResult<%=style%>" align="center"> <a href="<%=request.getContextPath()%>/Intake.do?action=Edit&key=<bean:write name="loop" property="intakeId"/>" style="text-decoration:none;font-size:.95em;"><bean:write name="loop" property="intakeId"/></a></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="lastname"/></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="mi"/></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="firstname"/></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="ssn"/></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="dob"/></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="entryDate"/></td>
	       <td colspan="2" class="searchFieldResult<%=style%>"><bean:write name="loop" property="intakeStatus"/></td>
	   </tr>
	   </logic:iterate>
		<tr><td class="searchRowOdd2" colspan="10" ><b><%=count %> results returned</b></td></tr>
	</logic:notEmpty>

    
 </html:form> 
 </td>
 </tr>
</table>
  </br></br></br></br>
  
        </div>
        </div>
    <div class="footer">
        
    </div>
   
</form>
</body>
</html>