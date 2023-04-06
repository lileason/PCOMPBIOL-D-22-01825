%% paper--N
clc,clear

N1 = 4;
N2 = 6;


theta = 0.5;
c = 1;
alpha = 1.5;
beta = 3.5;
x0 = theta/(theta+1);
a = 0.1;
epsilon = 6;
delta = 0;
rd = 1;
w = 0.5:0.001:1.5;

h = 0.05;
tf = 400;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

r1 = (N1.*(w-1)+rd.*((w.*x0-x0+1).^(N1-1)-1))./(w.*(w.*x0-x0+1).^(N1-1)-1);
e1 = (r1.*w-rd).*(N1-1).*(w.*theta+1).^(N1-2).*(w-1)./(r1-alpha)./(beta-r1)./(w.*(w.*theta+1).^(N1-1)-(1+theta).^(N1-1));
r2 = (N2.*(w-1)+rd.*((w.*x0-x0+1).^(N2-1)-1))./(w.*(w.*x0-x0+1).^(N2-1)-1);
e2 = (r2.*w-rd).*(N2-1).*(w.*theta+1).^(N2-2).*(w-1)./(r2-alpha)./(beta-r2)./(w.*(w.*theta+1).^(N2-1)-(1+theta).^(N2-1));

emax1 = max(e1);  emin1 = min(e1);
emax2 = max(e2);  emin2 = min(e2);

%% 离散
figure(1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equfd,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N1,c,a);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
box on
hold off



figure(2)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equfd,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N2,c,a);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
box on
hold off

%% 连续
figure(3)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a,delta,epsilon,theta,rd,N1,c);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
box on
hold off


figure(4)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a,delta,epsilon,theta,rd,N2,c);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
box on
hold off