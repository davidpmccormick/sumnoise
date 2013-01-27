<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/html5.xsl"/>
<xsl:import href="../utilities/twelve-month-archive.xsl"/>

<xsl:template match="data">
	<div class="span-16">
		<xsl:if test="blogimages/entry">
			<div class="cyclethis" style="height:330px; overflow:hidden; margin-bottom:10px;">
				<xsl:apply-templates select="blogimages/entry"/>
			</div>
		</xsl:if>
		<h2 class="blue"><xsl:value-of select="blogview/entry/title"/></h2>
		<xsl:copy-of select="blogview/entry/body/node()"/>
		<form id="commentform" style="margin-bottom:20px;" method="post" action="" enctype="multipart/form-data">
			<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
			<h2 class="green">noise</h2>
			
			<input id="namefield" class="default-value" style="height:25px;padding:10px; width:50%; font-size:15px; font-family:'pt-sans-narrow';" name="fields[name]" type="text" value="Yo' name, yo!"/><br />
			
    <input id="emailfield" class="default-value" style="height:25px;padding:10px; width:50%; font-size:15px; font-family:'pt-sans-narrow';" name="fields[email]" type="text" value="Yo' email won't be published, yo!" />
			
			<textarea id="commentfield" class="default-value" style="resize:none;overflow:hidden;color:#bbb;padding:10px;font-size:15px; font-family:'pt-sans-narrow';" name="fields[comment]" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;">Yo' comment, yo!</textarea>
			<input name="fields[post]" type="hidden" value="{$ds-blogview}" />
			<input name="action[comments]" type="hidden" value="" />
			<input name="send-email[subject]" value="Comment" type="hidden" />
		    <input name="send-email[body]" value="fields[comment]" type="hidden" />
		    <input name="send-email[recipient]" value="admin" type="hidden" />
			<h3 id="commentsubmit">bang</h3>
			<xsl:apply-templates select="events/comments"/>
		</form>
		<xsl:apply-templates select="comments/entry"/>
	</div>
	<ul class="monthlistview span-4 last">
		<xsl:call-template name="months"/> <!-- twelve-month-archive.xsl -->
	</ul>
<script type="text/javascript">
  <xsl:comment>
 	var active_color = '#FF92BB'; // Colour of user provided text
	var inactive_color = '#bbb'; // Colour of default text
      $(document).ready(function(){
		  $("input.default-value").css("color", inactive_color);
		  var default_values = new Array();
		  $("input.default-value").focus(function() {
		    if (!default_values[this.id]) {
		      default_values[this.id] = this.value;
		    }
		    if (this.value == default_values[this.id]) {
		      this.value = '';
		      this.style.color = active_color;
		    }
		    $(this).blur(function() {
		      if (this.value == '') {
		        this.style.color = inactive_color;
		        this.value = default_values[this.id];
		      }
		    });
		  });
		$('#commentform').submit(function(){
			if($('#namefield').attr('value') == "Yo' name, yo!") {
				$('#namefield').attr('value','');
			};
			if($('#commentfield').attr('value') == "Yo' comment, yo!") {
				$('#commentfield').attr('value','');
			};
			if($('#emailfield').attr('value') == "Yo' email won't be published, yo!") {
				$('#emailfield').attr('value','');
			};
		});
      });
  //</xsl:comment>
</script>
</xsl:template>

<xsl:template match="blogimages/entry">
	<div style="position:relative">
		<div class="descriptionwrapper"><div class="description"><xsl:copy-of select="description/node()"/></div></div>
		<img src="{$root}/image/2/630/330/1/images/{image/filename}" alt="{filename}">
			<xsl:if test="description != ''">
				<xsl:attribute name="class">showdescription</xsl:attribute>
			</xsl:if>
		</img>
	</div>
</xsl:template>

<xsl:template match="comments/entry">
	<h3 class="commentheading">
		<xsl:value-of select="name"/>
		<span class="right">
			<xsl:value-of select="date/@time"/>
			<xsl:text> on </xsl:text>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'d M Y'"/>
			</xsl:call-template>
		</span>
	</h3>
	<xsl:copy-of select="comment/node()" />
</xsl:template>

<xsl:template match="events/comments">
    <h3>
    	<xsl:attribute name="class"><xsl:value-of select="@result"/> eventalert</xsl:attribute>

			<xsl:choose>
				<xsl:when test="./@result = 'error'">
					<xsl:text>Ooooof!</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Big shout, yo!</xsl:text>
				</xsl:otherwise>
			</xsl:choose>

    </h3>
	<script type="text/javascript">
	  <xsl:comment>
	      $(document).ready(function(){
	      
	       $('.eventalert').attr('style','display:block');
	       
	      	$('.eventalert').css({'position':'absolute','top':'110px', 'z-index':'9999', 'font-size':'100px', 'border-color':'#FF929B', 'background':'#FF92BB', 'color':'#fff', 'text-shadow':'none', 'padding':'30px'});
	      
	      	$('.error').css({'left':'37%'});
	      	$('.success').css({'left':'30%'});
		      setTimeout(function(){
		         $('.error').fadeOut(2000);
		      	 $('.success').fadeOut(2000);
		      },1500);
	      });
	  //</xsl:comment>
	</script>
</xsl:template>

</xsl:stylesheet>