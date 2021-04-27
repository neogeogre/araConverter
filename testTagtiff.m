clc; clear all
% %t = Tiff('example.tif','r+');
% t = Tiff('00000002.tif','r+');

t = Tiff('00000002.tif','r+');

tagstruct.ImageLength = size(t,1)
tagstruct.ImageWidth = size(t,2)
tagstruct.Photometric = Tiff.Photometric.RGB
tagstruct.BitsPerSample = 8
tagstruct.SamplesPerPixel = 3
tagstruct.RowsPerStrip = 16
tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky
tagstruct.Software = 'MATLAB'
tagstruct.SubIFD = 2  % required to create subdirectories
t.setTag(tagstruct)

t.writeDirectory();

tagstruct2.ImageLength = size(t,1)
tagstruct2.ImageWidth = size(t,2)
tagstruct2.Photometric = Tiff.Photometric.RGB
tagstruct2.BitsPerSample = 8
tagstruct2.SamplesPerPixel = 3
tagstruct2.RowsPerStrip = 16
tagstruct2.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky
tagstruct2.Software = 'MATLAB'
t.setTag(tagstruct2)

t.writeDirectory();

tagstruct3.ImageLength = size(t,1)
tagstruct3.ImageWidth = size(t,2)
tagstruct3.Photometric = Tiff.Photometric.RGB
tagstruct3.BitsPerSample = 8
tagstruct3.SamplesPerPixel = 3
tagstruct3.RowsPerStrip = 16
tagstruct3.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky
tagstruct3.Software = 'MATLAB'
tagstruct3.chiant = '5465sdf'
t.setTag(tagstruct3)

t.close();

% geotiffinfo('00000002')

%%
setTag(t,Tiff.TagID.ImageWidth,size(imdata,2))

setTag(t,'Photometric', Tiff.Photometric.RGB)
setTag(t,'PlanarConfiguration', Tiff.PlanarConfiguration.Chunky)

tagStruct.BitsPerSample = 8;
tagStruct.SamplesPerPixel = 3;
tagStruct.TileWidth = 128;
tagStruct.TileLength = 128;
tagStruct.Compression = Tiff.Compression.JPEG;
tagStruct.Software = 'MATLAB';
setTag(t,tagStruct)

write(t,imdata)
close(t)




imdata = imread('example.tif');
imshow('example.tif')
%imdata = imread('00000002.tif');
t = Tiff('myfile.tif','w');

setTag(t,Tiff.TagID.ImageLength,size(imdata,1))
setTag(t,Tiff.TagID.ImageWidth,size(imdata,2))

setTag(t,'Photometric', Tiff.Photometric.RGB)
setTag(t,'PlanarConfiguration', Tiff.PlanarConfiguration.Chunky)

tagStruct.BitsPerSample = 8;
tagStruct.SamplesPerPixel = 3;
tagStruct.TileWidth = 128;
tagStruct.TileLength = 128;
tagStruct.Compression = Tiff.Compression.JPEG;
tagStruct.Software = 'MATLAB';
setTag(t,tagStruct)

write(t,imdata)
close(t)


% Write a WMS image to a GeoTIFF file.
% nasa = wmsfind('nasa', 'SearchField', 'serverurl');
% layerName = 'bluemarbleng';
% layer = nasa.refine(layerName,  'SearchField', 'layername', ...
%     'MatchType', 'exact');
% [A, R] = wmsread(layer(1));
% filename = [layerName '.tif'];
% geotiffwrite(filename, A, R)
% figure
% worldmap world
% geoshow(filename)