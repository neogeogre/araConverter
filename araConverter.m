function varargout = araConverter(varargin)
% ARACONVERTER MATLAB code for araConverter.fig

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @araConverter_OpeningFcn, ...
    'gui_OutputFcn',  @araConverter_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function araConverter_OpeningFcn(hObject, eventdata, handles, varargin)

epfllogoraw = archeologo();
findobj('Tag','LOGO1');
cla; 
hold on;
set(findobj('Tag','LOGO1'), ... % 'XLim',[0 150],'YLim',[0 100],...
    'DataAspectRatio',[1 1 1],'Visible','off');
hold on; 
imshow(uint8(epfllogoraw));
set(findobj('Tag','ConvertButton'), 'Enable', 'off');

function varargout = araConverter_OutputFcn(hObject, eventdata, handles)

function FolderButton_Callback(hObject, eventdata, handles)
global filesListing araFolder

araFolder = uigetdir;
if araFolder == 0
    return
end

set(findobj('Tag','text3'), 'String', araFolder)
filesListing = ls(araFolder);

nbrARAfiles = 0;
for i = 1:size(filesListing, 1)
    k = strfind(filesListing(i,:),'.ARA');
    if size(k,1) > 0
        nbrARAfiles = nbrARAfiles + 1;
    end
end

if nbrARAfiles > 0
    set(findobj('Tag','text4'), 'String', num2str(nbrARAfiles))
    set(findobj('Tag','ConvertButton'), 'Enable', 'on')
else
    set(findobj('Tag','text4'), 'String', '0')
    set(findobj('Tag','ConvertButton'), 'Enable', 'off')
    
end

function ConvertButton_Callback(hObject, eventdata, handles)
global filesListing araFolder

