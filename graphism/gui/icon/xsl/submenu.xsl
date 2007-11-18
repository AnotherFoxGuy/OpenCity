<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"&gt;
&lt;?xml-stylesheet type="text/css" href="../css/default.css" ?&gt;
&lt;?xml-stylesheet type="text/css" title="Menu" href="../css/menu.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="MenuOver" href="../css/menu_over.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="MenuDisable" href="../css/menu_disable.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="MenuActivate" href="../css/menu_activate.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="Splash" href="../css/splash.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="Bar" href="../css/bar.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="BarOver" href="../css/bar_over.css" alternate="yes" ?&gt;
&lt;?xml-stylesheet type="text/css" title="Cursor" href="../css/cursor.css" alternate="yes" ?&gt;
</xsl:text>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="use" name="background">
		<xsl:copy>
	  		<xsl:copy-of select="@*"/>
	  		<xsl:attribute name="xlink:href">../css/backgroundBox.svg#submenu</xsl:attribute>
    	</xsl:copy>
  	</xsl:template>

	<xsl:template match="*|@*|text()">
		<xsl:copy>
			<xsl:apply-templates select="*|@*|text()"/>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
