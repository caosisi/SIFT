clc
clear
I=imread('test/1.jpg');
I1=rgb2gray(I);
 [j,k,t,m,p]=change(I1,30,2,0.8,[25 25]);%change(i,��ת�Ƕ�,�Ŵ���,��С����,ƽ�ƾ���)
 num=30;%����all����100���ڵ�����
css(I1,j,'result/result_rotate.jpg',num);%��ת
css(I1,k,'result/result_resizedouble.jpg',num);%�Ŵ�����
css(I1,t,'result/result_resizedoublebilinear.jpg',num);%˫���Բ�ֵ�Ŵ�����
css(I1,m,'result/result_resize0.8.jpg',num);%��С0.8��
css(I1,p,'result/result_translate.jpg',num);%ƽ��