@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Dec 16 03:45:19 +0530 2023
REM SW Build 4029153 on Fri Oct 13 20:14:34 MDT 2023
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_mux2x1Scalared_behav -key {Behavioral:sim_1:Functional:tb_mux2x1Scalared} -tclbatch tb_mux2x1Scalared.tcl -log simulate.log"
call xsim  tb_mux2x1Scalared_behav -key {Behavioral:sim_1:Functional:tb_mux2x1Scalared} -tclbatch tb_mux2x1Scalared.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
