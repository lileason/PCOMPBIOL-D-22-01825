% w-threshold
clc
clear

threshold1 = 0.2;
threshold2 = 0.5;
threshold3 = 0.8;


theta = 0.5;
rd = 0.6;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
x0 = theta/(theta+1);
a = 0.1;
epsilon = 6;
tend = 160;
w1 = 1.3;
w2 = 0.7;

r1 = (N.*(w1-1)+rd.*((w1.*x0-x0+1).^(N-1)-1))./(w1.*(w1.*x0-x0+1).^(N-1)-1);
r2 = (N.*(w2-1)+rd.*((w2.*x0-x0+1).^(N-1)-1))./(w2.*(w2.*x0-x0+1).^(N-1)-1);

e1 = (r1.*w1-rd).*(N-1).*(w1.*theta+1).^(N-2).*(w1-1)./((r1-alpha).*(beta-r1).*(w1.*(w1.*theta+1).^(N-1)-(1+theta).^(N-1)));
e2 = (r2.*w2-rd).*(N-1).*(w2.*theta+1).^(N-2).*(w2-1)./((r2-alpha).*(beta-r2).*(w2.*(w2.*theta+1).^(N-1)-(1+theta).^(N-1)));


h = 0.05;
tf = 400;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

figure(1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equthreshold,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N,c,threshold1);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        elseif x0-exp(-6) < X(end) && X(end) < x0+exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.5 0.5 0.5], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.6 0.8 0.2], 'LineWidth', 0.2, 'scale', 0.1);
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
hold on 
area([0,threshold1],[3.5,3.5],'FaceColor','[1 0.6 0]','FaceAlpha',0.5);
area([threshold1,1],[3.5,3.5],'FaceColor','[0.5 0.8 1]','FaceAlpha',0.5);
plot([x0,x0],[1,3.5],'k--');
plot([threshold1,threshold1],[1,3.5],'k-');
plot(x0,r2,'k^','LineWidth', 3);
[~,x11]=ode23(@equthreshold,[0,tf],[0.9;2.5],options,epsilon,theta,rd,N,c,threshold1);
arrowPlot(x11(:,1),x11(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x12]=ode23(@equthreshold,[0,tf],[0.1;3],options,epsilon,theta,rd,N,c,threshold1);
arrowPlot(x12(:,1),x12(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x13]=ode45(@equthreshold,[0,tf],[0.4;2],options,epsilon,theta,rd,N,c,threshold1);
arrowPlot(x13(:,1),x13(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x14]=ode45(@equthreshold,[0,tf],[0.2;1.6],options,epsilon,theta,rd,N,c,threshold1);
arrowPlot(x14(:,1),x14(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
h1 = gca;
h1.Layer = 'top';
box on
hold off





figure(2)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equthreshold,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N,c,threshold2);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        elseif x0-exp(-6) < X(end) && X(end) < x0+exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.5 0.5 0.5], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.6 0.8 0.2], 'LineWidth', 0.2, 'scale', 0.1);
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


figure(5)
hold on 
area([0,threshold2],[3.5,3.5],'FaceColor','[1 0.6 0]','FaceAlpha',0.5);
area([threshold2,1],[3.5,3.5],'FaceColor','[0.5 0.8 1]','FaceAlpha',0.5);
plot([x0,x0],[1,3.5],'k--');
plot([threshold2,threshold2],[1,3.5],'k-');
plot(x0,r1,'k^','LineWidth', 3);
[~,x21]=ode45(@equthreshold,[0,tf],[0.9;2.5],options,epsilon,theta,rd,N,c,threshold2);
arrowPlot(x21(:,1),x21(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x22]=ode45(@equthreshold,[0,tf],[0.1;3],options,epsilon,theta,rd,N,c,threshold2);
arrowPlot(x22(:,1),x22(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x23]=ode45(@equthreshold,[0,tf],[0.4;2],options,epsilon,theta,rd,N,c,threshold2);
arrowPlot(x23(:,1),x23(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x24]=ode45(@equthreshold,[0,tf],[0.2;1.6],options,epsilon,theta,rd,N,c,threshold2);
arrowPlot(x24(:,1),x24(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
h2 = gca;
h2.Layer = 'top';
box on
hold off


figure(3)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equthreshold,[0,tf],[x_0;r_0],options,epsilon,theta,rd,N,c,threshold3);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        elseif x0-exp(-6) < X(end) && X(end) < x0+exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.5 0.5 0.5], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.6 0.8 0.2], 'LineWidth', 0.2, 'scale', 0.1);
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

figure(6)
hold on 
area([0,threshold3],[3.5,3.5],'FaceColor','[1 0.6 0]','FaceAlpha',0.5);
area([threshold3,1],[3.5,3.5],'FaceColor','[0.5 0.8 1]','FaceAlpha',0.5);
plot([x0,x0],[1,3.5],'k--');
plot([threshold3,threshold3],[1,3.5],'k-');
plot(x0,r1,'k^','LineWidth', 3);
[~,x31]=ode23(@equthreshold,[0,tf],[0.9;2.5],options,epsilon,theta,rd,N,c,threshold3);
arrowPlot(x31(:,1),x31(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x32]=ode45(@equthreshold,[0,tf],[0.2;1.8],options,epsilon,theta,rd,N,c,threshold3);
arrowPlot(x32(:,1),x32(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x33]=ode45(@equthreshold,[0,tf],[0.4;2],options,epsilon,theta,rd,N,c,threshold3);
arrowPlot(x33(:,1),x33(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
hold on
[~,x34]=ode45(@equthreshold,[0,tf],[0.2;1.6],options,epsilon,theta,rd,N,c,threshold3);
arrowPlot(x34(:,1),x34(:,2),'number', 5,'color', [0 0 0], 'LineWidth', 0.2, 'scale', 0.1);
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
h3 = gca;
h3.Layer = 'top';
box on
hold off



% [~,y1]=ode45(@equthreshold,[0,tf],[0.2;1.7],options,epsilon,theta,rd,N,c,threshold2);
% [~,y2]=ode45(@equthreshold,[0,tf],[0.8;1.7],options,epsilon,theta,rd,N,c,threshold2);
% [~,y3]=ode45(@equthreshold,[0,tf],[0.4;1.9],options,epsilon,theta,rd,N,c,threshold2);
% [t,y4]=ode45(@equthreshold,[0,tf],[0.7;3.3],options,epsilon,theta,rd,N,c,threshold2);
% figure(7)
% hold on
% plot(t,y1(:,1));
% plot(t,y3(:,1));
% plot(t,0.5*ones(length(t),1));
% axis([0 200 0 1]);
% hold off
% 
% figure(8)
% hold on
% plot(t,y1(:,2));
% plot(t,y3(:,2));
% plot(t,r2*ones(length(t),1));
% hold off
% axis([0 200 1.5 3.5]);
