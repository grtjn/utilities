<?xml version='1.0' encoding='UTF-8'?>

<!-- SVN: $Id$ -->

<!--+ ==============================================================
    |
    | XSL STYLESHEET FILE
    |
    | Path:
    | $HeadURL$
    |
    | Filename:   		handle-blocks.xsl
    | XSL version:      2.0
    | Description:
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
    | group handle-blocks
    +-->

	<xsl:template match="node()" mode="handle-blocks">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="node()" mode="handle-blocks" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="block" mode="handle-blocks">
		<xsl:choose>
			<xsl:when test="count(*/bullet) = 1">

				<lijst-item type="{string(*/bullet)}">
					<xsl:apply-templates select="*" mode="handle-blocks" />
				</lijst-item>

			</xsl:when>
			<xsl:when test="*/bullet">

				<xsl:message>
					Multiple bullets in same block, should not occur!
				</xsl:message>

			</xsl:when>
			<xsl:otherwise>

				<xsl:apply-templates select="*" mode="handle-blocks" />

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="line" mode="handle-blocks">
		<regel>
			<xsl:apply-templates select="*" mode="handle-blocks" />
		</regel>
	</xsl:template>

	<xsl:template match="bullet" mode="handle-blocks" />

	<xsl:template match="text" mode="handle-blocks">
		<xsl:apply-templates select="node()" mode="handle-blocks" />
		<xsl:if test="following-sibling::*">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
