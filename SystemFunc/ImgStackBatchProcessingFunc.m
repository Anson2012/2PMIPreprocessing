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
    error 'list path is empty��'
    return;
end

disp('Start batch process image stack.');

[rows, cols] = size(listPath);

for i = 1:cols
    
    %��¼��������ʱ��
    tic 
    
    %����������־
    saveDir = [listPath{i}(1:end - 4)];
    mkdir(saveDir); %�趨�������ݵ�Ŀ¼
    saveName = strcat(saveDir, '/', 'log.txt');
    diary(saveName);
    diary on;
    
 
    %read image stack
    previewImgStack = ImgStackReadFunc(listPath{i});
    
    %process image stack
    processingImg = ImgStackProcessingFunc(previewImgStack);
    
    %save image stack
    ImgStackSaveFunc(processingImg, listPath{i});
    
    
    %�رձ�����־
    diary off;
end



disp('Complete batch process image stack.');
toc
disp(' ');




