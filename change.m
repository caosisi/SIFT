function [j,k,t,m,img]=change(i,jiaodu,beishu,suoxiao,pingyi)
 j=imrotate(i,jiaodu);%ͼ����ת30�� 
 k=imresize(i,beishu);%ͼ��Ŵ�����  
 t=imresize(i,beishu,'bilinear');%����˫���Բ�ֵ�����зŴ����� 
 m=imresize(i,suoxiao);%ͼ����С��0.8�� 
 p=translate(strel(1), pingyi);%ͼ��ƽ��
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
