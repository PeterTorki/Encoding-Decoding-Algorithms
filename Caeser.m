function varargout = Caeser(varargin)
%CAESER MATLAB code file for Caeser.fig
%      CAESER, by itself, creates a new CAESER or raises the existing
%      singleton*.
%
%      H = CAESER returns the handle to a new CAESER or the handle to
%      the existing singleton*.
%
%      CAESER('Property','Value',...) creates a new CAESER using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Caeser_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      CAESER('CALLBACK') and CAESER('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CAESER.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Caeser

% Last Modified by GUIDE v2.5 16-May-2022 17:05:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Caeser_OpeningFcn, ...
                   'gui_OutputFcn',  @Caeser_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Caeser is made visible.
function Caeser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Caeser
handles.output = hObject;
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Caeser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Caeser_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.

function radiobutton1_Callback(hObject, eventdata, handles)
set(handles.radiobutton1, 'Value', 1)
set(handles.radiobutton2, 'Value', 0)
set(handles.edit2, 'enable', 'on')
set(handles.edit1, 'enable', 'on')


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
set(handles.radiobutton2, 'Value', 1)
set(handles.radiobutton1, 'Value', 0)
set(handles.edit2, 'enable', 'on')
set(handles.edit1, 'enable', 'on')


function edit2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)

    Plaintext = get(handles.edit1,'string');
    s = get(handles.edit2,'string');
    k = str2num(['uint8(',s,')']);
    k
    if(get(handles.radiobutton1,'value')== 1)
        Ciphertext = '';
        if k > 25 || k < 1
                f = msgbox('Key must be in range from 1 to 25','Error','error');

        else
            for i= 1:length(Plaintext)
                if (Plaintext(i)== 32)
                    Ciphertext(i) = 32 ;   
                else
                    Ciphertext(i) = Plaintext(i) + k;
                    if Ciphertext(i) > 122
                       Ciphertext(i) = Ciphertext(i) - 26;
                    end  
                end
            end
        end

        Ciphertext = upper(char(Ciphertext));
        set(handles.edit3, 'string', Ciphertext);
    else if(get(handles.radiobutton2,'value'))== 1
            Ciphertext = get(handles.edit1,'string');
            if k>25 || k<1
                f = msgbox('Key must be in range from 1 to 25','Error','error');
  
            else
                for i= 1:length(Ciphertext)
                %once he found a space, skip this iteration, ASCII of space=32
                    if (Ciphertext(i)== 32)
                    Plaintext(i) = 32 ;  
                    else
                         %using addition to find cipherletter "using ASCII code for letters"
                         %A=65  , Z=90
                        Plaintext(i)=Ciphertext(i)-k;
    
                        if Plaintext(i) <65
                            Plaintext(i)=Plaintext(i)+26;
                        end
                    end
                end
            Plaintext=lower(char(Plaintext));
            set(handles.edit3, 'string', Plaintext);

            end
        end
    end
    
function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);

% --- Executes on button press in pushbutton1.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.edit1,'string','');
set(handles.edit3,'string','');
set(handles.edit2,'string','');
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
