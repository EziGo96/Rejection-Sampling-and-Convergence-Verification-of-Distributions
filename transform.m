function [Y] = transform(X)
Y=zeros(size(X));
    for i =1:length(X)
        Y(i,1)=sum(X(1:i,1))/i;
    end
end