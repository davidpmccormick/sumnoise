<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="workprojects/entry">
	<div>
		<xsl:choose>
			<xsl:when test="position() = 1">
				<xsl:attribute name="class">
					<xsl:text>span-4 first</xsl:text>
					<xsl:if test="discipline/item">
						<xsl:text> </xsl:text>
						<xsl:for-each select="discipline/item">
							<xsl:value-of select="@handle"/><xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="position() = 2">
				<xsl:attribute name="class">
					<xsl:text>span-4</xsl:text>
					<xsl:if test="discipline/item">
						<xsl:text> </xsl:text>
						<xsl:for-each select="discipline/item">
							<xsl:value-of select="@handle"/><xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="class">
					<xsl:text>span-4 last</xsl:text>
					<xsl:if test="discipline/item">
						<xsl:text> </xsl:text>
						<xsl:for-each select="discipline/item">
							<xsl:value-of select="@handle"/><xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		<!-- AJAX for anything bigger than a phone -->
		<a rel="{title/@handle}" class="ajaxify"  href="{$root}/work/ajaxpreview/{title/@handle}"><h2 class="red"><xsl:value-of select="title"/></h2></a>
		<!-- direct links for phones -->
		<a rel="{title/@handle}" class="directlink"  href="{$root}/work/project/{title/@handle}"><h2 class="red"><xsl:value-of select="title"/></h2></a>
		<xsl:copy-of select="excerpt/node()"/>
	</div>
</xsl:template>


</xsl:stylesheet>