
% method позволяет выбрать вид переупорядочивания
% при method = 1 : zig zag (frame block) подходит для DCT
% при method = 2 : zig zag (field block) подходит для DCT для блоков 8х8
% при method = 3 : tree подходит для DWT
function reor_coef = reordering(coef, method, depth)
switch method
    case 1
        reor_coef = zigzag(coef);
    case 2
        reor_coef = zigzag_field(coef);
    case 3
        reor_coef = tree(coef, depth);
    otherwise 
        error('Неверный параметр метода преобразования');
end