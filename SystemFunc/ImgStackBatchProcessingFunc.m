function ImgStackBatchProcessingFunc(listPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:ImgStackBatchProcessingFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170209
%function:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(isempty(listPath))
    error 'list path is empty！'
    return;
end

disp('Start batch process image stack.');

[rows, cols] = size(listPath);

for i = 1:cols
    
    %记录程序运行时间
    tic 
    
    %开启保存日志
    saveDir = [listPath{i}(1:end - 4)];
    mkdir(saveDir); %设定保持数据的目录
    saveName = strcat(saveDir, '/', 'log.txt');
    diary(saveName);
    diary on;
    
 
    %read image stack
    previewImgStack = ImgStackReadFunc(listPath{i});
    
    %process image stack
    processingImg = ImgStackProcessingFunc(previewImgStack);
    
    %save image stack
    ImgStackSaveFunc(processingImg, listPath{i});
    
    
    %关闭保存日志
    diary off;
end



disp('Complete batch process image stack.');
toc
disp(' ');




