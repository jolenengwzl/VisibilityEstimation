function ovr = overall(transm)

tmp = mean(transm,'all');

if  tmp >= 0.7
        ovr = 5;
    elseif tmp >= 0.55
        ovr = 4;  
    elseif tmp >= 0.4
        ovr = 3;
    elseif tmp >= 0.2
        ovr = 2;   
    elseif tmp >= 0
        ovr = 1;
    else 
        ovr(i,j) = -1;
end
