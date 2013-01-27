<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/workprojectlist.xsl"/>
<xsl:import href="../utilities/workthumbimages.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template match="data">
	<div id="workcontainer" class="span-12">
		<div class="span-4 pink" style="margin-bottom:10px;">
			<form action="{$root}/search/" method="get">
				<h2 style="margin-bottom:0;padding-bottom:0;" class="searchbox">search work</h2>
			    <input class="searchinput" type="text" style="margin:0 0 10px 10px;" name="keywords" />
			</form>
		</div>
		<xsl:apply-templates select="workprojects/entry"/> <!-- workprojectlist.xsl -->

		<xsl:call-template name="pagination">
		     <xsl:with-param name="pagination" select="/data/workprojects/pagination"/>
		     <xsl:with-param name="pagination-url" select="'/work/$'"/>
		     <xsl:with-param name="show-navigation" select="false"/>
  		</xsl:call-template>
  		
  	</div>
	<div id="ajaxcontainer" class="span-8 last">
		<ul class="workthumbs">
			<xsl:apply-templates select="workprojects/entry" mode="images"/> <!-- workthumbimages.xsl -->
		</ul>
	</div>
</xsl:template>

</xsl:stylesheet>


