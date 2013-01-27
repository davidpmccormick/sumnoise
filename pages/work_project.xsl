<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/disciplinecms.xsl"/>
<xsl:import href="../utilities/allcms.xsl"/>
<xsl:import href="../utilities/alldiscipline.xsl"/>
<xsl:import href="../utilities/workmainimages.xsl"/>

<xsl:template match="data">
	<div class="span-16">
		<h2 class="yellow"><xsl:value-of select="projectview/entry/title"/></h2>
		<xsl:if test="workmainimages/entry">
			<div class="cyclethis" style="height:330px; overflow:hidden; margin-bottom:10px;">
				<xsl:apply-templates select="workmainimages/entry"/> <!-- workmainimages.xsl -->
			</div>
		</xsl:if>
		<xsl:copy-of select="projectview/entry/body/node()" />
		<xsl:if test="projectview/entry/discipline/item">
			<div class="span-4 first">
				<xsl:apply-templates select="projectview/entry/discipline/item"/> <!-- disciplinecms.xsl -->
			</div>
		</xsl:if>
		<xsl:if test="projectview/entry/cms/item">
			<div class="span-4">
				<xsl:apply-templates select="projectview/entry/cms/item"/> <!-- disciplinecms.xsl -->
			</div>
		</xsl:if>
	</div>
	<div class="span-4 last">
		<h3 style="margin-bottom:0;margin-top:10px;padding-bottom:5px;color:#555;">work by discipline</h3>
			<xsl:apply-templates select="alldiscipline/entry"/> <!-- allcms.xsl -->
		<h3 style="margin-bottom:0;margin-top:10px;padding-bottom:5px;color:#555;">work by cms</h3>
		<xsl:apply-templates select="allcms/entry"/> <!-- alldiscipline.xsl -->
	</div>	
</xsl:template>

</xsl:stylesheet>


