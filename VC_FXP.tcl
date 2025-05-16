set_fml_appmode FXP
#set_fml_var fml_aep_unique_name true
read_file -top seq_detect -format sverilog -sva -vcs {SEQ_detect.sv}
set_fml_var fxp_compute_rootcause_auto true
# we ask the tool to drive the clock and resets
create_clock clk -period 100
create_reset rst -low

# Ask VC Formal to bring the design out of reset
sim_run -stable
sim_save_reset

fxp_generate

set_fml_var fxp_compute_rootcause_auto true
