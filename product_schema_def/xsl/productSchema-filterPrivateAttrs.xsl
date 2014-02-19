<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns="http://wadl.dev.java.net/2009/02"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:sch="http://docs.rackspace.com/core/usage/schema"
    xmlns:rax="http://docs.rackspace.com/api"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:xslout="http://www.rackspace.com/repose/wadl/checker/Transform"
    exclude-result-prefixes="sch c rax xs"
    version="2.0">

    <xsl:namespace-alias stylesheet-prefix="xslout" result-prefix="xsl"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:variable name="NS_PREFIX" select="'w_ns'"/>
    
    <xsl:template match="c:directory">
        <xsl:variable name="productSchemas" as="node()" select="sch:getSchemas(.)"/>
        <xsl:comment>
            <xsl:text>&#x0a;    THIS XSLT IS AUTOGENERATED DO NOT EDIT</xsl:text>
            <xsl:text>&#x0a;    GENERATED ON: </xsl:text><xsl:value-of select="current-dateTime()"/>
            <xsl:text>&#x0a;</xsl:text>
        </xsl:comment>
        <xsl:text>&#x0a;</xsl:text>

        <xslout:stylesheet
            xmlns:event="http://docs.rackspace.com/core/event"
            xmlns:atom="http://www.w3.org/2005/Atom"
            xmlns:httpx="http://openrepose.org/repose/httpx/v1.0"
            version="2.0">
            
            <xslout:output method="xml" indent="yes" encoding="UTF-8"/>
            
            <xslout:param name="input-headers-uri"/>
            <xslout:variable name="headerDoc" select="doc($input-headers-uri)"/>
                      
            <xslout:template match="@*|node()">
                <xslout:copy>
                    <xslout:apply-templates select="@*|node()"/>
                </xslout:copy>
            </xslout:template>
            
            <xsl:for-each-group select="$productSchemas//sch:productSchema" group-by="@serviceCode">
                <xsl:call-template name="sch:filter_private_attrs">
                    <xsl:with-param name="schemas" select="current-group()"/>
                </xsl:call-template>
            </xsl:for-each-group>
        </xslout:stylesheet>

    </xsl:template>

    <xsl:template name="sch:filter_private_attrs">
        <xsl:param name="schemas" as="node()*"/>
        <xsl:if test="$schemas//sch:attribute[@private='true']">
            <xsl:text>&#x0a;&#x0a;    </xsl:text>
            <xsl:comment>
                <xsl:text>For product: </xsl:text><xsl:value-of select="@serviceCode"/><xsl:text> </xsl:text>
            </xsl:comment>
            <xsl:text>&#x0a;    </xsl:text>
            <xsl:apply-templates select="$schemas" mode="filter_private_attrs_mode"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="sch:productSchema[sch:attribute/@private | sch:attributeGroup/sch:attribute/@private]"
                  mode="filter_private_attrs_mode">
        <xsl:variable name="namespace" as="xs:anyURI" select="@namespace"/>
        <xsl:variable name="version" as="xs:string" select="@version"/>
        <xsl:variable name="private_attrs">
            <xsl:for-each select="./sch:attribute[@private = 'true']/@name"> 
                <xsl:if test="not(position() = 1)">, </xsl:if>
                <xsl:text>'</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>'</xsl:text>
            </xsl:for-each>
        </xsl:variable>

        <xslout:template match="pf:product[@version='{$version}']/@*[some $x in ({$private_attrs}) satisfies $x eq local-name(.)]">
            <xsl:namespace name="pf" select="$namespace"/>
            <xslout:if test="exists($headerDoc//httpx:request/httpx:header[@name = 'x-roles' and @value = 'cloudfeeds:service-admin'])">
                <xslout:copy-of select="."/>
            </xslout:if>
        </xslout:template>

        <xsl:for-each select="sch:attributeGroup[sch:attribute/@private]">
            <xsl:variable name="private_attr_group_attrs">
                <xsl:for-each select="current()/sch:attribute[@private = 'true']/@name"> 
                    <xsl:if test="not(position() = 1)">, </xsl:if>
                    <xsl:text>'</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>'</xsl:text>
                </xsl:for-each>
            </xsl:variable>
            <xslout:template match="pf:product[@version='{$version}']/pf:{@name}/@*[some $x in ({$private_attr_group_attrs}) satisfies $x eq local-name(.)]">
                <xsl:namespace name="pf" select="$namespace"/>
                <xslout:if test="exists($headerDoc//httpx:request/httpx:header[@name = 'x-roles' and @value = 'cloudfeeds:service-admin'])">
                    <xslout:copy-of select="."/>
                </xslout:if>
            </xslout:template>
            
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="copy" priority="2">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="copy"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()" mode="#all"/>
    <xsl:function name="sch:ns" as="xs:string">
        <xsl:param name="pos" as="xs:integer"/>
        <xsl:value-of select="concat($NS_PREFIX,$pos)"/>
    </xsl:function>
    <xsl:function name="sch:getSchemas" as="node()">
        <xsl:param name="dir" as="node()"/>
        <sch:productSchemas>
            <xsl:for-each select="$dir//c:directory[@name = 'sample_product_schemas' and not(ancestor::c:directory/@name = 'target')]/c:file[ends-with(lower-case(@name), '.xml')]">
                <xsl:sort select="@name"/>
                <xsl:apply-templates select="document(resolve-uri(@name,base-uri(.)))//sch:productSchema" mode="copy"/>
            </xsl:for-each>
        </sch:productSchemas>
    </xsl:function>
    <xsl:function name="sch:addSchemaPos" as="node()">
        <xsl:param name="schemas" as="node()"/>
        <sch:productSchemas>
            <xsl:for-each-group select="$schemas//sch:productSchema" group-by="@namespace">
                <xsl:variable name="pos" select="position()"/>
                <xsl:for-each select="current-group()">
                    <sch:productSchema pos="{$pos}">
                        <xsl:apply-templates select="@* | node()" mode="copy"/>
                    </sch:productSchema>
                </xsl:for-each>
            </xsl:for-each-group>
        </sch:productSchemas>
    </xsl:function>
    
</xsl:stylesheet>