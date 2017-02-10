function processingImg = ImgStackProcessingFunc(originalImg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:ImgStackProcessingFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170210
%function:
%根据选项处理调用相关算法处理数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Start process image stack.');


global parmValue;


processingImg = originalImg;


%enhance algorithm
if(parmValue.EnhancingCheckboxValue == 1)
    
    switch parmValue.EnhancingMenuValue
        case 1
            SaturatedPCT = parmValue.EnhancingParm.SaturatedPCT;
            processingImg = Normalize(processingImg, SaturatedPCT);
    end
end



%denoise algorithm
if(parmValue.DenoisingCheckboxValue == 1)
    
    switch parmValue.DenoisingMenuValue
        case 1 
            radiusX = parmValue.DenoisingParm.radiusX;
            radiusY = parmValue.DenoisingParm.radiusY;
            radiusT = parmValue.DenoisingParm.radiusT;
            processingImg = MedianFilter(processingImg, radiusX, radiusY, radiusT);
    end
end



%registration algorithm
if(parmValue.RegistrationCheckboxValue == 1)
    
    switch parmValue.RegistrationMenuValue
        case 1 
            modality = parmValue.RegistrationParm.modality;
            maxIteration = parmValue.RegistrationParm.maxIteration;
            processingImg = IntensityBasedRegistration(processingImg, modality, maxIteration);
    end
end



disp('Complete process image stack.');
toc
disp(' ');



