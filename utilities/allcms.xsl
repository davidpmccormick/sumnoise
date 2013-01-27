<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="allcms/entry">
	<a href="{$root}/work/cms/{title/@handle}">
		<h4>
			<xsl:attribute name="class">
				<xsl:text>cmsitem</xsl:text>
				<xsl:if test="title/@handle = $url-title">
					<xsl:text> currentcms</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</h4>
	</a>
</xsl:template>

</xsl:stylesheet>