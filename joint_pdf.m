function [z] = joint_pdf(x,y)
    if x>0 && x<=1 && y>0 && y<=1
        z=x+3/2*y^2;
    else
        z=0;
    end
end