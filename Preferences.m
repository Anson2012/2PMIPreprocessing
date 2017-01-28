function Preferences()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Preferences.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%��Algorithm����������preference�������޸ġ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%Enhancing%%%%%%%%%%%%%%%%%%%%%%
%checkbox default value: 0~1
parmValue.EnhancingCheckboxValue = 1;
parmValue.EnhancingMenuValue = 1;

%Normalize
parmValue.EnhancingParm.SaturatedPCT = 0.003;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%Denoising%%%%%%%%%%%%%%%%%%%%%%
%checkbox default value: 0~1
parmValue.DenoisingCheckboxValue = 1;
parmValue.DenoisingMenuValue = 1;


%3-D median filtering
parmValue.DenoisingParm.radiusX = 2;
parmValue.DenoisingParm.radiusY = 2;
parmValue.DenoisingParm.radiusT = 2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%�������Ϊ.mat��ʽ,���������޸�
save('Preferences.mat','parmValue');