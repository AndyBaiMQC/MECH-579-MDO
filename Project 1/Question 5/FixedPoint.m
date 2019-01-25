% Functions. Comment/uncomment to swictch
% f = @(x) x^2-4*x+4-log(x);
% g = @(x) 4+(log(x)-4)/x;
f = @(x) x+1-2*sin(pi*x);
g = @(x) asin((x+1)/2)*(1/pi);

% Global Conditions
p(1) = 0.5;
tol = 10^-5;
x_star = 0.681975;

%Initialize the array
n=2;
p(2) = g(p(1));

%%
while abs(p(n)-p(n-1)) >= tol
    p(n+1) = g(p(n));
    n = n+1;
end

%Error Convergence Plot
for i=2:n-1
    abs_error(i) = abs(p(i)-p(i-1));
end

plot(1:i,log(abs_error))
ylabel('ln(x(n+1)-x(n))')
xlabel('Number of iterations')
title('Convergence of the error')

%Table Builder
table=zeros(4);
I1=round(i/4);
I2=round(2*i/4);

table(1,:)=[1 p(1) f(p(1)) abs(f(p(1)-f(x_star)))];
table(2,:)=[I1 p(I1) f(p(I1)) abs(f(p(I1)-f(x_star)))];
table(3,:)=[I2 p(I2) f(p(I2)) abs(f(p(I2)-f(x_star)))];
table(4,:)=[i p(i) f(p(i)) abs(f(p(i)-f(x_star)))];

