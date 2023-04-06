a = 5;
delta = 0;
t = 0:0.01:10;
w1 = zeros(1,length(t));
w2 = w1;

figure(1)
for i = 1:length(t)
    if mod(floor(t(i)/pi*a),2) == 0
        w1(i)=0.8;
    else 
        w1(i) = 1.2;
    end
end
plot(t,w1);
axis([0 10 0.5 1.5]);
set(gca,'XTick','');
set(gca,'YTick','');
xlabel('t');
ylabel('w(t)');

figure(2)
for i = 1:length(t)
    if sin(a*t+delta)>=0
        w2(i) = 1/(1+sin(a*t(i)+delta));
    else 
        w2(i) = 1-0.5*sin(a*t(i)+delta);
    end
end
plot(t,w2);
axis([0 10 0 2]);
set(gca,'XTick','');
set(gca,'YTick','');
xlabel('t');
ylabel('w(t)');