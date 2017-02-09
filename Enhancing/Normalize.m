function enhanceImgStack = Normalize(ImgStack, SaturatedPCT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Normalize.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170123
%function:
%�Ҷ�ֵ���죬֧��8bit��16bit�ĵ�ͨ���Ҷ�ͼ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Start normalize.');
[rows, cols, frameNum] = size(ImgStack);
enhanceImgStack = [];


%enhance image
ImgCounter = 0;
for i = 1:frameNum
    if(isa(ImgStack, 'uint8'))
        [counts, binLocations] = imhist(ImgStack(:,:,i), 256);
    elseif(isa(ImgStack, 'uint16'))
        [counts, binLocations] = imhist(ImgStack(:,:,i), 65536);
    else
        disp(['�������Ͳ�֧��:' class(ImgStack)]);
        return;
    end

    ImgCounter = ImgCounter + counts;
end;


%����ǰ0.3�ı��͵ĻҶ�ֵlowIn highIn��0~1
pixelNum = sum(ImgCounter);
for i = 1:size(ImgCounter, 1)
    if sum(ImgCounter(1:i)) > pixelNum * SaturatedPCT
        lowIn = (i - 1) / (size(ImgCounter, 1) - 1);
        break;
    end
end

for i = size(ImgCounter, 1):-1:1
    if sum(ImgCounter(i:end)) > pixelNum * SaturatedPCT
        highIn = (i - 1) / (size(ImgCounter, 1) - 1);
        break;
    end
end

if(lowIn >= highIn)
    disp(['ͼ����ǿϵ������']); 
    disp(['lowIn:' num2str(lowIn) '  highIn:' num2str(highIn)]);      
    highIn = lowIn + 0.001;
end


%�Ҷ�ֵ����
for i = 1:frameNum
    tempImg = imadjust((ImgStack(:, :, i)), [lowIn(1) highIn(1)], [0 1]);
    enhanceImgStack = cat(3, enhanceImgStack, tempImg);
end

disp('Complete normalize.');
toc
disp(' ');



