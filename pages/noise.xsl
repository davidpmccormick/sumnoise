<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/flickr.xsl"/>
<xsl:import href="../utilities/talinkahashifyer.xsl"/>
<xsl:import href="../utilities/recent-tracks.xsl"/>
<xsl:import href="../utilities/pocket.xsl"/>

<xsl:template match="data">
	<div class="span-6">
		<div id="noiseflickr" class="clearfix" style="margin-bottom:10px;">
			<a href="http://www.flickr.com/photos/35170635@N07/"><h2 class="green">flickr</h2></a>
			<xsl:apply-templates select="flickr/atom:entry"/> <!-- flickr.xsl -->
		</div>
		
		<div id="noisealbum" class="clearfix">
			<h2 style="margin-top:10px;" class="blue">album of the week</h2>
			
			
			<xsl:variable name="lfmartist">
				<!-- hack to ensure default value to prevent the whole page breaking -->
				<xsl:choose>
					<xsl:when test="string-length(substring-before(substring-after(weeklyalbums/album/url, 'music/'), '/')) &gt; 0">
						<xsl:value-of select="substring-before(substring-after(weeklyalbums/album/url, 'music/'), '/')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>nothing</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:variable name="lfmalbum">
				<!-- hack to ensure default value to prevent the whole page breaking -->
				<xsl:choose>
					<xsl:when test="string-length(substring-after(substring-after(weeklyalbums/album/url, $lfmartist), '/')) &gt; 0">
						<xsl:value-of select="substring-after(substring-after(weeklyalbums/album/url, $lfmartist), '/')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>nothing</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			
			<xsl:variable name="xml-weekly-album">
				<xsl:text>http://ws.audioscrobbler.com/2.0/?method=album.getinfo&amp;api_key=12866380c7cdef08baa21d360d6c9b1c&amp;artist=</xsl:text>
				<xsl:value-of select="$lfmartist"/>
				<xsl:text>&amp;album=</xsl:text>
				<xsl:value-of select="$lfmalbum"/>
			</xsl:variable>
			
			<div class="weeklyalbum relative clearfix">
				<div class="weeklyalbumpink" style="position:absolute;z-index:1;top:0;left:0;width:230px;height:230px;background-color:#FF92BB;display:none;box-shadow:inset 0px 0px 20px #DB7093;"></div>
				<div class="weeklyalbumtags" style="position:absolute;z-index:2;top:0px; left:10px; width:185px; height:200px;padding:20px;display:none;">
					<p style="color:#fff;text-shadow:none;">tags, yo!</p>
					<ul>
						<xsl:for-each select="document($xml-weekly-album)/lfm/album/toptags/tag">
							<li style="color:#fff;"><xsl:value-of select="name"/></li>
						</xsl:for-each>
					</ul>
				</div>		
				<img>
					<xsl:attribute name="src">
						<xsl:choose>
							<xsl:when test="document($xml-weekly-album)/lfm/album/image[@size='large'] != ''">
								<xsl:value-of select="document($xml-weekly-album)/lfm/album/image[@size='large']"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$workspace"/><xsl:text>/images/noalbumart.png</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="width">230</xsl:attribute>
					<xsl:attribute name="height">230</xsl:attribute>
					<xsl:attribute name="style">margin-bottom:5px;</xsl:attribute>
				</img>
			</div>
			
			<a href="http://www.last.fm/music/{$lfmartist}"><h2 class="green"><xsl:value-of select="weeklyalbums/album/artist"/></h2></a>
			<a href="{weeklyalbums/album/url}"><h2 class="yellow"><xsl:value-of select="weeklyalbums/album/name"/></h2></a>
		</div>
			
		<div id="noisegithub" class="clear">
			<a href="http://www.github.com/davidpmccormick"><h2 class="red">github</h2></a>
			<ul>
				<xsl:apply-templates select="github/atom:entry" /> <!-- below -->
			</ul>
		</div>
		
	</div>
	<div class="span-8">
		<a href="http://www.twitter.com/davidpmccormick"><h2 class="blue">twitter</h2></a>
		
		<div class="noisetweet">
			<!-- loaded by jTweetsAnywhere -->
		</div>
		
	</div>
	<div class="span-6 last" style="position:relative;">
		<h2 class="red relative lastseenhover">last seen<span class="lastseentime">at <xsl:value-of select="substring(substring-after(/data/latitude/@creation, 'T'), 1,5)"/></span></h2>
		<div id="map_canvas" style="height:300px;width:230px;margin-bottom:10px;"></div>
		<a class="lastfmlink" href="http://www.last.fm/user/davidmccormick"><h2 class="yellow">last.fm</h2></a>
		<xsl:call-template name="get-last-fm-recent-tracks"> <!-- recent-tracks.xsl -->
		     <xsl:with-param name="api-key" select="'12866380c7cdef08baa21d360d6c9b1c'"/>
		     <xsl:with-param name="username" select="'davidmccormick'"/>
		     <xsl:with-param name="image-size" select="'small'"/>
		</xsl:call-template>
		<div class="sticky span-6 first last clearfix">
			<h2 class="blue relative" style="margin-top:10px;">recent reading</h2>
			<ul class="pocket">
				<xsl:apply-templates select="pocket/item"/> <!-- pocket.xsl -->
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
	  <xsl:comment>
	      $(document).ready(function(){
					$('.noisetweet').jTweetsAnywhere({
					    username: 'davidpmccormick',
					    count: 20,
					    
					    showTweetFeed: {
					    	showTwitterBird: false,
		            showProfileImages: false,
		            showUserScreenNames: false,
		            showUserFullNames: false,
		            showActionReply: false,
		            showActionRetweet: false,
		            showActionFavorite: false,
		            interval: 60,
		            duration: -1 
	            },
	            
					    tweetTimestampDecorator: function(tweet, options){
					       var date = new Date(formatDate(tweet.created_at));
					       var dateString =
					       		 (date.getHours() &lt; 10 ? '0' : '') +
					           date.getHours() + ':' +
					           (date.getMinutes() &lt; 10 ? '0' : '') +
					           date.getMinutes();
					
					        var html =
					            '&lt;span class="theTime"&gt; &#8226; ' +
					            dateString + '&lt;/span&gt;';
					       return html;
					    }
					});           
	      });
	  //</xsl:comment>
	</script>
	
</xsl:template>

<xsl:template match="github/atom:entry">
	<li class="{substring-before(substring-after(atom:content, 'span class=&#34;'),'&#34;')}">
		<a href="{atom:link/@href}">
			<xsl:choose>
				<xsl:when test="starts-with (atom:title, 'davidpmccormick')">
					<xsl:value-of select="substring(atom:title, 16)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="atom:title" />
				</xsl:otherwise>
			</xsl:choose>
		</a>
	</li>	
</xsl:template>

</xsl:stylesheet>