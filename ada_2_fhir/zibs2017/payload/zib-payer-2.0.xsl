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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM Payer concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Payer">zib-Payer</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Coverage resource for Payer.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-Payer-2.0" match="betaler[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | payer[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Coverage)" mode="doZibPayer-2.0">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-Payer</xsl:variable>
                <Coverage>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(verzekeraar/verzekering/verzekeringssoort | insurance_company/insurance/insurance_type)[@code]">
                        <type>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </type>
                    </xsl:for-each>
                    
                    <!-- Patient reference -->
                    <subscriber>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subscriber>
                    
                    <xsl:for-each select="(verzekeraar/verzekerde_nummer | insurance_company/insurant_number)[@value]">
                        <subscriberId>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </subscriberId>
                    </xsl:for-each>
                    
                    <!-- Patient reference -->
                    <beneficiary>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </beneficiary>
                    
                    <xsl:if test="(verzekeraar/verzekering/begin_datum_tijd | insurance_company/insurance/start_date_time)[@value] or (verzekeraar/verzekering/eind_datum_tijd | insurance_company/insurance/end_date_time)[@value]">
                        <period>
                            <xsl:for-each select="(verzekeraar/verzekering/begin_datum_tijd | insurance_company/insurance/start_date_time)[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <!-- period.end is required in the FHIR profile, so always output period.end, data-absent-reason if no actual value -->
                            <end>
                                <xsl:choose>
                                    <xsl:when test="(verzekeraar/verzekering/eind_datum_tijd | insurance_company/insurance/end_date_time)[@value]">
                                        <xsl:attribute name="value">
                                            <xsl:call-template name="format2FHIRDate">
                                                <xsl:with-param name="dateTime" select="xs:string((verzekeraar/verzekering/eind_datum_tijd | insurance_company/insurance/end_date_time)/@value)"/>
                                                <xsl:with-param name="dateT" select="$dateT"/>
                                            </xsl:call-template>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <extension url="{$urlExtHL7DataAbsentReason}">
                                            <valueCode value="unknown"/>
                                        </extension>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </end>
                        </period>
                    </xsl:if>
                    
                    <!-- payor is required in the FHIR profile, so always output payor, data-absent-reason if no actual value -->
                    <xsl:if test="betaler_persoon | payer_person">
                        <payor>
                            <xsl:if test="(betaler_persoon/bankgegevens/bank_naam | payer_person/bank_information/bank_name)[@value] or (betaler_persoon/bankgegevens/bankcode | payer_person/bank_information/bank_code)[@value] or (betaler_persoon/bankgegevens/rekeningnummer | payer_person/bank_information/account_number)[@value]">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Payer-BankInformation">
                                    <xsl:for-each select="(betaler_persoon/bankgegevens/bank_naam | payer_person/bank_information/bank_name)[@value]">
                                        <extension url="BankName">
                                            <valueString>
                                                <xsl:call-template name="string-to-string">
                                                    <xsl:with-param name="in" select="."/>
                                                </xsl:call-template>
                                            </valueString>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="(betaler_persoon/bankgegevens/rekeningnummer | payer_person/bank_information/account_number)[@value]">
                                        <extension url="AccountNumber">
                                            <valueString>
                                                <xsl:call-template name="string-to-string">
                                                    <xsl:with-param name="in" select="."/>
                                                </xsl:call-template>
                                            </valueString>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="(betaler_persoon/bankgegevens/bankcode | payer_person/bank_information/bank_code)[@value]">
                                        <extension url="Bankcode">
                                            <valueString>
                                                <xsl:call-template name="string-to-string">
                                                    <xsl:with-param name="in" select="."/>
                                                </xsl:call-template>
                                            </valueString>
                                        </extension>
                                    </xsl:for-each>
                                </extension>
                            </xsl:if>
                            <xsl:for-each select="(betaler_persoon/betaler_naam | payer_person/payer_name)[@value]">
                                <!--First create Patient/RelatedPerson resource
                                <reference>
                                    
                                </reference>-->
                                <display>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </display>
                            </xsl:for-each>
                        </payor>
                    </xsl:if>
                    <xsl:if test="verzekeraar | insurance_company">
                        <payor>
                            <xsl:apply-templates select="verzekeraar | insurance_company" mode="doOrganizationReference-2.0"/>
                            <!--<xsl:for-each select="(verzekeraar/identificatie_nummer | insurance_company/identification_number)[@value]">
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                            </xsl:for-each>
                            <xsl:for-each select="(verzekeraar/organisatie_naam | insurance_company/organization_name)[@value]">
                                <display>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </display>
                            </xsl:for-each>-->
                        </payor>
                    </xsl:if>
                    <xsl:if test="not(betaler_persoon | payer_person) and not(verzekeraar | insurance_company)">
                        <payor>
                            <extension url="{$urlExtHL7DataAbsentReason}">
                                <valueCode value="unknown"/>
                            </extension>
                        </payor>
                    </xsl:if>
                    
                </Coverage>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>