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
			<script src="scripts/main.js"></script>
		</head>

		<body>

			<div class="page_container">
				<xsl:for-each select="blog/posts/post">
					<div id="modal{@id}" class="modal hide">
						<div class="modal_content">
							<img class="post_card_image" src="{image}" alt="post_image" />
							<h2 class="modal_content_title">
								<xsl:value-of select="title" />
							</h2>
							<p>
								<xsl:value-of select="content" />
							</p>
							<div class="modal_content_comments">
								<span class="title">comments</span>
								<hr />
								<xsl:for-each select="comments/comment">
									<div class="comment">
										<div class="comment_header">
											<span><xsl:value-of select="author/username" /> says:</span>
											<span><xsl:value-of select="createdAt" /></span>
										</div>
										<p>
											<xsl:value-of select="content" />
										</p>
									</div>
								</xsl:for-each>
							</div>
						</div>
						<img class="modal_close"  src="images/close.png" alt="close" data-close-id="{@id}" />
					</div>
					<div class="post_card">
						<img class="post_card_image" src="{image}" alt="post_image" />
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
							<div class="post_card_content_button" data-id="{@id}">
								<a class="button primary">CONTINUE READING</a>
							</div>
							<hr />
							<div class="post_card_content_bottom">
								<div>
									By
									<xsl:value-of select="author/username" />
									on
									<xsl:value-of select="createdAt" />
								</div>
								<div>
									views:
									<xsl:value-of select="views" />
								</div>
							</div>
						</div>
					</div>
				</xsl:for-each>
			</div>
		</body>

		</html>
	</xsl:template>
</xsl:stylesheet>