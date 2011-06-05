function f = pca(data)
    f = 0;
    C = cov(data);
    [U,S,V] = svd(C);
    
    PC1 = U(:,1);
    PC2 = U(:,2);
    PC3 = U(:,3);
    PC4 = U(:,4);
    PC5 = U(:,5);
    PC6 = U(:,6);
    PC7 = U(:,7);
    
    XProp = data * PC1;
    YProp = data * PC2;
    ZProp = data * PC3;
    
    MurderX = data * PC4;
    RapeY = data * PC5;
    RobberyX = data * PC6;
    AssaultY = data * PC7;
    
    figure
    hold on
    plot3(XProp, YProp, ZProp, 'r+');
    xlabel('first principal component');
    ylabel('second principal component');
    zlabel('third principal component');
    rotate3d on
    title('Crime data projected on first three principal components');
    hold off
    
    figure
    hold on
    plot(MurderX, RapeY, 'r+');
    xlabel('fourth principal component');
    ylabel('fifth principal component');
    title('Crime data projected on fourth and fifth principal components');
    hold off
    
    figure
    hold on
    plot(RobberyX, AssaultY, 'r+');
    xlabel('sixth principal component');
    ylabel('seventh principal component');
    title('Crime data projected on fifth and sixth principal components');
    hold off
    
    figure
    hold on
    plot(AssaultY, RapeY, 'r+');
    xlabel('seventh principal component');
    ylabel('fifth principal component');
    title('Crime data projected on fifth and seventh principal components');
    hold off
    
    figure
    hold on
    plot3(RapeY, MurderX, AssaultY, 'r+');
    xlabel('fifth principal component');
    ylabel('fourth principal component');
    zlabel('seventh principal component');
    title('Crime data projected on fourth, fifth, and seventh principal components');
    rotate3d on
    hold off
end