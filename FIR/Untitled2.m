Fs=10000;
N=4096;
N1=0:1/Fs:(N-1)/Fs;
s=sin(1000*2*pi*N1)+sin(3000*2*pi*N1)+sin(4000*2*pi*N1);
fidc=fopen('E:\Vivado\2018.3\FIR\mem.txt','wt');
for x=1:N
    fprintf(fidc,'%x\n',round((s(x)+2.12)*58));
end
fclose(fidc);
