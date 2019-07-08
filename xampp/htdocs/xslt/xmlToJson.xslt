<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<!-- generate the outer brackets and start the conversion inside them starting with the root -->
<xsl:template match="/">{
    <xsl:apply-templates select="*"/>}
</xsl:template>

<!-- Object or Element Property-->
<xsl:template match="*">
	<!-- set root tag -->
    "<xsl:value-of select="name()"/>" :<xsl:call-template name="Properties">
		<!-- define as a root tag -->
        <xsl:with-param name="parent" select="'Yes'"> </xsl:with-param>
    </xsl:call-template>
</xsl:template>

<!-- Array Element -->
<xsl:template match="*" mode="ArrayElement">
	<!-- use the "Properties" template on every ArrayElement -->
    <xsl:call-template name="Properties"/>
</xsl:template>

<!-- Object Properties -->
<xsl:template name="Properties">
    <xsl:param name="parent">
	</xsl:param>
    <xsl:variable name="childName" select="name(*[1])"/>
    <xsl:choose>            
		<!-- if it is not a tag or atribute node -->
        <xsl:when test="not(*|@*)">
			<xsl:choose>
				<!-- if it follows the parent aka root -->
				<xsl:when test="$parent='Yes'"> 
					<!-- put content (this element) in quotes -->
					<xsl:text>&quot;</xsl:text>
					<xsl:value-of select="."/>
					<xsl:text>&quot;</xsl:text>
				</xsl:when>
				
				<!-- if it is no parent put it into the json with "name":"value" -->
                <xsl:otherwise>
					"<xsl:value-of select="name()"/>"
					:
					"<xsl:value-of  select="."/>"
				</xsl:otherwise>
            </xsl:choose> 
        </xsl:when>   
		
		<!-- when it has more then one child put it in an array in the format "name":[/* information in the array */] -->
        <xsl:when test="count(*[name()=$childName]) > 1">{
			"<xsl:value-of  select="$childName"/>" 
			:[
				<xsl:apply-templates select="*" mode="ArrayElement"/>
			] 
		}</xsl:when>
		
		<!-- if it is a tag or an attribute node apply the template on them-->
        <xsl:otherwise>{
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="*"/>
        }</xsl:otherwise>
		
    </xsl:choose>
	<!-- if has sibling separate them with , -->
    <xsl:if test="following-sibling::*">
	,
	</xsl:if>
</xsl:template>

<!-- Attribute Property -->
<xsl:template match="@*">
	"<xsl:value-of select="name()"/>"
	: 
	"<xsl:value-of select="."/>",
</xsl:template>
</xsl:stylesheet>