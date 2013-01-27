<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom">
	
<xsl:import href="../utilities/talinkahashifyer.xsl"/>

<xsl:template match="/data/tweet/item[not(starts-with(description, 'davidpmccormick: @'))]" mode="sidebar">

	<xsl:variable name="hourcorrection" select="substring($timezone,2,2)"/>
	<xsl:variable name="xmlhour" select="number(substring(pubDate,18,2))"/>
	<xsl:variable name="localhour">
		<xsl:choose>
			<xsl:when test="substring($timezone,1,1) = '+'">
			 	<xsl:value-of select="$xmlhour + $hourcorrection"/>
			</xsl:when>
			<xsl:when test="substring($timezone,1,1) = '-'">
			 	<xsl:value-of select="$xmlhour - $hourcorrection"/>
			</xsl:when>
			<xsl:otherwise>
			 	<xsl:value-of select="$xmlhour + $hourcorrection"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<li>
		<span class="tweettime">
			<xsl:choose>
				<xsl:when test="$localhour = '25' or $localhour = '-1'">
					00<xsl:value-of select="substring(pubDate,20,3)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select='format-number($localhour, "00")' /><xsl:value-of select="substring(pubDate,20,3)" />
				</xsl:otherwise>
			</xsl:choose>
		</span>
		<xsl:call-template name="linkahashify">
			<xsl:with-param name="tweet" select="substring-after(description, 'davidpmccormick: ')" />
		</xsl:call-template>				
	</li>
</xsl:template>

</xsl:stylesheet>