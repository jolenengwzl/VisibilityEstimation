function im = readIm(image, ext)
cd 'Dataset'
im = imread(strcat(image, ext));
cd ..

im = double(im);
im = im./255;