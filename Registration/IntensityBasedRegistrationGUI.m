function varargout = IntensityBasedRegistrationGUI(varargin)
% INTENSITYBASEDREGISTRATIONGUI MATLAB code for IntensityBasedRegistrationGUI.fig
%      INTENSITYBASEDREGISTRATIONGUI, by itself, creates a new INTENSITYBASEDREGISTRATIONGUI or raises the existing
%      singleton*.
%
%      H = INTENSITYBASEDREGISTRATIONGUI returns the handle to a new INTENSITYBASEDREGISTRATIONGUI or the handle to
%      the existing singleton*.
%
%      INTENSITYBASEDREGISTRATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTENSITYBASEDREGISTRATIONGUI.M with the given input arguments.
%
%      INTENSITYBASEDREGISTRATIONGUI('Property','Value',...) creates a new INTENSITYBASEDREGISTRATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IntensityBasedRegistrationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IntensityBasedRegistrationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IntensityBasedRegistrationGUI

% Last Modified by GUIDE v2.5 08-Feb-2017 21:05:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IntensityBasedRegistrationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @IntensityBasedRegistrationGUI_OutputFcn, ...
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


% --- Executes just before IntensityBasedRegistrationGUI is made visible.
function IntensityBasedRegistrationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IntensityBasedRegistrationGUI (see VARARGIN)

% Choose default command line output for IntensityBasedRegistrationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IntensityBasedRegistrationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IntensityBasedRegistrationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function maxIterationEdit_Callback(hObject, eventdata, handles)
% hObject    handle to maxIterationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxIterationEdit as text
%        str2double(get(hObject,'String')) returns contents of maxIterationEdit as a double


% --- Executes during object creation, after setting all properties.
function maxIterationEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxIterationEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global parmValue;

maxIteration = parmValue.RegistrationParm.maxIteration;
set(hObject, 'string', num2str(maxIteration));


% --- Executes on selection change in modalityPopupmenu.
function modalityPopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to modalityPopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns modalityPopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from modalityPopupmenu


% --- Executes during object creation, after setting all properties.
function modalityPopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modalityPopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global parmValue;

if(strcmpi(parmValue.RegistrationParm.modality, 'multimodal'))
   set(hObject, 'value', 1); 
elseif(strcmpi(parmValue.RegistrationParm.modality, 'monomodal'))
   set(hObject, 'value', 2); 
end



% --- Executes on button press in OKBtn.
function OKBtn_Callback(hObject, eventdata, handles)
% hObject    handle to OKBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global parmValue;

modality = get(handles.modalityPopupmenu, 'string');
maxIteration = str2num(get(handles.maxIterationEdit, 'string'));

if isempty(modality) || isempty(maxIteration)
    errordlg( '�������ô���', 'error', 'modal' );
else
    parmValue.RegistrationParm.modality = modality;
    parmValue.RegistrationParm.maxIteration = maxIteration;
    close(gcf);
end

% --- Executes on button press in CancelBtn.
function CancelBtn_Callback(hObject, eventdata, handles)
% hObject    handle to CancelBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);


% --- Executes during object creation, after setting all properties.
function OKBtn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OKBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
