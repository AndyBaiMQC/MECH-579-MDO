% Functions. Comment/uncomment to swictch
%f = @(x) x^2-4*x+4-log(x);
f = @(x) x+1-2*sin(pi*x);

% Global Conditions
low = 0.5;
high = 1;
tol = 10^-5;
x_star = 0.681975;

%Initialize the array
n=1;
a(1) = low;
b(1) = high;
%%
while abs(b(n)-a(n)) >= tol
    r = (b(n)+a(n))/2;
    if f(r)*f(a(n)) > 0
        a(n+1) = r;
        b(n+1) = b(n);
    else
        b(n+1) = r;
        a(n+1) = a(n);
    end
    approx(n) = (a(n)+b(n))/2; 
    n = n+1;
end

%Error Convergence Plot
for i=2:n-1
    abs_error(i) = abs(approx(i)-approx(i-1));
end

plot(1:i,log(abs_error))
ylabel('ln(x(n+1)-x(n)')
xlabel('Number of iterations')
title('Convergence of the error')

%Table Builder
table=zeros(4);
I1=round(i/4);
I2=round(2*i/4);

table(1,:)=[1 approx(1) f(approx(1)) abs(f(approx(1)-f(x_star)))];
table(2,:)=[I1 approx(I1) f(approx(I1)) abs(f(approx(I1)-f(x_star)))];
table(3,:)=[I2 approx(I2) f(approx(I2)) abs(f(approx(I2)-f(x_star)))];
table(4,:)=[i approx(i) f(approx(i)) abs(f(approx(i)-f(x_star)))];

