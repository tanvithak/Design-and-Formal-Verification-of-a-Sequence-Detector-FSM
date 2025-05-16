

set_fml_appmode AEP

set_fml_var fml_aep_unique_name true

read_file -top seq_detect -format sverilog -aep all -vcs {SEQ_detect.sv}

# we ask the tool to drive the clock and resets
create_clock clk -period 100
create_reset rst -sense low
# Ask VC Formal to bring the design out of reset
sim_run -stable
sim_save_reset


