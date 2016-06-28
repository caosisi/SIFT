clc
clear
I=imread('test/1.jpg');
I1=rgb2gray(I);
 [j,k,t,m,p]=change(I1,30,2,0.8,[25 25]);%change(i,旋转角度,放大倍数,缩小倍数,平移距离)
 num=30;%输入all或者100以内的整数
css(I1,j,'result/result_rotate.jpg',num);%旋转
css(I1,k,'result/result_resizedouble.jpg',num);%放大两倍
css(I1,t,'result/result_resizedoublebilinear.jpg',num);%双线性插值放大两倍
css(I1,m,'result/result_resize0.8.jpg',num);%缩小0.8倍
css(I1,p,'result/result_translate.jpg',num);%平移