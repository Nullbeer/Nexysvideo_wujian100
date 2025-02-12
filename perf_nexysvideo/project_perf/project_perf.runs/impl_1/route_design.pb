
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Clock Placer Checks: Poor placement for routing between an IO pin and BUFG. 
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.
 This is normally an ERROR but the CLOCK_DEDICATED_ROUTE constraint is set to FALSE allowing your design to continue. The use of this override is highly discouraged as it may lead to very poor timing results. It is recommended that this error condition be corrected in the design.

	%s (IBUF.O) is locked to %s
	%s (BUFG.I) is provisionally placed by clockplacer on %s
%s*DRC2\
 "F
PAD_JTAG_TCLK_IBUF_inst	PAD_JTAG_TCLK_IBUF_inst2default:default2default:default2B
 ",

IOB_X0Y118

IOB_X0Y1182default:default2default:default2h
 "R
padmux_cpu_jtg_tclk_BUFG_inst	padmux_cpu_jtg_tclk_BUFG_inst2default:default2default:default2H
 "2
BUFGCTRL_X0Y1
BUFGCTRL_X0Y12default:default2default:default2;
 #DRC|Implementation|Placement|Clocks2default:default8ZPLCK-12h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
C
.Phase 1 Build RT Design | Checksum: 1b0c72251
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:00 ; elapsed = 00:00:32 . Memory (MB): peak = 2332.293 ; gain = 0.0002default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
B
-Phase 2.1 Create Timer | Checksum: 1b0c72251
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:01 ; elapsed = 00:00:32 . Memory (MB): peak = 2332.293 ; gain = 0.0002default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 1b0c72251
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:01 ; elapsed = 00:00:32 . Memory (MB): peak = 2332.293 ; gain = 0.0002default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 1b0c72251
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:01 ; elapsed = 00:00:32 . Memory (MB): peak = 2332.293 ; gain = 0.0002default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 134c789ca
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:19 ; elapsed = 00:00:44 . Memory (MB): peak = 2332.293 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2K
7| WNS=1.776  | TNS=0.000  | WHS=-0.461 | THS=-938.713|
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 1589ffc39
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:00:51 . Memory (MB): peak = 2332.293 ; gain = 0.0002default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
B
-Phase 3 Initial Routing | Checksum: 9779e59d
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:02:14 ; elapsed = 00:01:14 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.911  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1000aa0fc
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:13 ; elapsed = 00:03:17 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 1000aa0fc
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:13 ; elapsed = 00:03:17 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 12886722c
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:17 ; elapsed = 00:03:20 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=1.007  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 12886722c
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:18 ; elapsed = 00:03:20 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 12886722c
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:18 ; elapsed = 00:03:20 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 12886722c
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:18 ; elapsed = 00:03:20 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 1879c6c90
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:24 ; elapsed = 00:03:24 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=1.007  | TNS=0.000  | WHS=-0.461 | THS=-0.461 |
2default:defaultZ35-416h px� 
�

Phase %s%s
101*constraints2
6.1.2 2default:default25
!Lut RouteThru Assignment for hold2default:defaultZ18-101h px� 
Y
DPhase 6.1.2 Lut RouteThru Assignment for hold | Checksum: 243f89f17
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:25 ; elapsed = 00:03:25 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 243f89f17
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:26 ; elapsed = 00:03:25 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
v

Phase %s%s
101*constraints2
6.2 2default:default2'
Additional Hold Fix2default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=1.007  | TNS=0.000  | WHS=-0.461 | THS=-0.461 |
2default:defaultZ35-416h px� 
I
4Phase 6.2 Additional Hold Fix | Checksum: 21ca57e95
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:33 ; elapsed = 00:03:30 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 246f8e577
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:37 ; elapsed = 00:03:33 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 180f57f13
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:37 ; elapsed = 00:03:33 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 180f57f13
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:37 ; elapsed = 00:03:33 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
D
/Phase 9 Depositing Routes | Checksum: 8787c850
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:41 ; elapsed = 00:03:38 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
�
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2S
?x_cpu_top/CPU/x_cr_tcipif_top/x_cr_coretim_top/refclk_ff1_reg/D2default:default2!
BUFGCTRL_X0Y02default:defaultZ35-419h px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 10.1 Update Timing | Checksum: 886a3548
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:48 ; elapsed = 00:03:42 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=1.007  | TNS=0.000  | WHS=-0.461 | THS=-0.461 |
2default:defaultZ35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
F
1Phase 10 Post Router Timing | Checksum: 886a3548
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:48 ; elapsed = 00:03:42 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2p
\Time (s): cpu = 00:05:48 ; elapsed = 00:03:42 . Memory (MB): peak = 2364.051 ; gain = 31.7582default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1032default:default2
452default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:05:532default:default2
00:03:452default:default2
2364.0512default:default2
31.7582default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:092default:default2
00:00:032default:default2
2364.0512default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2
kF:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.runs/impl_1/wujian100_open_top_routed.dcp2default:defaultZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:132default:default2
00:00:082default:default2
2364.0512default:default2
0.0002default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_drc -file wujian100_open_top_drc_routed.rpt -pb wujian100_open_top_drc_routed.pb -rpx wujian100_open_top_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
~report_drc -file wujian100_open_top_drc_routed.rpt -pb wujian100_open_top_drc_routed.pb -rpx wujian100_open_top_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
oF:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.runs/impl_1/wujian100_open_top_drc_routed.rptoF:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.runs/impl_1/wujian100_open_top_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:102default:default2
00:00:052default:default2
2373.4962default:default2
9.4452default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file wujian100_open_top_methodology_drc_routed.rpt -pb wujian100_open_top_methodology_drc_routed.pb -rpx wujian100_open_top_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file wujian100_open_top_methodology_drc_routed.rpt -pb wujian100_open_top_methodology_drc_routed.pb -rpx wujian100_open_top_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
{F:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.runs/impl_1/wujian100_open_top_methodology_drc_routed.rpt{F:/Nexysvideo_wujian100/perf_nexysvideo/project_perf/project_perf.runs/impl_1/wujian100_open_top_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:372default:default2
00:00:202default:default2
2850.8872default:default2
477.3912default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_power -file wujian100_open_top_power_routed.rpt -pb wujian100_open_top_power_summary_routed.pb -rpx wujian100_open_top_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_power -file wujian100_open_top_power_routed.rpt -pb wujian100_open_top_power_summary_routed.pb -rpx wujian100_open_top_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1152default:default2
452default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:252default:default2
00:00:152default:default2
2850.8872default:default2
0.0002default:defaultZ17-268h px� 
�
%s4*runtcl2�
qExecuting : report_route_status -file wujian100_open_top_route_status.rpt -pb wujian100_open_top_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -file wujian100_open_top_timing_summary_routed.rpt -pb wujian100_open_top_timing_summary_routed.pb -rpx wujian100_open_top_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px� 
�
%s4*runtcl2o
[Executing : report_incremental_reuse -file wujian100_open_top_incremental_reuse_routed.rpt
2default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
�
%s4*runtcl2o
[Executing : report_clock_utilization -file wujian100_open_top_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file wujian100_open_top_bus_skew_routed.rpt -pb wujian100_open_top_bus_skew_routed.pb -rpx wujian100_open_top_bus_skew_routed.rpx
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record