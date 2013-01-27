<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/date-time.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">

<rss version="2.0">
    <channel>
        <title><xsl:value-of select="$website-name"/></title>
        <link><xsl:value-of select="$root"/></link>
        <description>Yo!</description>
        <generator>DMC</generator>
		<xsl:for-each select="data/blogfeed/entry">
		    <item>
		        <title><xsl:value-of select="title"/></title>
		        <link><xsl:value-of select="$root"/>/blog/view/<xsl:value-of select="title/@handle"/></link>
		        <description>
		        	<xsl:value-of select="excerpt"/>
		        	<xsl:if test="image">
		        		&lt;img src="<xsl:value-of select="$workspace"/>/images/<xsl:value-of select="image/filename"/>"/&gt;
		        	</xsl:if>
		        </description>
		        <pubDate>
		            <xsl:call-template name="format-date">
		                <xsl:with-param name="date" select="date"/>
		                <xsl:with-param name="format" select="'w, d m Y T'"/>
		            </xsl:call-template>
		            <xsl:text>:00 </xsl:text>
		            <xsl:value-of select="translate($timezone,':','')"/>
		        </pubDate>
		        <guid><xsl:value-of select="$root"/>/blog/view/<xsl:value-of select="title/@handle"/></guid>
		    </item>
		</xsl:for-each>
    </channel>
</rss>	

</xsl:template>

</xsl:stylesheet>