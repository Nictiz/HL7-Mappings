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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="adaversion"/>
    
    <xsl:variable name="dataset-doc" select="document(concat('../',$adaversion,'/dataset.xml'))"/>
    <xsl:key name="dataset-concept-lookup" match="//concept" use="@id"/>
    <xsl:variable name="fhirmapping" select="document(concat('../',$adaversion,'/fhirmapping.xml'))"/>
    <xsl:key name="fhirmapping-lookup" match="dataset/record" use="ID"/>

    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg concepts to profiles.</xd:desc>
    </xd:doc>
    <xsl:template name="bc-profile" mode="doProfileMapping" match="bevalling | baring | graviditeit | pariteit | pariteit_voor_deze_zwangerschap | a_terme_datum | wijze_einde_zwangerschap | datum_einde_zwangerschap | voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie | voorgenomen_voeding" as="element()">
        <xsl:variable name="concept" select="key('dataset-concept-lookup', @conceptId, $dataset-doc)"/>   
        <xsl:variable name="conceptID" select="$concept/@iddisplay"/>
        <xsl:variable name="profile" select="$fhirmapping/dataset/record[ID=$conceptID]/profile"/>     
            <xsl:choose>
                <xsl:when test="$profile!='nl-core-observation'">       
                    <profile value="{concat('http://nictiz.nl/fhir/StructureDefinition/',$profile)}"/>
                </xsl:when>
                <xsl:otherwise>
                    <profile value="{concat('http://fhir.nl/fhir/StructureDefinition/',$profile)}"/>
                </xsl:otherwise>            
            </xsl:choose>
        <!--</xsl:for-each>-->
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg categories for Conditions.</xd:desc>
    </xd:doc>
    <xsl:template name="bc-category" mode="doCategoryMapping" match="/" as="element()">
        <xsl:variable name="concept" select="key('dataset-concept-lookup', @conceptId, $dataset-doc)"/>   
        <xsl:variable name="conceptID" select="$concept/@iddisplay"/>
        <xsl:variable name="profile" select="$fhirmapping/dataset/record[ID=$conceptID]/profile"/>   
            <xsl:choose>
                <xsl:when test="$profile='bc-DisorderOfPregnancy'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="173300003"/>
                            <display value="zwangerschapsstoornis (aandoening)"/>
                        </coding>
                    </category>
                </xsl:when>
                <xsl:when test="$profile='bc-DisorderOfLaborAndDelivery'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="362972006"/>
                            <display value="aandoening durante partu (aandoening)"/>
                        </coding>
                    </category>
                </xsl:when>
                <xsl:when test="$profile='bc-DisorderPostPartum'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="362973001"/>
                            <display value="aandoening tijdens kraamperiode (aandoening)"/>
                        </coding>
                    </category>
                </xsl:when>
                <xsl:when test="$profile='bc-DisorderOfChild'">    
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="414025005"/>
                            <display value="aandoening van foetus of neonaat (aandoening)"/>
                        </coding>
                    </category>
                 </xsl:when>  
                <xsl:otherwise>    
                    <category>
                        <coding>
                            <system value="{@conceptId}"/>
                            <code value="{name(.)}"/>
                            <display value="Codering van dit element ontbreekt in ART-DECOR terminology association"/>
                        </coding>  
                    </category>
                </xsl:otherwise>  
            </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of ADA geboortezorg terminology for Observations.</xd:desc>
    </xd:doc>
    <xsl:template name="bc-coding" mode="doTerminologyMapping" match="/" as="element()">      
        <xsl:variable name="concept" select="key('dataset-concept-lookup', @conceptId, $dataset-doc)"/>   
        <xsl:choose>
            <!-- todo: nettere oplossing hiervoor vinden -->
            <xsl:when test="@conceptId=('2.16.840.1.113883.2.4.3.11.60.90.77.2.12.1077','2.16.840.1.113883.2.4.3.11.60.90.77.2.12.1422')">
                <coding>
                    <system value="http://loinc.org"/>
                    <code value="8352-7"/>
                    <display value="Kleding gedragen tijdens meting [type]"/>
                </coding>                   
            </xsl:when>
            <xsl:when test="@conceptId='2.16.840.1.113883.2.4.3.11.60.90.77.2.12.4099'">
                <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="249120008"/>
                    <display value="begin van eerste fase van partus (waarneembare entiteit)"/>
                </coding>                   
            </xsl:when>
            <xsl:when test="@conceptId='2.16.840.1.113883.2.4.3.11.60.90.77.2.12.39'">
                <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="3950001"/>
                    <display value="geboorte (bevinding)"/>
                </coding>                   
            </xsl:when>
            <xsl:when test="$concept">
                <xsl:for-each select="$concept">
                   <xsl:variable name="terminologies">
                        <xsl:perform-sort select="terminologyAssociation" >
                            <xsl:sort select="@conceptId"/>
                        </xsl:perform-sort>
                    </xsl:variable> 
                    <xsl:variable name="terminology" select="($terminologies/terminologyAssociation[@codeSystemName='SNOMED CT'] | $terminologies/terminologyAssociation[@codeSystemName='LOINC'] | $terminologies/terminologyAssociation)[1]"/>
                    <coding>
                        <system value="{local:getUri($terminology/(@system|@codeSystem))}"/>
                        <code value="{$terminology/@code}"/>
                        <display value="{$terminology/(@display|@displayName)}"/>
                    </coding>   
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <coding>
                    <system value="{@conceptId}"/>
                    <code value="{name(.)}"/>
                    <display value="Codering van dit element ontbreekt in ART-DECOR terminology association"/>
                </coding>                
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>

    <xsl:template name="any-to-date" match="/" mode="doAnyToDate">
        <xsl:variable name="dateValue" select="nf:calculate-t-date(@value, current-date())"/>
        <valueDateTime value="{$dateValue}"/>
    </xsl:template>

</xsl:stylesheet>
