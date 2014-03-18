<?xml version='1.0' encoding='UTF-8'?>

<!--+==========================================================================
    |
    | This stylesheet takes the output of pdf2html with the -xml
    | flag (rather primitive output), and enhances it to facilitate
    | content enrichment.
    |
    | The supported enhancements mainly include:
    | - separation of fontspecs
    | - separation of header/footer texts from body
    | - grouping of text runs into lines
    | - grouping of lines into blocks on basis of indentation
    | - basic enrichment of text bullet patterns
    |
    | This stylesheet takes two parameters:
    | - header-height
    | - footer-height
    |
    +-->

<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

	xmlns:my="local-functions"

	exclude-result-prefixes="my"
>

<!--+==========================================================================
    | parameters
    +-->

	<xsl:param name="header-footer-by-string" select="'false'" />
	<xsl:param name="header-string" select="'c/2'" />
	<xsl:param name="footer-string" select="'c/2'" />
	<xsl:param name="header-height" select="200" />
	<xsl:param name="footer-height" select="200" />

<!--+==========================================================================
    | output specification
    +-->

	<xsl:output indent="yes" />

	<xsl:strip-space elements="*" />

<!--+==========================================================================
    | main template
    +-->

	<xsl:template match="pdf2xml">
		<xsl:variable name="pages-with-zones">
			<xsl:apply-templates select="." mode="detect-zones"/>
		</xsl:variable>
		
		<xsl:variable name="pages-with-enriched-text">
			<xsl:apply-templates select="$pages-with-zones" mode="enrich-text"/>
		</xsl:variable>

		<xsl:variable name="pages-with-lines">
			<xsl:apply-templates select="$pages-with-enriched-text" mode="detect-lines"/>
		</xsl:variable>

		<xsl:variable name="flattened-pages">
			<xsl:apply-templates select="$pages-with-lines" mode="flatten-pages"/>
		</xsl:variable>

		<xsl:variable name="pages-with-blocks">
			<xsl:apply-templates select="$flattened-pages" mode="detect-blocks"/>
		</xsl:variable>

		<!--
		<xsl:result-document href="debug.xml">
			<xsl:copy-of select="$pages-with-lines"/>
		</xsl:result-document>
		-->
		
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:copy-of select="$pages-with-blocks/page" />
		</xsl:copy>
	</xsl:template>

<!--+==========================================================================
    | group detect-zones
    +-->

	<xsl:template match="node()" mode="detect-zones">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:apply-templates select="node()" mode="detect-zones" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="page" mode="detect-zones">
		<xsl:variable name="page-height" select="number(@height)" />

		<xsl:variable name="header-texts" as="element()*">
			<xsl:choose>
				<xsl:when test="$header-footer-by-string = 'true'">
					<xsl:sequence select="text[contains(lower-case(.), $header-string)][1]/(self::*, following-sibling::text)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:sequence select="text[number($header-height) > (number(@top) + number(@height))]" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="footer-texts" as="element()*">
			<xsl:choose>
				<xsl:when test="$header-footer-by-string = 'true'">
					<xsl:sequence select="text[contains(lower-case(.), $footer-string)][1]/(self::*, following-sibling::text)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:sequence select="text[number(@top) > ($page-height - number($footer-height))]" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="body-texts" select="(text except $header-texts) except $footer-texts" />

		<xsl:variable name="header" as="element()">
			<header/>
		</xsl:variable>
		<xsl:variable name="body" as="element()">
			<body/>
		</xsl:variable>
		<xsl:variable name="footer" as="element()">
			<footer/>
		</xsl:variable>

		<xsl:copy>
			<xsl:copy-of select="@*" />

			<fonts>
				<xsl:copy-of select="* except text" />
			</fonts>

			<xsl:copy-of select="my:insert-text-block($header, $header-texts)" />

			<xsl:copy-of select="my:insert-text-block($body, $body-texts)" />

			<xsl:copy-of select="my:insert-text-block($footer, $footer-texts)" />
		</xsl:copy>
	</xsl:template>

