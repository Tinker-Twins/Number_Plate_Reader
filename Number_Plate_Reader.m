close all;
clear all;
warning('off', 'Images:initSize:adjustingMag');

%To find location of number plate.
im = imread('Test Images\Car 7.jpg');
im = imresize(im, [480 NaN]);
imgray = rgb2gray(im);
imbin = imbinarize(imgray);
im = edge(imgray, 'sobel');

im = imdilate(im, strel('diamond', 2));
im = imfill(im, 'holes');
im = imerode(im, strel('diamond', 10));

Iprops=regionprops(im,'BoundingBox', 'Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end    

im = imcrop(imbin, boundingBox);

%Resize the number plate to 240 NaN.
im = imresize(im, [240 NaN]);

%Clear dust.
im = imopen(im, strel('rectangle', [4 4]));

%Remove some objects if width is too long or too small than 500.
im = bwareaopen(~im, 500);

%Get size.
[h, w] = size(im);

imshow(im);

%Read the number plate.
Iprops=regionprops(im,'BoundingBox', 'Area', 'Image');
count = numel(Iprops);

%Initializing a variable for number plate string.
NumberPlate=[];

for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow<(h/2) && oh>(h/3)
       letter = Read_Function(Iprops(i).Image);     %Reading the letter corresponding the binary image 'N'.
       NumberPlate = [NumberPlate letter];          %Appending every subsequent character in NumberPlate variable.
   end
end
file = fopen('License Number.txt', 'wt');
fprintf(file,'%s',NumberPlate);
fclose(file);
winopen('License Number.txt')