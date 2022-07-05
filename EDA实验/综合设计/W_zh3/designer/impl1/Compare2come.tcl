# Created by Microsemi Libero Software 11.9.0.4
# Fri Dec 25 16:38:54 2020

# (NEW DESIGN)

# create a new design
new_design -name "Compare2come" -family "ProASIC3"
set_device -die {A3P060} -package {100 VQFP} -speed {STD} -voltage {1.5} -IO_DEFT_STD {LVTTL} -RESERVEMIGRATIONPINS {1} -RESTRICTPROBEPINS {1} -RESTRICTSPIPINS {0} -TARGETDEVICESFORMIGRATION {IS2X2M1} -TEMPR {COM} -UNUSED_MSS_IO_RESISTOR_PULL {None} -VCCI_1.5_VOLTR {COM} -VCCI_1.8_VOLTR {COM} -VCCI_2.5_VOLTR {COM} -VCCI_3.3_VOLTR {COM} -VOLTR {COM}


# set default back-annotation base-name
set_defvar "BA_NAME" "Compare2come_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {G:\EDA\W_zh3\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

# set working directory
set_defvar "DESDIR" "G:/EDA/W_zh3/designer/impl1"

# set back-annotation output directory
set_defvar "BA_DIR" "G:/EDA/W_zh3/designer/impl1"

# enable the export back-annotation netlist
set_defvar "BA_NETLIST_ALSO" "1"

# set EDIF options
set_defvar "EDNINFLAVOR" "GENERIC"

# set HDL options
set_defvar "NETLIST_NAMING_STYLE" "VERILOG"

# setup status report options
set_defvar "EXPORT_STATUS_REPORT" "1"
set_defvar "EXPORT_STATUS_REPORT_FILENAME" "Compare2come.rpt"

# legacy audit-mode flags (left here for historical reasons)
set_defvar "AUDIT_NETLIST_FILE" "1"
set_defvar "AUDIT_DCF_FILE" "1"
set_defvar "AUDIT_PIN_FILE" "1"
set_defvar "AUDIT_ADL_FILE" "1"

# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/Compare2come.edn}

# save the design database
save_design {Compare2come.adb}


compile
report -type "status" {Compare2come_compile_report.txt}
report -type "pin" -listby "name" {Compare2come_report_pin_byname.txt}
report -type "pin" -listby "number" {Compare2come_report_pin_bynumber.txt}

save_design
