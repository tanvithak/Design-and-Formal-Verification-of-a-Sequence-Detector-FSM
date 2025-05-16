set_fml_appmode FPV

set design seq_detect
read_file -top $design -format sverilog -sva \
 -vcs {SEQ_detect.sv +define+tanvitha}

# we ask the tool to drive the clock and resets
create_clock clk -period 100
create_reset rst -low

# Ask VC Formal to bring the design out of reset
sim_run -stable
sim_save_reset
