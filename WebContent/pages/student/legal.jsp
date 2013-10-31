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
					&nbsp;&nbsp;Home > Residents > Legal Information
				</div>

				
        <html:form action="/Intake">
        
  <div class="styledForm">
        
    <table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="header1">Legal Information</td>
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
		<td colspan="8">Have you ever been sued?&nbsp;
   			<html:select property="intake.lawsuitFlag" styleClass="select" >
				<html:option value="">Select</html:option>
				<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
			</html:select>

            &nbsp;&nbsp;&nbsp;If yes, when&nbsp;
            <html:text property="intake.lawsuitDate"  size="10" maxlength="10" />
        </td>
	</tr>
    <tr>
		<td colspan="8">Details:&nbsp;</td>
    </tr>
    <tr>
    	<td colspan="8">
    		<html:textarea property="intake.lawsuitDetails" cols="93" rows="5" styleClass="textarea" />
    	</td>
    </tr>
    <tr>
		<td colspan="8">Are you involved in a lawsuit?&nbsp;
			   			<html:select property="intake.currentLawsuitFlag" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
						&nbsp;&nbsp;&nbsp;If yes, when:
						<html:text property="intake.currentLawsuitDate"  size="10" maxlength="10" />
		</td>
	</tr>
    <tr>
		<td colspan="8"></td>
	</tr>
	<tr>
		<td colspan="8">Details:</td>
     </tr>
     <tr>
     	<td colspan="8">
     		<html:textarea property="intake.currentLawsuitDetails" rows="5" cols="93" styleClass="textarea" />
    	</td>
    </tr>
	<tr>
		<td colspan="8">Ever convicted of a felony?&nbsp;
          	<html:select property="intake.felonyFlag" styleClass="select" >
				<html:option value="">Select</html:option>
				<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
			</html:select>
			&nbsp;&nbsp;&nbsp;If yes, how many:
			<html:text property="intake.felonyQty"  size="3" maxlength="2" />
		</td>
	</tr>
    <tr>
		<td colspan="8">Details:</td>
     </tr>
     <tr>
     	<td colspan="8">
     		<html:textarea property="intake.felonyDetails" rows="5" cols="93" styleClass="textarea" />
     	</td>	
     </tr>
    <tr>
		<td colspan="8">Ever convicted of a sexual offense?&nbsp;
    			<html:select property="intake.sexualOffenseFlag" styleClass="select" >
					<html:option value="">Select</html:option>
					<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
				</html:select>
 				&nbsp;&nbsp;&nbsp;If yes, how many:
 				<html:text property="intake.sexualOffenseQty"  size="3" maxlength="2" />
 		</td>
	</tr>
    <tr>
		<td colspan="8">Details:</td>
    </tr>
    <tr>
    	<td colspan="8">
    		<html:textarea property="intake.sexualOffenseDetails" rows="5" cols="93" styleClass="textarea" />
    	</td>
	</tr>
    <tr>
		<td colspan="8" ></td>
	</tr>
	<tr>
		<td colspan="8">Are you on probation? &nbsp;
   			<html:select property="intake.probationFlag" styleClass="select" >
				<html:option value="">Select</html:option>
				<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
			</html:select>

		</td>
	</tr>
	<tr>
		<td colspan="8">What County?&nbsp;
		<html:text property="intake.probationCounty"  size="20" maxlength="20" />
	</tr>
    
    <tr>
		<td colspan="8">What State?&nbsp;
    			<html:select property="intake.probationState" styleClass="select" >
				<html:option value="">Select</html:option>
				<html:optionsCollection name="ddl_state" value="value" label="label" />
			</html:select>
	
        
        
        </td>
	</tr>
    
	<tr>
		<td colspan="8">Probation Officers Name:&nbsp;
		<html:text property="intake.probationOfficer"  size="20" maxlength="20" />
	</tr>
   
	<tr>
		<td colspan="8">Probation Officers Phone #:&nbsp;
		<html:text property="intake.probationOfficerPhone"  size="20" maxlength="20" />
	</tr>
    
	<tr>
		<td colspan="8">Any Court or Probation appointments in the next 30 days?&nbsp;
	   		<html:select property="intake.probationApptFlag" styleClass="select" >
				<html:option value="">Select</html:option>
				<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
			</html:select>
      </td>
      </tr>
      <tr>
      <td colspan="8">If yes, Dates & Times:
          	<html:text property="intake.probationApptDetails"  size="45" maxlength="150" />
      </td>
	</tr>	
    
	
    
    </table>


</br></br>
     
    <div align="left">
		<input type="submit" name="action" value="Save" class="button" title="Save" />
		<input type="submit" name="action" value="Print Card" class="button" title="Save" />
		<input type="submit" name="action" value="Print" class="button" title="Save" />
	</div>   			
     
    <html:hidden property="pageSource" value="legal"/>  
      
     </br></br>
     </br></br>
</html:form>
      
    </div>
   
   </td>
   </tr>
   </table>
   
</body>
</html>
    