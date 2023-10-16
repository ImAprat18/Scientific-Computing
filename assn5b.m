x = [0:0.01:1];
function y = f (x, A, B, C, D);
  y = A*x^3+B*x^2+C*x+D;
endfunction;
sx = size(x);
topval = sx(1,2);
yval = zeros(1,topval);
for t = 1:topval,
  yval(1,t) = f (x(1,t), 1, -1.62, 0.77251, -0.10750525);
endfor;
y_noise = zeros(1, topval);
for l = 1:topval,
  y_noise(1,l) = yval(1,l) + rand()*0.04+-0.02;
endfor;
coeff = polyfit(x,y_noise,3);
y_fit = zeros(1,topval);
for m = 1:topval,
  y_fit(1,m) = f (x(1,m), coeff(1,1), coeff(1,2), coeff(1,3), coeff(1,4));
endfor;
plot(x,yval, 'b', 'Linewidth', 0.5); hold on
plot(x,y_fit, 'g', 'Linewidth', 0.5); hold on
plot(x,y_noise, 'r--', 'Linewidth', 1); title("Polynomial function for x between 0 and 1");xlabel("x");ylabel("f(x)");legend("Polynomial y=f(x)", "Polynomial with poly-fitted coefficients", "Polynomial y=f(x) with noise");
expression = ['y = ' num2str(coeff(1,1)) 'x^3 + ' num2str(coeff(1,2)) 'x^2 + ' num2str(coeff(1,3)) 'x + ' num2str(coeff(1,4))]
disp("The original polynomial used is:"), disp("y = x^3 - 1.62x^2 + 0.77251x - 0.10750525");
disp("A = "), disp(coeff(1,1));
disp("B = "), disp(coeff(1,2));
disp("C = "), disp(coeff(1,3));
disp("D = "), disp(coeff(1,4));
disp("The final fitted polynomial is given as:"), disp(expression);
