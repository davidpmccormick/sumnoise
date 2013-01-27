<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exslt="http://exslt.org/common"
    xmlns:date="http://exslt.org/dates-and-times"
    exclude-result-prefixes="exslt date"
>

    <!--
        XSL Calender for Symphony, powered by some EXSLT functions
        Based on code from Neil Ang: http://neilang.com/entries/generating-a-calendar-using-xslt/

        Just call the template to show the calendar in the current month.

        Parameters:
            month               - the month to show
            year                - the year to show
            displayCaption      - display the caption (month name and (optional) navigation)
            displayNavigation   - display the navigation. Works only if displayCaption is true() (default)
            displayDays         - display the names of the days.
        
        To make it work in a real-life environment, override the 'calender-day'-template to fit your needs.
        For example:

        <xsl:template name="calendar-day">
            <xsl:param name="day" />
            <xsl:param name="month" />
            <xsl:param name="year" />
            <xsl:param name="date" />
            <xsl:choose>
                <xsl:when test="$month = 12 and $day = 25">
                    <a href="/christmas/">25</a>
                </xsl:when>
                <xsl:when test="/data/agenda/entry/date[. = $date]">
                    <xsl:variable name="entry" select="/data/agenda/entry[date = $date]" />
                    <a href="/agenda/{$entry/title/@handle}/" title="{$entry/title}">
                        <xsl:value-of select="$day"/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$day"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>

    -->

    <!-- Month names: -->
    <xsl:template name="GetMonthName">
        <xsl:param name="month" />
        <xsl:choose>
            <xsl:when test="$month = 1">January</xsl:when>
            <xsl:when test="$month = 2">February</xsl:when>
            <xsl:when test="$month = 3">May</xsl:when>
            <xsl:when test="$month = 4">April</xsl:when>
            <xsl:when test="$month = 5">March</xsl:when>
            <xsl:when test="$month = 6">June</xsl:when>
            <xsl:when test="$month = 7">July</xsl:when>
            <xsl:when test="$month = 8">August</xsl:when>
            <xsl:when test="$month = 9">September</xsl:when>
            <xsl:when test="$month = 10">October</xsl:when>
            <xsl:when test="$month = 11">November</xsl:when>
            <xsl:when test="$month = 12">December</xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- You can override this template to fit your needs: -->
    <xsl:template name="calendar-day">
        <xsl:param name="day" />
        <xsl:param name="month" />
        <xsl:param name="year" />
        <xsl:param name="date" />
        <xsl:value-of select="$day"/>
    </xsl:template>

    <xsl:param name="url-y" />
    <xsl:param name="url-m" />

    <xsl:template name="DaysInMonth">
        <xsl:param name="month" />
        <xsl:param name="year" />
        <xsl:choose>
            <xsl:when test="$month = 1 or $month = 3 or $month = 5 or $month = 7 or $month = 8 or $month = 10 or $month = 12">31</xsl:when>
            <xsl:when test="$month=2">
                <xsl:choose>
                    <xsl:when test="$year mod 4 = 0">29</xsl:when>
                    <xsl:otherwise>28</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>30</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="calendar">
        <xsl:param name="month" select="false()"/>
        <xsl:param name="year" select="false()"/>
        <xsl:param name="displayDays" select="true()" />
        <xsl:param name="displayCaption" select="true()" />
        <xsl:param name="displayNavigation" select="true()" />

        <!-- Set the displaydate, for default values: -->
        <xsl:variable name="DisplayDate" select="date:date()"/>

        <!-- Set the year: -->
        <xsl:variable name="Year">
            <xsl:choose>
                <xsl:when test="$url-y != ''">
                    <xsl:value-of select="$url-y" />
                </xsl:when>
                <xsl:when test="$year">
                    <xsl:value-of select="$year"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="date:year($DisplayDate)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Set the month: -->
        <xsl:variable name="Month">
            <xsl:choose>
                <xsl:when test="$url-m != ''">
                    <xsl:value-of select="$url-m" />
                </xsl:when>
                <xsl:when test="$month">
                    <xsl:value-of select="$month"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="date:month-in-year($DisplayDate)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Get the month name: -->
        <xsl:variable name="MonthName">
            <xsl:call-template name="GetMonthName">
                <xsl:with-param name="month" select="$Month" />
            </xsl:call-template>
        </xsl:variable>

        <!-- Set the number of days in a month: -->
        <xsl:variable name="NumberOfDaysInMonth">
            <xsl:call-template name="DaysInMonth">
                <xsl:with-param name="month" select="$Month"/>
                <xsl:with-param name="year" select="$Year"/>
            </xsl:call-template>
        </xsl:variable>

        <!-- Set the first day in the week: -->
        <xsl:variable name="FirstDayInWeekForMonth">
            <xsl:choose>
                <xsl:when test="$Month &lt; 10">
                    <xsl:value-of select="date:day-in-week(date:date(concat($Year,'-0', $Month, '-01')))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="date:day-in-week(date:date(concat($Year,'-', $Month, '-01')))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Set the number of weeks in this month: -->
        <xsl:variable name="WeeksInMonth">
            <xsl:value-of select="($NumberOfDaysInMonth + $FirstDayInWeekForMonth - 1) div 7"/>
        </xsl:variable>

        <table summary="Monthly calendar">
            <xsl:if test="$displayCaption">
                <caption>
                    <xsl:variable name="prev-month">
                        <xsl:choose>
                            <xsl:when test="$Month = 1">12</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Month - 1" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="prev-year">
                        <xsl:choose>
                            <xsl:when test="$Month = 1">
                                <xsl:value-of select="$Year - 1" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Year" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="next-month">
                        <xsl:choose>
                            <xsl:when test="$Month = 12">1</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Month + 1" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="next-year">
                        <xsl:choose>
                            <xsl:when test="$Month = 12">
                                <xsl:value-of select="$Year + 1" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$Year" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:if test="$displayNavigation">
                        <a href="?y={$prev-year}&amp;m={$prev-month}" class="prev">«</a>
                    </xsl:if>
                    <xsl:value-of select="concat($MonthName, ' ', $Year)" />
                    <xsl:if test="$displayNavigation">
                        <a href="?y={$next-year}&amp;m={$next-month}" class="next">»</a>
                    </xsl:if>
                </caption>
            </xsl:if>
            <xsl:if test="$displayDays">
                <tr>
                    <th abbr="Sunday">Sun</th>
                    <th abbr="Monday">Mon</th>
                    <th abbr="Tuesday">Tue</th>
                    <th abbr="Wednesday">Wed</th>
                    <th abbr="Thursday">Thu</th>
                    <th abbr="Friday">Fri</th>
                    <th abbr="Saturday">Sat</th>
                </tr>
            </xsl:if>
            <xsl:call-template name="CalendarWeek">
                <xsl:with-param name="WeeksInMonth" select="$WeeksInMonth"/>
                <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                <xsl:with-param name="year" select="$Year" />
                <xsl:with-param name="month" select="$Month" />
            </xsl:call-template>
        </table>
    </xsl:template>

    <xsl:template name="CalendarWeek">
        <xsl:param name="WeeksInMonth"/>
        <xsl:param name="FirstDayInWeekForMonth"/>
        <xsl:param name="NumberOfDaysInMonth" />
        <xsl:param name="year" />
        <xsl:param name="month" />

        <xsl:param name="week">1</xsl:param>
        <xsl:param name="day">1</xsl:param>
        <tr>
            <xsl:call-template name="CalendarDay">
                <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                <xsl:with-param name="day" select="$day"/>
                <xsl:with-param name="year" select="$year" />
                <xsl:with-param name="month" select="$month" />
            </xsl:call-template>
        </tr>
        <xsl:if test="$WeeksInMonth &gt; $week">
            <xsl:call-template name="CalendarWeek">
                <xsl:with-param name="WeeksInMonth" select="$WeeksInMonth"/>
                <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                <xsl:with-param name="year" select="$year" />
                <xsl:with-param name="month" select="$month" />
                <xsl:with-param name="week" select="$week + 1"/>
                <xsl:with-param name="day" select="$week * 7 - ($FirstDayInWeekForMonth - 2)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="CalendarDay">
        <xsl:param name="FirstDayInWeekForMonth" />
        <xsl:param name="NumberOfDaysInMonth" />
        <xsl:param name="count">1</xsl:param>
        <xsl:param name="day"/>
        <xsl:param name="year" />
        <xsl:param name="month" />
        <xsl:choose>
            <xsl:when test="($day = 1 and $count != $FirstDayInWeekForMonth) or $day &gt; $NumberOfDaysInMonth">
                <td class="empty">
                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                </td>
                <xsl:if test="$count &lt; 7">
                    <xsl:call-template name="CalendarDay">
                        <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                        <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                        <xsl:with-param name="year" select="$year" />
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="count" select="$count + 1"/>
                        <xsl:with-param name="day" select="$day"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:variable name="date-day">
                        <xsl:choose>
                            <xsl:when test="$day &lt; 10">
                                <xsl:value-of select="concat('0', $day)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$day" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="date-month">
                        <xsl:choose>
                            <xsl:when test="$month &lt; 10">
                                <xsl:value-of select="concat('0', $month)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$month" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="date" select="concat($year, '-', $date-month, '-', $date-day)" />
                    <xsl:if test="$date = $today">
                        <xsl:attribute name="id">calendar-today</xsl:attribute>
                    </xsl:if>
                    <xsl:call-template name="calendar-day">
                        <xsl:with-param name="day" select="$day" />
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="year" select="$year" />
                        <xsl:with-param name="date" select="$date" />
                    </xsl:call-template>
                </td>
                <xsl:if test="$count &lt; 7">
                    <xsl:call-template name="CalendarDay">
                        <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                        <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                        <xsl:with-param name="year" select="$year" />
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="count" select="$count + 1"/>
                        <xsl:with-param name="day" select="$day + 1"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>