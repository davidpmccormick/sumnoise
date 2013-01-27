<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/twelve-month-archive.xsl"/>

<xsl:template match="data">
	<div class="span-16">
		<h2 class="yellow">
			<xsl:choose>
			    <xsl:when test="substring($year,6,2) = $this-month">
			    	<xsl:text>This has been going down in </xsl:text>
			    </xsl:when>
			    <xsl:otherwise>
			    	<xsl:text>This went down in </xsl:text>
			    </xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date"><xsl:value-of select="$year"/>-01</xsl:with-param>
				<xsl:with-param name="format" select="'M'"/>
			</xsl:call-template>
			<xsl:if test="substring($year,6,2) = $this-month">
				<xsl:text>, yo!</xsl:text>
			</xsl:if>
		</h2>
	   <xsl:apply-templates select="archive/entry"/>
   </div>
   	<ul class="monthlistview span-4 last">
		<xsl:call-template name="months"/> <!-- twelve-month-archive.xsl -->
	</ul>
</xsl:template>

<xsl:template match="archive/entry">
    <a href="{$root}/blog/view/{title/@handle}"><h3 class="blue"><xsl:value-of select="title"/></h3></a>
    <xsl:copy-of select="excerpt/node()"/>
</xsl:template>

</xsl:stylesheet>