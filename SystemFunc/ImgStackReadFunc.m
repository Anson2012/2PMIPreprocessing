function imgStack = ImgStackReadFunc(imgPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:ImgStackReadFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170209
%function:
%返回uint8、uint16的单通道数据
%支持uint8的单通道、三通道，uint16的单通道、三通道数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Read image stack.');
disp(imgPath);
info = imfinfo(imgPath);
[frameNum, ~] = size(info);
tempInfo = info(1);
disp(['Format:' tempInfo.Format ...
        ' Width:' num2str(tempInfo.Width) ' Height:' num2str(tempInfo.Height) ...
            ' BitDepth:' num2str(tempInfo.BitDepth)]);

imgStack = imread(imgPath, 1);
[rows, cols, channels] = size(imgStack);


imgStack = imgStack(:, :, 1);
%imgStack = im2uint8(imgStack);
for i = 2:frameNum
    tempImg = imread(imgPath, i);
    tempImg = tempImg(:, :, 1);
    %tempImg = im2uint8(tempImg);
    imgStack = cat(3, imgStack, tempImg);
end


disp('Complete image stack.');
toc
disp(' ');


