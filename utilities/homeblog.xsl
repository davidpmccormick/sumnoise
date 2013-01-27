<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="homeblog/entry">
	<div class="span-8 first last blogentry">
		<span class="homeblogdate">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'d M'"/>
			</xsl:call-template>
		</span>		
		<a href="{$root}/blog/view/{title/@handle}"><h2 class="blue homeblog"><xsl:value-of select="title"/></h2></a>
		<xsl:if test="excerpt">
			<xsl:copy-of select="excerpt/node()"/>
		</xsl:if>
		<xsl:if test="image">
			<img src="{$workspace}/images/{image}" alt="{title}" width="310" />
		</xsl:if>
	</div> <!-- end .blogentry -->
</xsl:template>

</xsl:stylesheet>