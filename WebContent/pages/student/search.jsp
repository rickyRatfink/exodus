<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

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
					&nbsp;&nbsp;Home > Residents > Search
				</div>


<script language="javascript">
	toggleVisibility('Residents');
</script>

				
        <html:form action="/Intake">
        
        <div class="styledForm">
        
       		<table width="600" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="header1">Resident Search</td>
				</tr>
				<tr>
					<td class="instructions">Search for residents using the filter criteria below.  Leaving all fields empty could yield large results sets that may render slow.</td>
				</tr>
			</table>
        
          	<table width="450" cellpadding="0" cellspacing="0" border="0">
          	<tr><td colspan="3" height="40"></tr>
            <tr>
            	<td>Entry Date</td>
            	<td>Exit Date</td>
            	<td>Program Status</td>
            </tr>
            <tr>
                <td><html:text property="intake.entryDate" size="20" maxlength="13" styleClass="tcal" /></td>
                <td><html:text property="intake.exitDate" size="20" maxlength="13" styleClass="tcal" /></td>
                <td>
                	<html:select property="programStatus" styleClass="select" > 
						<html:option value=""></html:option>
						<html:optionsCollection name="ddl_programStatus" value="value" label="label" />
					</html:select>
				</td>
            </tr>
            <tr><td colspan="3" height="20"></tr>
            </table>
            
            <table width="600" cellpadding="0" cellspacing="0" border="0">
            <tr>
            	<td>Last Name</td>
            	<td>First Name</td>
            	<td>SSN</td>
            	<td>Date of Birth</td>
            </tr>
             <tr>
            	<td><html:text property="intake.lastname" size="30" maxlength="13"  styleClass="textbox" /></td>
                <td><html:text property="intake.firstname" size="30" maxlength="13" styleClass="textbox" /></td>
                <td><html:text property="intake.ssn" size="11" maxlength="11"  onkeypress="return maskSsn(event,this)" styleClass="textbox" /></td>
                <td><html:text property="intake.dob" size="20" maxlength="13" styleClass="tcal" /></td>
            </tr>
            <tr><td colspan="4" height="20"></tr>
            </table>
            
           <table  cellpadding="0" cellspacing="0" border="0">
           <tr>
                 <td><html:checkbox  name="intakeForm" property="pictureFlag" value="Yes" />&nbsp;Show Picture?</td>
           </tr>
           <tr>
                <td><html:checkbox name="intakeForm" property="gedFlag" value="Yes"/>&nbsp;Need GED?&nbsp;</td>
           </tr> 
           <tr>
                <td><html:checkbox  name="intakeForm" property="pictureFlag" value="Yes" />&nbsp;Currently Takes Medication?&nbsp;</td>
           </tr>
           <tr>
                <td><html:checkbox  name="intakeForm" property="pictureFlag" value="Yes" />&nbsp;Court Ordered?&nbsp;</td>
           </tr>
           </table>
          
          <table width="100%" >
          		<tr>
                	<td width="100%" height="50" valign="center" align="left">
                      <input type="submit" name="action" value="Search Students" class="button"/>
                    </td>
                 </tr>
 		  </table>
        </div>
        
        </html:form> 
 </td>
 </tr>
</table>
 
  
        </div>
        </div>
    <div class="footer">
        
    </div>
   
</form>
</body>
</html>
