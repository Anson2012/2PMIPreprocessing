function varargout = MainInterface(varargin)
% MAININTERFACE MATLAB code for MainInterface.fig
%      MAININTERFACE, by itself, creates a new MAININTERFACE or raises the existing
%      singleton*.
%
%      H = MAININTERFACE returns the handle to a new MAININTERFACE or the handle to
%      the existing singleton*.
%
%      MAININTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAININTERFACE.M with the given input arguments.
%
%      MAININTERFACE('Property','Value',...) creates a new MAININTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainInterface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainInterface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainInterface

% Last Modified by GUIDE v2.5 29-Jan-2017 15:21:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @MainInterface_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MainInterface is made visible.
function MainInterface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainInterface (see VARARGIN)

% Choose default command line output for MainInterface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainInterface wait for user response (see UIRESUME)
% uiwait(handles.MainInterface);


% --- Outputs from this function are returned to the command line.
function varargout = MainInterface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function MainInterface_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainInterface (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global parmValue;

display('Start 2PMIpreprocessing software.');
display('Powered by luyang.');
disp(' ');

% %修改图标
% newIcon = javax.swing.ImageIcon('PKU.jpg');
% figFrame = get(handle(hObject),'JavaFrame');
% figFrame.setFigureIcon(newIcon); 

%保存下默认参数
Preferences();
load('Preferences.mat');



% --- Executes on button press in FileBtn.
function FileBtn_Callback(hObject, eventdata, handles)
% hObject    handle to FileBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global listPath;

[filename, pathname] = uigetfile({'*.tif';'*.tiff'}, 'Select File');

if isequal(filename, 0)
    msgbox('The file is not exist!', 'IMM'); 
else
    listPath = get(handles.FileList, 'string');
    listPath{length(listPath)+1} = [pathname filename];  
    set(handles.FileList,'value',1);
    set(handles.FileList,'string',listPath);
end
    


% --- Executes on button press in DeleteBtn.
function DeleteBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global listPath;

listValue = get(handles.FileList, 'value');
listPath = get(handles.FileList, 'string');
listPath(listValue) = []; %运行没有问题，不会产生遗留

if(listValue == 1)
    set(handles.FileList, 'value',1);  
elseif(listValue > 1)
    set(handles.FileList, 'value', (listValue - 1));  
end
set(handles.FileList, 'string', listPath);



% --- Executes on button press in PreviewBtn.
function PreviewBtn_Callback(hObject, eventdata, handles)
% hObject    handle to PreviewBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global listPath;

listValue = get(handles.FileList, 'value');
previewPath = listPath{listValue};

PreviewFunc(previewPath);



% --- Executes on button press in StartBtn.
function StartBtn_Callback(hObject, eventdata, handles)
% hObject    handle to StartBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global listPath;

ImgStackBatchProcessingFunc(listPath);



% --- Executes on button press in StopBtn.
function StopBtn_Callback(hObject, eventdata, handles)
% hObject    handle to StopBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in QuitBtn.
function QuitBtn_Callback(hObject, eventdata, handles)
% hObject    handle to QuitBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CleanGlobals;
close(gcf);



function CleanGlobals
global listPath parmValue;
disp('Global value is cleared.')
listPath = {};
parmValue = {};
load('Preferences.mat');



function ConfigurationEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ConfigurationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ConfigurationEdit as text
%        str2double(get(hObject,'String')) returns contents of ConfigurationEdit as a double



% --- Executes during object creation, after setting all properties.
function ConfigurationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ConfigurationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in ConfigurationBtn.
function ConfigurationBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ConfigurationBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in SaveBtn.
function SaveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SaveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in DenoisingBtn.
function DenoisingBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DenoisingBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
listValue = get(handles.DenoisingMenu, 'value');

switch listValue
    case 1
        run MedianFilterGUI.m;
end


% --- Executes during object creation, after setting all properties.
function DenoisingCheckbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DenoisingCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global parmValue;

DenoisingCheckboxValue = parmValue.DenoisingCheckboxValue;
set(hObject, 'value', DenoisingCheckboxValue);



% --- Executes on button press in DenoisingCheckbox.
function DenoisingCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to DenoisingCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DenoisingCheckbox
global parmValue;

DenoisingCheckboxValue = get(hObject, 'value');
parmValue.DenoisingCheckboxValue = DenoisingCheckboxValue;



% --- Executes during object creation, after setting all properties.
function DenoisingMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DenoisingMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global parmValue;

DenoisingMenuValue = parmValue.DenoisingMenuValue;
set(hObject, 'value', DenoisingMenuValue);



% --- Executes on selection change in DenoisingMenu.
function DenoisingMenu_Callback(hObject, eventdata, handles)
% hObject    handle to DenoisingMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DenoisingMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DenoisingMenu
global parmValue;

DenoisingMenuValue = get(hObject, 'value');
parmValue.DenoisingMenuValue = DenoisingMenuValue;


% --- Executes on button press in EnhancingCheckbox.
function EnhancingCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to EnhancingCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of EnhancingCheckbox
global parmValue;

EnhancingCheckboxValue = get(hObject, 'value');
parmValue.EnhancingCheckboxValue = EnhancingCheckboxValue;


% --- Executes on selection change in EnhancingMenu.
function EnhancingMenu_Callback(hObject, eventdata, handles)
% hObject    handle to EnhancingMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EnhancingMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EnhancingMenu
global parmValue;

EnhancingMenuValue = get(hObject, 'value');
parmValue.EnhancingMenuValue = EnhancingMenuValue;



% --- Executes during object creation, after setting all properties.
function EnhancingMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnhancingMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global parmValue;

EnhancingMenuValue = parmValue.EnhancingMenuValue;
set(hObject, 'value', EnhancingMenuValue);


% --- Executes on button press in EnhancingBtn.
function EnhancingBtn_Callback(hObject, eventdata, handles)
% hObject    handle to EnhancingBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
listValue = get(handles.EnhancingMenu, 'value');

switch listValue
    case 1
        run NormalizeGUI.m;
end


% --- Executes on button press in RegistrationCheckbox.
function RegistrationCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to RegistrationCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RegistrationCheckbox
global parmValue;

RegistrationCheckboxValue = get(hObject, 'value');
parmValue.RegistrationCheckboxValue = RegistrationCheckboxValue;


% --- Executes on selection change in RegistrationMenu.
function RegistrationMenu_Callback(hObject, eventdata, handles)
% hObject    handle to RegistrationMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RegistrationMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RegistrationMenu
global parmValue;

RegistrationMenuValue = get(hObject, 'value');
parmValue.RegistrationMenuValue = RegistrationMenuValue;


% --- Executes during object creation, after setting all properties.
function RegistrationMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RegistrationMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global parmValue;

RegistrationMenuValue = parmValue.RegistrationMenuValue;
set(hObject, 'value', RegistrationMenuValue);


% --- Executes on button press in RegistrationBtn.
function RegistrationBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RegistrationBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
listValue = get(handles.DenoisingMenu, 'value');

switch listValue
    case 1
        run IntensityBasedRegistrationGUI.m;
end


% --- Executes during object creation, after setting all properties.
function RegistrationCheckbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RegistrationCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global parmValue;

RegistrationCheckboxValue = parmValue.RegistrationCheckboxValue;
set(hObject, 'value', RegistrationCheckboxValue);


% --- Executes during object creation, after setting all properties.
function EnhancingCheckbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnhancingCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global parmValue;

EnhancingCheckboxValue = parmValue.EnhancingCheckboxValue;
set(hObject, 'value', EnhancingCheckboxValue);
