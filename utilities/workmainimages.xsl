<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="workmainimages/entry">
	<img src="{$root}/image/2/630/330/1/images/{image/filename}" alt="{description}"/><!-- JIT image manipulation -->	
</xsl:template>

</xsl:stylesheet>