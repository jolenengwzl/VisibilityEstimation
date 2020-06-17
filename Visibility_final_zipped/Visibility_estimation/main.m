
% % Program consists of two parts, in default only DCP method is ON
% First part is dark prior channel method.
% Second is canny edge detection method.
% To make both methods work
% remove indexing of lines 18, 23, 30, 37, 38
% and lines 100 to 124
% also make sure that path in cd - line 14 is set correctly


clc; clear all; close all;


cd('C:\Users\dudek\Documents\MATLAB\Visibility_estimation');

file_ext = '.png';
file = {'foggycar'};
% ref = {'IMG_7411_RGB'};
scale = 1;

%filename operations
file = char(file);
% ref = char(ref);
disp(strcat('Process: ', file));


%read image and save it in results folder
imageRGB = imresize(readIm(file, file_ext), scale);
imwrite(imageRGB, fullfile('Results', strcat(file, file_ext)));
% imageref = imresize(readIm(ref, file_ext), scale);


%plottingimage
figure;
imshow(imageRGB);

% figure;
% imshow(imageref);

% text(2,8,'A Simple Plot','Color','red','FontSize',14);

% %split into R G B
% R = imageRGB(:,:,1);
% G = imageRGB(:,:,2);
% B = imageRGB(:,:,3);

%histograms plotting for R G B currently not using histograms, maybe in
%later development of code would be useful
% figure;
% h1 = histogram(R,'facecolor', 'red', 'EdgeColor', 'none');
% hold on
% h2 = histogram(G,'facecolor', 'green', 'EdgeColor', 'none');
% hold on
% h3 = histogram(B,'facecolor', 'blue', 'EdgeColor', 'none');


% figure;
% subplot(1,3,1)
% histogram(R,'facecolor', 'red', 'EdgeColor', 'none');
% subplot(1,3,2)
% histogram(G,'FaceColor', 'g', 'EdgeColor', 'none');
% subplot(1,3,3)
% histogram(B,'facecolor', 'blue', 'EdgeColor', 'none');


%First method
%Dark channel prior

dark = darkchannel(imageRGB);
imwrite(dark, fullfile('Results', strcat(file, '_dark', file_ext)));
% figure;
% imshow(dark);

%calculate atmospheric light
light = atmlight(imageRGB, dark);

%transmission map
trans = transmission(imageRGB, light);
imwrite(trans, fullfile('Results', strcat(file, '_trans', file_ext)));
%  figure;
%  imshow(trans);


%my proposed way to calculate visibility
visi = visibility(trans)
scale = scaling(visi)
ovr = overall(trans)

%write data on our image
soi = scaleonimage(imageRGB,scale);

% 
% %second method is canny edge algorithm
% %it applies for static camera and we need some base
% %so we need picture of object when there was no fog
% %then we can estimate fog by comparing edges matching
% 
 %Canny edge algorithm built in

%  imagegray = rgb2gray(imageRGB);
%   canny = edge(imagegray,'Canny');
%   figure;
%   imshow(canny);
% %  
% %  %canny edge for reference image
%   imagerefgray = rgb2gray(imageref);
%   cannyref = edge(imagerefgray, 'Canny');
%   figure;
%   imshow(cannyref);
% %  
% %  %doing intersection to prove it matches
%   inter = bitand(canny, cannyref);
%   figure;
%   imshow(inter);
% %  
% %  %calculating non zero elements
%   nbase = nnz(cannyref);
%   ninter = nnz(inter);
% %  
% %  %calculating matching of base and intersection
%   matching = ninter/nbase;
%   result = cannyresult(matching)
% 

