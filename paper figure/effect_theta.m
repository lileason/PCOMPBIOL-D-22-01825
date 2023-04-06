%% paper--theta
clc,clear

theta1 = 0.5;
theta2 = 1.5;
x1 = theta1/(theta1+1);
x2 = theta2/(theta2+1);

N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
a = 0.1;
epsilon = 6;
delta = 0;
rd = 1;
w = 0.5:0.001:1.5;

h = 0.05;
tf = 400;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

r1 = (N.*(w-1)+rd.*((w.*x1-x1+1).^(N-1)-1))./(w.*(w.*x1-x1+1).^(N-1)-1);
e1 = (r1.*w-rd).*(N-1).*(w.*theta1+1).^(N-2).*(w-1)./(r1-alpha)./(beta-r1)./(w.*(w.*theta1+1).^(N-1)-(1+theta1).^(N-1));
r2 = (N.*(w-1)+rd.*((w.*x2-x2+1).^(N-1)-1))./(w.*(w.*x2-x2+1).^(N-1)-1);
e2 = (r2.*w-rd).*(N-1).*(w.*theta2+1).^(N-2).*(w-1)./(r2-alpha)./(beta-r2)./(w.*(w.*theta2+1).^(N-1)-(1+theta2).^(N-1));

emax1 = max(e1);  emin1 = min(e1);
emax2 = max(e2);  emin2 = min(e2);

% 离散
figure(1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equfd,[0,tf],[x_0;r_0],options,epsilon,theta1,rd,N,c,a);
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



% figure(2)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equfd,[0,tf],[x_0;r_0],options,epsilon,theta2,rd,N,c,a);
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
% 
% %% 连续
% figure(3)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a,delta,epsilon,theta1,rd,N,c);
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
% 
% 
% figure(4)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a,delta,epsilon,theta2,rd,N,c);
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