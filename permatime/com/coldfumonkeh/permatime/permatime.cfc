<!---
Filename: permatime.cfc
Creation Date: 20/August/2010
Original Author: Matt Gifford aka coldfumonkeh
Description:
I am a permatime object to interact with the permatime API to generate links.

Version: 0.9

--->
<cfcomponent displayname="permatime" output="false" hint="I am the permatime Class.">

	<cfset variables.instance = structNew() />
	<cfset variables.instance.baseURL = 'http://permatime.com' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the permatime Class.">
		<cfreturn this />
	</cffunction>
	
	<!--- getters / accessors --->
	<cffunction name="getBaseURL" access="public" output="false" hint="I retrieve the base URL to add into the generated link.">
		<cfreturn variables.instance.baseURL />
	</cffunction>
	
	<!--- public methods --->
	<cffunction name="buildLink" access="public" output="false" hint="I return a permatime link using a specific location, date and time. Optional label and link can be provided.">
		<cfargument name="location" required="true" 	type="String" hint="I am the location for the permatime link. For a list of available location/timezones, please visit http://permatime.com/timezones." />
		<cfargument name="date" 	required="true" 	type="String" hint="I am the date for the permatime link. You will need leading zeros for single digit months/days." />
		<cfargument name="time" 	required="true" 	type="String" hint="I am the time for the permatime link. You will need leading zeros for single digit hours/minutes." />
		<cfargument name="label" 	required="false" 	type="String" hint="I am an optional label you can provide for the permatime link." />
		<cfargument name="link" 	required="false" 	type="String" hint="I am an optional link you can provide to append to the permatime link." />
			<cfset var strURL = '' />
				<cfscript>
					strURL = getBaseURL() & '/' & arguments.location & '/' & arguments.date & '/' & arguments.time;
					if(structKeyExists(arguments, 'label')) {
						strURL = strURL & '/' & arguments.label;
					}
					if(structKeyExists(arguments, 'link')) {
						strURL = strURL & '?link=' & arguments.link;
					}
				</cfscript>
		<cfreturn strURL />
	</cffunction>
	
	<cffunction name="buildTimestampLink" access="public" output="false" hint="I return a permatime link using a Unix timestamp. Optional label and link can be provided.">
		<cfargument name="timestamp" 	required="true" 	type="String" hint="I am the timestamp for the permatime link." />
		<cfargument name="label" 		required="false" 	type="String" hint="I am an optional label you can provide for the permatime link." />
		<cfargument name="link" 		required="false" 	type="String" hint="I am an optional link you can provide to append to the permatime link." />
			<cfset var strURL = '' />
				<cfscript>
					strURL = getBaseURL() & '/timestamp/' & arguments.timestamp;
					if(structKeyExists(arguments, 'label')) {
						strURL = strURL & '/' & arguments.label;
					}
					if(structKeyExists(arguments, 'link')) {
						strURL = strURL & '?link=' & arguments.link;
					}
				</cfscript>
		<cfreturn strURL />
	</cffunction>
	
</cfcomponent>