for i = 1:size(filesListing, 1)
    if size(strfind(filesListing(i,:),'.ARA'),1) > 0

        araID = fopen([araFolder, '\', filesListing(i,:)]);
        
        asctecFlirTau2.bmp_mark        = fread(araID, 1, 'uint16');
        asctecFlirTau2.bmp_filelenght  = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_reserved01  = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_offset      = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_hdrsize     = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_width_px    = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_height_px   = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_planes      = fread(araID, 1, 'uint16');
        asctecFlirTau2.bmp_bitperpixel = fread(araID, 1, 'uint16');
        asctecFlirTau2.bmp_compression = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_data_size   = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_ppm_x       = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_ppm_y       = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_colors      = fread(araID, 1, 'uint32');
        asctecFlirTau2.bmp_colors2     = fread(araID, 1, 'uint32');
        
        asctecFlirTau2.version         = fread(araID, 1, 'uint16');
        asctecFlirTau2.checksum        = fread(araID, 1, 'uint16');
        asctecFlirTau2.mode            = fread(araID, 1, 'uint16');
        asctecFlirTau2.trigger_counter = fread(araID, 1, 'uint16');
        asctecFlirTau2.bit_per_pixel   = fread(araID, 1, 'uint16');
        asctecFlirTau2.byte_per_pixel  = fread(araID, 1, 'uint16');
        asctecFlirTau2.color_min       = fread(araID, 1, 'uint32');
        asctecFlirTau2.color_max       = fread(araID, 1, 'uint32');
        
        asctecFlirTau2.cam_sernum            = fread(araID, 1, 'uint32');
        asctecFlirTau2.cam_sernum_sensor     = fread(araID, 1, 'uint32');
        asctecFlirTau2.cam_version           = fread(araID, 1, 'uint32');
        asctecFlirTau2.cam_fw_version        = fread(araID, 1, 'uint32');
        asctecFlirTau2.cam_sensortemperature = fread(araID, 1, 'uint16');
        asctecFlirTau2.cam_crc_error_cnt     = fread(araID, 1, 'uint32');
        asctecFlirTau2.cam_dcmi_error_cnt    = fread(araID, 1, 'uint32');
        for j = 1:32
            asctecFlirTau2.cam_partnum = fread(araID, 1, 'uint8');
        end
        asctecFlirTau2.time_ms     = fread(araID, 1, 'uint32');
        asctecFlirTau2.gps_week    = fread(araID, 1, 'uint16');
        asctecFlirTau2.gps_time_ms = fread(araID, 1, 'uint32');
        asctecFlirTau2.gps_long    = fread(araID, 1, 'uint32')*1e-7;
        asctecFlirTau2.gps_lat     = fread(araID, 1, 'uint32')*1e-7;
        asctecFlirTau2.gps_height  = fread(araID, 1, 'uint32')*1e-3;
        asctecFlirTau2.gps_hor_accuracy   = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.gps_vert_accuracy  = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.gps_speed_accuracy = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.gps_speed_x = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.gps_speed_y = fread(araID, 1, 'uint16')*1e-3;
        
        asctecFlirTau2.angle_pitch = fread(araID, 1, 'uint16')/100;
        asctecFlirTau2.angle_roll  = fread(araID, 1, 'uint16')/100;
        asctecFlirTau2.angle_yaw   = fread(araID, 1, 'uint16')/100;
        asctecFlirTau2.cam_angle_pitch = fread(araID, 1, 'uint16')/100;
        asctecFlirTau2.cam_angle_roll  = fread(araID, 1, 'uint16')/100;
        asctecFlirTau2.cam_angle_yaw   = fread(araID, 1, 'uint16')/100;
        
        asctecFlirTau2.fw_version_major = fread(araID, 1, 'uint16');
        asctecFlirTau2.fw_version_minor = fread(araID, 1, 'uint16');
        asctecFlirTau2.fw_version_build_count = fread(araID, 1, 'uint32');
        asctecFlirTau2.fw_version_timestamp   = fread(araID, 1, 'uint32');
        for j = 1:32
            asctecFlirTau2.fw_version_svn_revision = fread(araID, 1, 'uint8');
        end
        
        asctecFlirTau2.startup_gps_long   = fread(araID, 1, 'int32')*1e-7;
        asctecFlirTau2.startup_gps_lat    = fread(araID, 1, 'int32')*1e-7;
        asctecFlirTau2.startup_gps_height = fread(araID, 1, 'int32')*1e-3;
        asctecFlirTau2.startup_gps_hor_accuracy   = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.startup_gps_vert_accuracy  = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.startup_gps_speed_accuracy = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.startup_gps_speed_x = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.startup_gps_speed_y = fread(araID, 1, 'uint16')*1e-3;
        asctecFlirTau2.tlinear             = fread(araID, 1, 'uint8');
        asctecFlirTau2.tlinearResolution   = fread(araID, 1, 'uint8');
        
        fseek(araID, 512, -1);
        ThermalImage = fread(araID, [640 512], 'uint16');
        
        fclose(araID);
        disp('=============================================================');
        disp(' ');
        fprintf('File %s Metadata from the Asctec Flir Tau 2/640 : \n', filesListing(i,1:8))
        fprintf('bmp_mark = %0.0f\n',       asctecFlirTau2.bmp_mark);
        fprintf('bmp_filelenght = %0.0f\n', asctecFlirTau2.bmp_filelenght);
        fprintf('bmp_reserved01 = %0.0f\n', asctecFlirTau2.bmp_reserved01);
        fprintf('bmp_offset = %0.0f\n',     asctecFlirTau2.bmp_offset);
        fprintf('bmp_hdrsize = %0.0f\n',    asctecFlirTau2.bmp_hdrsize);
        fprintf('bmp_width_px = %0.0f\n',   asctecFlirTau2.bmp_width_px);
        fprintf('bmp_height_px = %0.0f\n',  asctecFlirTau2.bmp_height_px);
        fprintf('bmp_planes = %0.0f\n',        asctecFlirTau2.bmp_planes);
        fprintf('bmp_bitperpixel = %0.0f\n',   asctecFlirTau2.bmp_bitperpixel);
        fprintf('bmp_compression = %0.0f\n',   asctecFlirTau2.bmp_compression);
        fprintf('bmp_data_size = %0.0f\n',     asctecFlirTau2.bmp_data_size);
        fprintf('bmp_ppm_x = %0.0f\n',         asctecFlirTau2.bmp_ppm_x);
        fprintf('bmp_ppm_y = %0.0f\n',         asctecFlirTau2.bmp_ppm_y);
        fprintf('bmp_colors = %0.0f\n',        asctecFlirTau2.bmp_colors);
        fprintf('bmp_colors2 = %0.0f\n',       asctecFlirTau2.bmp_colors2);
        fprintf('version = %0.0f\n',           asctecFlirTau2.version);
        fprintf('checksum = %0.0f\n',          asctecFlirTau2.checksum);
        fprintf('mode = %0.0f\n',              asctecFlirTau2.mode);
        fprintf('trigger_counter = %0.0f\n',   asctecFlirTau2.trigger_counter);
        fprintf('bit_per_pixel = %0.0f\n',     asctecFlirTau2.bit_per_pixel);
        fprintf('byte_per_pixel = %0.0f\n',    asctecFlirTau2.byte_per_pixel);
        fprintf('color_min = %0.0f\n',         asctecFlirTau2.color_min);
        fprintf('color_max = %0.0f\n',         asctecFlirTau2.color_max);
        fprintf('cam_sernum = %0.0f\n',        asctecFlirTau2.cam_sernum);
        fprintf('cam_sernum_sensor = %0.0f\n', asctecFlirTau2.cam_sernum_sensor);
        fprintf('cam_version = %0.0f\n',       asctecFlirTau2.cam_version);
        fprintf('cam_fw_version = %0.0f\n',    asctecFlirTau2.cam_fw_version);
        fprintf('cam_sensortemperature = %0.0f\n', asctecFlirTau2.cam_sensortemperature);
        fprintf('cam_crc_error_cnt = %0.0f\n',     asctecFlirTau2.cam_crc_error_cnt);
        fprintf('cam_dcmi_error_cnt = %0.0f\n',    asctecFlirTau2.cam_dcmi_error_cnt);
        fprintf('cam_partnum = %0.0f\n',           asctecFlirTau2.cam_partnum);
        fprintf('time_ms = %0.0f\n',      asctecFlirTau2.time_ms);
        fprintf('gps_week = %0.0f\n',     asctecFlirTau2.gps_week);
        fprintf('gps_time_ms = %0.0f\n',  asctecFlirTau2.gps_time_ms);
        fprintf('gps_long = %0.7f\n',     asctecFlirTau2.gps_long);
        fprintf('gps_lat = %0.7f\n',      asctecFlirTau2.gps_lat);
        fprintf('gps_height = %0.3f\n',   asctecFlirTau2.gps_height);
        fprintf('gps_hor_accuracy = %0.3f\n',   asctecFlirTau2.gps_hor_accuracy);
        fprintf('gps_vert_accuracy = %0.3f\n',  asctecFlirTau2.gps_vert_accuracy);
        fprintf('gps_speed_accuracy = %0.3f\n', asctecFlirTau2.gps_speed_accuracy);
        fprintf('gps_speed_x = %0.3f\n',        asctecFlirTau2.gps_speed_x);
        fprintf('gps_speed_y = %0.3f\n',        asctecFlirTau2.gps_speed_y);
        fprintf('angle_pitch = %0.3f\n',        asctecFlirTau2.angle_pitch);
        fprintf('angle_roll = %0.3f\n',         asctecFlirTau2.angle_roll);
        fprintf('angle_yaw = %0.3f\n',          asctecFlirTau2.angle_yaw);
        fprintf('cam_angle_pitch = %0.3f\n',    asctecFlirTau2.cam_angle_pitch);
        fprintf('cam_angle_roll = %0.3f\n',     asctecFlirTau2.cam_angle_roll);
        fprintf('cam_angle_yaw = %0.3f\n',      asctecFlirTau2.cam_angle_yaw);
        fprintf('fw_version_major = %0.0f\n',   asctecFlirTau2.fw_version_major);
        fprintf('fw_version_minor = %0.0f\n',   asctecFlirTau2.fw_version_minor);
        fprintf('fw_version_build_count = %0.0f\n',  asctecFlirTau2.fw_version_build_count);
        fprintf('fw_version_timestamp = %0.0f\n',    asctecFlirTau2.fw_version_timestamp);
        fprintf('fw_version_svn_revision = %0.0f\n', asctecFlirTau2.fw_version_svn_revision);
        fprintf('startup_gps_long = %0.0f\n',        asctecFlirTau2.startup_gps_long);
        fprintf('startup_gps_lat = %0.0f\n',    asctecFlirTau2.startup_gps_lat);
        fprintf('startup_gps_height = %0.0f\n', asctecFlirTau2.startup_gps_height);
        fprintf('startup_gps_hor_accuracy = %0.0f\n',   asctecFlirTau2.startup_gps_hor_accuracy);
        fprintf('startup_gps_vert_accuracy = %0.0f\n',  asctecFlirTau2.startup_gps_vert_accuracy);
        fprintf('startup_gps_speed_accuracy = %0.0f\n', asctecFlirTau2.startup_gps_speed_accuracy);
        fprintf('startup_gps_speed_x = %0.0f\n', asctecFlirTau2.startup_gps_speed_x);
        fprintf('startup_gps_speed_y = %0.0f\n', asctecFlirTau2.startup_gps_speed_y);
        fprintf('tlinear = %0.0f\n',             asctecFlirTau2.tlinear);
        fprintf('tlinearResolution = %0.0f\n',   asctecFlirTau2.tlinearResolution);
        disp(' ');
        fprintf('File %s geographic info', filesListing(i,1:8))
        
%         geotiffwrite([filesListing(i,1:8), '.tif'], single(ThermalImage), ...
%             [asctecFlirTau2.gps_height asctecFlirTau2.gps_lat asctecFlirTau2.gps_long ]);
%  
%         tags.Compression = Tiff.Compression.None;
%         tags.ImageDescription = 'asctecFlirTau2.angle_roll';
%         
%         setTag(tiffobj, 32768, angle_roll)
               
        geotiffwrite([araFolder, '\', filesListing(i,1:8), '.tif'], single(ThermalImage), ...
            [asctecFlirTau2.gps_height asctecFlirTau2.gps_lat asctecFlirTau2.gps_long ]);
        geotiffinfo([araFolder, '\',filesListing(i,1:8)])
        xml_write([araFolder, '\', filesListing(i,1:8), '.xml'],asctecFlirTau2);

    end
end
