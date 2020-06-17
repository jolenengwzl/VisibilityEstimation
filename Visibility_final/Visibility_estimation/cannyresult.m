function result = cannyresult(image)



if  image >= 0.8
        result = 5;
    elseif image >= 0.65
        result = 4;  
    elseif image >= 0.4
        result = 3;
    elseif image >= 0.2
        result = 2;   
    elseif image >= 0
        result = 1;
    else 
        result(i,j) = -1;
end
