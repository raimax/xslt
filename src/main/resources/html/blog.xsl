<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<html>

		<head>
			<link rel="preconnect" href="https://fonts.googleapis.com" />
			<link rel="preconnect" href="https://fonts.gstatic.com" />
			<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;0,900;1,400" rel="stylesheet" />
			<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700" rel="stylesheet" />
			<link rel="stylesheet" href="styles/style.css" />
		</head>

		<body>
			<div class="page_container">
				<xsl:for-each select="blog/posts/post">
					<div class="post_card">
						<img class="post_card_image" alt="post_image">
						<xsl:attribute name="src">
							<xsl:value-of select="image" />
						</xsl:attribute>
						</img>
						<div class="post_card_content">
							<a class="post_card_content_category">
								<xsl:value-of select="category" />
							</a>
							<h2 class="post_card_content_title">
								<xsl:value-of select="title" />
							</h2>
							<p class="post_card_content_summary">
								<xsl:value-of select="summary" />
							</p>
							<div class="post_card_content_button">
								<a class="button primary ">CONTINUE READING</a>
							</div>
							<hr />
							<div class="post_card_content_bottom">
								By
								<xsl:value-of select="author/username" />
								on
								<xsl:value-of select="createdAt" />
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</body>

		</html>
	</xsl:template>
</xsl:stylesheet>