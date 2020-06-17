function A = atmlight(im_input, dark_image)

% vector and sort operations to find closest to 1 atmospheric light

[height, width, ~] = size(im_input);
imsize = width * height;

range = floor(imsize/1000);
dark_J_vector = reshape(dark_image,imsize,1); 
input_im_vector = reshape(im_input,imsize,3);  

[dark_J_vector, indices] = sort(dark_J_vector); 
indices = indices(imsize-range+1:end); 

atmSum = zeros(1,3);
for ind = 1:range
    atmSum = atmSum + input_im_vector(indices(ind),:);
end

A = atmSum / range;