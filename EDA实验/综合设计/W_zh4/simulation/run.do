quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "G:/EDA/W_zh4"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/W_zh4.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/smartgen/newCore/newCore.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/Jfq/Jfq.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/test_zh4.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test_zh4
add wave /test_zh4/*
run 1000ns
