
% Fs = 10000; %采样频率决定了两个正弦波点之间的间隔 
% N = 4096; %采样点数
% N1 = 0 : 1/Fs : (N-1)/Fs;
% s = sin(1000*2*pi*N1) + sin(3000*2*pi*N1) +sin(4000*2*pi*N1);
% fidc = fopen('C:\Users\fuwen\Desktop\FPGA_final\FIR_EDA_VERSION\project_3\mem.txt','wt');  
% for x = 1 : N
%    fprintf(fidc,'%x\n',round((s(x)+2.12)*58));
% end  
% fclose(fidc);  
 
Fs = 10000; %采样频率决定了两个正弦波点之间的间隔
N = 4096; %采样点数 
N1 = 0 : 1/Fs :(N-1)/Fs;
in =sin(1000*2*pi*N1) + sin(3000*2*pi*N1) + sin(4000*2*pi*N1); 
coeff =[-0.0325,-0.0384,0.0784,0.2874,0.3984,0.2874,0.0784,-0.0384,-0.0325]; %滤波器系数
out =conv(in,coeff);%卷积滤波
subplot(2,1,1);
plot(in);
xlabel('滤波前');
axis([0  200 -3 3]);
subplot(2,1,2);
plot(out);
xlabel('滤波后');
axis ([100 200 -2 2]);