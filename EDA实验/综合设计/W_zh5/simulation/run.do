quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "G:/EDA/W_zh5"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/W_zh4.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/Zhq/Zhq.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/test_zh5.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test_zh5
add wave /test_zh5/*
run 1000ns
