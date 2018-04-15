function reord_coef = zigzag_field(coef)

if (size(coef,1) ~= 8)
    error('Поддерживает только блоки 8х8');
end

[maxh, maxv] = size(coef);
reord_coef = zeros(1, maxh*maxv);
v = 1;
h = maxh/2;
n = maxh/2;

reord_coef(1:n) = coef(1:h, v);
n = n + 1;
h = 1;
v = v + 1;

while (n < 53)

    reord_coef(n) = coef(h,v);
    
    reord_coef(n+1:n+maxh/8) = coef(h+1:(h+maxh/8),v);
    n = n + maxh/8 + 1;
    %h = h - maxh/8;
    v = v + 1;
    reord_coef(n) = coef(h,v);
    
    reord_coef(n+1:n+maxh/8) = coef(h+1:(h+maxh/8),v);
    
    n = n + maxh/8 + 1;
    h = h + maxh/4;
    % h = h + maxh/8;
    v = v - 1;
    reord_coef(n) = coef(h,v);
    
    reord_coef(n+1:n+maxh/8) = coef(h+1:(h+maxh/8),v);
    
    n = n + maxh/8 + 1;
    h = h + maxh/4;
    v = v - 1;
    reord_coef(n) = coef(h,v);
    
    reord_coef(n+1:n+maxh/2-1) = coef(h+1:(h+maxh/2-1),v);
    
    n = n + maxh/2;
    v = v + 1;
    h = maxh;
    reord_coef(n:n+maxh/2-1) = coef(h:-1:(h-maxh/2+1),v);
    
    h = h - maxh/2 - (maxh/8 - 1) ;
    v = v + 1;
    n = n + maxh/2 ;
    
    reord_coef(n:n+maxh/4-1) = coef(h:-1:h-maxh/4+1,v);
    
    n = n + maxh/4;
    v = v + 1;
    h = 1;
end

reord_coef(n:n+maxh/2 - 1) = coef(h:h+maxh/2-1,v);
reord_coef(n:n+maxh/2 - 1) = coef(h:h+maxh/2-1,v);

n = n + maxh/2;
v = v + 1;
h = h + maxh/2 - 1;
reord_coef(n:n+maxh/2 - 1) = coef(h:-1:h-maxh/2+1,v);





