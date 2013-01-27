<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="disciplinelist/entry">
	<a href="{$root}/work/project/{title/@handle}">
		<h3 class="pink"><xsl:value-of select="title"/></h3>
	</a>
	<xsl:copy-of select="excerpt/node()"/>
</xsl:template>

</xsl:stylesheet>