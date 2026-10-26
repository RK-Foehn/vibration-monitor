# Independent synthesis and implementation feasibility evaluation for
# vibration_processing_pipeline. This script does not open or modify any
# existing Vivado project.

if {$argc != 2} {
    puts "Usage: vivado -mode batch -source evaluate_processing_pipeline.tcl -tclargs <output_dir> <repo_root>"
    exit 2
}

set output_dir [file normalize [lindex $argv 0]]
set repo_root  [file normalize [lindex $argv 1]]
set rtl_dir    [file join $repo_root fpga rtl]
set part_name  xc7z020clg400-2
set top_name   vibration_processing_pipeline

file mkdir $output_dir

# This is deliberately an evaluation-only constraint. There are no package
# pins or I/O standards because processing_pipeline is not a board top.
set eval_xdc [file join $output_dir processing_pipeline_eval.xdc]
set xdc_handle [open $eval_xdc w]
puts $xdc_handle {create_clock -name pl_clk_50mhz -period 20.000 [get_ports clk]}
close $xdc_handle

read_verilog -sv [file join $rtl_dir vibration_frame_fifo.sv]
read_verilog -sv [file join $rtl_dir vibration_window_features.sv]
read_verilog -sv [file join $rtl_dir vibration_processing_pipeline.sv]
read_xdc $eval_xdc

# Out-of-context mode deliberately omits top-level I/O buffers. The integration
# module exposes 166 ports, while XC7Z020-CLG400 has only 125 available PL I/Os;
# it is an internal processing core, not a physical board top.
synth_design -top $top_name -part $part_name -flatten_hierarchy rebuilt \
    -mode out_of_context
write_checkpoint -force [file join $output_dir post_synth.dcp]
report_utilization -hierarchical -hierarchical_depth 4 \
    -file [file join $output_dir post_synth_utilization.rpt]
report_utilization \
    -file [file join $output_dir post_synth_utilization_summary.rpt]
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -file [file join $output_dir post_synth_timing_summary.rpt]
report_drc -file [file join $output_dir post_synth_drc.rpt]
report_methodology -file [file join $output_dir post_synth_methodology.rpt]
report_design_analysis -logic_level_distribution \
    -file [file join $output_dir post_synth_logic_levels.rpt]

set inventory_handle [open [file join $output_dir post_synth_primitive_inventory.txt] w]
foreach primitive_name [lsort -unique [get_property REF_NAME [get_cells -hierarchical -filter {IS_PRIMITIVE}]]] {
    set primitive_count [llength [get_cells -hierarchical -filter "IS_PRIMITIVE && REF_NAME == $primitive_name"]]
    puts $inventory_handle "$primitive_name $primitive_count"
}
close $inventory_handle

opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force [file join $output_dir post_route.dcp]

report_utilization -hierarchical -hierarchical_depth 4 \
    -file [file join $output_dir post_route_utilization.rpt]
report_utilization \
    -file [file join $output_dir post_route_utilization_summary.rpt]
report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -file [file join $output_dir post_route_timing_summary.rpt]
report_timing -delay_type max -max_paths 20 -sort_by group \
    -file [file join $output_dir post_route_critical_paths.rpt]
report_drc -file [file join $output_dir post_route_drc.rpt]
report_methodology -file [file join $output_dir post_route_methodology.rpt]
report_clock_utilization -file [file join $output_dir post_route_clock_utilization.rpt]
report_route_status -file [file join $output_dir post_route_status.rpt]

puts "EVALUATION_COMPLETE output_dir=$output_dir"
