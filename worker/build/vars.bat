@echo off

set "VSDIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0"
set "MLDIR=C:\Program Files\MATLAB\R2013a"
set "GSDIR=D:\ucl\svn\phase12\worker"

set MLINCLDIR="%MLDIR%\extern\include"
set MLLIBDIR="%MLDIR%\extern\lib\win64\microsoft"
set MPILIBDIR="%MPIDIR%\Lib\amd64"
set GSINCLDIR="%GSDIR%"
set CONTAINERS="%GSDIR%\Containers"
set SCMs="%GSDIR%\SCMs"
set ASTRO="%GSDIR%\Astro"
set GABA="%GSDIR%\GABA"
set STDP="%GSDIR%\STDP"
set XCUR="%GSDIR%\ExtraCurrent"
set MODCURs="%GSDIR%\ModCurrents"
set MATFILEIO="%GSDIR%\MatFileIO"

call "%VSDIR%\VC\vcvarsall.bat" amd64

cd ..