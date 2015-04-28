<!---
Filename: index.cfm
Creation Date: 20/August/2010
Original Author: Matt Gifford aka coldfumonkeh
Description:
I am the index file containing example code to use the permatime object.
--->
<cfscript>
	objPermatime = createObject('component','com.coldfumonkeh.permatime.permatime').init();
	
	// For a list of available location/timezones, please visit http://permatime.com/timezones
	
	strPermLink = objPermatime.buildLink(
			location 	= 'US/Central',
			date		= '1963-11-22',
			time		= '12:30',
			label		= 'Assassination of JFK',
			link		= 'http://en.wikipedia.org/wiki/John_F._Kennedy_assassination'
		);
		
	
	strPermLink2 = objPermatime.buildTimestampLink(
			timestamp 	= '1226183760'
			/*
			* This function can also accept a label and link attribute
			*/
		);
</cfscript>

<cfdump var="#strPermLink#" 
		label="I am the returned output from the buildLink method." />

<cfdump var="#strPermLink2#" 
		label="I am the returned output from the buildTimestampLink method." />