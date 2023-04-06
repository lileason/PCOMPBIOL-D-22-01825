% alpha & beta
figure(4)
hold on
alpha1 = 1;    beta1 = 3;
alpha2 = 1.5;  beta2 = 3.5;
alpha3 = 2;    beta3 = 5;
theta = 0.5:0.001:4;
w11 = 0.8;
w22 = 1.2;
rd = 0.8;
N0 = 4;
x = theta./(theta+1);

% w = 0.8
rc11 = (N0.*(w11-1)+rd.*((w11.*x-x+1).^(N0-1)-1))./(w11.*(w11.*x-x+1).^(N0-1)-1);
e11 = (rc11.*w11-rd).*(N0-1).*(w11.*theta+1).^(N0-2).*(w11-1)./((rc11-alpha1).*(beta1-rc11).*(w11.*(w11.*theta+1).^(N0-1)-(1+theta).^(N0-1)));

rc22 = (N0.*(w11-1)+rd.*((w11.*x-x+1).^(N0-1)-1))./(w11.*(w11.*x-x+1).^(N0-1)-1);
e22 = (rc22.*w11-rd).*(N0-1).*(w11.*theta+1).^(N0-2).*(w11-1)./((rc22-alpha2).*(beta2-rc22).*(w11.*(w11.*theta+1).^(N0-1)-(1+theta).^(N0-1)));

rc33 = (N0.*(w11-1)+rd.*((w11.*x-x+1).^(N0-1)-1))./(w11.*(w11.*x-x+1).^(N0-1)-1);
e33 = (rc33.*w11-rd).*(N0-1).*(w11.*theta+1).^(N0-2).*(w11-1)./((rc33-alpha3).*(beta3-rc33).*(w11.*(w11.*theta+1).^(N0-1)-(1+theta).^(N0-1)));


