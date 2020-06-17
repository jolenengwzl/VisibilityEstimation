function visi = visibility(transm)

H = size(transm,1)/3;
W = size(transm,2)/3;

heightpart = floor(H);
widthpart = floor(W);

for i = 0:2
    for j = 0:2
    
    B = transm((1+(i*heightpart)):((1+i)*heightpart),  (1+(j*widthpart)):((1+j)*widthpart) );
    
    Result(1+i,1+j) = mean(B,'all');
    
    
    end
end


visi = Result;

end

