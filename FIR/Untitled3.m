
% Fs = 10000; %����Ƶ�ʾ������������Ҳ���֮��ļ�� 
% N = 4096; %��������
% N1 = 0 : 1/Fs : (N-1)/Fs;
% s = sin(1000*2*pi*N1) + sin(3000*2*pi*N1) +sin(4000*2*pi*N1);
% fidc = fopen('C:\Users\fuwen\Desktop\FPGA_final\FIR_EDA_VERSION\project_3\mem.txt','wt');  
% for x = 1 : N
%    fprintf(fidc,'%x\n',round((s(x)+2.12)*58));
% end  
% fclose(fidc);  
 
Fs = 10000; %����Ƶ�ʾ������������Ҳ���֮��ļ��
N = 4096; %�������� 
N1 = 0 : 1/Fs :(N-1)/Fs;
in =sin(1000*2*pi*N1) + sin(3000*2*pi*N1) + sin(4000*2*pi*N1); 
coeff =[-0.0325,-0.0384,0.0784,0.2874,0.3984,0.2874,0.0784,-0.0384,-0.0325]; %�˲���ϵ��
out =conv(in,coeff);%����˲�
subplot(2,1,1);
plot(in);
xlabel('�˲�ǰ');
axis([0  200 -3 3]);
subplot(2,1,2);
plot(out);
xlabel('�˲���');
axis ([100 200 -2 2]);