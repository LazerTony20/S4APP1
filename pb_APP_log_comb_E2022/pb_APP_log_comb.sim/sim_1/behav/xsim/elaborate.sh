#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Wed May 04 14:26:19 EDT 2022
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 6e88f38826214958bd01804f64fad5de --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot AppCombi_top_tb_behav xil_defaultlib.AppCombi_top_tb -log elaborate.log"
xelab -wto 6e88f38826214958bd01804f64fad5de --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot AppCombi_top_tb_behav xil_defaultlib.AppCombi_top_tb -log elaborate.log

