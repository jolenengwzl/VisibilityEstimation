function dark = darkchannel(im_input)

[height, width, ~] = size(im_input);

patch_size = 15; 
pad_size = 7; 


dark = zeros(height, width); % the dark channel

pad_added = padarray(im_input, [pad_size pad_size], Inf);

for j = 1:height
    for i = 1:width
        
        patch = pad_added(j:(j+patch_size-1), i:(i+patch_size-1),:);
        
        dark(j,i) = min(patch(:));
        
        
     end
end


