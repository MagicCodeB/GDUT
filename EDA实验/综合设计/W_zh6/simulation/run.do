quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "G:/EDA/W_zh6"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/W_zh6Mealy.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/W_zh5Moore.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/Zdshj/Zdshj.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/test_zh6.v"

vsim -L proasic3 -L presynth  -t 1ps presynth.test_zh6
add wave /test_zh6/*
run 1000ns
