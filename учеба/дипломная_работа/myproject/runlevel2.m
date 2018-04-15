function [rlcoef] = runlevel2(rcoef)

width = size(rcoef,2);
%state = 0;
ncount = 0;
rlcoef = [];

for i=1:width
    if (rcoef(1,i) == 0)
        ncount = ncount + 1;
    elseif (rcoef(1,i) ~=0)
        rlcoef = [rlcoef ncount rcoef(1,i)];
        ncount = 0;
    end    
end