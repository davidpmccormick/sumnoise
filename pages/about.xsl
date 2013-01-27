<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>

<xsl:template match="data">
	<div class="span-16 prepend-2 last">
		<div class="mobileabout">
			<h2 class="green">Oi oi!</h2>
			<h2 class="pink">I'm David</h2>
			<h2 class="yellow">I enjoying tinkering with the web</h2>
			<h2 class="blue">I'm not currently available for freelance projects</h2>
			<h2 class="red">but I'm always happy to help out where I can – <a href="mailto:david@sumnoise.com">mail me</a></h2>
		</div>
		<div class="preventmouseevents" style="position:absolute;left:160px;top:0;width:545px;height:450px;z-index:30;"><xsl:text> </xsl:text></div>
		<div class="aboutdescription" style="position:absolute;left:160px;top:0;width:545px;">
			<h2 class="pink ad1">I'm David</h2>
			<h2 class="yellow ad2">I enjoying tinkering with the web</h2>
			<h2 class="blue ad3">I'm not currently available for freelance projects</h2>
			<h2 class="red ad4">but I'm always happy to help out where I can – <a href="mailto:david@sumnoise.com">mail me</a></h2>
		</div>
		<div class="aboutcontainer">
			<div class="sumnoisehitarea"><h2>sumnoise</h2></div>
			
			<div class="aboutwebdesigncontainer clearfix"><div class="aboutwebdesign"><span class="webdesignhit"></span><span class="aboutwebdesigntext venntext">web design</span></div></div>
			
			
			<div class="aboutfrontendcontainer clearfix"><div class="aboutfrontend"><span class="frontendhit"></span><span class="aboutfrontendtext venntext">front-end development</span></div></div>
			
			<div class="aboutbackendcontainer clearfix"><div class="aboutbackend"><span class="backendhit"></span><span class="aboutbackendtext venntext">back-end development</span></div></div>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>