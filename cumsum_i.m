function [Y] = cumsum_i(X,distribution)
    Y = X;
    if strcmp(distribution,'Normal')
        for i=1:length(X)-1
            Y = Y+normrnd(2,sqrt(2),size(X));
        end
        
    elseif strcmp(distribution,'Uniform')
        for i=1:length(X)-1
            Y = Y+unifrnd(2,4,size(X));
        end
    elseif strcmp(distribution,'Exponential')
        for i=1:length(X)-1
            Y = Y+exprnd(1/2,size(X));
        end
    else
        disp("Unspecified Distribution!");
    end
    Y = Y/length(X);
end