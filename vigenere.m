function varargout = vigenere(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vigenere_OpeningFcn, ...
                   'gui_OutputFcn',  @vigenere_OutputFcn, ...
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


% --- Executes just before vigenere is made visible.
function vigenere_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vigenere (see VARARGIN)

% Choose default command line output for vigenere
handles.output = hObject;

set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
guidata(hObject, handles);

% UIWAIT makes vigenere wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = vigenere_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    plaintext = get(handles.edit1,'string');
    k = get(handles.edit2,'string');
    ciphertext = plaintext;
    
    if(get(handles.radiobutton1,'value')== 1)
        key = zeros(1,length(plaintext))
        i=1;
        for j=1:length(plaintext) 
            if(plaintext(j)==32)
               key(1,j)=plaintext(j)
            else
               key(1,j)=k(i)
               i=i+1
                if i>length(k)
                     i=1
                end
            end

        end

        for x=1 : length(plaintext)
            if (plaintext(x)==32)
                continue;
            else
                plaintext(x)=plaintext(x)-97;
                key(x)=key(x)-97;
                ciphertext(x)=upper(char(mod(plaintext(x)+key(x),26)+97));
            end
        end
        
    set(handles.edit6, 'string', ciphertext);
    else
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        x = ciphertext;
        ciphertext = plaintext;
        plaintext = x;
        key=zeros(1,length(ciphertext));
        i=1;
        for j=1:length(ciphertext); 
            if(ciphertext(j)==32)
               key(1,j)=ciphertext(j);
            else
               key(1,j)=k(i);
               i=i+1;
                if i>length(k);
                     i=1;
                end
            end

        end
        for x=1:length(ciphertext);
            if (ciphertext(x)==32)
                continue;
            else
                ciphertext(x)=ciphertext(x)-65;
                key(x)=key(x)-65;
                plaintext(x)=lower(char(mod(ciphertext(x)-key(x),26)+65));
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        set(handles.edit6, 'string', plaintext);
    end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.edit1,'string','');
set(handles.edit6,'string','');
set(handles.edit2,'string','');
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
