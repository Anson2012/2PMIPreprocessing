function registeredImgStack = IntensityBasedRegistration(imgStack, modality, maximumIterations)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Normalize.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170210
%function:
%ͼ����׼��֧��8bit��16bit�ĵ�ͨ���Ҷ�ͼ��
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
    
    
    %��׼�㷨
    [optimizer, metric]  = imregconfig(modality); %Ч����Ⱥ
    if(strcmpi(modality, 'multimodal'))
        optimizer.MaximumIterations = maximumIterations; %���ӵ�������
    elseif(strcmpi(modality, 'monomodal'))
        optimizer.MaximumIterations = maximumIterations; %���ӵ�������
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
    
    