function PreviewFunc(previewPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:PreviewFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%Ԥ���������ĺ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if(isempty(previewPath))
    error 'preview path is empty��'
    return;
end

disp('Make preview ');
disp(previewPath);
disp(' ');



tic %��¼��������ʱ��



%read image stack
previewImgStack = ImgStackReadFunc(previewPath);



%process image stack
processingImg = ImgStackProcessingFunc(previewImgStack);



%show image stack
if(~isempty(processingImg))
    ImgStackShowFunc(processingImg);
end




