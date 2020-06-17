function soi = scaleonimage(image, scale)

H = size(image,1)/3;
W = size(image,2)/3;
C = size(image,1)/15;

heightpart = floor(H);
widthpart = floor(W);

figure;
imshow(image);

for i = 0:2
    for j = 0:2
    
    B = scale(i+1,j+1);
    
    X = floor(widthpart/2);
    Y = floor(heightpart/2);
    
    X = X+widthpart*j;
    Y = Y+heightpart*i;
    
    switch B
        case 1
          text(X,Y,'1','Color','#8c8c8c','FontSize',C);
        case 2
          text(X,Y,'2','Color','#8c8c8c','FontSize',C); 
        case 3
          text(X,Y,'3','Color','#404040','FontSize',C); 
        case 4
          text(X,Y,'4','Color','#8c8c8c','FontSize',C); 
        case 5
          text(X,Y,'5','Color','#8c8c8c','FontSize',C); 
    end
    
    
       
    end
end

soi = 1;


end