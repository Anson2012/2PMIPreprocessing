function PreviewFunc(previewPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:PreviewFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%预览处理结果的函数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if(isempty(previewPath))
    error 'preview path is empty！'
    return;
end

disp('Make preview ');
disp(previewPath);
disp(' ');



tic %记录程序运行时间



%read image stack
previewImgStack = ImgStackReadFunc(previewPath);



%process image stack
processingImg = ImgStackProcessingFunc(previewImgStack);



%show image stack
if(~isempty(processingImg))
    ImgStackShowFunc(processingImg);
end




