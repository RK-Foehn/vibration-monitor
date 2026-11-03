# Vivado 2023.2: vivado -mode batch -source build/rebuild_fpga.tcl
# Run on a COPY of the delivered package. Existing synth/impl run results in
# that copy are reset; the shipped XSA and board/ binaries are not overwritten.
set repo_root [file normalize [file join [file dirname [info script]] ..]]
set project_file [file join $repo_root fpga vivado zynq_vibration_system zynq_vibration_system.xpr]
set bd_file [file join $repo_root fpga vivado zynq_vibration_system zynq_vibration_system.srcs sources_1 bd design_1 design_1.bd]
set output_dir [file join $repo_root build generated]
foreach f [list $project_file $bd_file] {
    if {![file isfile $f]} {error "Required file missing: $f"}
}
if {[llength $argv] == 1 && [lindex $argv 0] eq "--check-only"} {
    puts "FPGA_INPUT_PATHS_PASS (no synthesis performed)"
    return
}
file mkdir $output_dir
open_project $project_file
if {[get_property PART [current_project]] ne "xc7z020clg400-2"} {
    error "Unexpected target part"
}
open_bd_design $bd_file
validate_bd_design
generate_target all [get_files $bd_file]
update_compile_order -fileset sources_1
reset_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
set run_status [get_property STATUS [get_runs impl_1]]
if {![string match "*write_bitstream Complete*" $run_status]} {
    error "Implementation did not finish: $run_status"
}
open_run impl_1
report_utilization -file [file join $output_dir utilization.rpt]
report_timing_summary -file [file join $output_dir timing_summary.rpt]
report_drc -file [file join $output_dir drc.rpt]
write_hw_platform -fixed -include_bit -force -file [file join $output_dir zynq_vibration_system_uart0.xsa]
puts "FPGA_REBUILD_PASS output=$output_dir"
close_project
