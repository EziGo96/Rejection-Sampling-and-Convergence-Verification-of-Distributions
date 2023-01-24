function [z] = Norm_pdf(x)
    z=exp((-(x-2).^2)/(2*2))/sqrt(2*pi*2);
end