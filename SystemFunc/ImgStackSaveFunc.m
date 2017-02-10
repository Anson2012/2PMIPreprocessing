function ImgStackSaveFunc(imgStack, savePath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:ImgStackSaveFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170210
%function:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(isempty(imgStack))
    error 'img stack is empty��'
    return;
end


disp('Start save image stack.');
[rows, cols, frameNum] = size(imgStack);



%�趨���ݱ���Ŀ¼
saveDir = [savePath(1:end - 4)];
mkdir(saveDir); %�趨�������ݵ�Ŀ¼

saveFileNamePos = strfind(savePath,'\');
saveFileName = savePath((saveFileNamePos(1, end) + 1):(end - 4));



saveName = strcat(saveDir, '/', saveFileName, ' preprocessed.tif');
for i = 1:frameNum
   imwrite(imgStack(:, :, i), saveName, 'WriteMode', 'append');
end


disp('Complete save image stack.');
toc
disp(' ');




