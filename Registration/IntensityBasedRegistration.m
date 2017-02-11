function registeredImgStack = IntensityBasedRegistration(imgStack, modality, maximumIterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Normalize.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170210
%function:
%图像配准，支持8bit和16bit的单通道灰度图。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Start registration.');
disp(['modality:' modality ...
        ' maximumIterations:' num2str(maximumIterations)]);

[rows, cols, frameNum] = size(imgStack);
fixedImg = imgStack(:, :, 1);

registeredImgStack = [];
for i = 1:frameNum
    disp(['Start to registration frame ' num2str(i)]);
    %tic
    
    movingImg = imgStack(:, :, i);
    
%     errorImg = fixedImg - movingImg;
%     temp = sqrt(mean(errorImg(:) .^2));
%     rmsErrorBefore = [rmsErrorBefore; temp];
    
    
    %配准算法
    [optimizer, metric]  = imregconfig(modality); %效果拔群
    if(strcmpi(modality, 'multimodal'))
        optimizer.MaximumIterations = maximumIterations; %增加迭代次数
    elseif(strcmpi(modality, 'monomodal'))
        optimizer.MaximumIterations = maximumIterations; %增加迭代次数
    end
    [movingRegistered, R_reg] = imregister(movingImg, fixedImg, 'translation', optimizer, metric);

    
    %tform = imregtform(movingImg, fixedImg, 'translation', optimizer, metric)
    
%     errorImg = fixedImg - movingRegistered;
%     temp = sqrt(mean(errorImg(:) .^2));
%     rmsErrorAfter = [rmsErrorAfter; temp];

 
    registeredImgStack = cat(3, registeredImgStack, movingRegistered);
    toc
end

disp('Complete registration.');
toc
disp(' ');
    
    