<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.41240
Name: obs Opmerking bij VWO 3
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000">
   <title>obs Opmerking bij VWO 3</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]
Item: (obsElement1240)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]"
         id="d41e123265-false-d1082837e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]) &gt;= 1">(obsElement1240): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]) &lt;= 1">(obsElement1240): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]
Item: (obsElement1240)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]"
         id="d41e123273-false-d1082864e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1240): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1240): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement1240): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']) &gt;= 1">(obsElement1240): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']) &lt;= 1">(obsElement1240): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1240' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1240): element hl7:code[(@code = '1240' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1240' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1240): element hl7:code[(@code = '1240' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &gt;= 1">(obsElement1240): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="count(hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]) &lt;= 1">(obsElement1240): element hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']
Item: (obsElement1240)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']"
         id="d41e123302-false-d1082946e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1240): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.41240')">(obsElement1240): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.41240' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:code[(@code = '1240' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1240)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:code[(@code = '1240' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d41e123312-false-d1082965e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1240): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="@nullFlavor or (@code='1240' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1240): de elementwaarde MOET een zijn van 'code '1240' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]
Item: (obsElement1240)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:value[resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'ST')]"
         id="d41e123322-false-d1082985e0">
      <extends rule="ST"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="@xsi:type">(obsElement1240): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20230613T223721/tmp-2.16.840.1.113883.2.4.6.10.100.41240-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement1240): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement1240)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41240
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41240']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement1240)
-->
</pattern>