function H = quyufenlei(xx,mycolor,h,tf)
    %%
    %x=xx(:,1);
    %y=xx(:,2);
    z=mycolor;

    nc=1000;
    edges1=linspace(0,1,nc);
    edges2=linspace(1.5,3.5,nc);
    [~,~,I1]=histcounts(xx(:,1),edges1);
    [~,~,I2]=histcounts(xx(:,2),edges2);
    C=zeros(nc);NC=zeros(nc);
    for i=1:length(I1)
        C(I1(i),I2(i)) = C(I1(i),I2(i)) + z(i);
        NC(I1(i),I2(i)) = NC(I1(i),I2(i)) + 1;    
    end
    C=round(C./NC);
    C2=C;
    for iter=1:100
        C1=C2;
        for i=2:nc-1
            for j=2:nc-1
                if isnan(C1(i,j))
                    C2(i,j)=round(median([C1(i-1,j),C1(i,j-1),C1(i+1,j),C1(i,j+1),C1(i,j+1),C1(i+1,j-1),C1(i+1,j),C1(i+1,j+1)],'omitnan'));
                end
            end
        end
    end
    
    %%
    load('color3.mat')
    H = imagesc(edges1,edges2,fliplr(rot90(C2,3)));axis xy;
    ax=gca;
    colormap(ax,mycmap);
    %colormap(ax,jet);
    caxis([1 3]);
    
    %%
    hold on;
    box on;
%     for i = 1:floor(1/h)-1
%         for j = 1:floor(1/h)-1
%             x=xx(((i-1)*(floor(1/h)-1)+j-1)*(tf*40+1)+1:((i-1)*(floor(1/h)-1)+j)*(tf*40+1),:);
%             X=x(:,1);
%             R=x(:,2);
%             arrowPlot(X,R,'number', 5,'color', 'k', 'LineWidth', 0.2, 'scale', 0.1);
%             hold on
%         end
%     end
   

    hold off
end
