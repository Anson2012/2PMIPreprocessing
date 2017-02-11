function smoothImgStack = MedianFilter(ImgStack, radiusX, radiusY, radiusT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Preferences.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%��Algorithm����������preference��֧��8bit��16bit�ĵ�ͨ���Ҷ�ͼ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Start 3-D median filter.');
disp(['radiusX:' num2str(radiusX) ...
        ' radiusY:' num2str(radiusY) ...
            ' radiusT:' num2str(radiusT)]);
smoothImgStack = medfilt3(ImgStack, ...
                    [(2*radiusX+1) (2*radiusY+1) (2*radiusT+1)]);
        
%���ã����ǲ�Ӱ����
if(isa(ImgStack, 'uint8'))
    smoothImgStack = uint8(smoothImgStack);
elseif(isa(ImgStack, 'uint16'))
    smoothImgStack = uint16(smoothImgStack);
else
    disp(['�������Ͳ�֧��:' class(ImgStack)]);
    return;
end
   
disp('Complete 3-D median filter.');
toc
disp(' ');




