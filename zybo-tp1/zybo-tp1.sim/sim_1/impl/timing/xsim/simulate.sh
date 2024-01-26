#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2023.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Jan 26 10:36:19 CET 2024
# SW Build 3865809 on Sun May  7 15:04:56 MDT 2023
#
# IP Build 3864474 on Sun May  7 20:36:21 MDT 2023
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim test_pulse_gen_time_impl -key {Post-Implementation:sim_1:Timing:test_pulse_gen} -tclbatch test_pulse_gen.tcl -log simulate.log"
xsim test_pulse_gen_time_impl -key {Post-Implementation:sim_1:Timing:test_pulse_gen} -tclbatch test_pulse_gen.tcl -log simulate.log

