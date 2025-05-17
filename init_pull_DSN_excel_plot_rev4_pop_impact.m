clear;
clc;
close all;
close all force;
app=NaN(1);  %%%%%%%%%This is to allow for Matlab Application integration.
format shortG
%format longG
top_start_clock=clock;
folder1='C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\7GHz DSN Contour Plots';
cd(folder1)
addpath(folder1)
addpath('C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\Basic_Functions')
addpath('C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\General_Movelist')  %%%%%%%%This is another Github repo
addpath('C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\General_Terrestrial_Pathloss')  %%%%%%%%This is another Github repo
addpath('C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\Generic_Bugsplat')
addpath('C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\Census_Functions')
addpath('C:\Local Matlab Data\Local MAT Data') %%%%%%%One Drive Error with mat files
pause(0.1)


%%%%%%%%%'Pull data and pop impact'
impact_levels=cell(3,3);
impact_levels{1,1}='DSN';
impact_levels{1,2}=-127:10:-77;
impact_levels{2,1}='NEN';
impact_levels{2,2}=-127:10:-77;
impact_levels{3,1}='GOES';
impact_levels{3,2}=-130:10:-80;
impact_levels
array_mitigation=-127:10:-77;
array_reliability=horzcat(0.01,50)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Folder of Data
rev_folder='C:\Users\nlasorte\OneDrive - National Telecommunications and Information Administration\MATLAB2024\7GHz DSN Contour Plots\Rev101' %%%%%%%%%%%DSN and EESS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Now running the simulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tf_server_status=0;
parallel_flag=0%1%0;
[workers,parallel_flag]=check_parallel_toolbox(app,parallel_flag)
workers=2
tf_recalculate=0%1%0%1
tf_rescrap_rev_data=1
tf_repull_excel=0  %%%%%%%%%%If we want to repull the Lat/Lon/Signal Strength Data
tf_plot_bugsplat=1%0%1
tf_plot_multi_con=1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pull the excel file for the data.
excel_filename_sim_data='Sim_Data_Rev101.xlsx'
tf_repull_sim_data=0%1%0;
mat_filename_sim_data='sim_data_1'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wrapper_bugsplat_DSN_EESS_rev15(app,rev_folder,parallel_flag,workers,tf_server_status,tf_recalculate,tf_rescrap_rev_data,array_mitigation,array_reliability,impact_levels,tf_repull_excel,tf_plot_bugsplat,tf_plot_multi_con,excel_filename_sim_data,tf_repull_sim_data,mat_filename_sim_data)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end_clock=clock;
total_clock=end_clock-top_start_clock;
total_seconds=total_clock(6)+total_clock(5)*60+total_clock(4)*3600+total_clock(3)*86400;
total_mins=total_seconds/60;
total_hours=total_mins/60;
if total_hours>1
    strcat('Total Hours:',num2str(total_hours))
elseif total_mins>1
    strcat('Total Minutes:',num2str(total_mins))
else
    strcat('Total Seconds:',num2str(total_seconds))
end
cd(folder1)
'Done'


