<?xml version='1.0' encoding='UTF-8'?>

<!-- SVN: $Id$ -->

<!--+ ==============================================================
    |
    | XSL STYLESHEET FILE
    |
    | Path:
    | $HeadURL$
    |
    | Filename:   		merge-regels.xsl
    | XSL version:      2.0
    | Description:		Samenvoegen van opeenvolgende regels tot blokken tekst, al dan niet met regelafbreking
    | Created by:		Geert Josten
    | Created at:		02-02-2010
    |
    | Last changed:		$LastChangedDate$
    | Last changed by:  $LastChangedBy$
    | Version:          $Rev$
    |
    | Copyright (c):    2010 Daidalos BV, The Netherlands, Bleiswijk
    |
    | ==============================================================
    |
    |
    | ==============================================================
    |
    | HISTORY:
    |
    | 2010-04-06 (GJ)
    | - Rejoin-on-hyphen feature, voor het samenvoegen van afgebroken woorden.
	|   Werkt overigens niet geheel feilloos. Koppelstreepjes worden als afbreek-
	|   streepjes herkend. Default true(), kan vanaf cmdline uitgeschakeld worden.
    | 2010-02-02 (GJ)
    | - Initial version, refactored out of c2aant.xsl for reuse
    |
    | ==============================================================
    +-->

<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

	xmlns:my="local-functions"

	exclude-result-prefixes="my"
>

<!--+==========================================================================
    | external parameters
    +-->

	<xsl:param name="rejoin-on-hyphen" select="true()"/>

<!--+==========================================================================
    | group merge-regels
    +-->

	<xsl:template match="node()" mode="merge-regels">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="node()" mode="merge-regels" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="regel" mode="merge-regels">
		<xsl:if test="not(preceding-sibling::*[1][self::regel])">
			<tekst>
				<xsl:apply-templates select="." mode="merge-regels-continue">
					<xsl:with-param name="next-no-break" select="true()"/>
				</xsl:apply-templates>
			</tekst>
		</xsl:if>
	</xsl:template>

<!--+==========================================================================
    | group merge-regels-continue
    +-->

	<xsl:template match="regel" mode="merge-regels-continue">
		<xsl:param name="next-no-break" select="false()"/>

		<xsl:variable name="last-child" select="child::node()[last()]"/>

		<xsl:if test="not($next-no-break)">
			<xsl:choose>
				<xsl:when test="$rejoin-on-hyphen">
					<!-- alleen spaties tussen regels als gerejoined wordt -->
					<xsl:text> </xsl:text>
				</xsl:when>

				<xsl:otherwise>
					<br/>
					<xsl:text>&#10;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="$rejoin-on-hyphen and $last-child/self::text() and ends-with($last-child, '-') and following-sibling::regel[1]">
				<xsl:apply-templates select="node() except $last-child" mode="merge-regels" />

				<xsl:value-of select="substring($last-child, 1, string-length($last-child) - 1)" />

				<xsl:apply-templates select="following-sibling::*[1][self::regel]" mode="merge-regels-continue">
					<xsl:with-param name="next-no-break" select="true()"/>
				</xsl:apply-templates>
			</xsl:when>

			<xsl:otherwise>
				<xsl:apply-templates select="node()" mode="merge-regels" />
				<xsl:apply-templates select="following-sibling::*[1][self::regel]" mode="merge-regels-continue" />
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

</xsl:stylesheet>
