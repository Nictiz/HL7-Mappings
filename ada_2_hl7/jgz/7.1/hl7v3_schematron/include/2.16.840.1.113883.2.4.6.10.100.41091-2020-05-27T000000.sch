<?xml version="1.0" encoding="UTF-8"?>
<!--
Template derived pattern
===========================================
ID: 2.16.840.1.113883.2.4.6.10.100.41091
Name: obs 14. Wordt over het algemeen aardig gevonden door andere jeugdigen
Description: 
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron"
         id="template-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000">
   <title>obs 14. Wordt over het algemeen aardig gevonden door andere jeugdigen</title>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]
Item: (obsElement1091)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]"
         id="d40e60158-false-d455609e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]) &gt;= 1">(obsElement1091): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]) &lt;= 1">(obsElement1091): element hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]
Item: (obsElement1091)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]"
         id="d40e60166-false-d455636e0">
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="string(@classCode) = ('OBS') or not(@classCode)">(obsElement1091): de waarde van classCode MOET 'OBS' zijn. Gevonden: "<value-of select="@classCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="string(@moodCode) = ('EVN') or not(@moodCode)">(obsElement1091): de waarde van moodCode MOET 'EVN' zijn. Gevonden: "<value-of select="@moodCode"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="string(@negationInd) = ('false') or not(@negationInd)">(obsElement1091): de waarde van negationInd MOET 'false' zijn. Gevonden: "<value-of select="@negationInd"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']) &gt;= 1">(obsElement1091): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091'] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']) &lt;= 1">(obsElement1091): element hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091'] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1091' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &gt;= 1">(obsElement1091): element hl7:code[(@code = '1091' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] is mandatory [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:code[(@code = '1091' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]) &lt;= 1">(obsElement1091): element hl7:code[(@code = '1091' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')] komt te vaak voor [max 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &gt;= 1">(obsElement1091): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] is required [min 1x].</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="count(hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]) &lt;= 1">(obsElement1091): element hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor] komt te vaak voor [max 1x].</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']
Item: (obsElement1091)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']"
         id="d40e60192-false-d455720e0">
      <extends rule="II"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'II')">(obsElement1091): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:II" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="string(@root) = ('2.16.840.1.113883.2.4.6.10.100.41091')">(obsElement1091): de waarde van root MOET '2.16.840.1.113883.2.4.6.10.100.41091' zijn. Gevonden: "<value-of select="@root"/>"</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:code[(@code = '1091' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]
Item: (obsElement1091)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:code[(@code = '1091' and @codeSystem = '2.16.840.1.113883.2.4.4.40.267')]"
         id="d40e60202-false-d455739e0">
      <extends rule="CV"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="empty(@xsi:type) or resolve-QName(@xsi:type, .) = QName('urn:hl7-org:v3', 'CV')">(obsElement1091): indien er een @xsi:type instructie aanwezig is MOET deze de waarde "{urn:hl7-org:v3}:CV" bevatten. Gevonden "{<value-of select="namespace-uri-from-QName(resolve-QName(@xsi:type,.))"/>}:<value-of select="local-name-from-QName(resolve-QName(@xsi:type,.))"/>"</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="@nullFlavor or (@code='1091' and @codeSystem='2.16.840.1.113883.2.4.4.40.267')">(obsElement1091): de elementwaarde MOET een zijn van 'code '1091' codeSystem '2.16.840.1.113883.2.4.4.40.267''.</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]
Item: (obsElement1091)
-->
   <rule fpi="RULC-1"
         context="*[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]"
         id="d40e60212-false-d455761e0">
      <extends rule="CV"/>
      <let name="theCode" value="@code"/>
      <let name="theCodeSystem" value="@codeSystem"/>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="@nullFlavor or exists(doc('include/voc-2.16.840.1.113883.2.4.3.11.60.100.11.2.572-2012-05-21T012654.xml')//valueSet[1][conceptList/concept[@code = $theCode][@codeSystem = $theCodeSystem]])">(obsElement1091): de elementwaarde MOET een zijn van '2.16.840.1.113883.2.4.3.11.60.100.11.2.572 W0572 Niet waar Een beetje waar Zeker waar (HL7) (2012-05-21T01:26:54)'.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="@xsi:type">(obsElement1091): attribute @xsi:type MOET aanwezig zijn.</assert>
      <assert role="error"
              see="http://decor.nictiz.nl/pub/jeugdgezondheidszorg/jgz-html-20240426T081156/tmp-2.16.840.1.113883.2.4.6.10.100.41091-2020-05-27T000000.html"
              test="not(@xsi:type) or (string-length(@xsi:type) &gt; 0 and not(matches(@xsi:type,'\s')))">(obsElement1091): attribuut @xsi:type MOET datatype 'cs' hebben  - '<value-of select="@xsi:type"/>'</assert>
   </rule>
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:component1[hl7:nonBDSData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10028']]]
Item: (obsElement1091)
-->
   <!--
Template derived rules for ID: 2.16.840.1.113883.2.4.6.10.100.41091
Context: *[hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]]/hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.41091']]/hl7:component2[hl7:metaData[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.100.10029']]]
Item: (obsElement1091)
-->
</pattern>