function [rlcoef] = runlevel3(rcoef, sqr_size)

width = size(rcoef,2);

nullcount = 0;
notnullcount = 0;
count = 0;
rlcoef = [];
state = 0;
startstate = 0;

for i=1:width
    
    if (rcoef(1,i) == 0)
        
        nullcount = nullcount + 1;
        count = count + 1;
        
        if (notnullcount == 0 && count == sqr_size * sqr_size)
            rlcoef = [rlcoef 0 0];
        end
        if (count == sqr_size * sqr_size)
            rlcoef = [rlcoef 1];
            count = 0;
            nullcount = 0;
            notnullcount = 0;
            state = 1;
        end

    elseif (rcoef(1,i) ~=0)
        if (count < sqr_size * sqr_size && state == 0 && startstate == 1)
            rlcoef = [rlcoef 0];
        elseif (count == sqr_size * sqr_size)
            rlcoef = [rlcoef 1];
            count = 0;
        end
        
        if (count < sqr_size * sqr_size)
            notnullcount = notnullcount + 1;
        else
            notnullcount = 0;
        end
        state = 0;
        rlcoef = [rlcoef nullcount rcoef(1,i)];
        nullcount = 0;
        count = count + 1;
        startstate = 1;    
    end    
end