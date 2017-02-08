function Preferences()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:Preferences.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170120
%function:
%将Algorithm参数保存在preference，方便修改。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%Enhancing%%%%%%%%%%%%%%%%%%%%%%
%checkbox default value: 0~1
parmValue.EnhancingCheckboxValue = 0;
parmValue.EnhancingMenuValue = 1;

%Normalize
parmValue.EnhancingParm.SaturatedPCT = 0.003;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%Denoising%%%%%%%%%%%%%%%%%%%%%%
%checkbox default value: 0~1
parmValue.DenoisingCheckboxValue = 0;
parmValue.DenoisingMenuValue = 1;


%3-D median filtering
parmValue.DenoisingParm.radiusX = 2;
parmValue.DenoisingParm.radiusY = 2;
parmValue.DenoisingParm.radiusT = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%Registration%%%%%%%%%%%%%%%%%%%%%%
%checkbox default value: 0~1
parmValue.RegistrationCheckboxValue = 0;
parmValue.RegistrationMenuValue = 1;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%保存参数为.mat格式,这项无需修改
save('Preferences.mat','parmValue');