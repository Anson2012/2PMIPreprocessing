function varargout = EnhancingGUI(varargin)
% ENHANCINGGUI MATLAB code for EnhancingGUI.fig
%      ENHANCINGGUI, by itself, creates a new ENHANCINGGUI or raises the existing
%      singleton*.
%
%      H = ENHANCINGGUI returns the handle to a new ENHANCINGGUI or the handle to
%      the existing singleton*.
%
%      ENHANCINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENHANCINGGUI.M with the given input arguments.
%
%      ENHANCINGGUI('Property','Value',...) creates a new ENHANCINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnhancingGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnhancingGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnhancingGUI

% Last Modified by GUIDE v2.5 23-Jan-2017 16:45:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EnhancingGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @EnhancingGUI_OutputFcn, ...
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


% --- Executes just before EnhancingGUI is made visible.
function EnhancingGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnhancingGUI (see VARARGIN)

% Choose default command line output for EnhancingGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnhancingGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EnhancingGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function SaturatedEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SaturatedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global parmValue;

SaturatedPCT = parmValue.EnhancingParm.SaturatedPCT;
set(hObject, 'string', num2str(SaturatedPCT));


% --- Executes on button press in OKBtn.
function OKBtn_Callback(hObject, eventdata, handles)
% hObject    handle to OKBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global parmValue;

SaturatedPCT = str2num(get(handles.SaturatedEdit, 'string'));

if isempty(SaturatedPCT)
    errordlg( '≤Œ ˝…Ë÷√¥ÌŒÛ£°', 'error', 'modal' );
else
    parmValue.EnhancingParm.SaturatedPCT = SaturatedPCT;
    close(gcf);
end



% --- Executes on button press in CancelBtn.
function CancelBtn_Callback(hObject, eventdata, handles)
% hObject    handle to CancelBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
