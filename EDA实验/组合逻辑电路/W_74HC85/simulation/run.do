quietly set ACTELLIBNAME ProASIC3
quietly set PROJECT_DIR "I:/EDA/zuhe/W_74HC85"

if {[file exists ../designer/impl1/simulation/postlayout/_info]} {
   echo "INFO: Simulation library ../designer/impl1/simulation/postlayout already exists"
} else {
   file delete -force ../designer/impl1/simulation/postlayout 
   vlib ../designer/impl1/simulation/postlayout
}
vmap postlayout ../designer/impl1/simulation/postlayout
vmap proasic3 "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/proasic3"

vlog -vlog01compat -work postlayout "${PROJECT_DIR}/designer/impl1/W_74HC85_ba.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work postlayout "${PROJECT_DIR}/stimulus/test_74HC85.v"

vsim -L proasic3 -L postlayout  -t 1ps -sdfmax /u1=${PROJECT_DIR}/designer/impl1/W_74HC85_ba.sdf postlayout.test_74HC85
add wave /test_74HC85/*
run 1000ns
