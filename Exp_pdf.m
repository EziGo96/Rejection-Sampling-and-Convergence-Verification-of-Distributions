function [z] = Exp_pdf(x)
    z=2*exp(-2*x).*(x>=0);
end