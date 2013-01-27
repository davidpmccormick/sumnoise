<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="homecontact/entry">
	<li><a href="{service-url}"><xsl:value-of select="service-name"/></a></li>
</xsl:template>

</xsl:stylesheet>