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
					&nbsp;&nbsp;Home > Residents > Personal Information
				</div>

				
        <html:form action="/Intake">
        
  <div class="styledForm">
        
    <table width="600" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="header1">Personal Information</td>
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
                	<td class="fieldLabel1">Photo&nbsp;<a href="<%=request.getContextPath()%>/Intake.do?action=Photo" style="font-size:.95em;">[Edit]</a></td>
                	<td class="fieldLabel1">Insurance&nbsp;<a href="<%=request.getContextPath()%>/Intake.do?action=Insurance" style="font-size:.95em;">[Edit]</a></td>
               		<td class="fieldLabel1">Social Security&nbsp;<a href="<%=request.getContextPath()%>/Intake.do?action=SocialSecurity" style="font-size:.95em;">[Edit]</a></td>
                 	<td class="fieldLabel1">Driver's License&nbsp;<a href="<%=request.getContextPath()%>/Intake.do?action=License" style="font-size:.95em;">[Edit]</a></td>
                 </tr>
                <tr>
                	<td>
                			<logic:notEmpty name="intakeForm" property="intake.imageHeadshot">
                		   		<img src="<%=request.getContextPath()%>/Image.do" width="200" height="133"/>
                		    </logic:notEmpty>
                	        <logic:empty name="intakeForm" property="intake.imageHeadshot">
                	       		<img src="<%=request.getContextPath()%>/images/local/person.jpg" width="200" height="133"/>
                	       </logic:empty>
                	</td>   
                	<td>
                			<img src="<%=request.getContextPath()%>/images/insurance_card.jpg" width="206" height="133"/>
                	</td>  
                	<td>
                			<img src="<%=request.getContextPath()%>/images/ss_card.jpg" width="216" height="133"/>
                	</td> 
                	<td>
                			<img src="<%=request.getContextPath()%>/images/sample_license.jpg" width="209" height="133"/>
                	</td>  
                	              	
                </tr>
            </table>
              
            <table width="420" border="0" cellpadding="0" cellspacing="0">
                <tr>
	                <td class="fieldLabel1">Last Name</td>
	                <td class="fieldLabel1">First Name</td>
	                <td class="fieldLabel1">MI</td>
	            </tr>
                <tr>
	                <td><html:text styleClass="textbox"  property="intake.lastname" size="30" maxlength="30" /></td>
	                <td><html:text styleClass="textbox"  property="intake.firstname" size="30" maxlength="30" /></td>
	                <td><html:text styleClass="textbox"  property="intake.mi" size="3" maxlength="1" /></td>
	                </td>
            	</tr>
            </table>
       
           <table width="350" border="0">
                <tr>	
                	<td class="fieldLabel1">SSN</td>
                	<td width="200" class="fieldLabel1">Date of Birth&nbsp;<i>(mm/dd/yyyy)</i></td>
                </tr>
                <tr>
                	<td><html:text styleClass="textbox"  property="intake.ssn" size="30" maxlength="11"  onkeypress="return maskSsn(event,this)" /></td>
                	<td><html:text  property="intake.dob" size="15" maxlength="10" styleClass="tcal" /></td>
                </tr>
           </table>
           
           <table width="600" border="0">
          	<tr>
          	    <td class="fieldLabel1">Referred By</td>
                <td class="fieldLabel1">Emergency Contact</td>
                <td class="fieldLabel1">Relationship</td>
                <td class="fieldLabel1">Emergency Phone</td>
            </tr>
            <tr>
                <td><html:text styleClass="textbox"  property="intake.referredBy" size="30" maxlength="40" /></td>
                <td><html:text styleClass="textbox"  property="intake.emergencyContact"   /></td>
                <td><html:text styleClass="textbox"  property="intake.emergencryRelationship"  /></td>
                <td><html:text styleClass="textbox"  property="intake.emergencyPhone" size="20" onkeypress="return maskPhone(event,this)" /></td>
            </tr>
           </table>
        

           <table width="700" border="0">
                <tr>
	                <td class="fieldLabel1">Address of Contact&nbsp;</td>
	                <td class="fieldLabel1">City</td>
	                <td class="fieldLabel1">State</td>
	                <td class="fieldLabel1">Zipcode</td>
	            </tr>
                <tr>
                	<td><html:text styleClass="textbox"  property="intake.address" size="30" maxlength="45"  /></td>
                	<td><html:text styleClass="textbox"  property="intake.city" size="20" maxlength="25"  /></td>
                	<td>
                		<html:select property="intake.state" styleClass="select" >
						<html:option value="">Select</html:option>
						<html:optionsCollection name="ddl_state" value="value" label="label" />
						</html:select>
					</td>
                	<td><html:text styleClass="textbox"  property="intake.zipcode" size="20" maxlength="11" /></td>
                </tr>
            </table>
       
           <table width="400" border="0">
                <tr>
                <td class="fieldLabel1">Phone Number</td>
                <td class="fieldLabel1">Email Address</td>
                </tr>
                <tr>
                	<td><html:text styleClass="textbox"  property="intake.referredByPhone" size="20" maxlength="12" onkeypress="return maskPhone(event,this)"  /></td>
                	<td><html:text styleClass="textbox"  property="intake.referredByPhone" size="50" maxlength="80"  /></td>
                </tr>                
             </table>
        
	       <table width="700" border="0">
                <tr>
                    <td class="fieldLabel1">Marial Status</td>
                    <td class="fieldLabel1">Ethnicity</td>
                    <td class="fieldLabel1">Height</td></td>
					<td class="fieldLabel1">Weight</td></td>
					<td class="fieldLabel1">Eyes Color</td>
					<td class="fieldLabel1">Hair Color</td>
					
                  </tr>
                  <tr>
                  	<td>
                    	<html:select property="intake.maritalStatus" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_maritalstatus" value="value" label="label" />
						</html:select>
                    </td>
                    <td>
		                 <html:select property="intake.ethnicity" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_ethnicity" value="value" label="label" />
						</html:select>
                    </td>
		 			<td><html:text styleClass="textbox"  property="intake.height" size="5" /></td>
					<td><html:text styleClass="textbox"  property="intake.weight" size="6" /></td>
					<td>
		        		        <html:select property="intake.eyeColor" styleClass="select" >
									<html:option value="">Select</html:option>
									<html:optionsCollection name="ddl_eyecolor" value="value" label="label" />
								</html:select>
		        	</td>
					<td>
		    		            <html:select property="intake.hairColor" styleClass="select" >
									<html:option value="">Select</html:option>
									<html:optionsCollection name="ddl_haircolor" value="value" label="label" />
								</html:select>
		        	</td>
                </tr>
         </table>
     
        <table width="900">
        <tr>
        <td class="fieldLabel1">Where are you currently living?</td>
        </tr>
        <tr>
        <td>
        	            <html:select property="intake.homeLocation" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_living" value="value" label="label" />
						</html:select>
		</td>
		</tr>
		</table>
		
		<table width="500">
        <tr>
	       	<td class="fieldLabel1">Highest Education Level</td>
	       	<td class="fieldLabel1">Did you graduate?</td>
	       	<td class="fieldLabel1">Need GED?</td>
	       	<td class="fieldLabel1">Read English?</td>
	       	<td class="fieldLabel1">Speak English?</td>
        </tr>
        <tr>
	        <td>
	    		            <html:select property="intake.educationLevel" styleClass="select" >
								<html:option value="">Select</html:option>
								<html:optionsCollection name="ddl_education" value="value" label="label" />
							</html:select>
	
			</td>
			<td>
				            <html:select property="intake.graduateFlag" styleClass="select" >
								
								<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
							</html:select></td>
		
			</td>
			<td>
	    		            <html:select property="intake.needGed" styleClass="select" >
								<html:option value="">Select</html:option>
								<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
							</html:select>
	
			</td>		
			<td>
			 				<html:select property="intake.englishReadingFlag" styleClass="select" >
								<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
							</html:select>
			</td>
			<td>
				            <html:select property="intake.englishSpeakingFlag" styleClass="select" >
								<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
							</html:select>
			</td>
        </tr>
       </table>
       
    
    <table width="550">
     <tr>
		<td class="fieldLabel1" >Current Income</td>
		<td class="fieldLabel1">Income Source(s)</td>
		<td class="fieldLabel1" >Income Schedule (<i>check one</i>)</td>
		
	 </tr>
	 <tr>
	 	<td><html:text styleClass="textbox"  property="intake.incomeAmount" size="10" maxlength="10" /></td>
		<td><html:text styleClass="textbox"  property="intake.incomeSource"   /></td>
		<td>
			<input type="checkbox" property="intake.incomeWeeklyFlag" value="YES" />Weekly&nbsp;&nbsp;
            <input type="checkbox" property="intake.incomeBiWeeklyFlag" value="YES"  />Bi-Weekly&nbsp;&nbsp;
            <input type="checkbox" property="intake.incomeMonthlyFlag" value="YES" />Monthly&nbsp;&nbsp;
            <input type="checkbox" property="intake.incomeYearlyFlag" value="YES"  />Yearly
         </td>
     </tr>
     </table>
     
   
	<table width="500">
    <tr>
		<td class="fieldLabel1">Government Benefits <i>(check all that apply)</i></td>
		<td class="fieldLabel1">Other benefits</td>
	</tr>
	<tr>
		<td>
			<html:checkbox property="intake.ssFlag" value="YES"   />Social Security&nbsp;&nbsp;
            <html:checkbox property="intake.vaFlag" value="YES"  />VA&nbsp;&nbsp;
            <html:checkbox property="intake.wcFlag" value="YES" />Workman's Comp
         </td>
         <td><html:text styleClass="textbox"  property="intake.otherBenefits" size="20" maxlength="20" /></td>
     </tr>
    </table>
    
   
    
   <table width="600">
        <tr>
        <td class="fieldLabel1">Are you a US Veteran?</td>
        <td class="fieldLabel1">Branch of Service?</td>
        <td class="fieldLabel1">Highest Rank</td>
        <td class="fieldLabel1" >Length Of Service</td>
        </tr>
        <tr>
        	<td>
	   		            <html:select property="intake.veteranStatus" styleClass="select" >
							
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
			</td>
        	<td>
	   		            <html:select property="intake.branchOfService" styleClass="select" >
							<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_military" value="value" label="label" />
						</html:select>
			</td>
			<td><html:text styleClass="textbox"  property="intake.rank" size="20" maxlength="20"  /></td>
			<td><html:text styleClass="textbox"  property="intake.lengthOfService" size="20" maxlength="20"  /></td>
         </tr>
        </table>
 
    <table width="700" border="0" cellpadding="0" cellspacing="0">
        <tr>
        	<td class="fieldLabel1">Valid Driver's License</td>
        	<td class="fieldLabel1">DL State</td>
        	<td class="fieldLabel1">DL#:</td>
        </tr>
        <tr>
        	<td>
       		   		<html:select property="intake.dlFlag" styleClass="select" >
						<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
					</html:select>
        	</td>
        	<td>
		   		   <html:select property="intake.dlState" styleClass="select" >
						<html:option value="">Select</html:option>
						<html:optionsCollection name="ddl_state" value="value" label="label" />
					</html:select>
        	</td>	
        	<td><html:text styleClass="textbox"  property="intake.dlNumber" size="22" maxlength="22"  /></td>	
   		 </tr>
    </table>
   
     	<table width="500">
        <tr>
        	<td class="fieldLabel1">Mother living</td>
            <td class="fieldLabel1">Relationship with Mother</td>
            <td class="fieldLabel1">Father living</td>
            <td class="fieldLabel1">Relationship with Father</td>
        </tr>
        <tr>
        	<td>       <html:select property="intake.motherLivingFlag" styleClass="select" >
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
        	</td>
        	<td>	    <html:select property="intake.relationshipWithMother" styleClass="select" >
        			    <html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_relationship" value="value" label="label" />
						</html:select>
			</td>
           	<td>
           		        <html:select property="intake.fatherLivingFlag" styleClass="select" >
							<html:optionsCollection name="ddl_yesNo" value="value" label="label" />
						</html:select>
        	</td>
        	<td><html:select property="intake.relationshipWithFather" styleClass="select" >
    	           		<html:option value="">Select</html:option>
							<html:optionsCollection name="ddl_relationship" value="value" label="label" />
						</html:select>
			</td>
		</tr>
	</table>
     
  <table width="450">
    <tr>
    	<td class="fieldLabel1">Number of Brothers</td>
    	<td class="fieldLabel1">Number of Sisters</td>
    	<td class="fieldLabel1">Number of Children</td>
    </tr>
    <tr>	
    	<td><html:text styleClass="textbox"  property="intake.brothers" size="2"  onkeypress="return isNumberKey(event)" /></td>
        <td><html:text styleClass="textbox"  property="intake.sisters" size="2"  onkeypress="return isNumberKey(event)" /></td>
        <td><html:text styleClass="textbox"  property="intake.children" size="2" onkeypress="return isNumberKey(event)" /></td>
    </tr>
 </table>


    
 <table width="900">
     <tr>
		<td class="fieldLabel1"><br />How long have you been homeless?<br /></td>
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
     </table>
   <table width="900">
     <tr>
		<td class="fieldLabel1" ><br />How often have you been homeless?<br /></td>
      </tr>
      <tr>
      	<td>
			<html:radio property="intake.homelessHowOften" value="Never" />&nbsp;Never&nbsp;&nbsp;
            <html:radio property="intake.homelessHowOften" value="1 to 2 times" />&nbsp;1 to 2 times&nbsp;&nbsp;
            <html:radio property="intake.homelessHowOften" value="more than 2 times in 2 years" />&nbsp;more than 2 times in 2 years&nbsp;&nbsp;
            <html:radio property="intake.homelessHowOften" value="Long Term" />&nbsp;Long term
        </td>
     </tr>
     </table>
     
    <table width="900">
     <tr>
		<td class="fieldLabel1"><br />Reason for homelessness:<br /></td>
      </tr>
      <tr>
      	<td >
			<html:radio property="intake.homelessReason" value="Lack of a fixed, regular and adequate night time residence." />&nbsp;Lack of a fixed, regular and adequate night time residence.<br />
            <html:radio property="intake.homelessReason" value="Primary night time residence is a shelter designed to provide temporary living accomodations (including welfar hotels, congregate shelters, and transitional housing for the mentally ill)." />&nbsp;Primary night time residence is a shelter designed to provide temporary living accomodations (including welfar hotels, congregate shelters, and transitional housing for the mentally ill).<br />
            <html:radio property="intake.homelessReason" value="Primary night time residence is an institution that provides a temporary residence for individuals intended to be institutionalized." />&nbsp;Primary night time residence is an institution that provides a temporary residence for individuals intended to be institutionalized.<br />
            <html:radio property="intake.homelessReason" value="Primary night time residence is a public or private place not designated for, or ordinarily used as a regular sleeping accomodation for human beings."/>&nbsp;Primary night time residence is a public or private place not designated for, or ordinarily used as a regular sleeping accomodation for human beings.
        </td>
     </tr>
      </table>
   
   	</br></br>
     
    <div align="left">
		<input type="submit" name="action" value="Save" class="button" title="Save" />
		<input type="submit" name="action" value="Print Card" class="button" title="Save" />
		<input type="submit" name="action" value="Print" class="button" title="Save" />
	</div>   			
     
    <html:hidden property="pageSource" value="personal"/>  
      
     </br></br>
     </br></br>
</html:form>
      
    </div>
   
   </td>
   </tr>
   </table>
   
</body>
</html>
    