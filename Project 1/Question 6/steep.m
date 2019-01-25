% Initalizaing
X = 0;
Y = 0;
CONVERGENCE = 0;
x = 1;
y = 1;

% Defining function and parameters
f = (x - 1)^2 + 100*(- x^2 + y)^2;
grad = [2*x - 400*x*(- x^2 + y) - 2 ; - 200*x^2 + 200*y];
p_k_formula =  [400*x*(- x^2 + y) - 2*x + 2;  200*x^2 - 200*y];
hess = [ 1200*x^2 - 400*y + 2, -400*x; -400*x,    200];

% Defining computing conditions
k=0;
limit = 100000;
tol = 0.01;
alpha = 0.0005; % We could try other values, and usually small alpha work
theC = 10^(-4);
rho = 0.9;
x = 3;
y = 4;
p_k = [400*x*(- x^2 + y) - 2*x + 2;  200*x^2 - 200*y];

% Looping through
while(1)
    epsilon = norm([2*x - 400*x*(- x^2 + y) - 2 ; - 200*x^2 + 200*y]);
    k=k+1;

    CONVERGENCE(k) = epsilon;
    X(k) = x;
    Y(k) = y;
    
    % Break if reach tolerance or limit
    if (epsilon < tol)
        break;
    end  
    if (k==limit)
        break;
    end 
   
    % Updating
    x_old = x;
    y_old = y;
    x = x_old + alpha * p_k(1);
    y = y_old + alpha * p_k(2);
    p_k = [400*x*(- x^2 + y) - 2*x + 2;  200*x^2 - 200*y];
end

%Plotting 
semilogy(CONVERGENCE)
xlabel('Number of iterations')
ylabel('Norm of \nablaf(x,y)')
title('Convergence of Gradient')
grid on
size = 5;
a = linspace(-size,size);
b = linspace(-size,size);
[A,B] = meshgrid(a,b);
C = (1-A).^2+100*((B-(A.^2)).^2);
levels = 100:100:100;
figure
hold on
contour(A,B,C,200)
plot(X,Y)
plot(3,4,'g*')
plot(x,y,'r*')
legend('\nablaf(x,y)','Path','Start','End')
xlabel('X')
ylabel('Y')
title('Contour Plot and Algorithm Path')