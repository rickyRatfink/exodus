<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@ page import="java.util.ArrayList" %>

<jsp:include page="../../includes/header.jsp" flush="true"/>

<script language="javascript" type="text/javascript">
function ucase(obj) {
  obj.value=obj.value.toUpperCase();
}

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
	  

</script>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="mainBkgr">
			<jsp:include page="../../includes/menu.jsp" flush="true"/>
		</td>


<script language="javascript">
	toggleVisibility('Residents');
</script>

<td width="100%" align="left" valign="top" class="mainBkgr" >
			<div id="boxContent"> 
				<div id="breadcrumb">
					&nbsp;&nbsp;Home > Residents > Discipline
				</div>

				
        <html:form action="/Intake">
        
  <div class="styledForm">
        
    <table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="header1">Discipline History/Information</td>
	</tr>
	<tr>
		<td class="instructions">
			<bean:write name="intakeForm" property="intake.firstname"/>&nbsp;<bean:write name="intakeForm" property="intake.lastname"/>
			/&nbsp;<bean:write name="intakeForm" property="intake.ssn"/> 
		</td>
	</tr>
	</table>
    
    <table width="900" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="11">
    		<jsp:include page="../../includes/messages.jsp" flush="true"/>
	   </td>
	</tr>
	</table>
	
	   	     <table width="900" cellpadding="0" cellspacing="0" border="0">
            <tr>
            	<td  style="background: silver; text-align: center;color:#000000;font-weight:bold;height=18px;">Discipline History</td>
            </tr>
            <tr>
            	<table width="900" cellpadding="0" cellspacing="0" >
            		<tr>
                    	<td style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Violation Date</td>
                        <td style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Area Of Violation</td>
                        <td style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Type</td>
                     </tr>
                     <tr>
                    	<td style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                    		<html:text property="disciplineHistory.violationDate" size="12" maxlength="12" styleClass="tcal"/>
                    	</td>
                        <td style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                                <html:select property="disciplineHistory.violationArea" styleClass="status"> 
									<html:option value="">Select</html:option>
									<html:optionsCollection name="ddl_violationArea" value="value" label="label" />
								</html:select>
					
                		</td>
                        <td colspan="2" style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                                <html:select property="disciplineHistory.violationType" styleClass="status"> 
									<html:option value="">Select</html:option>
								<html:optionsCollection name="ddl_violationType" value="value" label="label" />
								</html:select>
						</td>
                        
                     </tr>
            		 <tr>
                    	<td style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Warnings</td>
                        <td style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Fines</td>
                        <td style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Additional Consequences</td>
                     </tr>
                     <tr>
                    	<td style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                                <html:select property="disciplineHistory.warnings" styleClass="status"> 
									<html:option value="">Select</html:option>
								<html:optionsCollection name="ddl_warnings" value="value" label="label" />
								</html:select>
                    	</td>
                        <td style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                                <html:select property="disciplineHistory.fines" styleClass="status"> 
									<html:option value="">Select</html:option>
								<html:optionsCollection name="ddl_fines" value="value" label="label" />
								</html:select>
                		</td>
                        <td colspan="2" style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                                <html:select property="disciplineHistory.additionalConsquences" styleClass="status"> 
									<html:option value="">Select</html:option>
								<html:optionsCollection name="ddl_additionalConsequences" value="value" label="label" />
								</html:select>
						</td>
                        
                     </tr>
                     <tr>
                    	<td colspan="3" style="height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">Comments</td>
                     </tr>
                     <tr>
                    	<td colspan="3" style="background: silver;height:20px;border: 1px solid #666;color:#000000;font-weight:bold;padding-left:5px;">
                                <html:textarea property="disciplineHistory.comments" rows="5" cols="50"></html:textarea>

                    	</td>
                     </tr>
                     </table>
                     
                     
                     
                 <table width="700" cellpadding="0" cellspacing="0" border="0">    
                     <logic:notEmpty name="intakeForm" property="studentDisciplineHistory">
	                     <logic:iterate id="loop" name="intakeForm" property="studentDisciplineHistory" indexId="i">
	                     <tr> 
	                     	<td><input type="submit" name="action" value="Delete Discipline History" onClick="javascript:document.getElementById('deleteId').value='<bean:write name="loop" property="studentDisciplineHistoryId"/>'" class="imageButtonDelete"/></td>
	                     	<td><b>Date:</b><bean:write name="loop" property="violationDate"/></td>
	                        <td><b>Area:</b><bean:write name="loop" property="violationArea"/></td>
	                        <td><b>Type:</b><bean:write name="loop" property="violationType"/></td> 
	                     </tr>
	                     <tr> 
	                     	<td></td>
	                     	<td><b>Warnings:</b><bean:write name="loop" property="warnings"/></td>
	                        <td colspan="2"><b>Fines:</b><bean:write name="loop" property="fines"/></td>
	                     </tr>
	                     <tr>
	                     	<td></td>
	                     	<td colspan="3">
	                     		<b>Comments:</b><bean:write name="loop" property="comments"/>
	                     	</td>
	                     </tr>
	                     <tr>
	                     	<td colspan="4" height="15"></td>
	                     </tr>
	                     </logic:iterate>
	                  </logic:notEmpty>    
	                  <logic:empty name="intakeForm" property="studentDisciplineHistory">
	                     <tr>
	                     	<td colspan="4">No history</td> 
	                     </tr>
	                  </logic:empty>
                    
                </table>
 
 
 </br></br>
     
    <div align="left">
		<input type="submit" name="action" value="Save" class="button" title="Save" />
		<input type="submit" name="action" value="Print Card" class="button" title="Save" />
		<input type="submit" name="action" value="Print" class="button" title="Save" />
	</div>   			
     
    <html:hidden property="pageSource" value="discipline"/>  
    <html:hidden property="deleteId" styleId="deleteId" />
      
     </br></br>
     </br></br>
</html:form>
      
    </div>
   
   </td>
   </tr>
   </table>
   
</body>
</html>
    