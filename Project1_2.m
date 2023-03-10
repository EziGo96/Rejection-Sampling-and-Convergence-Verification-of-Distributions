clc;close all;
cumsum_i=@cumsum_i;

y_norm_100=cumsum_i(x_norm_100_routine,'Normal');
figure;
histogram(y_norm_100,10,'Normalization', 'pdf');
title('y-norm-100-histogram');
y_norm_1000=cumsum_i(x_norm_1000_routine,'Normal');
figure;
histogram(y_norm_1000,100,'Normalization', 'pdf');
title('y-norm-1000-histogram');
y_norm_10000=cumsum_i(x_norm_10000_routine,'Normal');
figure;
histogram(y_norm_10000,500,'Normalization', 'pdf');
title('y-norm-10000-histogram');

y_unif_100=cumsum_i(x_unif_100_routine,'Uniform');
figure;
histogram(y_unif_100,10,'Normalization', 'pdf');
title('y-unif-100-histogram');
y_unif_1000=cumsum_i(x_unif_1000_routine,'Uniform');
figure;
histogram(y_unif_1000,100,'Normalization', 'pdf');
title('y-unif-1000-histogram');
y_unif_10000=cumsum_i(x_unif_10000_routine,'Uniform');
figure;
histogram(y_unif_10000,500,'Normalization', 'pdf');
title('y-unif-10000-histogram');

y_exp_100=cumsum_i(x_exp_100_routine,'Exponential');
figure;
histogram(y_exp_100,10,'Normalization', 'pdf');
title('y-exp-100-histogram');
y_exp_1000=cumsum_i(x_exp_1000_routine,'Exponential');
figure;
histogram(y_exp_1000,100,'Normalization', 'pdf');
title('y-exp-1000-histogram');
y_exp_10000=cumsum_i(x_exp_10000_routine,'Exponential');
figure;
histogram(y_exp_10000,500,'Normalization', 'pdf');
title('y-exp-10000-histogram');