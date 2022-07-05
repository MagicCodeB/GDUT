new_project \
    -name {W_74HC138} \
    -location {C:\EDA\W_74HC138\designer\impl1\W_74HC138_fp} \
    -mode {single}
set_programming_file -file {C:\EDA\W_74HC138\designer\impl1\W_74HC138.pdb}
set_programming_action -action {PROGRAM}
run_selected_actions
save_project
close_project
