function an=IntegralImage_HaarY(row, column, size, img)
% This function IntegralImage_HaarY will ..
%
% [an] = IntegralImage_HaarY( row,column,size,img )
%  
%  inputs,
%    row : 
%    column : 
%    size : 
%    img : The integral image
%  
%  outputs,
%    an : The haar response in y-direction
%  
% 
an= IntegralImage_BoxIntegral(row, column - size / 2, size / 2, size , img) - IntegralImage_BoxIntegral(row - size / 2, column - size / 2, size / 2, size , img);

        