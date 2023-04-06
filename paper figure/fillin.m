hold on
arrowPlot(X1,R1,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
hold on
arrowPlot(X2,R2,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
hold on
arrowPlot(X3,R3,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
hold on

% area([X1(:,1),X1(:,3)],[R1(:,1),R1(:,3)]);%,[0.93333, 0.83529, 0.82353]);

% xconf = [X1(:,1) fliplr(X1(:,1))] ;%一个来回         
% rconf = [R1(:,1)+0.05 fliplr(R1(:,1))-0.05];%0.15就是条带宽度，换成矩阵就会有不同的宽度
% p = fill(xconf,rconf,'r','FaceColor',[1 0.8 0.8],'EdgeColor','none');%FaceColor为填充颜色，EdgeColor为边框颜色
% hold on
% A = [X1(:,1);X1(:,2)];
% B = [R1(:,1);R1(:,2)];

% k = boundary(A,B,0.01);
% figure(2)
% plot(A(k),B(k));

