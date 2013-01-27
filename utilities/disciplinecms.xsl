<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="discipline/item">
	<a href="{$root}/work/discipline/{@handle}">
		<h3>
			<xsl:attribute name="class"><xsl:value-of select="@handle"/> disciplinecolor</xsl:attribute>
			<xsl:value-of select="."/>
		</h3>
	</a>
</xsl:template>

<xsl:template match="cms/item">
	<a href="{$root}/work/cms/{@handle}">
		<h3>
			<xsl:attribute name="class"><xsl:value-of select="@handle"/> cmscolor</xsl:attribute>
			<xsl:value-of select="."/>
		</h3>
	</a>
</xsl:template>

</xsl:stylesheet>