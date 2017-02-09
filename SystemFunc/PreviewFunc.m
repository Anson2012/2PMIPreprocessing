function PreviewFunc(previewPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:PreviewFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%预览处理结果的函数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global parmValue;

if(isempty(previewPath))
    error 'preview path is empty！'
    return;
end

disp('Make preview ');
disp(previewPath);
disp(' ');


tic %记录程序运行时间
%read image stack
disp('Read image stack');
[frameNum, ~] = size(imfinfo(previewPath));
previewImgStack = imread(previewPath, 1);
[rows, cols] = size(previewImgStack);
for i = 2:frameNum
    tempImg = imread(previewPath, i);
    previewImgStack = cat(3, previewImgStack, tempImg);
end
ProcessingImg = previewImgStack;
toc
disp(' ');



%enhance algorithm
if(parmValue.EnhancingCheckboxValue == 1)
    
    switch parmValue.EnhancingMenuValue
        case 1
            SaturatedPCT = parmValue.EnhancingParm.SaturatedPCT;
            ProcessingImg = Normalize(ProcessingImg, SaturatedPCT);
    end
end



%denoise algorithm
if(parmValue.DenoisingCheckboxValue == 1)
    
    switch parmValue.DenoisingMenuValue
        case 1 
            radiusX = parmValue.DenoisingParm.radiusX;
            radiusY = parmValue.DenoisingParm.radiusY;
            radiusT = parmValue.DenoisingParm.radiusT;
            ProcessingImg = MedianFilter(ProcessingImg, radiusX, radiusY, radiusT);
    end
end



%registration algorithm
if(parmValue.RegistrationCheckboxValue == 1)
    
    switch parmValue.RegistrationMenuValue
        case 1 
            modality = parmValue.RegistrationParm.modality;
            maxIteration = parmValue.RegistrationParm.maxIteration;
            ProcessingImg = IntensityBasedRegistration(ProcessingImg, modality, maxIteration);
    end
end



if(~isempty(ProcessingImg))
    ImgStackShowFunc(ProcessingImg);
end




