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
parmValue.DenoisingParm.radiusX = 1;
parmValue.DenoisingParm.radiusY = 1;
parmValue.DenoisingParm.radiusT = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%Registration%%%%%%%%%%%%%%%%%%%%%%
%checkbox default value: 0~1
parmValue.RegistrationCheckboxValue = 0;
parmValue.RegistrationMenuValue = 1;


%IntensityBasedRegistration
parmValue.RegistrationParm.modality = 'multimodal'; %'multimodal' or 'monomodal'
parmValue.RegistrationParm.maxIteration = 200;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%�������Ϊ.mat��ʽ,���������޸�
save('Preferences.mat','parmValue');



