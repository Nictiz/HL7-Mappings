@setlocal enableextensions

@echo off

echo.ant ada2hl7 MP 910 build...
call ant -f _ant-buildfiles\ant-publish\build-ada2hl7-mp-910.xml >ant-build.log

echo.Done
pause