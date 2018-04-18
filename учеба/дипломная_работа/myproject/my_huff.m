function [code, avglen] = my_huff(coef, reor_coef, sqr_size) 

code = [];
code_len = 0;

length = size(coef,1);
width = size(coef,2);

reorlen = size(reor_coef,2);

maxblock = zeros(sqr_size, sqr_size);
minblock = zeros(sqr_size, sqr_size);

maxv = max(max(coef));
minv = min(min(coef)); 

% for i=1:length/sqr_size
%     for j=1:width/sqr_size
%         block = coef(((i-1)*8+1):((i-1)*8+8), (((j-1)*8+1):((j-1)*8+8)));
%         if (maxv < max(max(block)))
%             maxv = max(max(block));
%             maxblock = block;
%         end
%         if (minv > min(min(block)))
%             minv = min(min(block));
%             minblock = block;
%         end
%     end
% end
% minv
%[p, symbols] = form_pos([maxblock minblock]);
[p, symbols] = form_pos(coef);
[dict,avglen] = huffmandict(symbols,p);

for i=1:reorlen
        coef_numb = reor_coef(i)-(minv-1);
        if (coef_numb <= size(dict,1) && coef_numb > 0)
            code = [code dict{coef_numb,2}];
        else
            error('Попытка закодировать коэффициент, лежащий вне таблицы');
        end
end


