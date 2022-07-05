# Created by Microsemi Libero Software 11.9.0.4
# Tue Dec 22 14:58:43 2020

# (OPEN DESIGN)

open_design "W_74HC138.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "W_74HC138_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {I:\EDA\zuhe\W_74HC138\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

backannotate -format "SDF" -language "VERILOG" -netlist

save_design
