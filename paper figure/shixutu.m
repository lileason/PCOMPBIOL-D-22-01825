clc,clear

theta = 1;
rd = 1.2;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
xtheta = theta/(theta+1);
a = 0.05;



epsilon = 4;
delta = 0;

h = 0.2;
tf = 200;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);
final = floor(1/h)-1;

interval=400;
tend = 400;

% figure(1)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equfd,[0,tf],[x_0;r_0],options,e22,theta,rd,N,c,a);
%         T=t(1:(40*tf+1),1);
%         X=x(1:(40*tf+1),1);
%         R=x(1:(40*tf+1),2);          
%         plot(T,X,'-x','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:(40*tf+1),'MarkerSize',8);
%         hold on
%     end
% end
% 
% W = zeros(1,40*tf+1);
% for i = 1:(40*tf+1)
%     if mod(floor(T(i)/pi*a),2) == 0
%         W(i)=0.8;
%     else 
%         W(i) = 1.2;
%     end
% end
% hold on
% 
% plotyy(T,X,T,W);
% 
% 
% box on
% hold off

%% paper6补充
% figure(2)
% hold on;
% for i = 1:final
%     for j = 1:final
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x] = ode45(@equfd1,[0,tend],[x_0;r_0],options,epsilon,theta,rd,N,c,a);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off


% figure(3)
% hold on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equst,[0,tend],[x_0;r_0],options,a,delta,epsilon,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off

w1 = 1.4;
w2 = 1;
w3 = 0.6;
r1 = (N*(w1-1)+rd*((w1*xtheta-xtheta+1)^(N-1)-1))/(w1*(w1*xtheta-xtheta+1)^(N-1)-1);
e1 = (r1*w1-rd)*(N-1)*(w1*theta+1)^(N-2)*(w1-1)/(r1-alpha)/(beta-r1)/(w1*(w1*theta+1)^(N-1)-(1+theta)^(N-1));
r2 = (theta*rd*(N-1)+N*(theta+1))/(theta*(N-1)+theta+1);
e2 = ((1-xtheta)*(N-1)*(r2-rd))/(((N-1)*xtheta+1)*(r2-alpha)*(beta-r2));
r3 = (N*(w3-1)+rd*((w3*xtheta-xtheta+1)^(N-1)-1))/(w3*(w3*xtheta-xtheta+1)^(N-1)-1);
e3 = (r3*w3-rd)*(N-1)*(w3*theta+1)^(N-2)*(w3-1)/(r3-alpha)/(beta-r3)/(w3*(w3*theta+1)^(N-1)-(1+theta)^(N-1));

% 四段w
figure(4)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x] = ode45(@equfd1,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N,c,a);
        T=t(1:(40*tf+1),1);
        X=x(1:(40*tf+1),1);
        R=x(1:(40*tf+1),2); 
        [AX,H1,H2] = plotyy(T,X,T,R);
        set(H1,'Linestyle','-','Color','b');
        set(H2,'Linestyle','--','Color','r');
        set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
        set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
        set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
        set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);
        hold on
    end
end

XX = xtheta.*ones(length(T),1);
RR1 = r1.*ones(length(T),1);
RR2 = r2.*ones(length(T),1);
RR3 = r3.*ones(length(T),1);
hold on
[AX,H1,H2] = plotyy(T,XX,T,RR1);
set(H1,'Linestyle','-','LineWidth',2,'Color','b');
set(H2,'Linestyle','--','LineWidth',2,'Color','r');
set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);
hold on
[AX,H1,H2] = plotyy(T,XX,T,RR2);
set(H1,'Linestyle','-','LineWidth',2,'Color','b');
set(H2,'Linestyle','--','LineWidth',2,'Color','r');
set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);
hold on
[AX,H1,H2] = plotyy(T,XX,T,RR3);
set(H1,'Linestyle','-','LineWidth',2,'Color','b');
set(H2,'Linestyle','--','LineWidth',2,'Color','r');
set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);

% % w图像
% W1 = zeros(40*tf+1,1);
% for i = 1:(40*tf+1)
%     if mod(floor(T(i)/pi*a*4/2),4) == 1
%         W1(i)=0.6;
%     elseif mod(floor(T(i)/pi*a*4/2),4) == 3
%         W1(i)=1.4;
%     else
%         W1(i) = 1;
%     end
% end
% hold on
% figure(5)
% plot(T,W1);


% % 两段w
% w4 = 1.2;
% w5 = 0.8;
% r4 = (N*(w4-1)+rd*((w4*xtheta-xtheta+1)^(N-1)-1))/(w4*(w4*xtheta-xtheta+1)^(N-1)-1);
% e4 = (r4*w4-rd)*(N-1)*(w4*theta+1)^(N-2)*(w4-1)/(r4-alpha)/(beta-r4)/(w4*(w4*theta+1)^(N-1)-(1+theta)^(N-1));
% r5 = (N*(w5-1)+rd*((w5*xtheta-xtheta+1)^(N-1)-1))/(w5*(w5*xtheta-xtheta+1)^(N-1)-1);
% e5 = (r5*w5-rd)*(N-1)*(w5*theta+1)^(N-2)*(w5-1)/(r5-alpha)/(beta-r5)/(w5*(w5*theta+1)^(N-1)-(1+theta)^(N-1));
% 
% figure(6)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x] = ode45(@equfd,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N,c,a);
%         T=t(1:(40*tf+1),1);
%         X=x(1:(40*tf+1),1);
%         R=x(1:(40*tf+1),2); 
%         [AX,H1,H2] = plotyy(T,X,T,R);
%         set(H1,'Linestyle','-','Color','b');
%         set(H2,'Linestyle','--','Color','r');
%         set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
%         set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
%         set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
%         set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);
%         hold on
%     end
% end
% 
% XX = xtheta.*ones(length(T),1);
% RR4 = r4.*ones(length(T),1);
% RR5 = r5.*ones(length(T),1);
% hold on
% [AX,H1,H2] = plotyy(T,XX,T,RR4);
% set(H1,'Linestyle','-','LineWidth',2,'Color','b');
% set(H2,'Linestyle','--','LineWidth',2,'Color','g');
% set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
% set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
% set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
% set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);
% hold on
% [AX,H1,H2] = plotyy(T,XX,T,RR5);
% set(H1,'Linestyle','-','LineWidth',2,'Color','b');
% set(H2,'Linestyle','--','LineWidth',2,'Color','k');
% set(AX(1),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
% set(AX(1),'ylim',[0 1],'ytick',[0:0.1:1]);
% set(AX(2),'xlim',[0 tf],'xtick',[0:(tf/4):tf]);
% set(AX(2),'ylim',[1.5 3.5],'ytick',[1.5:0.2:3.5]);


figure(7)
[t,x] = ode45(@equfd1,[0,tend],[0.2;2.3],options,epsilon,theta,rd,N,c,a);
X=x(:,1);
R=x(:,2);
if X(end) > 1-exp(-6)
    arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
elseif X(end) < exp(-6)
    arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
else
    arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);


