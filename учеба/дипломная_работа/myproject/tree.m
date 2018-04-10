function reor_coef = tree(coef, depth)

heigth = size(coef,1);
reor_coef = zeros(1, heigth * heigth);
n = 1;

root_heigth = heigth/2^depth; % размер самого маленького квадрата

if (root_heigth<1) 
    error('Недопустимое значение глубины дерева');
end

for i = 1:root_heigth
    for j = 1:root_heigth
        reor_coef(1,n) = coef(i, j);
        n = n + 1;
        step = root_heigth;
        num_pix = 1;
        
        for k = 1:depth % для всех уровней  
            
            for l = 1:sqrt(num_pix) % по каждой строчке квадрата  
                reor_coef(n:n + sqrt(num_pix) - 1) = ...
                                   coef((i+step+l-1), j:j+sqrt(num_pix)-1);
                n = n + sqrt(num_pix);
            end
            
            step = step * 2;
            num_pix = num_pix * 4;
        end
        
        step = root_heigth;
        num_pix = 1;
        
        for k = 1:depth % для всех уровней  
            
            for l = 1:sqrt(num_pix) % по каждой строчке квадрата
                reor_coef(n:n + sqrt(num_pix) - 1) = ...
                                   coef((i+l-1), (j+step):(j+step+sqrt(num_pix)-1));
                n = n + sqrt(num_pix);
            end
            
            step = step * 2;
            num_pix = num_pix * 4;
        end
        
        step = root_heigth;
        num_pix = 1;
        
        for k = 1:depth % для всех уровней  
            
            for l = 1:sqrt(num_pix) % по каждой строчке квадрата 
                reor_coef(n:n + sqrt(num_pix) - 1) = ...
                                   coef((i+l+step-1), (j+step):(j+step+sqrt(num_pix)-1));
                n = n + sqrt(num_pix);
            end
            
            step = step * 2;
            num_pix = num_pix * 4;
        end
    end
end