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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" exclude-result-prefixes="#all" version="2.0">

	<xsl:variable name="nlcoreMedicationAdministration">http://nictiz.nl/fhir/StructureDefinition/nl-core-MedicationAdministration</xsl:variable>
	<xsl:variable name="extMedicationAdministration2AgreedDateTime">http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.AgreedDateTime</xsl:variable>
	<xsl:variable name="extMedicationAdministrationAgreedAmount">http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration.AgreedAmount</xsl:variable>
	<xsl:variable name="extContextEpisodeOfCare">http://nictiz.nl/fhir/StructureDefinition/ext-Context-EpisodeOfCare</xsl:variable>
	<xsl:variable name="extMedicationAdministrationReasonForDeviation">http://nictiz.nl/fhir/StructureDefinition/ext-MedicationAdministration2.ReasonForDeviation</xsl:variable>


	<!-- TODO, this extAsAgreed is not yet implemented in FHIR profiles! -->
	<xsl:variable name="extAsAgreed">http://nictiz.nl/fhir/StructureDefinition/ext-Medication.AsAgreedIndicator</xsl:variable>


	<xd:doc>
		<xd:desc>Template to convert f:MedicationAdministration to ADA medicatietoediening</xd:desc>
	</xd:doc>
	<xsl:template match="f:MedicationAdministration" mode="nl-core-MedicationAdministration">
		<medicatietoediening>
			<!-- identificatie -->
			<xsl:apply-templates select="f:identifier" mode="#current"/>
			<!-- toedienings_product -->
			<xsl:apply-templates select="f:medicationReference" mode="#current"/>
			<!-- toedienings_datum_tijd -->
			<xsl:apply-templates select="f:effectiveDateTime" mode="#current"/>
			<!-- afgesproken_datum_tijd -->
			<xsl:apply-templates select="f:extension[@url = $extMedicationAdministration2AgreedDateTime]" mode="#current"/>
			<!-- geannuleerd_indicator -->
			<xsl:if test="f:status/@value = 'entered-in-error'">
				<geannuleerd_indicator value="true"/>
			</xsl:if>
			<!-- toegediende_hoeveelheid -->
			<xsl:apply-templates select="f:dosage/f:dose" mode="#current"/>
			<!-- afgesproken_hoeveelheid -->
			<xsl:apply-templates select="f:dosage/f:extension[@url = $extMedicationAdministrationAgreedAmount]/f:valueQuantity" mode="#current"/>
			<!-- volgens_afspraak_indicator -->
			<!-- TODO: should be updated in FHIR profile -->
			<xsl:apply-templates select="f:extension[@url = $extAsAgreed]" mode="#current"/>
			<!-- toedieningsweg -->
			<xsl:apply-templates select="f:dosage/f:route" mode="nl-core-InstructionsForUse"/>
			<!-- toedieningssnelheid -->
			<xsl:apply-templates select="f:dosage/f:rateQuantity" mode="#current"/>
			<!-- prik_plak_locatie -->
			<xsl:apply-templates select="f:dosage/f:site/f:text" mode="#current"/>
			<!-- relatie medicatieafspraak -->
			<xsl:apply-templates select="f:request" mode="#current"/>
			<!-- relatie_toedieningsafspraak -->
			<xsl:apply-templates select="f:supportingInformation" mode="#current"/>
			<!-- relatie_wisselend_doseerschema -->
			<!-- TODO relatie_wisselend_doseerschema: where in FHIR? -->
			<!-- relatie_contact of relatie_zorgepisode -->
			<xsl:apply-templates select="f:context[f:reference | f:identifier]" mode="contextContactEpisodeOfCare"/>
			<!-- relatie_zorgepisode wanneer ook relatie_contact-->
			<xsl:apply-templates select="f:context/f:extension[@url = $extContextEpisodeOfCare]/f:valueReference" mode="contextContactEpisodeOfCare"/>
			<!-- toediener -->
			<xsl:apply-templates select="f:performer" mode="#current"/>
			<!-- medicatie_toediening_reden_van_afwijken -->
			<xsl:apply-templates select="f:extension[@url = $extMedicationAdministrationReasonForDeviation]" mode="#current"/>
			<!-- medicatie_toediening_status  -->
			<xsl:apply-templates select="f:status[@value ne 'entered-in-error']" mode="#current"/>
			<!-- toelichting -->
			<xsl:apply-templates select="f:note" mode="#current"/>
		</medicatietoediening>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:extension $extAsAgreed to volgens_afspraak_indicator element.</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $extAsAgreed]" mode="nl-core-MedicationAdministration">
		<volgens_afspraak_indicator>
			<xsl:call-template name="boolean-to-boolean">
				<xsl:with-param name="in" select="f:valueBoolean"/>
			</xsl:call-template>
		</volgens_afspraak_indicator>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:extension reason for deviation to medicatie_toediening_reden_van_afwijken element.</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $extMedicationAdministrationReasonForDeviation]" mode="nl-core-MedicationAdministration">
		<xsl:call-template name="CodeableConcept-to-code">
			<xsl:with-param name="in" select="f:valueCodeableConcept"/>
			<xsl:with-param name="adaElementName">medicatie_toediening_reden_van_afwijken</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:identifier to identificatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:identifier" mode="nl-core-MedicationAdministration">
		<xsl:call-template name="Identifier-to-identificatie"/>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:medicationReference to afgesproken_geneesmiddel</xd:desc>
	</xd:doc>
	<xsl:template match="f:medicationReference" mode="nl-core-MedicationAdministration">
		<xsl:variable name="referenceValue" select="f:reference/@value"/>
		<toedienings_product>
			<farmaceutisch_product value="{nf:convert2NCName(f:reference/@value)}" datatype="reference"/>
		</toedienings_product>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:dosage/f:extension[@url= <xd:ref name="extMedicationAdministrationAgreedAmount" type="variable"/>] to afgesproken_hoeveelheid</xd:desc>
	</xd:doc>
	<xsl:template match="f:dosage/f:extension[@url = $extMedicationAdministrationAgreedAmount]/f:valueQuantity" mode="nl-core-MedicationAdministration">
		<afgesproken_hoeveelheid>
			<xsl:call-template name="GstdQuantity2ada"/>
		</afgesproken_hoeveelheid>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:dosage/f:dose to toegediende_hoeveelheid aantal  and eenheid element.</xd:desc>
	</xd:doc>
	<xsl:template match="f:dosage/f:dose" mode="nl-core-MedicationAdministration">

		<toegediende_hoeveelheid>
			<xsl:call-template name="GstdQuantity2ada"/>
		</toegediende_hoeveelheid>

	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:dosage/f:site/f:text to prik_plak_locatie</xd:desc>
	</xd:doc>
	<xsl:template match="f:dosage/f:site/f:text" mode="nl-core-MedicationAdministration">
		<prik_plak_locatie value="{@value}"/>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:effectiveDateTime to toedienings_datum_tijd</xd:desc>
	</xd:doc>
	<xsl:template match="f:effectiveDateTime" mode="nl-core-MedicationAdministration">
			<xsl:call-template name="datetime-to-datetime">
				<xsl:with-param name="in" select="."/>
				<xsl:with-param name="adaElementName">toedienings_datum_tijd</xsl:with-param>
			</xsl:call-template>
			
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:status to geannuleerd_indicator. Only the FHIR status value 'entered-in-error' is used in this mapping.</xd:desc>
	</xd:doc>
	<xsl:template match="f:status" mode="nl-core-MedicationAdministration">
		<xsl:choose>
			<xsl:when test="@value = 'entered-in-error'">
				<geannuleerd_indicator value="true"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="mapMtdStatus" as="element()*">
					<map inValue="in-progress" code="active" codeSystem="{$oidHL7ActStatus}" codeSystemName="{$oidMap[@oid=$oidHL7ActStatus]/@displayName}" displayName="{$hl7ActStatusMap[@hl7Code='active']/@displayName}"/>
					<map inValue="on-hold" code="suspended" codeSystem="{$oidHL7ActStatus}" codeSystemName="{$oidMap[@oid=$oidHL7ActStatus]/@displayName}" displayName="{$hl7ActStatusMap[@hl7Code='suspended']/@displayName}"/>
					<map inValue="stopped" code="aborted" codeSystem="{$oidHL7ActStatus}" codeSystemName="{$oidMap[@oid=$oidHL7ActStatus]/@displayName}" displayName="{$hl7ActStatusMap[@hl7Code='aborted']/@displayName}"/>
					<map inValue="completed" code="completed" codeSystem="{$oidHL7ActStatus}" codeSystemName="{$oidMap[@oid=$oidHL7ActStatus]/@displayName}" displayName="{$hl7ActStatusMap[@hl7Code='completed']/@displayName}"/>
					<map inValue="not-done" code="cancelled" codeSystem="{$oidHL7ActStatus}" codeSystemName="{$oidMap[@oid=$oidHL7ActStatus]/@displayName}" displayName="{$hl7ActStatusMap[@hl7Code='cancelled']/@displayName}"/>
				</xsl:variable>
				<xsl:if test="@value = $mapMtdStatus/@inValue">
					<medicatie_toediening_status>
						<xsl:call-template name="code-to-code">
							<xsl:with-param name="value" select="@value"/>
							<xsl:with-param name="codeMap" as="element()*" select="$mapMtdStatus"/>
						</xsl:call-template>
					</medicatie_toediening_status>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:performer to toediener</xd:desc>
	</xd:doc>
	<xsl:template match="f:performer" mode="nl-core-MedicationAdministration">

		<toediener>
			<xsl:for-each select="f:actor">
				<xsl:variable name="resource" select="nf:resolveRefInBundle(.)"/>
				<xsl:choose>
					<xsl:when test="f:type/@value = 'Patient' or $resource[f:Patient]">
						<patient>
							<toediener_is_patient value="true"/>
						</patient>
					</xsl:when>
					<xsl:when test="f:type/@value = ('Practitioner', 'PractitionerRole') or $resource[f:Practitioner | f:PractitionerRole]">
						<zorgverlener>
							<zorgverlener value="{nf:convert2NCName(f:reference/@value)}"/>
						</zorgverlener>
					</xsl:when>
					<xsl:when test="f:type/@value = ('RelatedPerson') or $resource[f:RelatedPerson]">
						<mantelzorger>
							<contactpersoon value="{nf:convert2NCName(f:reference/@value)}"/>
						</mantelzorger>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</toediener>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:rateQuantity to toedieningssnelheid</xd:desc>
	</xd:doc>
	<xsl:template match="f:rateQuantity" mode="nl-core-MedicationAdministration">
		<toedieningssnelheid>
			<xsl:apply-templates select="." mode="nl-core-InstructionsForUse"/>
		</toedieningssnelheid>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:request to relatie_medicatieafspraak</xd:desc>
	</xd:doc>
	<xsl:template match="f:request" mode="nl-core-MedicationAdministration">
		<relatie_medicatieafspraak>
			<xsl:call-template name="Reference-to-identificatie"/>
		</relatie_medicatieafspraak>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:supportingInformation to relatie_toedieningsafspraak</xd:desc>
	</xd:doc>
	<xsl:template match="f:supportingInformation" mode="nl-core-MedicationAdministration">
		<relatie_toedieningsafspraak>
			<xsl:call-template name="Reference-to-identificatie"/>
		</relatie_toedieningsafspraak>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:extension with extension url "$extMedicationAdministration2AgreedDateTime" to afgesproken_datum_tijd</xd:desc>
	</xd:doc>
	<xsl:template match="f:extension[@url = $extMedicationAdministration2AgreedDateTime]" mode="nl-core-MedicationAdministration">
		<afgesproken_datum_tijd>
			<xsl:attribute name="value">
				<xsl:call-template name="format2ADADate">
					<xsl:with-param name="dateTime" select="f:valueDateTime/@value"/>
				</xsl:call-template>
			</xsl:attribute>
		</afgesproken_datum_tijd>
	</xsl:template>

	<xd:doc>
		<xd:desc>Template to convert f:note to toelichting</xd:desc>
	</xd:doc>
	<xsl:template match="f:note" mode="nl-core-MedicationAdministration">
		<toelichting value="{f:text/@value}"/>
	</xsl:template>

</xsl:stylesheet>