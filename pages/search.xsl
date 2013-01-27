<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>

<xsl:template match="data">
	<div class="span-20 last" style="min-height:1100px;">
		<xsl:if test="starts-with($current-query-string,'?keywords=')">
			<h2 class="green">Results for "<xsl:value-of select="substring-after($current-query-string,'?keywords=')"/>"</h2>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="worksearch/entry">
			    <xsl:apply-templates select="worksearch/entry"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="substring-after($current-query-string,'?keywords=')">
					<h3>No results, yo.</h3>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

<xsl:template match="worksearch/entry">
    <a href="{$root}/work/project/{title/@handle}"><h3 class="pink"><xsl:value-of select="title"/></h3></a>
    <xsl:copy-of select="excerpt/node()"/><br/><br/>
</xsl:template>

</xsl:stylesheet>