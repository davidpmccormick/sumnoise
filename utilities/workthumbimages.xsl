<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="workprojects/entry" mode="images">
	<xsl:apply-templates select="../../workthumbimages/entry[project/item/@id = current()/@id][position() &lt; 3]"/>
</xsl:template>

<xsl:template match="workthumbimages/entry">
	<li class="span-4 grid-image">
		<img src="{$root}/image/2/150/150/1/images/{image/filename}" alt="{image/filename}" width="150" height="150"/> <!-- JIT image manipulation -->
		<a href="{$root}/work/project/{project/item/@handle}">
			<div class="thumbteaser">
				<xsl:copy-of select="description/node()"/>
			</div>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>