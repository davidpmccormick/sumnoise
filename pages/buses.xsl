<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:math="http://exslt.org/math"
    extension-element-prefixes="math">

<xsl:import href="../utilities/html5.xsl"/>

<xsl:template match="data">
	<div class="span-8">
		<xsl:choose>
			<xsl:when test="$stop != ''">
				<h2 class="blue"><xsl:value-of select="buses/bus/@stop[position() = 1]" />
				<xsl:if test="$route != ''">
					<xsl:text> </xsl:text><span style="text-transform:uppercase;"><xsl:value-of select="$route" /></span>
				</xsl:if>
			</h2>
				<ul class="buslist">
					<xsl:apply-templates select="buses/bus" />
				</ul>
				<input type="number" class="businput" placeholder="enter bus stop number" />
				<h2 style="cursor:pointer;" class="yellow submitbus">submit</h2>
			</xsl:when>
			<xsl:otherwise>
				<h2 class="blue">buses</h2>
				<input type="number" class="businput" placeholder="enter bus stop number" />
				<h2 style="cursor:pointer;" class="yellow submitbus">submit</h2>
			</xsl:otherwise>
		</xsl:choose>
	</div>
    
	
	
	<div class="span-4">
		<a style="color:#333;" href="{$root}/{$current-page}/73959"><h2 class="red">north</h2></a>
		<a style="color:#333;" href="{$root}/{$current-page}/53018"><h2 class="green">south</h2></a>
		<a style="color:#333;" href="{$root}/{$current-page}/54101"><h2 class="blue">to kx</h2></a>
		<a style="color:#333;" href="{$root}/{$current-page}/77744"><h2 class="red">from kx</h2></a>
		<a style="color:#333;" href="{$root}/{$current-page}/51963"><h2 class="yellow">from tcr</h2></a>
	</div>
	
	<div class="span-4">
		<xsl:choose>
			<xsl:when test="$stop = 73959">
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/73959/48"><h2 class="red">48</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/73959/55"><h2 class="red">55</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/73959/106"><h2 class="red">106</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/73959/236"><h2 class="red">236</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/73959/254"><h2 class="red">254</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/73959/277"><h2 class="red">277</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/73959/d6"><h2 class="red">D6</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/73959/n55"><h2 class="red">N55</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/73959/n253"><h2 class="red">N253</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/73959"><h2 class="red">ALL</h2></a>
			</xsl:when>
			<xsl:when test="$stop = 53018">
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/53018/48"><h2 class="red">48</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/53018/55"><h2 class="red">55</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/53018/106"><h2 class="red">106</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/53018/236"><h2 class="red">236</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/53018/254"><h2 class="red">254</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/53018/277"><h2 class="red">277</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/53018/d6"><h2 class="red">D6</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/53018/n55"><h2 class="red">N55</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/53018/n253"><h2 class="red">N253</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/53018"><h2 class="red">ALL</h2></a>
			</xsl:when>
			<xsl:when test="$stop = 54101">
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/54101/38"><h2 class="red">38</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/54101/242"><h2 class="red">242</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/54101/277"><h2 class="red">277</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/54101/n38"><h2 class="red">N38</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/54101"><h2 class="red">ALL</h2></a>
			</xsl:when>
			<xsl:when test="$stop = 77744">
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/77744/19"><h2 class="red">19</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/77744/38"><h2 class="red">38</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/77744/153"><h2 class="red">153</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/77744/341"><h2 class="red">341</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/77744/n19"><h2 class="red">N19</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/77744/n38"><h2 class="red">N38</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/77744"><h2 class="red">ALL</h2></a>
			</xsl:when>
			<xsl:when test="$stop = 51963">
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/51963/19"><h2 class="red">19</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/51963/38"><h2 class="red">38</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/51963/55"><h2 class="red">55</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/51963/176"><h2 class="red">176</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/51963/n19"><h2 class="red">N19</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/51963/n35"><h2 class="red">N35</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/51963/n38"><h2 class="red">N38</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/51963/n41"><h2 class="red">N41</h2></a>
				<a class="span-2" style="color:#333;" href="{$root}/{$current-page}/51963/n55"><h2 class="red">N55</h2></a>
				<a class="span-2 last" style="color:#333;" href="{$root}/{$current-page}/51963"><h2 class="red">ALL</h2></a>
			</xsl:when>
			<xsl:otherwise>
				
			</xsl:otherwise>
		</xsl:choose>
	</div>
	
</xsl:template>

<xsl:template match="buses/bus">
	<li>
		<span class="busno" style="text-transform:uppercase;"><xsl:value-of select="."/></span>
		<xsl:text>  to </xsl:text>
		<xsl:value-of select="./@destination" />
		<xsl:text> &#8212; due at </xsl:text>
		<xsl:value-of select="./@time" />
	</li>
</xsl:template>

</xsl:stylesheet>