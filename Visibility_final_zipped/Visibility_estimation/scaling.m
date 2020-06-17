function scale = scaling(visi)

scale = zeros(3,3);

for i = 1:3
    for j = 1:3
    if  visi(i,j) >= 0.7
        scale(i,j) = 5;
    elseif visi(i,j) >= 0.55
        scale(i,j) = 4;  
    elseif visi(i,j) >= 0.4
        scale(i,j) = 3;
    elseif visi(i,j) >= 0.2
        scale(i,j) = 2;   
    elseif visi(i,j) >= 0
        scale(i,j) = 1;
    else 
        scale(i,j) = -1;
    end
    end
    
end


