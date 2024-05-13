<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" version="2.0">
    <xsl:import href="../../../2_fhir_gebz_include_32.xsl"/>
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:param name="mask-ids"/>
         
    <xsl:variable name="usecase">medmij-gbz</xsl:variable>
    <xsl:variable name="adaversion" select="'3.2'"/>
     
    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "med_mij_uitbreiding_verloskunde_beschikbaarstellen".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="//med_mij_uitbreiding_verloskunde_beschikbaarstellen"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build the individual FHIR resources.</xd:desc>
    </xd:doc>
    <xsl:template name="ConversieIntegraleZwangerschapskaartGegevens" match="med_mij_uitbreiding_verloskunde_beschikbaarstellen">             
        <xsl:apply-templates select="$bouwstenen" mode="doResourceInResultdoc"/>
    </xsl:template>
      
    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:Resource/* | f:Patient | f:Practitioner | f:PractitionerRole | f:Organization | f:Condition | f:EpisodeOfCare | f:Observation | f:Procedure | f:Encounter" mode="doResourceInResultdoc">
        <xsl:variable name="zib-name" select="tokenize(f:meta/f:profile[last()]/@value, './')[last()]"/>
        <xsl:variable name="code" select="replace(f:code/f:coding/f:code/@value,':','')"/>
        
        <xsl:variable name="resourceWithIdentifier">
            <xsl:choose>
                <xsl:when test="f:identifier">
                    <xsl:copy-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy>
                        <xsl:copy-of select="f:id | f:meta | f:implicitRules | f:language | f:text | f:contained | f:extension | f:modifierExtension"/>
                        <identifier xmlns="http://hl7.org/fhir">
                            <system value="urn:oid:2.16.840.1.113883.2.4.3.11.999.7.6"/>
                            <value value="{uuid:get-uuid(.)}"/>
                        </identifier>
                        <xsl:copy-of select="*[not(self::f:id or self::f:meta or self::f:implicitRules or self::f:language or self::f:text or self::f:contained or self::f:extension or self::f:modifierExtension)]"/>
                    </xsl:copy>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:result-document href="../fhir_instance/{$usecase}-{$zib-name}{$code}-{f:id/@value}.xml">
            <xsl:apply-templates select="$resourceWithIdentifier" mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template> 
       
</xsl:stylesheet>
