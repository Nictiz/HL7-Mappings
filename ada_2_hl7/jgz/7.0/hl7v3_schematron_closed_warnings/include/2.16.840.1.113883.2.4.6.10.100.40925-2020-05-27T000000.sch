<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.40925
Name: obs Opmerking bij VWO 27
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000">
   <title>obs Opmerking bij VWO 27</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]
Item: (obsElement0925)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]"
         id="d41e89896-false-d1687361e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]) &gt;= 1">(obsElement0925): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]) &lt;= 1">(obsElement0925): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]
Item: (obsElement0925)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]"
         id="d41e89904-false-d1687388e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement0925): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement0925): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement0925): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']) &gt;= 1">(obsElement0925): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']) &lt;= 1">(obsElement0925): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '925' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement0925): element hl7:code[(@code = '925' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '925' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement0925): element hl7:code[(@code = '925' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(obsElement0925): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(obsElement0925): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']
Item: (obsElement0925)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']"
         id="d41e89933-false-d1687470e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement0925): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.40925')">(obsElement0925): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.40925' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:code[(@code = '925' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement0925)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:code[(@code = '925' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e89943-false-d1687489e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement0925): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="@nullFlavor or (@code='925' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement0925): de elementwaarde MOET een zijn van 'code '925' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement0925)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e89953-false-d1687509e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="@xsi:type">(obsElement0925): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.40925-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement0925): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement0925)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.40925
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.40925']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement0925)
-->
</pattern>