plot(theta,e11,'-d','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:200:length(theta),'LineWidth',1);
plot(theta,e22,'-o','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:200:length(theta),'LineWidth',1);
plot(theta,e33,'-x','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:200:length(theta),'LineWidth',1);

% w = 1.2
rc44 = (N0.*(w22-1)+rd.*((w22.*x-x+1).^(N0-1)-1))./(w22.*(w22.*x-x+1).^(N0-1)-1);
e44 = (rc44.*w22-rd).*(N0-1).*(w22.*theta+1).^(N0-2).*(w22-1)./((rc44-alpha1).*(beta1-rc44).*(w22.*(w22.*theta+1).^(N0-1)-(1+theta).^(N0-1)));

rc55 = (N0.*(w22-1)+rd.*((w22.*x-x+1).^(N0-1)-1))./(w22.*(w22.*x-x+1).^(N0-1)-1);
e55 = (rc55.*w22-rd).*(N0-1).*(w22.*theta+1).^(N0-2).*(w22-1)./((rc55-alpha2).*(beta2-rc55).*(w22.*(w22.*theta+1).^(N0-1)-(1+theta).^(N0-1)));
x55 = find(rc55>alpha2);

rc66 = (N0.*(w22-1)+rd.*((w22.*x-x+1).^(N0-1)-1))./(w22.*(w22.*x-x+1).^(N0-1)-1);
e66 = (rc66.*w22-rd).*(N0-1).*(w22.*theta+1).^(N0-2).*(w22-1)./((rc66-alpha3).*(beta3-rc66).*(w22.*(w22.*theta+1).^(N0-1)-(1+theta).^(N0-1)));
x66 = find(rc66>alpha3);

plot(theta,e44,'-d','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:200:length(theta),'LineWidth',1);
plot(theta(x55),e55(x55),'-o','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:200:length(theta),'LineWidth',1);
plot(theta(x66),e66(x66),'-x','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:50:length(theta),'LineWidth',1);

legend('w=0.8,α=1,β=3',...
    'w=0.8,α=1.5,β=3.5',...
    'w=0.8,α=2,β=5',...
    'w=1.2,α=1,β=3',...
    'w=1.2,α=1.5,β=3.5',...
    'w=1.2,α=2,β=5');

axis([0.5 4 0 8]);
xlabel('θ');
% ylabel('threshold of feedback speed,\epsilon^{*}')
box on
hold off


% effects of N

N = 3:1:15;
w1 = 0.9;
w2 = 1.1;
rd1 = 0.9;
rd2 = 1.2;
theta1 = 2;
theta2 = 2;

x1 = theta1./(theta1+1);
x2 = theta2./(theta2+1);

alpha = 1.5;
beta = 3.5;


rc1 = (N.*(w1-1)+rd1.*((w1.*x1-x1+1).^(N-1)-1))./(w1.*(w1.*x1-x1+1).^(N-1)-1);
%rc2 = (N.*(w1-1)+rd1.*((w1.*x2-x2+1).^(N-1)-1))./(w1.*(w1.*x2-x2+1).^(N-1)-1);
rc3 = (N.*(w1-1)+rd2.*((w1.*x1-x1+1).^(N-1)-1))./(w1.*(w1.*x1-x1+1).^(N-1)-1);
%rc4 = (N.*(w1-1)+rd2.*((w1.*x2-x2+1).^(N-1)-1))./(w1.*(w1.*x2-x2+1).^(N-1)-1);
rc5 = (N.*(w2-1)+rd1.*((w2.*x1-x1+1).^(N-1)-1))./(w2.*(w2.*x1-x1+1).^(N-1)-1);
%rc6 = (N.*(w2-1)+rd1.*((w2.*x2-x2+1).^(N-1)-1))./(w2.*(w2.*x2-x2+1).^(N-1)-1);
rc7 = (N.*(w2-1)+rd2.*((w2.*x1-x1+1).^(N-1)-1))./(w2.*(w2.*x1-x1+1).^(N-1)-1);
%rc8 = (N.*(w2-1)+rd2.*((w2.*x2-x2+1).^(N-1)-1))./(w2.*(w2.*x2-x2+1).^(N-1)-1);

figure(5)
hold on
plot(N,rc1,'-d','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,rc2,'-o','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
plot(N,rc3,'-x','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,rc4,'-h','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
plot(N,rc5,'-d','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,rc6,'-o','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
plot(N,rc7,'-x','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,rc8,'-h','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);

legend('w=0.9,r_{d}=0.9',...%'w=0.8,r_{d}=0.1,\theta=2',...
    'w=0.9,r_{d}=1.2',...%'w=0.8,r_{d}=1.2,\theta=2',...
    'w=1.1,r_{d}=0.9',...%'w=1.2,r_{d}=0.1,\theta=2',...
    'w=1.1,r_{d}=1.2');%'w=1.2,r_{d}=1.2,\theta=2'% );
xlabel('N');
% ylabel('multiplication of cooperators,r_{c}^{*}');
axis([3 N(end) 1.5 3.5]);
box on
hold off


% figure(6)
% 
% e1 = (rc1.*w1-rd1).*(N-1).*(w1.*theta1+1).^(N-2).*(w1-1)./((rc1-alpha).*(beta-rc1).*(w1.*(w1.*theta1+1).^(N-1)-(1+theta1).^(N-1)));
% %e2 = (rc2.*w1-rd1).*(N-1).*(w1.*theta2+1).^(N-2).*(w1-1)./((rc2-alpha).*(beta-rc2).*(w1.*(w1.*theta2+1).^(N-1)-(1+theta2).^(N-1)));
% e3 = (rc3.*w1-rd2).*(N-1).*(w1.*theta1+1).^(N-2).*(w1-1)./((rc3-alpha).*(beta-rc3).*(w1.*(w1.*theta1+1).^(N-1)-(1+theta1).^(N-1)));
% %e4 = (rc4.*w1-rd2).*(N-1).*(w1.*theta2+1).^(N-2).*(w1-1)./((rc4-alpha).*(beta-rc4).*(w1.*(w1.*theta2+1).^(N-1)-(1+theta2).^(N-1)));
% e5 = (rc5.*w2-rd1).*(N-1).*(w2.*theta1+1).^(N-2).*(w2-1)./((rc5-alpha).*(beta-rc5).*(w2.*(w2.*theta1+1).^(N-1)-(1+theta1).^(N-1)));
% %e6 = (rc6.*w2-rd1).*(N-1).*(w2.*theta2+1).^(N-2).*(w2-1)./((rc6-alpha).*(beta-rc6).*(w2.*(w2.*theta2+1).^(N-1)-(1+theta2).^(N-1)));
% e7 = (rc7.*w2-rd2).*(N-1).*(w2.*theta1+1).^(N-2).*(w2-1)./((rc7-alpha).*(beta-rc7).*(w2.*(w2.*theta1+1).^(N-1)-(1+theta1).^(N-1)));
% %e8 = (rc8.*w2-rd2).*(N-1).*(w2.*theta2+1).^(N-2).*(w2-1)./((rc8-alpha).*(beta-rc8).*(w2.*(w2.*theta2+1).^(N-1)-(1+theta2).^(N-1)));
% 
% hold on
% plot(N,e1,'-d','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
% %plot(N,e2,'-o','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,e3,'-x','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
% %plot(N,e4,'-h','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,e5,'-d','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
% %plot(N,e6,'-o','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
% plot(N,e7,'-x','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
% %plot(N,e8,'-h','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:5:length(N),'LineWidth',1);
% 
% legend('w=0.9,r_{d}=0.9',...%'w=0.8,r_{d}=0.1,\theta=2',...
%     'w=0.9,r_{d}=1.2',...%'w=0.8,r_{d}=1.2,\theta=2',...
%     'w=1.1,r_{d}=0.9',...%'w=1.2,r_{d}=0.1,\theta=2',...
%     'w=1.1,r_{d}=1.2');%'w=1.2,r_{d}=1.2,\theta=2');
% xlabel('N');
% % ylabel('threshold of feedback speed,\epsilon^{*}');
% axis([3 N(end) 0 3.5]);
% box on
% hold off
% 
% 
