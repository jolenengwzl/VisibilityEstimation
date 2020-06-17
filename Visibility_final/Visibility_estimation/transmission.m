function trans = transmission(im_input, A)

omega = 1; 

im_div_light = zeros(size(im_input));




for c = 1:3 
    im_div_light(:,:,c) = im_input(:,:,c)./A(c);
end



trans = 1-omega*darkchannel(im_div_light);