<!--+==========================================================================
    | group flatten-pages
    +-->

	<xsl:template match="node()" mode="flatten-pages">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:apply-templates select="node()" mode="flatten-pages" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="pdf2xml" mode="flatten-pages">
		<xsl:variable name="pages" select="page[not(body/@top = '')]"/>
		<xsl:variable name="first-page" select="$pages[1]"/>
		<xsl:variable name="last-page" select="$pages[position() = last()]"/>
		
		<page number="1" position="absolute" top="{$first-page/@top}" left="{$first-page/@left}" height="{sum($pages/@height)}" width="{max($pages/@width)}">
			<fonts>
				<xsl:copy-of select="$pages/fonts/*" />
			</fonts>
			
			<!--
			<xsl:message><xsl:value-of select="sum(($pages except $last-page)/@height)"/> - <xsl:value-of select="$first-page/body/@top"/> + <xsl:value-of select="$last-page/body/@height"/> XX <xsl:value-of select="max($pages/body/@width)"/></xsl:message>
			-->
			<body top="{$first-page/body/@top}" left="{$first-page/body/@left}" height="{sum(($pages except $last-page)/@height) - $first-page/body/@top + $last-page/body/@height}" width="{max($pages/body/@width)}">
			
				<xsl:for-each select="$pages/body">
					<xsl:variable name="page-top" select="sum(parent::page/preceding-sibling::page[not(body/@top = '')]/@height)"/>
					<xsl:variable name="body-left-add" select="$first-page/body/@left - parent::page/body/@left"/>
					
					<xsl:for-each select="line">
						<xsl:copy>
							<xsl:copy-of select="@* except (@top, @left)" />
							<xsl:attribute name="top" select="@top + $page-top"/>
							<xsl:attribute name="left" select="@left + $body-left-add"/>

							<xsl:apply-templates select="node()" mode="flatten-pages">
								<xsl:with-param name="page-top" select="$page-top" tunnel="yes" />
								<xsl:with-param name="body-left-add" select="$body-left-add" tunnel="yes" />
							</xsl:apply-templates>
						</xsl:copy>
					</xsl:for-each>
					
				</xsl:for-each>
				
			</body>
		</page>
	</xsl:template>

	<xsl:template match="text" mode="flatten-pages">
		<xsl:param name="page-top" tunnel="yes"/>
		<xsl:param name="body-left-add" tunnel="yes" />
		
		<xsl:copy>
			<xsl:copy-of select="@* except (@top, @left)" />
			<xsl:attribute name="top" select="@top + $page-top"/>
			<xsl:attribute name="left" select="@left + $body-left-add"/>

			<xsl:copy-of select="node()"/>
		</xsl:copy>
	</xsl:template>

<!--+==========================================================================
    | group enrich-text
    +-->

	<xsl:template match="node()" mode="enrich-text">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:apply-templates select="node()" mode="enrich-text" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="text" mode="enrich-text">
		<xsl:choose>
			<xsl:when test="matches(normalize-space(.), '^–$')">
				<bullet>
					<xsl:copy-of select="@*" />

					<xsl:apply-templates select="." mode="fix-positions" />

					<xsl:apply-templates select="node()" mode="enrich-text" />
				</bullet>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:copy-of select="@*" />

					<xsl:apply-templates select="." mode="fix-positions" />

					<xsl:apply-templates select="node()" mode="enrich-text" />
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<!--+==========================================================================
    | group fix-positions
    +-->

	<xsl:template match="text" mode="fix-positions">
		<xsl:variable name="max-prev-top" select="max(preceding-sibling::text/@top/number(.))" />

		<xsl:if test="$max-prev-top > number(@top)">
			<xsl:attribute name="top">
				<xsl:value-of select="$max-prev-top" />
			</xsl:attribute>
		</xsl:if>
	</xsl:template>

