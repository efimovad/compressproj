% ОКРУГЛЯТЬ ВНЕ ФУНКЦИИ
function quant_coef = jpeg_quan8(coef, sqr_size, reverse)

% Таблица квантования из стандарта JPEG для значений яркости
a = [ 16 11 10 16 24 40 51 61;
      12 12 14 19 26 58 60 55;
      14 13 16 24 40 57 69 56;
      14 17 22 29 51 87 80 62;
      18 22 37 56 68 109 103 77;
      24 35 55 64 81 104 113 92;
      49 64 78 87 103 121 120 101;
      72 92 95 98 112 100 103 99];

quant_coef = zeros(size(coef));
width = size(coef, 2); % длина строки
length = size(coef, 1); % колво строк
  
if (sqr_size ~= 8)
    error('Подходит только для блоков 8х8');
end

% инициализация текущего блока коэффициентов нулями
block = zeros(sqr_size,sqr_size);


for i=1:sqr_size:width-sqr_size+1
    for j=1:sqr_size:length-sqr_size+1
        
        % разбиение на блоки
        for l=1:sqr_size
            for k=1:sqr_size
                block(l,k) = coef(i+l-1,j+k-1);
            end
        end
        if (reverse == 0)
            block = block/a;
            %block = block/a;
        else 
            block = block*a;
            %block = block*a;
        end
        quant_coef(i:i+sqr_size - 1,j:j+sqr_size - 1) = block;

    end
end


