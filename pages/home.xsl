<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:math="http://exslt.org/math"
    extension-element-prefixes="math">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/homeblog.xsl"/>
<xsl:import href="../utilities/homecontact.xsl"/>

<xsl:template match="data">
	<div id="centercontainer" class="span-12">
		<div id="hometext" class="span-8 relative">
			<div class="dot clearfix" style="position:absolute;top:-126px;left:151px;z-index:9999;">
				<img class="spinny" src="{$workspace}/images/dot.png" alt="dot, yeah?"/>
			</div>
			<h2 class="yellow">this is</h2>
			<img src="{$workspace}/images/sumnoise.png" alt="sumnoise"/>
		</div> <!-- end #hometext -->
		<div id="homeaboutcontact" class="span-4 last">
			<div id="homeabout" class="span-4 last">
				<a href="{$root}/about"><h2 class="green">what it is, yo!</h2></a>
				<p>Designing and building online digital interfaces with a bit of a difference.</p>
				<p>Basically, it's web design and development, yeah?</p>
			</div> <!-- end #homeabout -->
			<div id="homecontact" class="span-4 last">
				<a href="{$root}/noise"><h3 class="pink" style="margin-bottom:0;">word up</h3></a>
				<ul class="clearfix relative" style="height:15px;">
					<li class="twitterli wordup"><a class="twitter" href="http://www.twitter.com/davidpmccormick"></a></li>
					<li class="facebookli wordup"><a class="facebook" href="http://www.facebook.com/davidpmccormick"></a></li>
					<li class="flickrli wordup"><a class="flickr" href="http://www.flickr.com/photos/35170635@N07/"></a></li>
					<li class="lastfmli wordup"><a class="lastfm" href="http://www.last.fm/user/davidmccormick"></a></li>
					<li class="githubli last wordup"><a class="github" href="https://github.com/davidpmccormick"></a></li>
				</ul>
			</div> <!-- end #homecontact -->
		</div> <!-- end #homeaboutcontact -->
		<xsl:if test="homework/entry">
			<!-- get a random number 1 to 5 inclusive, to use in the position() of the homework entry -->
			<xsl:variable name="randonetofive"><xsl:value-of select="(floor(math:random()*5) mod 5) + 1" /></xsl:variable>
			<a href="{$root}/work/project/{homework/entry[position() = $randonetofive]/title/@handle}"><div id="homework" class="span-12" style="position:relative;">
				<h2 class="red"><xsl:value-of select="homework/entry[position() = $randonetofive]/title"/></h2>
					<img src="{$workspace}/images/{homework/entry[position() = $randonetofive]/image}" alt="{homework/entry[position() = $randonetofive]/title}" width="470" />
				<div class="teaser">
					<div class="teaser-nested">
						<xsl:copy-of select="homework/entry[position() = $randonetofive]/excerpt/node()"/>
					</div>
				</div>
			</div></a> <!-- end #homework -->
		</xsl:if>
	</div> <!-- end #centercontainer -->
	<div id="homeblog" class="span-8 last">
		<xsl:apply-templates select="homeblog/entry"/> <!-- homeblog.xsl -->
	</div> <!-- end #homeblog -->
</xsl:template>

</xsl:stylesheet>