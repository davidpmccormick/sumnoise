<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/cmsentries.xsl"/>
<xsl:import href="../utilities/alldiscipline.xsl"/>
<xsl:import href="../utilities/allcms.xsl"/>

<xsl:template match="data">
	<div class="span-16">
		<h2>
		<xsl:attribute name="class"><xsl:value-of select="currentcms/entry/title/@handle"/></xsl:attribute>
			<xsl:value-of select="currentcms/entry/title"/>
		</h2>
		<xsl:apply-templates select="cmslist/entry"/> <!-- cmsentries.xsl -->
	</div>
	<div class="span-4 last">
		<h3 style="margin-bottom:0;margin-top:10px;padding-bottom:5px;color:#555;">work by discipline</h3>
			<xsl:apply-templates select="alldiscipline/entry"/> <!-- allcms.xsl -->
		<h3 style="margin-bottom:0;margin-top:10px;padding-bottom:5px;color:#555;">work by cms</h3>
		<xsl:apply-templates select="allcms/entry"/> <!-- alldiscipline.xsl -->
	</div>
</xsl:template>

</xsl:stylesheet>