<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"&gt;
&lt;?xml-stylesheet type="text/css" title="Cursor" href="../css/cursor.css" ?&gt;
</xsl:text>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="use" name="background">
		<xsl:copy>
	  		<xsl:copy-of select="@*"/>
	  		<xsl:attribute name="xlink:href">../css/backgroundBox.svg#cursor</xsl:attribute>
    	</xsl:copy>
  	</xsl:template>

	<xsl:template match="*|@*|text()">
		<xsl:copy>
			<xsl:apply-templates select="*|@*|text()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
