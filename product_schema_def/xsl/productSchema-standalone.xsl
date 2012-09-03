<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:schema="http://docs.rackspace.com/core/usage/schema"
    xmlns:usage="http://docs.rackspace.com/core/usage"
    xmlns="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="schema"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="schema:productSchema">
        <xsl:variable name="resourceTypes" as="xsd:string*" select="tokenize(@resourceTypes, ' ')" use-when="not(system-property('xsl:is-schema-aware'))"/>
        <xsl:variable name="resourceTypes" as="xsd:string*" select="@resourceTypes" use-when="system-property('xsl:is-schema-aware')"/>
        <xsl:variable name="MAX_STRING">255</xsl:variable>
        <xsl:comment>
            <xsl:text>&#x0a;    THIS SCHEMA IS AUTOGENERATED DO NOT EDIT</xsl:text>
            <xsl:text>&#x0a;    ORIGINAL FILE: </xsl:text><xsl:value-of select="base-uri()"/>
            <xsl:text>&#x0a;    GENERATED ON: </xsl:text><xsl:value-of select="current-dateTime()"/>
            <xsl:text>&#x0a;</xsl:text>
        </xsl:comment>
        <xsl:text>&#x0a;</xsl:text>
        <xsd:schema
              elementFormDefault="qualified"
              attributeFormDefault="unqualified"
              xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
              xmlns:xsd="http://www.w3.org/2001/XMLSchema"
              xmlns:html="http://www.w3.org/1999/xhtml"
              xmlns:xerces="http://xerces.apache.org"
              xmlns:saxon="http://saxon.sf.net/"
              xmlns="http://www.w3.org/2001/XMLSchema">
            <xsl:namespace name="p" select="@namespace"/>
            <xsl:attribute name="targetNamespace">
                <xsl:value-of select="@namespace"/>
            </xsl:attribute>
            
            <element name="product">
                <xsl:attribute name="type">
                    <xsl:value-of select="concat('p:',@serviceCode,'Type')"/>
                </xsl:attribute>
            </element>
            
            <complexType>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat(@serviceCode,'Type')"/>
                </xsl:attribute>
                <annotation>
                    <documentation>
                        <html:p>
                            <xsl:value-of select="normalize-space(schema:description)"/>
                        </html:p>
                    </documentation>
                    <appinfo>
                        <usage:core>
                            <xsl:if test="@groupByResource">
                                <xsl:attribute name="groupByResource" select="@groupByResource"/>
                            </xsl:if>
                        </usage:core>
                    </appinfo>
                </annotation>
                <attribute name="version" type="xsd:string" use="required">
                    <xsl:attribute name="fixed" select="@version"/>
                </attribute>
                <xsl:if test="@resourceTypes">
                    <attribute name="resourceType"  use="required" type="p:ResourceTypes"/>
                </xsl:if>
                <attribute name="serviceCode" use="required" type="xsd:Name" fixed="{@serviceCode}"/>
                <xsl:apply-templates/>
            </complexType>
            <xsl:if test="@resourceTypes">
                <simpleType name="ResourceTypes">
                    <annotation>
                        <documentation>
                            <html:p>Resource Types for this product.</html:p>
                        </documentation>
                    </annotation>
                    <restriction base="xsd:token">
                        <xsl:for-each select="$resourceTypes">
                            <enumeration>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                            </enumeration>
                        </xsl:for-each>
                    </restriction>
                </simpleType>
            </xsl:if>
            <xsl:if test="schema:attribute[@type=('UUID', 'UUID*')]">
                <simpleType name="UUID">
                    <restriction base="xsd:string">
                        <length value="36" fixed="true"/>
                        <pattern>
                            <xsl:attribute name="value">[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}</xsl:attribute>
                        </pattern>
                    </restriction>
                </simpleType>
            </xsl:if>
            <xsl:if test="schema:attribute[@type=('utcDateTime', 'utcDateTime*')]">
                <simpleType name="UTCDateTime">
                    <restriction base="xsd:dateTime" vc:minVersion="1.0" vc:maxVersion="1.1"/>
                    <restriction base="xsd:dateTimeStamp" vc:minVersion="1.1">
                        <assertion
                            test="ends-with(string($value),'Z') or ends-with(string($value),'+00:00') or ends-with(string($value),'-00:00')"
                            xerces:message="The dateTime should be in the UTC timezone, it is expect to end in +00:00 or Z."
                            saxon:message="The dateTime should be in the UTC timezone, it is expect to end in +00:00 or Z."/>
                    </restriction>
                </simpleType>
            </xsl:if>
            <xsl:if test="schema:attribute[@type=('utcTime', 'utcTime*')]">
                <simpleType name="UTCTime">
                    <restriction base="xsd:time">
                        <assertion
                            vc:minVersion="1.1"
                            test="ends-with(string($value),'Z') or ends-with(string($value),'+00:00') or ends-with(string($value),'-00:00')"
                            xerces:message="The time should be in the UTC timezone, it is expect to end in +00:00 or Z."
                            saxon:message="The time should be in the UTC timezone, it is expect to end in +00:00 or Z."/>
                    </restriction>
                </simpleType>
            </xsl:if>
            <xsl:if test="schema:attribute[@type='string' and not(@allowedValues)]">
                <simpleType name="string">
                    <restriction base="xsd:string">
                        <maxLength value="{$MAX_STRING}"/>
                    </restriction>
                </simpleType>
            </xsl:if>
            <xsl:if test="schema:attribute[@type=('Name','Name*') and not(@allowedValues)]">
                <simpleType name="Name">
                    <restriction base="xsd:Name">
                        <maxLength value="{$MAX_STRING}"/>
                    </restriction>
                </simpleType>
            </xsl:if>
            <xsl:apply-templates mode="AddTypes"/>
        </xsd:schema>
    </xsl:template>
    <xsl:template match="schema:attribute">
        <attribute>
            <xsl:attribute name="name" select="@name"/>
            <xsl:if test="@use">
                <xsl:attribute name="use" select="@use"/>
            </xsl:if>
            <xsl:if test="@fixed">
                <xsl:attribute name="fixed" select="@fixed"/>
            </xsl:if>
            <xsl:if test="@default">
                <xsl:attribute name="default" select="@default"/>
            </xsl:if>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="ends-with(@type, '*')">
                        <xsl:value-of select="usage:listNameType(.,true())"/>
                    </xsl:when>
                    <xsl:when test="@allowedValues">
                        <xsl:value-of select="usage:enumNameType(., true())"/>
                    </xsl:when>
                    <xsl:when test="@type='UUID'">
                        <xsl:value-of select="'p:UUID'"/>
                    </xsl:when>
                    <xsl:when test="@type='utcDateTime'">
                        <xsl:value-of select="'p:UTCDateTime'"/>
                    </xsl:when>
                    <xsl:when test="@type='utcTime'">
                        <xsl:value-of select="'p:UTCTime'"/>
                    </xsl:when>
                    <xsl:when test="@type='string'">
                        <xsl:value-of select="'p:string'"/>
                    </xsl:when>
                    <xsl:when test="@type='Name'">
                        <xsl:value-of select="'p:Name'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('xsd:',@type)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <annotation>
                <documentation>
                    <html:p>
                        <xsl:value-of select="normalize-space(.)"/>
                    </html:p>
                </documentation>
                <appinfo>
                    <usage:attributes>
                        <xsl:if test="@displayName">
                            <xsl:attribute name="displayName" select="@displayName"/>
                        </xsl:if>
                        <xsl:if test="@aggregateFunction">
                            <xsl:attribute name="aggregateFunction" select="@aggregateFunction"/>
                        </xsl:if>
                        <xsl:if test="@unitOfMeasure">
                            <xsl:attribute name="unitOfMeasure" select="@unitOfMeasure"/>
                        </xsl:if>
                        <xsl:if test="@groupBy">
                            <xsl:attribute name="groupBy" select="@groupBy"/>
                        </xsl:if>
                        <xsl:if test="@billable">
                            <xsl:attribute name="billable" select="@billable"/>
                        </xsl:if>
                        <xsl:if test="@frequency">
                            <xsl:attribute name="frequency" select="@frequency"/>
                        </xsl:if>
                        <xsl:if test="@frequencyAttribute">
                            <xsl:attribute name="frequencyAttribute" select="@frequencyAttribute"/>
                        </xsl:if>
                    </usage:attributes>
                </appinfo>
            </annotation>
        </attribute>
    </xsl:template>
    <xsl:template match="schema:attribute" mode="AddTypes">
        <xsl:if test="ends-with(@type, '*')">
            <xsl:call-template name="addListType"/>
        </xsl:if>
        <xsl:if test="@allowedValues">
            <xsl:call-template name="addEnumType"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="addEnumType">
        <xsl:variable name="enumValues" as="xsd:string*" select="tokenize(@allowedValues, ' ')" use-when="not(system-property('xsl:is-schema-aware'))"/>
        <xsl:variable name="enumValues" as="xsd:string*" select="@allowedValues" use-when="system-property('xsl:is-schema-aware')"/>
        <simpleType>
            <xsl:attribute name="name" select="usage:enumNameType(., false())"/>
            <restriction>
                <xsl:attribute name="base" select="usage:enumBaseType(.)"/>
                <xsl:for-each select="$enumValues">
                    <enumeration>
                        <xsl:attribute name="value" select="normalize-space(.)"/>
                    </enumeration>
                </xsl:for-each>
            </restriction>
        </simpleType>
    </xsl:template>
    <xsl:template name="addListType">
        <simpleType>
            <xsl:attribute name="name" select="usage:listNameType(.,false())"/>
            <list>
                <xsl:attribute name="itemType">
                    <xsl:value-of select="usage:listItemType(.)"/>
                </xsl:attribute>
            </list>
        </simpleType>
    </xsl:template>
    <xsl:function name="usage:enumNameType">
        <xsl:param name="attrib" as="node()"/>
        <xsl:param name="qualified" as="xsd:boolean"/>
        <xsl:choose>
            <xsl:when test="$qualified">
                <xsl:value-of select="concat('p:',$attrib/@name, 'Enum')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($attrib/@name, 'Enum')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="usage:enumBaseType">
        <xsl:param name="attrib" as="node()"/>
        <xsl:variable name="type" as="xsd:string">
            <xsl:choose>
                <xsl:when test="contains($attrib/@type,'*')">
                   <xsl:value-of select="substring-before($attrib/@type,'*')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$attrib/@type"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$type='UUID'">
                <xsl:value-of select="'p:UUID'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('xsd:',$type)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="usage:listNameType">
        <xsl:param name="attrib" as="node()"/>
        <xsl:param name="qualified" as="xsd:boolean"/>
        <xsl:choose>
            <xsl:when test="$qualified">
                <xsl:value-of select="concat('p:',$attrib/@name, 'List')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($attrib/@name, 'List')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="usage:listItemType">
        <xsl:param name="attrib" as="node()"/>
        <xsl:variable name="type" select="substring-before($attrib/@type,'*')" as="xsd:string"/>
        <xsl:choose>
            <xsl:when test="$type='UUID'">
                <xsl:value-of select="concat('p:',$type)"/>
            </xsl:when>
            <xsl:when test="$attrib/@allowedValues">
                <xsl:value-of select="usage:enumNameType($attrib,true())"/>
            </xsl:when>
            <xsl:when test="$type='Name'">
                <xsl:value-of select="concat('p:',$type)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('xsd:',$type)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:template mode="#all" match="text()"/>
</xsl:stylesheet>
