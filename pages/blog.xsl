<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/twelve-month-archive.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template match="data">
	<div id="blogcontainer" class="span-16">
		<div class="span-4 green" style="margin-bottom:10px;">
			<form action="{$root}/blogsearch/" method="get">
				<h2 style="margin-bottom:0;padding-bottom:0;" class="searchbox">search blog</h2>
			    <input class="searchinput" type="text" style="margin:0 0 10px 10px;" name="keywords" />
			</form>
		</div>
		<xsl:apply-templates select="blogexcerpts/entry"/>
		
		<xsl:call-template name="pagination">
		     <xsl:with-param name="pagination" select="/data/blogexcerpts/pagination"/>
		     <xsl:with-param name="pagination-url" select="'/blog/$'"/>
		     <xsl:with-param name="show-navigation" select="false"/>
  		</xsl:call-template>

	</div>
	<ul class="monthlist span-4 last">
		<xsl:call-template name="months"/> <!-- twelve-month-archive.xsl -->
	</ul>
</xsl:template>

<xsl:template match="blogexcerpts/entry">
	<div class="span-4">
		<a href="{$root}/blog/view/{title/@handle}"><h2 class="blue blogexcerpt"><xsl:value-of select="title"/></h2></a>
		<xsl:copy-of select="excerpt/node()"/>
	</div>	
</xsl:template>

</xsl:stylesheet>