<html>
<body>
<br/>
<h1>Encyclopedia</h1>

<ul>
{
for $x in doc("encyclopedia.xml")/encyclopedia
order by $x/ename
return <li><h2 style="color:#ff00ff">{data($x/ename)} - Count of sections: {data($x/countOfSections)} - ID: {data($x/@encyclopediaID)}</h2></li>
}
</ul>

<br/>
<h2>Sections</h2>

<ol>
{
for $x in doc("encyclopedia.xml")/encyclopedia/section
order by $x/sname
return <li><h3 style="color:#ff00ff">{data($x/sname)} - Count of articles: {data($x/countOfArticles)} - ID: {data($x/@sectionID)}</h3></li>
}
</ol>

<br/>
<h2>Sections with more then 2 articles</h2>

<ol>
{
for $x in doc("encyclopedia.xml")/encyclopedia/section
where $x/countOfArticles>2
order by $x/sname
return <li><h3 style="color:#ff00ff">{data($x/sname)} - Count of articles: {data($x/countOfArticles)} - ID: {data($x/@sectionID)}</h3></li>
}
</ol>

<br/><br/>

<h2>Articles ordered by date</h2>

<table border="1" style="text-align:center;"><tr><th bgcolor="#bbbbbb">Article name</th><th bgcolor="#bbbbbb">Content</th><th bgcolor="#bbbbbb">Last change date</th></tr>
{
   for $x in doc("encyclopedia.xml")/encyclopedia/section/article  
   order by $x/lastChangeDate
   return <tr><td bgcolor="#7FFFD4">{data($x/aname)}</td><td bgcolor="#7FFFD4">{data($x/content)}</td><td bgcolor="#7FFFD4">{data($x/lastChangeDate)}</td></tr>
}
</table>

<br/>
<h2>Articles with "If-Then-Else" expression</h2>
<h3>Colored when article name is Article2</h3>

<table border="1" style="text-align:center;"><tr><th bgcolor="#bbbbbb">Article name</th><th bgcolor="#bbbbbb">Content</th><th bgcolor="#bbbbbb">Last change date</th></tr>
{
   for $x in doc("encyclopedia.xml")/encyclopedia/section/article  
   order by $x/aname
   return if($x/aname = "Article2")
   then <tr><td bgcolor="#ff00ff">{data($x/aname)}</td><td bgcolor="#ff00ff">{data($x/content)}</td><td bgcolor="#ff00ff">{data($x/lastChangeDate)}</td></tr>
   else <tr><td bgcolor="#7FFFD4">{data($x/aname)}</td><td bgcolor="#7FFFD4">{data($x/content)}</td><td bgcolor="#7FFFD4">{data($x/lastChangeDate)}</td></tr>
}
</table>
<br/>
{
for $x in doc("encyclopedia.xml")/encyclopedia/user, $y in doc("encyclopedia.xml")/encyclopedia/change
where $x/@userID = $y/@userID
return <p>{$x} -------- {$y}</p>
}
<br/><br/>
</body>
</html>(: Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" useresolver="yes" url="" outputurl="" processortype="datadirect" tcpport="0" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline=""
		          additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" host="" port="0" user="" password="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProperties name="CollectionURIResolver" value=""/>
			<advancedProperties name="ModuleURIResolver" value=""/>
			<advancedProperties name="DocumentURIResolver" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="encyclopedia.xml" srcSchemaRoot="encyclopedia" AssociatedInstance="file:///d:/Projects/Git/encyclopedia/encyclopedia/encyclopedia.xml" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template name="xquery_body">
				<block path="html/body/ul/flwr" x="256" y="90"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
:)