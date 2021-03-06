<cfsetting showDebugOutput="false">

<!--- Executes all tests in the 'specs' folder with simple reporter by default --->
<cfparam name="url.labels" default="">
<cfparam name="url.bundles" default="">
<cfparam name="url.recurse" default="true">
<cfparam name="url.reporter" default="simple">
<cfparam name="url.directory" default="test.cfml">
<cfparam name="url.propertiesFilename" default="TEST.properties">
<cfparam name="url.propertiesSummary" default="false" type="boolean">
<cfparam name="url.reportpath" default="#expandPath( "test/cfml/results/" )#">

<!--- Include the TestBox HTML Runner --->
<cfinclude template="/testbox/system/runners/HTMLRunner.cfm" >
