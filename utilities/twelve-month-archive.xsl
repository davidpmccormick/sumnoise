<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="months"> <!-- display a list of linked month numbers (from 12 to 00) counting back from current month for archive pages -->
	<xsl:param name="thismonth" select="$this-month"/> <!-- month number -->
	<xsl:param name="countmonths">
		<xsl:choose>
		    <xsl:when test="concat($this-year,$this-month) &lt; 201304"> <!-- date smaller than 201304  -->
		    	<xsl:choose>
		    		<xsl:when test="$this-month - 3 &gt; 0"> <!-- start list in April 2012 (when the blog started) -->
		    			<xsl:value-of select="$this-month - 3"/> <!-- up till December 2012, remove 3 to get the right number -->
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:value-of select="$this-month + 9"/> <!-- Janury-March 2013, add 9 to get the right number -->
		    		</xsl:otherwise>
		    	</xsl:choose>
		    </xsl:when>
		    <xsl:otherwise>
		    	<xsl:value-of select="12"/> <!--  April 2013 onwards, show 12 previous months -->
		    </xsl:otherwise>
		</xsl:choose>
	</xsl:param> <!-- months in a year -->
	<xsl:if test="$countmonths &gt; 0">
		<xsl:choose>
			<xsl:when test="$thismonth &gt; 0"> <!-- if it's bigger than 0 -->
				<xsl:choose>
					<xsl:when test="string-length($thismonth) = 1"> <!-- if there's no preceding zero -->
						<a href="{$root}/blog/archive/{$this-year}-0{$thismonth}">
							<xsl:if test="$thismonth = concat('0',substring-after($year,'-'))">
								<xsl:attribute name="class">currentmonth</xsl:attribute>
							</xsl:if>
							<li class="month-0{$thismonth}">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date"><xsl:value-of select="$this-year"/>-0<xsl:value-of select="$thismonth"/>-01</xsl:with-param> <!-- add '01' to the end (the 'day') to allow the format-date function to parse it -->
									<xsl:with-param name="format" select="'M'"/>
								</xsl:call-template>
							</li>
						</a> <!-- prepend a zero -->
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/blog/archive/{$this-year}-{$thismonth}">
							<xsl:if test="$thismonth = substring-after($year,'-')">
								<xsl:attribute name="class">currentmonth</xsl:attribute>
							</xsl:if>
							<li class="month-{$thismonth}">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date"><xsl:value-of select="$this-year"/>-<xsl:value-of select="$thismonth"/>-01</xsl:with-param>
									<xsl:with-param name="format" select="'M'"/>
								</xsl:call-template>
							</li>
						</a>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise> <!-- if it's smaller than 0 -->
				<xsl:choose>
					<xsl:when test="string-length($thismonth + 12) = 1"> <!-- if there's no preceding zero -->
						<a href="{$root}/blog/archive/{$this-year - 1}-0{$thismonth + 12}">
							<xsl:if test="$thismonth + 12 = concat('0',substring-after($year,'-'))">
								<xsl:attribute name="class">currentmonth</xsl:attribute>
							</xsl:if>
							<li class="month-0{$thismonth + 12}">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date"><xsl:value-of select="$this-year - 1"/>-0<xsl:value-of select="$thismonth + 12"/>-01</xsl:with-param>
									<xsl:with-param name="format" select="'M'"/>
								</xsl:call-template>
							</li> <!-- prepend a zero and add 12 -->
						</a>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/blog/archive/{$this-year - 1}-{$thismonth + 12}">
							<xsl:if test="$thismonth + 12 = substring-after($year,'-')">
								<xsl:attribute name="class">currentmonth</xsl:attribute>
							</xsl:if>
							<li class="month-{$thismonth + 12}">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date"><xsl:value-of select="$this-year - 1"/>-<xsl:value-of select="$thismonth + 12"/>-01</xsl:with-param>
									<xsl:with-param name="format" select="'M'"/>
								</xsl:call-template>
							</li>
						</a>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="months">
			<xsl:with-param name="thismonth" select="$thismonth - 1"/>
			<xsl:with-param name="countmonths" select="$countmonths - 1"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>