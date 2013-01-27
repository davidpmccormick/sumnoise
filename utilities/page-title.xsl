<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/twelve-month-archive.xsl"/>

<xsl:template name="page-title">
	<xsl:value-of select="$website-name"/>
	<xsl:text> | </xsl:text>
	<xsl:choose>
		<xsl:when test="$current-page-id = 6"> <!-- work projects -->
			<xsl:value-of select="/data/projectview/entry/title"/>
		</xsl:when>
		<xsl:when test="$current-page-id = 7"> <!-- cms -->
			<xsl:value-of select="/data/currentcms/entry/title"/>
		</xsl:when>
		<xsl:when test="$current-page-id = 8"> <!-- discipline -->
			<xsl:value-of select="/data/currentdiscipline/entry/title"/>
		</xsl:when>
		<xsl:when test="$current-page-id = 8"> <!-- discipline -->
			<xsl:value-of select="/data/currentdiscipline/entry/title"/>
		</xsl:when>
		<xsl:when test="$current-page-id = 13"> <!-- blog archive -->
			<xsl:call-template name="format-date">
				<xsl:with-param name="date"><xsl:value-of select="$year"/>-01</xsl:with-param>
				<xsl:with-param name="format" select="'M'"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="$current-page-id = 14"> <!-- blog view -->
			<xsl:value-of select="/data/blogview/entry/title"/>
		</xsl:when>
		<xsl:when test="$current-page-id = 12"> <!-- (work) search -->
			<xsl:choose>
				<xsl:when test="substring-after($current-url,'?keywords=')">
					"<xsl:value-of select="substring-after($current-url,'?keywords=')"/>"
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$page-title"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:when test="$current-page-id = 20"> <!-- blog search -->
			<xsl:choose>
				<xsl:when test="substring-after($current-url,'?keywords=')">
					"<xsl:value-of select="substring-after($current-url,'?keywords=')"/>"
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$page-title"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$page-title"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>