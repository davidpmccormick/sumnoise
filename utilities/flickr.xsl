<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom">

<xsl:template match="flickr/atom:entry">
	<a style="position:relative;float:left;width:57px;height:57px;overflow:hidden;" class="flickrimage" href="{atom:link/@href}">	
		<img style="position:absolute;">
			<xsl:attribute name="src"><xsl:value-of select="$root"/><xsl:text>/image/2/57/57/1/1/</xsl:text><xsl:value-of select="substring-after((substring-after(substring-before(atom:content, '&quot; width'),'src=&quot;')), 'http://')" /></xsl:attribute>
		</img>
	</a>
</xsl:template>

</xsl:stylesheet>

