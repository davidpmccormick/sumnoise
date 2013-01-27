<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:atom="http://www.w3.org/2005/Atom"
xmlns:georss="http://www.georss.org/georss">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="html" omit-xml-declaration="yes" indent="no" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>

<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	<html lang="en">
		<head>
			<meta charset="utf-8" />
			<meta name="title" content="{$page-title}" />
			<meta name="description" content="Web design and development from David McCormick" />
			<meta name="tags" content="web design, web development, html5, css3, javascript, jquery, php, xslt, symphony cms, expression engine, wordpress, textpattern" />
			<title><xsl:call-template name="page-title"/></title>
			<link rel="apple-touch-icon-precomposed" href="{$workspace}/images/iphone-icon.png" />
			<link rel="shortcut icon" type="image/png" href="{$workspace}/images/favicon.png"/>
			<link rel="icon" type="image/png" href="{$workspace}/images/favicon.png"/>
			<link rel="alternate" href="{$root}/blog/blogfeed" title="blog, yo!" type="application/rss+xml" />
			<link rel="alternate" href="{$root}/work/workfeed" title="work, yo!" type="application/rss+xml" />
			<link id="thestylesheet" rel="stylesheet" media="screen" href="{$workspace}/css/screen.css" />
			<link id="size-stylesheet" rel="stylesheet" media="screen" href="{$workspace}/css/screen.css" />
			<link rel="stylesheet" href="{$workspace}/css/lionbars.css" type="text/css" media="screen" />
			<link type="text/css" rel="stylesheet" media="only screen and (max-device-width: 600px)" href="{$workspace}/css/handheld.css" /> <!-- CSS for phones -->
			<link type="text/css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" href="{$workspace}/css/tablet.css" /> <!-- CSS for iPads -->
			<link type="text/css" rel="stylesheet" media="(min-device-width: 601px) and (max-device-width: 1080px)" href="{$workspace}/css/tablet.css" /> <!-- CSS for tablets -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
			<script src="{$workspace}/js/jquery.isotope.min.js"></script>
			<script src="{$workspace}/js/jquery.ajaxify.min.js"></script>
			<script id="thejavascript" src="{$workspace}/js/sumnoise.js"></script>
			<script src="{$workspace}/js/jquery.lionbars.js"></script>
			<script type="text/javascript" src="{$workspace}/js/rotate.min.js"></script>
			<script type="text/javascript" src="{$workspace}/js/jquery.jtweetsanywhere-1.3.1.js"></script>
			
			
			
			<xsl:comment><![CDATA[[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/selectivizr-min.js"></script><![endif]]]></xsl:comment>
					
			<xsl:comment><![CDATA[[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/sumnoise_ie.js"></script><![endif]]]></xsl:comment>
					
			<xsl:comment><![CDATA[[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/about_ie.js"></script><![endif]]]></xsl:comment>
								
	        <xsl:if test="$current-page-id = '2'"> <!-- only for 'about' page -->
				<script src="{$workspace}/js/about.js"></script>
			</xsl:if>
			<script src="{$workspace}/js/jquery.history.js"></script>
			<script src="{$workspace}/js/jquery.cycle.min.js"></script>
			<script src="{$workspace}/js/jquery.animate-shadow-min.js"></script>
			<script src="{$workspace}/js/jquery.sticky.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
			<script type="text/javascript" src="http://use.typekit.com/oty5wmg.js"></script>
			<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
			<style type="text/css">
			<!-- hide all text until webfonts have loaded (to prevent flash of unstyled text) -->
			h1, h2, h3, h4, p, a, #tweets li {
			  visibility: hidden;
			}
			.wf-active h1, .wf-active h2, .wf-active h3, .wf-active h4, .wf-active p, .wf-active a, .wf-active #tweets li {
			  visibility: visible;
			}
			<!-- don't hide type in browsers that don't support webfonts -->
			.wf-inactive h1, .wf-inactive h2, .wf-inactive h3, .wf-inactive h4, .wf-inactive p, .wf-inactive a, .wf-inactive #tweets li {
			  visibility: visible; 
			}
			</style>
			<xsl:if test="$current-page-id = '5'"> <!-- only for 'noise' page -->
				<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
				<script type="text/javascript">
				var map;
			  	var cityCircle;
			    var lastLat = <xsl:value-of select="substring-before(/data/latitude/atom:entry/georss:point, ' ')"/>;
			    var lastLong = <xsl:value-of select="substring-after(/data/latitude/atom:entry/georss:point, ' ')"/>;
				var lastSeen = new google.maps.LatLng(lastLat, lastLong);
				
				
				function initialize() {
				var stylez = [
				  {
				    elementType: "geometry",
				    stylers: [
				      { visibility: "simplified" },
				      { lightness: 14 },
				      { hue: "#ff0055" },
				      { saturation: -3 },
				      { gamma: 0.81 }
				    ]
				  },{
				    elementType: "labels",
				    stylers: [
				      { saturation: -40 },
				      { hue: "#00ffe6" },
				      { visibility: "simplified" }
				    ]
				  }
				];
				var mapOptions = {
				  zoom: 15,
				  center: lastSeen,
				  mapTypeControlOptions: {
				  	mapTypeIds: [google.maps.MapTypeId.TERRAIN, 'tehgrayz']
				  }
				};
				map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
				  var aboutHere = {
				    strokeColor: "#FF929B",
				    strokeOpacity: 0.8,
				    strokeWeight: 2,
				    fillColor: "#FF92BB",
				    fillOpacity: 0.35,
				    map: map,
				    center: lastSeen,
				    radius: <xsl:value-of select="/data/latitude/atom:entry/georss:radius"/>
				  };
				  var mapType = new google.maps.StyledMapType(stylez, { name:"pink, yo!" });    
					map.mapTypes.set('tehgrayz', mapType);
					map.setMapTypeId('tehgrayz');
				  cityCircle = new google.maps.Circle(aboutHere);
				  
					var marker = new google.maps.Marker({
						position: lastSeen, 
						map: map, 
						title: 'Yo!',
						icon: '<xsl:value-of select="$workspace" />/images/mapmarker.png'
					});

				  
				}
				$(document).ready(function(){
					initialize();
				});
				</script>
			</xsl:if>
			<script type="text/javascript">
			  var _gaq = _gaq || [];
			  _gaq.push(['_setAccount', 'UA-22859821-1']);
			  _gaq.push(['_trackPageview']);
			  (function() {
			    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			  })();
			</script>			
		</head>
		<body id="{$current-page}-page" rel="{$workspace}">
			<div class="container relative">
				<div id="left-col" class="span-4 first">
					<div id="nav" class="span-4 first">
						<xsl:apply-templates select="data/mainnav"/> <!-- navigation.xsl -->
					</div> <!-- end #nav -->
					<div id="tweets" class="span-4 first">
						<xsl:if test="$current-page-id = '3'"> <!-- only for 'work' page -->
							<xsl:attribute name="style">height:250px;</xsl:attribute>
						</xsl:if>
						
						<!-- loaded by jTweetsAnywhere -->
						
					</div> <!-- end #tweets -->
					<xsl:if test="$current-page-id = '3'"> <!-- only for 'work' page -->
						<div id="disciplinelist" class="span-4 first">
						<h3 style="margin-bottom:0;margin-top:20px;padding-bottom:5px;color:#555;padding-left:0;">filter by discipline</h3>
							<ul class="disciplinefilter">
								<xsl:for-each select="/data/alldiscipline/entry/title">
									<a href="#" data-filter=".{@handle}"><li style="padding:0;" class="{@handle} disciplineitem"><xsl:value-of select="."/></li></a>
									<xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
								</xsl:for-each>
								<a href="#" data-filter="*"><li style="padding:0;" class="disciplineitem"><xsl:text> </xsl:text>all</li></a>
							</ul>
						</div>
					</xsl:if>
				</div> <!-- end #left-col -->
				<div class="article">
					<xsl:if test="$current-page-id = '3'"> <!-- only for 'work' page -->
						<div class="gifspinner"><img src="{$workspace}/images/loading.gif"/></div> 
						<div id="loadingcontainer" style="position:absolute;top:0;right:0;"></div>
					</xsl:if>
					<xsl:if test="$current-page-id = '4'"> <!-- only for 'blog' page -->
						<div class="gifspinnerblog"><img src="{$workspace}/images/loading.gif"/></div> 
					</xsl:if>
					<xsl:apply-templates />
				</div>		
				<div id="footer" class="span-20 right first">
					<p class="right">©<xsl:value-of select="$this-year"/> dmc</p>
				</div>
			</div> <!-- end .container -->	
			<script type="text/javascript">
			  <xsl:comment>
			      $(document).ready(function(){
			           $('#tweets').lionbars({autohide: true});
			           
			      });
			  //</xsl:comment>
			</script>
			
			<xsl:if test="$current-page-id = '3'"> <!-- glow the discipline filter heading on the work page -->
				<script type="text/javascript">
				  <xsl:comment>
				      $(window).load(function(){
					      setTimeout(function(){
					           $('#disciplinelist h3').animate({'color':'#ccccdd'},1000, function(){
					           		$('#disciplinelist h3').animate({'color':'#333'},1000);
					           });
					      },1000);
				      });
				  //</xsl:comment>
				</script>
			</xsl:if>
			<xsl:if test="$current-page-id = '14'"> <!-- syntax highlighting on blog:view pages -->
				<script type="text/javascript" src="{$workspace}/js/shCore.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushAppleScript.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushBash.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushCss.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushJScript.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushPhp.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushSql.js"></script>
				<script type="text/javascript" src="{$workspace}/js/brushes/shBrushXml.js"></script>
				<link type="text/css" rel="stylesheet" href="{$workspace}/css/shCoreDefault.css"/>
				<script type="text/javascript">
				$(document).ready(function(){
    				SyntaxHighlighter.all();
				});
				</script>
			</xsl:if>
			
			<script type="text/javascript">
			  <xsl:comment>
			      $(document).ready(function(){
					    $('#tweets').jTweetsAnywhere({
					      username: 'davidpmccormick',
					      count: 20,
					      
					      showTweetFeed: {
					            showProfileImages: false,
					            showUserScreenNames: false,
					            showUserFullNames: false,
					            showActionReply: false,
					            showActionRetweet: false,
					            showActionFavorite: false,
					            showGeoLocation: false
					        },
					      
					      showFollowButton: false,
					      tweetProfileImagePresent: false,
					      tweetDecorator: function(tweet, options) {
					      
							   var date = new Date(formatDate(tweet.created_at));
							   var dateString =
							   		 (date.getHours() &lt; 10 ? '0' : '') +
							       date.getHours() + ':' +
							       (date.getMinutes() &lt; 10 ? '0' : '') +
							       date.getMinutes();
							
							    var tweetTime =
							        '&lt;span class="tweettime"&gt;' +
							        dateString + '&lt;/span&gt;';
					      
					        var html = '';
					        	
					          html = '&lt;li class="jta-tweet-list-item"&gt;';
					          html += tweetTime;
					          
					          if (options.tweetBodyDecorator)
					            html += options.tweetBodyDecorator(tweet, options);
					          html += '&lt;div class="jta-clear"&gt; &lt;/div&gt;';
					          html += '&lt;/li&gt;';
					        
					        return html;
					      },
					      
					      tweetTextDecorator: function(tweet, options) {
					        var tweetText = options.linkDecorator ? options.linkDecorator(tweet.text, options) : tweet.text;
					        if (options.usernameDecorator)
					          tweetText = options.usernameDecorator(tweetText, options);
					        if (options.hashtagDecorator)
					          tweetText = options.hashtagDecorator(tweetText, options);
					        tweetText = tweetText.replace(/\n/gi, '&lt;br /&gt;')
					        return '&lt;span class="tweet-text"&gt;' + tweetText + '&lt;/span&gt;';
					      },
					      
						  tweetTimestampDecorator: function(tweet, options) {
						    var tweetTime = ''
						    return tweetTime;
						  }
					    });
			      });
			  //</xsl:comment>
			</script>

		</body>
	</html>
</xsl:template>

<xsl:strip-space elements="*"/>

</xsl:stylesheet>



