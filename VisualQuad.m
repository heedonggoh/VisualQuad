%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualization of a quadratic equation in a complex plane %%
% 0 = a*x^2+b*x+c := P(x)
% by Heedong Goh <wellposed@gmail.com> 20171028
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
close all;
%% Inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% coefficients
a=2;
b=3;
c=2;
% mesh 
nm=40;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Discriminant and solutions
Discriminant=b*b-4*a*c
solutions=roots([a,b,c])
%% Plot in a complex plane 
maxs=max(abs(solutions));
dx=4*(maxs*1.01)/nm;
x=-2*(maxs*1.01):dx:2*(maxs*1.01);
N=max(size(x));
cdata=zeros(N,N);
rdata=zeros(1,N);
yz=zeros(1,N);
for ii=1:N
  for jj=1:N
    loc=x(ii)+1i*x(jj);
    cdata(ii,jj)=a*loc*loc+b*loc+c;
  end
  rdata(ii)=a*x(ii)*x(ii)+b*x(ii)+c;
end
figure;
surf(x,x,abs(cdata));
colormap rainbow
%alpha(.4) % for matlab
line(yz,x,rdata,'linewidth',2);
xlabel('imag x');
ylabel('real x');
zlabel('abs P(x)');
legend('complex x','real x');
title(strcat('solution=',num2str(solutions)));
