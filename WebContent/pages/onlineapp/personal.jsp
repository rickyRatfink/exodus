<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<jsp:include page="student_header.jsp" flush="true"/>

<script language="javascript" type="text/javascript">
  
   function moveOnMax(field,nextFieldID){
	  if(field.value.length >= field.maxLength){
	    document.getElementById(nextFieldID).focus();
	  }
	}

function maskPhone(e,f){

  	
	var len = f.value.length;
	var key = whichKey(e);
	if(key>47 && key<58)
	{
		if( len==3 )f.value=f.value+'-'
		else if(len==7 )f.value=f.value+'-'
		else f.value=f.value;
	}
	else{
		f.value = f.value.replace(/[^0-9-]/,'')
		f.value = f.value.replace('--','-')
	}
}

function maskSsn(e,f){

  	
	var len = f.value.length;
	var key = whichKey(e);
	if(key>47 && key<58)
	{
		if( len==3 )f.value=f.value+'-'
		else if(len==6 )f.value=f.value+'-'
		else f.value=f.value;
	}
	else{
		f.value = f.value.replace(/[^0-9-]/,'')
		f.value = f.value.replace('--','-')
	}
}
 
function whichKey(e) {
   	
	var code;
	if (!e) var e = window.event;
	if (e.keyCode) code = e.keyCode;
	else if (e.which) code = e.which;
	return code
//	return String.fromCharCode(code);
}
 
</script>


<html:form action="/OnlineApp">


<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td align="left">
	<table width="100%">
	<tr>
		<td><p><i>Thank you for your interest in Faith Farm Ministries.  Please complete the online application as accurately 
		as possible.  Once the application is submitted it will be reviewed and an intake coordinator will contact you shortly.</i></p>
		<br/>
		</td>
	</tr>
	</table>
	
	<table width="100%">
    <tr>
		<td>
    		<jsp:include page="messages.jsp" flush="true"/>
	   </td>
	</tr>
	</table>
	<br/><br/>
	
	<table width="100%">
		<tr>
		<td>
		<b>Farm Location:</b>
		<html:select property="intake.farmBase" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_farm" value="name" label="name" />
		</html:select>
		<br/><br/>
		</td>	
	</tr>
	</table>
	
    <table width="100%">
	<tr>
		<td><b>Personal Information: </b></td>
	</tr>
	</table>
	
	<table width="100%">
	<tr>
    	<td>
                <table width="100%" border="0">
                <tr>
                <td>Last Name</td>
                <td><html:text property="intake.lastname" size="30" maxlength="30" /></td>
                <td>&nbsp;&nbsp;</td>
                <td>First Name</td>
                <td><html:text property="intake.firstname" size="30" maxlength="30" /></td>
                <td>&nbsp;&nbsp;</td>
                <td>MI</td>
                <td colspan="2" align="left"><html:text property="intake.mi" size="3" maxlength="1" /></td>
                </td>
            </tr>
            </table>
        </td>
    </tr>
	</table>
	
	<table width="100%">
	<tr>
    	<td>
                <table width="100%" border="0">
                <tr>	
                <td>SSN</td>
                <td><html:text property="intake.ssn" size="30" maxlength="11" onkeypress="return maskSsn(event,this)" /></td>
                <td>&nbsp;&nbsp;</td>
                <td >Referred to Faith Farm By</td>
                <td>
                    <html:text property="intake.referredBy" size="30" maxlength="40" />
                </td>
           		</tr>
            
           	
                 </table>
         </td>
   </tr>
   </table>
   
   
   <table width="100%" border="0">
                <tr>
                <td>Address of Contact</td>
                <td>City</td>
                <td>State</td>
                <td>Zipcode</td>
                </tr>
                <tr>
                <td><html:text property="intake.address" size="30" maxlength="45"  /></td>
                <td><html:text property="intake.city" size="20" maxlength="25"  /></td>
                <td>
                <html:select property="intake.state" styleClass="select" >
					<html:option value="">Select</html:option>
					<html:optionsCollection name="ddl_state" value="value" label="label" />
				</html:select>
				</td>
				<td>
                	<html:text property="intake.zipcode" size="20" maxlength="11" />
                </td>
                </tr>
    </table>
       

  <table width="100%">
	            <tr>
                <td width="200">Phone Number&nbsp;<i>(xxx)xxx-xxxx</i>&nbsp;
                	<html:text property="intake.referredByPhone" size="20" maxlength="12" onkeypress="return maskPhone(event,this)"  />
                </td>
                <td width="200">Date of Birth&nbsp;<i>(mm/dd/yyyy)</i>&nbsp;
                	<html:text property="intake.dob" size="10" maxlength="10"  />
                </td>
                <td>Age&nbsp;<html:text property="intake.age" size="2"  maxlength="2" onkeypress="return isNumberKey(event)"/></td>
                </tr>                
    </table>
     
     
    <table width="100%" border="0">
               
                <tr>
                <td>Emergency Contact&nbsp;<html:text property="intake.emergencyContact"   /> </td>
                <td>Relationship&nbsp;<html:text property="intake.emergencryRelationship"  /></td>
                <td>Phone&nbsp;<i>(xxx)xxx-xxxx</i>&nbsp;<html:text property="intake.emergencyPhone" size="20" onkeypress="return maskPhone(event,this)" /></td>
                </tr>               
                </table>
     
	 <table width="100%" border="0">
                <tr>
                    <td width="250">Marial Status&nbsp;
                    	<html:select property="intake.maritalStatus" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_maritalstatus" value="value" label="label" />
						</html:select>
                    </td>
                    <td>Ethnicity
		                 <html:select property="intake.ethnicity" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_ethnicity" value="value" label="label" />
						</html:select>
                    </td>
                </tr>
     </table>
     
 
	<table width="100%">
        <tr>
        <td>Height&nbsp;<html:text property="intake.height" size="5" /></td>
		<td>Weight&nbsp;<html:text property="intake.weight" size="6" /></td>
		<td>Eyes Color&nbsp;
        		        <html:select property="intake.eyeColor" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_eyecolor" value="value" label="label" />
						</html:select>
        </td>
		<td>Hair Color&nbsp;
    		            <html:select property="intake.hairColor" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_haircolor" value="value" label="label" />
						</html:select>
        </td>
        </tr>
        
        </table>
    
    <table width="100%">
        <tr>
        <td>Where do you live?
				&nbsp;&nbsp;
    		            <html:select property="intake.homeLocation" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_living" value="value" label="label" />
						</html:select>
		</td>
		<td>Schooling Completed?
        		&nbsp;
    		            <html:select property="intake.educationLevel" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_education" value="value" label="label" />
						</html:select>

		</td>	
		<td>Need GED?
        		&nbsp;
    		            <html:select property="intake.needGed" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>

		</td>			
        </tr>
       
         </table>
  
  
  <table width="100%">
        <tr>
        <td>Did you graduate?&nbsp;
     		            <html:select property="intake.graduateFlag" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select></td>
		<td>Read English? &nbsp;
	   		            <html:select property="intake.englishReadingFlag" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
		</td>
		<td>Speak English?&nbsp;
	   		            <html:select property="intake.englishSpeakingFlag" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
		</td>
        </tr>
        
    </table>
   
   <br/>
   <table width="100%">
     <tr>
		<td><b>Current Income?</b><html:text property="intake.incomeAmount" size="10" maxlength="10"/>&nbsp;&nbsp;<b>Check One:</b>&nbsp;
			<input type="checkbox" property="intake.incomeWeeklyFlag" value="YES" />Weekly&nbsp;&nbsp;
            <input type="checkbox" property="intake.incomeBiWeeklyFlag" value="YES"  />Bi-Weekly&nbsp;&nbsp;
            <input type="checkbox" property="intake.incomeMonthlyFlag" value="YES" />Monthly&nbsp;&nbsp;
            <input type="checkbox" property="intake.incomeYearlyFlag" value="YES"  />Yearly
         </td>
     </tr>
 	<tr> 
		<td colspan="8">Source(s)?&nbsp;&nbsp;
			<html:text property="intake.incomeSource"   />
        </td>	
    </tr>
