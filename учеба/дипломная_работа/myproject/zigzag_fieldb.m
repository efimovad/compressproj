function reor_coef = zigzag_fieldb(coef)

length = size(coef,1);
width = size(coef,2);

reor_coef = zeros(1, length*width);

if (width == 4)
    order = [1,1; 2,1; 1,2; 3,1; 
             4,1; 2,2; 3,2; 4,2; 
             1,3; 2,3; 3,3; 4,3;
             1,4; 2,4; 3,4; 4,4];
end

if (width == 8)
    order = [1,1; 2,1; 3,1; 1,2; 2,2; 4,1; 5,1; 3,2; 
             1,3; 4,2; 6,1; 7,1; 8,1; 5,2; 2,3; 1,4; 
             3,3; 6,2; 7,2; 8,2; 4,3; 2,4; 1,5; 3,4; 
             5,3; 6,3; 7,3; 8,3; 4,4; 2,5; 1,6; 3,5; 
             5,4; 6,4; 7,4; 8,4; 4,5; 2,6; 1,7; 3,6; 
             5,5; 6,5; 7,5; 8,5; 4,6; 2,7; 1,8; 3,7; 
             5,6; 6,6; 7,6; 8,6; 4,7; 2,8; 3,8; 5,7; 
             6,7; 7,7; 8,7; 4,8; 5,8; 6,8; 7,8; 8,8];
end

for i=1:length*width
    n = order(i,1);
    m = order(i,2);
    reor_coef(1,i) = coef(n,m); 
end