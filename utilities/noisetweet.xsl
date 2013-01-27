<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:twitter="http://api.twitter.com">

<xsl:import href="../utilities/talinkahashifyer.xsl"/>

<xsl:template match="tweet/item" mode="noise">

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


	<h3 class="pink noisetweettime">
		<xsl:attribute name="style">font-size:14px;color:#fff;text-shadow:1px 1px 0px #ccc;font-family:'pt-sans-narrow';</xsl:attribute>
		<xsl:value-of select="substring(pubDate,1,11)"/> at
		<xsl:choose>
			<xsl:when test="$localhour = '25' or $localhour = '-1'">
				00<xsl:value-of select="substring(pubDate,20,3)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select='format-number($localhour, "00")' /><xsl:value-of select="substring(pubDate,20,3)" />
			</xsl:otherwise>
		</xsl:choose>
	</h3>
	<span class="noisetweet clearfix relative" style="margin-bottom:10px; display:block;">
		<span class="tweetlocation clearfix">
			<span style="padding:10px;display:block;">
				<xsl:choose>
					<xsl:when test="twitter:place/twitter:name">
						from <xsl:value-of select="twitter:place/twitter:name"/>, yo!
					</xsl:when>
					<xsl:otherwise>
						dunno where this was, yo!
					</xsl:otherwise>
				</xsl:choose>
			</span>
		</span>
		<xsl:call-template name="linkahashify">
			<xsl:with-param name="tweet" select="substring-after(description, 'davidpmccormick: ')" />
		</xsl:call-template>
	</span>
</xsl:template>

</xsl:stylesheet>