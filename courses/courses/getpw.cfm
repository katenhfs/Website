<cfinclude template="Templates/header.cfm">

<cfif not IsDefined("form.CurrEmail")>
	<cflocation url="checkout.cfm">
</cfif>

<cfquery datasource="#dsn#" name="GetPW">
	Select Password from Customers
		Where Email = <cfqueryparam cfsqltype="CF_SQL_CHAR" value="#Form.CurrEmail#">
		and Password > '' and password != '$(@##$JH$'
</cfquery>

<cfif GetPW.RecordCount EQ 0>
	<BR><BR>
	<FONT SIZE="+1" color="#BB0000"><B>
	<cfif form.currEmail eq "">
		Oops - you didn't enter an email address!  Please go back and enter your email address, then
		click the "Get Password" button to retrieve your password.
	<cfelse>
		Sorry, we don't have an account with that email address, , or your
	password has been reset for security purposes.  You can request a new password at <a href="resetpw.cfm">this site</a>	
	</cfif>
	</B></FONT>
	<BR><BR>
<cfelse>
	<cfmail from="#adm_email#" to="#Form.CurrEmail#" subject="Password Request from #co_name#">
		Thank you being a customer of #co_name#!  We've received a request
		for the password to your online account.  Your password is:
			
			#GetPW.Password#
			
		You may visit us at #co_URL# and browse through our online courses.
		We look forward to seeing you.
	</cfmail>
	<H2 ALIGN=CENTER>Thank you!  Your password has been sent to <cfoutput>#Form.CurrEmail#</cfoutput></H1>
</cfif>

<DIV ALIGN=CENTER><A HREF="checkout.cfm">Back to checkout</A></DIV>

<cfinclude template="Templates/footer.cfm">