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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA hartfrequentie to FHIR Observation resource conforming to profile nl-core-HeartRate.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameHeartRate">nl-core-HeartRate</xsl:variable>
    <xsl:variable name="profileNameHeartRateHeartbeatRegularity">nl-core-HeartRate.HeartbeatRegularity</xsl:variable>
    <xsl:variable name="profileNameHeartRateInterpretationHeartRate">nl-core-HeartRate.InterpretationHeartRate</xsl:variable>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-HeartRate instance as an Observation FHIR instance from ADA hartfrequentie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="hartfrequentie" name="nl-core-HeartRate" mode="nl-core-HeartRate" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameHeartRate"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <category>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/observation-category"/>
                        <code value="vital-signs"/>
                        <display value="Vital Signs"/>
                    </coding>
                </category>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                        <code value="8867-4"/>
                        <display value="Heart rate"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="hartfrequentie_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <xsl:for-each select="hartfrequentie_waarde">
                    <valueQuantity>
                        <xsl:call-template name="hoeveelheid-to-Quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueQuantity>
                </xsl:for-each>
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
                <xsl:for-each select="hartslag_meet_methode">
                    <method>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </method>
                </xsl:for-each>
                <xsl:for-each select="hartslag_regelmatigheid">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameHeartRateHeartbeatRegularity"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="interpretatie_frequentie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameHeartRateInterpretationHeartRate"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-HeartRate.HeartbeatRegularity instance as an Observation FHIR instance from ADA hartslag_regelmatigheid element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="hartslag_regelmatigheid[parent::hartfrequentie]" name="nl-core-HeartRate.HeartbeatRegularity" mode="nl-core-HeartRate.HeartbeatRegularity" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameHeartRateHeartbeatRegularity"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <category>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/observation-category"/>
                        <code value="vital-signs"/>
                        <display value="Vital Signs"/>
                    </coding>
                </category>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="301112006"/>
                        <display value="Finding of heart rhythm"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../hartfrequentie_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
                <xsl:for-each select="../hartslag_meet_methode">
                    <method>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </method>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
        <xd:doc>
            <xd:desc>Creates an nl-core-HeartRate.InterpretationHeartRate instance as an Observation FHIR instance from ADA interpretatie_frequentie element.</xd:desc>
            <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
            <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        </xd:doc>
        <xsl:template match="interpretatie_frequentie[parent::hartfrequentie]" name="nl-core-HeartRate.InterpretationHeartRate" mode="nl-core-HeartRate.InterpretationHeartRate" as="element(f:Observation)?">
            <xsl:param name="in" select="." as="element()?"/>
            <xsl:param name="subject" select="patient/*" as="element()?"/>
            
            <xsl:for-each select="$in">
                <Observation>
                    <xsl:call-template name="insertLogicalId">
                        <xsl:with-param name="profile" select="$profileNameHeartRateInterpretationHeartRate"/>
                    </xsl:call-template>
                    <meta>
                        <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                    </meta>
                    <status value="final"/>
                    <category>
                        <coding>
                            <system value="http://terminology.hl7.org/CodeSystem/observation-category"/>
                            <code value="vital-signs"/>
                            <display value="Vital Signs"/>
                        </coding>
                    </category>
                    <code>
                        <coding>
                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                            <code value="301113001"/>
                            <display value="Finding of heart rate"/>
                        </coding>
                    </code>
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                    <xsl:for-each select="../hartfrequentie_datum_tijd">
                        <effectiveDateTime>
                            <xsl:call-template name="date-to-datetime">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </effectiveDateTime>
                    </xsl:for-each>
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                    <xsl:for-each select="../hartslag_meet_methode">
                        <method>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </method>
                    </xsl:for-each>
                </Observation>
            </xsl:for-each>
        </xsl:template>
        
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="hartfrequentie" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Heart rate observation</xsl:text>
            <xsl:if test="hartfrequentie_datum_tijd[@value]">
                <xsl:value-of select="concat('measurement date ', hartfrequentie_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
  
  
    <xsl:template match="hartslag_regelmatigheid[parent::hartfrequentie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Hartslag regelmatigheid</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>   
    </xsl:template>  
    
    
    <xsl:template match="interpretatie_frequentie[parent::hartfrequentie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Interpretatie frequentie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>  
    </xsl:template>  
    
</xsl:stylesheet>