<!--+==========================================================================
    | group detect-lines
    +-->

	<xsl:template match="node()" mode="detect-lines">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:apply-templates select="node()" mode="detect-lines" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="header|body|footer" mode="detect-lines">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:for-each-group select="*" group-by="@top">
				<xsl:variable name="line" as="element(line)">
					<line number="{position()}"/>
				</xsl:variable>

				<xsl:copy-of select="my:insert-text-block($line, current-group())"/>
			</xsl:for-each-group>
		</xsl:copy>
	</xsl:template>

<!--+==========================================================================
    | group detect-blocks
    +-->

	<xsl:template match="node()" mode="detect-blocks">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:apply-templates select="node()" mode="detect-blocks" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="header|body|footer" mode="detect-blocks">
		<xsl:copy>
			<xsl:copy-of select="@*" />

			<xsl:copy-of select="my:detect-blocks(line)"/>
		</xsl:copy>
	</xsl:template>

<!--+==========================================================================
    | function my:detect-blocks
    +-->

	<xsl:function name="my:detect-blocks">
		<xsl:param name="current-group" as="element()*"/>

		<xsl:variable name="min-left" select="min($current-group/@left/number(.)) + 10" />
		<xsl:variable name="max-left" select="max($current-group/@left/number(.))" />

		<xsl:variable name="block-element" as="element()">
			<block />
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$max-left > $min-left">

				<xsl:for-each-group select="$current-group" group-starting-with="*[($min-left > number(@left))]">

					<xsl:variable name="block-contents" as="element()*">
						<xsl:copy-of select="current-group()[position() = 1]"/>
						<xsl:if test="count(current-group()) > 1">
							<xsl:copy-of select="my:detect-blocks(current-group()[position() > 1])"/>
						</xsl:if>
					</xsl:variable>

					<xsl:copy-of select="my:insert-text-block($block-element, $block-contents)"/>

				</xsl:for-each-group>

			</xsl:when>
			<xsl:when test="$current-group/bullet">

				<!-- bottom level, single out lines containing bullets for convenience
					 in future processing -->
				<xsl:for-each-group select="$current-group" group-adjacent="boolean(bullet)">

					<xsl:choose>
						<xsl:when test="bullet">
							<!-- put each bullet line in a separate block -->
							<xsl:for-each select="current-group()">
								<xsl:copy-of select="my:insert-text-block($block-element, .)"/>
							</xsl:for-each>
						</xsl:when>

						<xsl:otherwise>
							<xsl:copy-of select="my:insert-text-block($block-element, current-group())"/>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:for-each-group>

			</xsl:when>
			<xsl:otherwise>

				<xsl:copy-of select="my:insert-text-block($block-element, $current-group)"/>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

<!--+==========================================================================
    | function my:insert-text-block
    +-->

	<xsl:function name="my:insert-text-block" as="element()">
		<xsl:param name="block-element" as="element()"/>
		<xsl:param name="block-contents" as="element()*"/>

		<xsl:variable name="min-top" select="min($block-contents/@top/number(.))" />
		<xsl:variable name="max-top" select="max($block-contents/@top/number(.))" />
		<xsl:variable name="min-left" select="min($block-contents/@left/number(.))" />
		<xsl:variable name="max-left" select="max($block-contents/@left/number(.))" />
		<xsl:variable name="total-width" select="$max-left - $min-left + max($block-contents[number(@left) = $max-left]/@width/number(.))" />
		<xsl:variable name="total-height" select="$max-top - $min-top + max($block-contents[number(@top) = $max-top]/@height/number(.))" />

		<xsl:element name="{name($block-element)}">
			<xsl:copy-of select="$block-element/@*" />

			<xsl:attribute name="top"><xsl:value-of select="$min-top"/></xsl:attribute>
			<xsl:attribute name="left"><xsl:value-of select="$min-left"/></xsl:attribute>
			<xsl:attribute name="width"><xsl:value-of select="$total-width"/></xsl:attribute>
			<xsl:attribute name="height"><xsl:value-of select="$total-height"/></xsl:attribute>

			<xsl:copy-of select="$block-contents" />
		</xsl:element>
	</xsl:function>

</xsl:stylesheet>
