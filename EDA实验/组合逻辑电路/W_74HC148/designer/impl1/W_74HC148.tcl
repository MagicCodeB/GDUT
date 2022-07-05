# Created by Microsemi Libero Software 11.9.0.4
# Tue Dec 22 14:51:40 2020

# (OPEN DESIGN)

open_design "W_74HC148.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "W_74HC148_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {I:\EDA\zuhe\W_74HC148\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/W_74HC148.edn} -merge_physical "no" -merge_timing "yes"
compile
report -type "status" {W_74HC148_compile_report.txt}
report -type "pin" -listby "name" {W_74HC148_report_pin_byname.txt}
report -type "pin" -listby "number" {W_74HC148_report_pin_bynumber.txt}

save_design