</table>
<br/>
<table width="100%">
    <tr>
		<td><b>Do you receive government benefits?</b>&nbsp;&nbsp;
			<html:checkbox property="intake.ssFlag" value="YES"   />Social Security&nbsp;&nbsp;
            <html:checkbox property="intake.vaFlag" value="YES"  />VA&nbsp;&nbsp;
            <html:checkbox property="intake.wcFlag" value="YES" />Workman's Comp
         </td>
     </tr>
    
	<tr>
		<td>Other benefits?&nbsp;&nbsp;
		<html:text property="intake.otherBenefits" size="20" maxlength="20" />
        </td>	
    </tr>
</table> 
    
    
    
     	<table width="100%">
        <tr>
        <td ><br/>
        <b>Are you a US Veteran?</b>
        <html:select property="intake.veteranStatus" styleClass="select" >
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
		</td>
		</tr>
		<tr>
        <td>Branch of Service? &nbsp;
	   		            <html:select property="intake.branchOfService" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_military" value="value" label="label" />
						</html:select>
		</td>
         </tr>
      
        </table>
  
        <table width="100%">
            <tr>
            <td width="220">Highest Rank&nbsp;&nbsp;
                <html:text property="intake.rank" size="20" maxlength="20"  />
            </td>	
            <td >Length Of Service&nbsp;&nbsp;
                <html:text property="intake.lengthOfService" size="20" maxlength="20"  />
            </td>	
        </tr>
        
         </table>
   
     	<table width="100%">
        <tr>
        <td><br/><b>Driver's License Information</b>
        </tr>
        <tr>
        <td>Have a Valid Driver's License?
        		   		<html:select property="intake.dlFlag" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
        </td>
        <td>
        	DL State
			   		   <html:select property="intake.dlState" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_state" value="value" label="label" />
						</html:select>
        </td>	
        <td>DL#:&nbsp;&nbsp;
			<html:text property="intake.dlNumber" size="22" maxlength="22"  />
        </td>	
       
    </tr>
    
    </table>
   
   <table width="100%">
        <tr>
        <td colspan="2"><br/>
        	<b>Your Family:</b>&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td width="200">Is your Mother living?
          		            <html:select property="intake.motherLivingFlag" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
        </td>
           	<td>Is your Father living?
           		            <html:select property="intake.fatherLivingFlag" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
        	</td>
         </tr>
     </table>
     
     <table width="100%" >
        <tr> 
      	<td width="280">Relationship with Mother?&nbsp;&nbsp;
        			    <html:select property="intake.relationshipWithMother" styleClass="select" >
        			    <html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_relationship" value="value" label="label" />
						</html:select>
        &nbsp;&nbsp;&nbsp;&nbsp;</td>
    	<td>Relationship with Father?&nbsp;&nbsp;
    	           		<html:select property="intake.relationshipWithFather" styleClass="select" >
    	           		<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_relationship" value="value" label="label" />
						</html:select>
    	</td>        
    	</tr>
        
    </table>
    
    <table width="100%">
    <tr>
    	<td>Number of Brothers&nbsp;&nbsp;<html:text property="intake.brothers" size="2"  onkeypress="return isNumberKey(event)" />&nbsp;&nbsp;&nbsp;&nbsp;
        				Number of Sisters&nbsp;&nbsp;<html:text property="intake.sisters" size="2"  onkeypress="return isNumberKey(event)" />&nbsp;&nbsp;&nbsp;&nbsp;
        				Number of Children&nbsp;&nbsp;<html:text property="intake.children" size="2" onkeypress="return isNumberKey(event)" />
   </tr>
	</table>
	<br/>
	<table width="100%">
    <tr>
		<td><b>Homelessness Documentation:</b></td>
	</tr>
    
     <tr>
		<td>How long have you been homeless?</td>
      </tr>
      <tr>
      	<td>
			<html:radio property="intake.homelessTime" value="Less than 2 weeks"  />&nbsp;Less than 2 weeks&nbsp;&nbsp;
            <html:radio property="intake.homelessTime" value="2 weeks to 1 month" />&nbsp;2 weeks to 1 month&nbsp;&nbsp;
            <html:radio property="intake.homelessTime" value="1 to 3 months" />&nbsp;1 to 3 months&nbsp;&nbsp;
            <html:radio property="intake.homelessTime" value="3 months to 1 year" />&nbsp;3 months to 1 year&nbsp;&nbsp;
            <html:radio property="intake.homelessTime" value="more than 1 year" />&nbsp;more than 1 year
         </td>
     </tr>
  
     <tr>
		<td><br/>How often have you been homeless?</td>
      </tr>
      <tr>
      	<td>
			<html:radio property="intake.homelessHowOften" value="Never" />&nbsp;Never&nbsp;&nbsp;
            <html:radio property="intake.homelessHowOften" value="1 to 2 times" />&nbsp;1 to 2 times&nbsp;&nbsp;
            <html:radio property="intake.homelessHowOften" value="more than 2 times in 2 years" />&nbsp;more than 2 times in 2 years&nbsp;&nbsp;
            <html:radio property="intake.homelessHowOften" value="Long Term" />&nbsp;Long term
        </td>
     </tr>
     <tr>
		<td><br />Reason for homelessness:<br /></td>
      </tr>
      <tr>
      	<td>
			<html:radio property="intake.homelessReason" value="Lack of a fixed, regular and adequate night time residence." />&nbsp;Lack of a fixed, regular and adequate night time residence.<br />
            <html:radio property="intake.homelessReason" value="Primary night time residence is a shelter designed to provide temporary living accomodations (including welfar hotels, congregate shelters, and transitional housing for the mentally ill)." />&nbsp;Primary night time residence is a shelter designed to provide temporary living accomodations (including welfar hotels, congregate shelters, and transitional housing for the mentally ill).<br />
            <html:radio property="intake.homelessReason" value="Primary night time residence is an institution that provides a temporary residence for individuals intended to be institutionalized." />&nbsp;Primary night time residence is an institution that provides a temporary residence for individuals intended to be institutionalized.<br />
            <html:radio property="intake.homelessReason" value="Primary night time residence is a public or private place not designated for, or ordinarily used as a regular sleeping accomodation for human beings."/>&nbsp;Primary night time residence is a public or private place not designated for, or ordinarily used as a regular sleeping accomodation for human beings.
        </td>
     </tr>
  </table>
  <br/><br/>
	<table width="100%" style="padding-right:20px;">
    <tr>
    	<td align="right"><input type="submit" name="action" value="Next"  title="Continue to next step" style="padding-left:40px;padding-right:40px;"/></td>
	</tr>
	<tr><td  height="30"></td></tr>
	</table>
	
	
	
</td>
</tr>
</table>



<html:hidden property="pageSource" value="personal"/>  
    <html:hidden property="nextStep" value="religious"/>  
</html:form>

<jsp:include page="footer.jsp" flush="true"/>
    