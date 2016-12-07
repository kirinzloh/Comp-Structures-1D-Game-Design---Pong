set projDir "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/planAhead"
set projName "TestLedMatrix"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/mojo_top_0.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/reset_conditioner_1.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/display_2.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/drawing_3.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/logic_4.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/ball_5.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/padA_6.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/padB_7.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/score_8.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/seven_seg_9.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/seven_seg_9.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/score_display_11.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/edge_detector_12.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/edge_detector_12.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/button_conditioner_14.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/button_conditioner_14.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/edge_detector_12.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/edge_detector_12.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/button_conditioner_14.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/button_conditioner_14.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/pipeline_20.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/pipeline_20.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/pipeline_20.v" "C:/Users/weiqu/Documents/ISTD/Computation Structures/1DProject/TestLedMatrix/work/verilog/pipeline_20.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/weiqu/Documents/ISTD/Computation\ Structures/1DProject/TestLedMatrix/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
