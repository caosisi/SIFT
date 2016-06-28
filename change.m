function [j,k,t,m,img]=change(i,jiaodu,beishu,suoxiao,pingyi)
 j=imrotate(i,jiaodu);%图像旋转30度 
 k=imresize(i,beishu);%图像放大两倍  
 t=imresize(i,beishu,'bilinear');%采用双线性插值法进行放大两倍 
 m=imresize(i,suoxiao);%图像缩小到0.8倍 
 p=translate(strel(1), pingyi);%图像平移
 img=imdilate(i,p);
 figure(1);
 imshow(j);
 saveas(gcf,'test/rotate.jpg');
 figure(2);
 imshow(k);
 saveas(gcf,'test/resizedouble.jpg');
  figure(3);
 imshow(t);
 saveas(gcf,'test/resizedoublebilinear.jpg');
 figure(4);
 imshow(m);
 saveas(gcf,'test/resize0.8.jpg');
 figure(5);
 imshow(img);
 saveas(gcf,'test/translate.jpg');
end
