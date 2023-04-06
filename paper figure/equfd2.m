function dx=equfd2(t,x,epsilon,theta,rd,N,c,a,alpha,beta) 
dx=zeros(2,1); 
if mod(floor(t/pi*a),2) == 0
    w = 1.3;
else
    w = 0.7;
end
    dx(1)=x(1)*(1-x(1))*c*((x(2)/N/(1-w)*(1-w*(1-x(1)+w*x(1))^(N-1))-1)-rd/N/(1-w)*(1-(1-x(1)+w*x(1))^(N-1)));
    dx(2)=epsilon*(x(2)-alpha)*(beta-x(2))*(-x(1)*c*(x(2)/N/(1-w)*(1-w*(1-x(1)+w*x(1))^(N-1))-1)+theta*(1-x(1))*c*rd/N/(1-w)*(1-(1-x(1)+w*x(1))^(N-1)));

end