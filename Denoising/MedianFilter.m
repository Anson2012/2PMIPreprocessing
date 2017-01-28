function smoothImgStack = MedianFilter(ImgStack, radiusX, radiusY, radiusT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Preferences.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%��Algorithm����������preference�������޸ġ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Start 3-D median filter.');
smoothImgStack = medfilt3(double(ImgStack), ...
                    [(2*radiusX+1) (2*radiusY+1) (2*radiusT+1)]);
                
if(isa(ImgStack, 'uint8'))
    smoothImgStack = uint8(smoothImgStack);
elseif(isa(ImgStack, 'uint16'))
    smoothImgStack = uint16(smoothImgStack);
else
    disp(['�������Ͳ�֧��:' class(ImgStack)]);
    return;
end
   
disp('Complete 3-D median filter.');
disp(' ');




