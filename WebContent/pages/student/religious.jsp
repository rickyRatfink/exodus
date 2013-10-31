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
					&nbsp;&nbsp;Home > Residents > Spriritual
				</div>

				
        <html:form action="/Intake">
        
  <div class="styledForm">
        
    <table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="header1">Spritual/Religious Information</td>
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

   <table width="900" border="0" cellpadding="0" cellspacing="0">
	<tr>
    	<td class="fieldLabel1">Describe your religious/spiritual experiences:</td>
	</tr>
    <tr>
		<td>
			<html:textarea property="intake.religiousExperience" cols="93" styleClass="textarea" />
		</td>
	</tr>
    </table>
    
    <table width="900" border="0" cellpadding="0" cellspacing="0">
    <tr>
		<td class="fieldLabel1">Religious Background</td>
	</tr>
	<tr>
		<td>
        		<html:select property="intake.religion" styleClass="select" >
					<html:option value="">Select</html:option>
					<html:optionsCollection name="ddl_religion" value="value" label="label" />
				</html:select> 
        </td>
	</tr>
	</table>
	
 
 
 </br></br>
     
    <div align="left">
		<input type="submit" name="action" value="Save" class="button" title="Save" />
		<input type="submit" name="action" value="Print Card" class="button" title="Save" />
		<input type="submit" name="action" value="Print" class="button" title="Save" />
	</div>   			
     
    <html:hidden property="pageSource" value="religious"/>  
      
     </br></br>
     </br></br>
</html:form>
      
    </div>
   
  
   
</body>
</html>
    