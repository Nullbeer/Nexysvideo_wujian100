set_property SRC_FILE_INFO {cfile:f:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc rfile:../../../project_perf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0/clk_wiz_0_in_context.xdc id:1 order:EARLY scoped_inst:u_clk_wiz_0} [current_design]
set_property SRC_FILE_INFO {cfile:F:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.srcs/constrs_1/imports/xdc/NexysVideo.xdc rfile:../../../project_perf.srcs/constrs_1/imports/xdc/NexysVideo.xdc id:2} [current_design]
current_instance u_clk_wiz_0
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 20.000 [get_ports -no_traverse {}]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -source [get_ports clk_in1] -edges {1 2 3} -edge_shift {0.000 15.000 30.000} [get_ports {}]
current_instance
set_property src_info {type:XDC file:2 line:317 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:2 line:323 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports PAD_GPIO_0]
set_property src_info {type:XDC file:2 line:324 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports PAD_GPIO_1]
set_property src_info {type:XDC file:2 line:325 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports PAD_GPIO_2]
set_property src_info {type:XDC file:2 line:328 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L13 [get_ports PAD_MCURST]
set_property src_info {type:XDC file:2 line:331 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T7 [get_ports PAD_USI0_SCLK]
set_property src_info {type:XDC file:2 line:332 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T8 [get_ports PAD_USI0_SD0]
set_property src_info {type:XDC file:2 line:336 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F12 [get_ports PAD_JTAG_TCLK]
set_property src_info {type:XDC file:2 line:337 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F13 [get_ports PAD_JTAG_TMS]
set_property src_info {type:XDC file:2 line:340 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L4 [get_ports { PAD_GPIO_6 }]; #Sch=sd_cclk         sclk        PAD_GPIO_6
set_property src_info {type:XDC file:2 line:341 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T2 [get_ports { PAD_GPIO_18 }]; #Sch=sd_cd          card detect
set_property src_info {type:XDC file:2 line:342 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R1 [get_ports { PAD_GPIO_5 }]; #Sch=sd_cmd          mosi        PAD_GPIO_5
set_property src_info {type:XDC file:2 line:343 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H16 [get_ports { PAD_GPIO_7 }]; #Sch=sd_d[0]         miso        PAD_GPIO_7
set_property src_info {type:XDC file:2 line:344 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R2 [get_ports { PAD_GPIO_19 }]; #Sch=sd_d[3]        cs          PAD_GPIO_19
