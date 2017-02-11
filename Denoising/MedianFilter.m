function smoothImgStack = MedianFilter(ImgStack, radiusX, radiusY, radiusT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Preferences.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%将Algorithm参数保存在preference，支持8bit和16bit的单通道灰度图。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Start 3-D median filter.');
disp(['radiusX:' num2str(radiusX) ...
        ' radiusY:' num2str(radiusY) ...
            ' radiusT:' num2str(radiusT)]);
smoothImgStack = medfilt3(ImgStack, ...
                    [(2*radiusX+1) (2*radiusY+1) (2*radiusT+1)]);
        
%无用，但是不影响结果
if(isa(ImgStack, 'uint8'))
    smoothImgStack = uint8(smoothImgStack);
elseif(isa(ImgStack, 'uint16'))
    smoothImgStack = uint16(smoothImgStack);
else
    disp(['数据类型不支持:' class(ImgStack)]);
    return;
end
   
disp('Complete 3-D median filter.');
toc
disp(' ');




