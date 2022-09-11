%fplot(@(x)sin(x.^2),[-pi,pi])

%{
rng(0,"twister");
a=0;
b=100;
r_1 = (b-a).*rand(1,1) + a;
r_2= (b-a).*rand(1,1) + a;
p = [1 -4 0 1];
disp(r_1);
disp(r_2);
if (r_1)<(r_2)
    fplot(@(x) polyval(p,x), [r_1 r_2]);
else
    fplot(@(x) polyval(p,x), [r_2 r_1]);
end
%}

syms x;
p = x^3-4*x^2+1 ;
fplot(p, [-1 4]);
resp=solve(p,x,'MaxDegree',3);
disp(resp);
VpaN=vpa(resp);
doubleN=double(VpaN);
disp(doubleN);

resp=vpasolve(p);
disp(resp);

%{
La de ahora da la misma respuesta que la siguiente
SymN=sym(resp);
doubleN=double(SymN);
disp(doubleN);
%}

resp=roots(sym2poly(p));
disp(resp);
p = @(x) x.^3-4*x.^2+1; 
suma=0;
for i=1:(length(resp)-1)
    integN=abs(integral(p,resp(i),resp(i+1)));
    suma=suma+integN;
end 
disp(suma);

syms x;
p = x.^3-4*x.^2+1; 
xcrit = solve(diff(p, x),x);
mini=min(resp);
maxi=max(resp);
xcrit(xcrit < mini | xcrit > maxi) = [];
xcrit = unique([xcrit; mini; maxi]);
ycrit = subs(p,x,xcrit);
[miny, minidx] = min(ycrit);
fprintf('minimum is %g at %g\n', miny, xcrit(minidx));
[maxy, maxidx] = max(ycrit);
fprintf('maximum is %g at %g\n', maxy, xcrit(maxidx));

f = @Compute;
xcrit = solve(diff(p, x),x);
for i =1:length(xcrit)
    fprintf('Critic y is %g at %g\n', f(xcrit(i)), xcrit(i));
end


function p=Compute(x)  
p = x.^3-4*x.^2+1;
end











