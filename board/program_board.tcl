# XSCT 2023.2: xsct board/program_board.tcl [--check-only] [server_url]
# Downloads the delivered binaries into volatile FPGA/RAM. Does not write flash.
set board_dir [file normalize [file dirname [info script]]]
set bit [file join $board_dir bitstream zynq_vibration_system_uart0.bit]
set init [file join $board_dir psinit ps7_init.tcl]
set elf [file join $board_dir elf vibration_uart_app.elf]
foreach f [list $bit $init $elf] {
    if {![file isfile $f]} {error "Required file missing: $f"}
}
if {[llength $argv] > 0 && [lindex $argv 0] eq "--check-only"} {
    puts "BOARD_INPUT_PATHS_PASS (no hardware accessed)"
    return
}
set server_url tcp:127.0.0.1:3121
if {[llength $argv] > 0} {set server_url [lindex $argv 0]}
connect -url $server_url
targets -set -filter {name =~ "APU"}
rst -system
after 1000
targets -set -filter {name =~ "xc7z020"}
fpga -file $bit
targets -set -filter {name =~ "ARM*#0"}
source $init
ps7_init
ps7_post_config
rst -processor
dow $elf
con
puts "PROGRAM_STARTED (verify DEVICE_ID and live windows on UART0)"
disconnect
