quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "C:/EDA/W_zh2"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/74HC138.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/74HC4511.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/Ymtz/Ymtz.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/test_zh2.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test_zh2
add wave /test_zh2/*
run 1000ns
