<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no" />
	<xsl:template match="/">
		<fo:root language="EN">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-height="297mm" page-width="210mm">
					<fo:region-body region-name="xsl-region-body" />
					<!-- <fo:region-after background-color="#f4f4f4" extent="297mm" /> -->
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block background-color="#f4f4f4" page-break-before="always">

						<xsl:for-each select="blog/posts/post">
							<fo:block background-color="#fff" margin-top="5mm" margin-bottom="3mm" margin-left="20mm" margin-right="20mm">
								<!-- post image -->
								<fo:block text-align="center">
									<fo:external-graphic src="url('{image}')" width="100%" content-height="100%" content-width="scale-to-fit" scaling="uniform" />
								</fo:block>
								<!-- post body -->
								<fo:block margin-left="5mm" margin-right="5mm">
									<fo:block color="#a7573b" text-transform="uppercase" text-align="center" font-size="10pt" margin-top="5mm">
										<xsl:value-of select="category" />
									</fo:block>
									<fo:block color="#044264" text-transform="uppercase" text-align="center" font-family="monospace" font-size="24pt" margin-top="8mm" margin-bottom="8mm">
										<xsl:value-of select="title" />
									</fo:block>
									<fo:block margin-bottom="10mm">
										<xsl:value-of select="content" />
									</fo:block>
									<!-- post comments -->
									<fo:block>
									Comments
									</fo:block>
									<fo:leader leader-pattern="rule" leader-length="100%" rule-style="solid" rule-thickness="1pt" />
									<xsl:for-each select="comments/comment">
										<fo:block margin-bottom="4mm" border-style="solid" border-width="0.3mm">
											<fo:block color="#444" margin-left="1mm" margin-right="1mm" margin-bottom="1mm" margin-top="1mm">
												<xsl:value-of select="author/username" />
												says:
											</fo:block>
											<fo:block margin-left="1mm" margin-right="1mm" margin-bottom="1mm">
												<xsl:value-of select="content" />
											</fo:block>
										</fo:block>
									</xsl:for-each>
								</fo:block>
							</fo:block>
						</xsl:for-each>

					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>