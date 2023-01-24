function [z] = Unif_pdf(x)
    z=(1/(4-2)).*(x>=2 & x<=4);
end