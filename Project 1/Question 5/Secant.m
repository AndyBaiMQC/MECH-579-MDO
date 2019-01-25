% Functions. Comment/uncomment to swictch
f = @(x) x+1-2*sin(pi*x);
%f = @(x) x^2-4*x+4-log(x);

% Global Conditions
low = 0.5;
high = 1;
r0 = 0.5;
r1 = 1;
tol = 10^-5;
x_star = 0.681975;

%Initialize
n=1;
r = r1 - f(r1)*(r1-r0)/(f(r1)-f(r0));
approx(n) = r;

%%
while abs(r-r1) >= tol
    r0 = r1;
    r1 = r;
    r = r1 - f(r1)*(r1-r0)/(f(r1)-f(r0));
    n = n+1;
    approx(n) = r;
end

%Error Convergence Plot
for i=2:n-1
    abs_error(i) = abs(approx(i)-approx(i-1));
end

plot(1:i,log(abs_error))
ylabel('ln(x(n+1)-x(n))')
xlabel('Number of iterations')
title('Convergence of the error')

%Table Builder
table=zeros(4);
I1=2%round(i/4);
I2=round(2*i/4);

table(1,:)=[1 approx(1) f(approx(1)) abs(f(approx(1)-f(x_star)))];
table(2,:)=[I1 approx(I1) f(approx(I1)) abs(f(approx(I1)-f(x_star)))];
table(3,:)=[I2 approx(I2) f(approx(I2)) abs(f(approx(I2)-f(x_star)))];
table(4,:)=[i approx(i) f(approx(i)) abs(f(approx(i)-f(x_star)))];

