<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template name="get-last-fm-recent-tracks">
	<xsl:param name="location-source" select="'external'"/>
	<xsl:param name="api-key"/><!-- Required -->
	<xsl:param name="username"/><!-- Required -->
	<xsl:param name="page" select="1"/>
	<xsl:param name="xml-source">
		<xsl:text>http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&amp;user=</xsl:text>
		<xsl:value-of select="$username"/>
		<xsl:text>&amp;api_key=</xsl:text>
		<xsl:value-of select="$api-key"/>
		<xsl:text>&amp;page=</xsl:text>
		<xsl:value-of select="$page"/>
	</xsl:param>
	<xsl:param name="image-size" select="'large'"/>
	
	<xsl:element name="ul">
	<xsl:attribute name="style">margin:0;padding:0;</xsl:attribute>
	<xsl:attribute name="class">lastfm clearfix</xsl:attribute>
	<xsl:choose>
		<xsl:when test="$location-source='external'">
			<xsl:apply-templates select="document($xml-source)/lfm/recenttracks/track">
				<xsl:with-param name="img-size" select="$image-size"/>
			</xsl:apply-templates>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="//track">
				<xsl:with-param name="img-size" select="$image-size"/>
			</xsl:apply-templates>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:element>
</xsl:template>

<xsl:template match="track">
	<xsl:param name="element-wrap" select="'li'"/>
	<xsl:param name="img-size"/>
	<xsl:element name="{$element-wrap}">
		<xsl:attribute name="class">clearfix</xsl:attribute>
			<xsl:choose>
				<xsl:when test="./@nowplaying = 'true'">
					<h3 class="pink" style="font-size:14px;color:#fff;text-shadow:1px 1px 0px #ccc;font-family:'pt-sans-narrow';">Now playing</h3>
				</xsl:when>
				<xsl:otherwise>
					<h3 class="pink" style="font-size:14px;color:#fff;text-shadow:1px 1px 0px #ccc;font-family:'pt-sans-narrow';">
						<xsl:value-of select="substring(date,1,6)"/><xsl:text> at </xsl:text>
						<xsl:variable name="hourcorrection" select="substring($timezone,2,2)"/>
						<xsl:variable name="xmlhour" select="number(substring(substring-after(date,','),2,2))"/>
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
						<xsl:choose>
							<xsl:when test="$localhour = '25' or $localhour = '-1'">
								00<xsl:value-of select="substring(substring-after(date,','),4,3)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select='format-number($localhour, "00")' /><xsl:value-of select="substring(substring-after(date,','),4,3)" />
							</xsl:otherwise>
						</xsl:choose>
					</h3>
				</xsl:otherwise>
			</xsl:choose>			
			<div class="span-1 first">
				<a href="{url}" title="{name} by {artist}, yo!">
				<xsl:choose>
					<xsl:when test="./@nowplaying">
						<img class="continuousspinny" src="{$workspace}/images/nowplaying.png" alt="noise"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="image[@size='small'] != ''">
							<img class="spinny" src="{image[@size=$img-size]}" alt="{name} by {artist}" width="34" height="34"/>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
				</a>
			</div>
			<div class="span-5 last">
				<span class="lfmartist"><xsl:value-of select="artist"/></span><br/>
				<span class="lfmtitle"><xsl:value-of select="name"/></span>
			</div>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>