function css(I1,I2,I3,num)
[m n]=size(I1);
I2=imresize(I2,[m n]);
% Get the Key Points
  Options.upright=true;
  Options.tresh=0.0001;
  Ipts1=SIFT(I1,Options);
  Ipts2=SIFT(I2,Options);
% Put the landmark descriptors in a matrix
  D1 = reshape([Ipts1.descriptor],64,[]); 
  D2 = reshape([Ipts2.descriptor],64,[]); 
% Find the best matches
  err=zeros(1,length(Ipts1));
  cor1=1:length(Ipts1); 
  cor2=zeros(1,length(Ipts1));
  for i=1:length(Ipts1),
      distance=sum((D2-repmat(D1(:,i),[1 length(Ipts2)])).^2,1);
      [err(i),cor2(i)]=min(distance);
  end
% Sort matches on vector distance
  [err, ind]=sort(err); 
  cor1=cor1(ind); 
  cor2=cor2(ind);
% Show both images
  I = zeros([size(I1,1) size(I1,2)*2 size(I1,3)]);
  I(:,1:size(I1,2),:)=I1; I(:,size(I1,2)+1:size(I1,2)+size(I2,2),:)=I2;
  figure, imshow(I/255); hold on;
% Show the best matches
if(strcmp(class(num),class(2)))
    number=num;
elseif(strcmp(num,'all'))
    number=length(Ipts1);
end
  for i=1:number
      c=rand(1,3);
      plot([Ipts1(cor1(i)).x Ipts2(cor2(i)).x+size(I1,2)],[Ipts1(cor1(i)).y Ipts2(cor2(i)).y],'-','Color',c)
      plot([Ipts1(cor1(i)).x Ipts2(cor2(i)).x+size(I1,2)],[Ipts1(cor1(i)).y Ipts2(cor2(i)).y],'o','Color','r')
  end
   saveas(gcf,I3);
end