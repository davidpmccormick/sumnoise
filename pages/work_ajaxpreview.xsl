<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<a href="{$root}/work/project/{data/ajaxpreview/entry/title/@handle}">
		<div class="relative clickhere"><h2 class="ajaxheading blue"><xsl:value-of select="data/ajaxpreview/entry/title"/>
		</h2><span class="right" style="position:absolute;top:5px;right:5px;">click for details</span></div>
	</a>
	<xsl:copy-of select="data/ajaxpreview/entry/ajax-preview/node()"/>
</xsl:template>

</xsl:stylesheet>