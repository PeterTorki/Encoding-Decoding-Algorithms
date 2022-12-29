function varargout = LBCB(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LBCB_OpeningFcn, ...
                   'gui_OutputFcn',  @LBCB_OutputFcn, ...
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


% --- Executes just before LBCB is made visible.
function LBCB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LBCB (see VARARGIN)

% Choose default command line output for LBCB
handles.output = hObject;
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
set(handles.edit3, 'enable', 'off')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LBCB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LBCB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

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




% --- Executes during object creation, after setting all properties.
function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_Callback(hObject, eventdata, handles)

% --- Executes on button press in radiobutton1.


function radiobutton1_Callback(hObject, eventdata, handles)
set(handles.radiobutton1, 'Value', 1)
set(handles.radiobutton2, 'Value', 0)
set(handles.edit3, 'enable', 'on')
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'on')
set(handles.edit1,'string','');
set(handles.edit3,'string','');
set(handles.edit2,'string','');

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
set(handles.radiobutton2, 'Value', 1)
set(handles.radiobutton1, 'Value', 0)
set(handles.edit1, 'enable', 'off')
set(handles.edit2, 'enable', 'on')
set(handles.edit3, 'enable', 'on')
set(handles.edit1,'string','');
set(handles.edit3,'string','');
set(handles.edit2,'string','');


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
% hObject handle to done (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
if(get(handles.radiobutton1,'value')== 1)
    
    set(handles.edit2,'Enable','on');
    a = get(handles.edit1,'string');
    b = get(handles.edit3,'string');

    g = str2num(b);
    d = str2num(a);
% 1 1 0 1 0 0 0 ;0 1 1 0 1 0 0;1 1 1 0 0 1 1;1 0 1 0 0 0 1 
    v = mod(d*g, 2);
    s = mat2str(v);
    set(handles.edit2, 'string', s);

else if(get(handles.radiobutton2,'value')== 1)
        
        set(handles.edit1,'Enable','on');
        a = get(handles.edit2,'string');
        b = get(handles.edit3,'string');

        g = str2num(b); % Generator Matrix
        v = str2num(a); % V
        
        [k, n] = size(g);
        x = n - k;
        
        P = [g(1 : k, 1 : n - k)];
        H = [eye(n - k) P']
        H
        Ht = transpose(H);
        
        S = mod(v * Ht, 2);
                    
        if sum(S) == 0
            u = v(x + 1: n);
         
        else
            for i = 1: size(Ht, 1)
              if(Ht(i, 1: x) == S)
                v(i) = 1 - v(i);
                break;
              end
            end
              u = v(x + 1: n)
        end
    disp(u)
    s = mat2str(u);
    set(handles.edit1, 'string', s);
    

    end
end
    
function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string','');
set(handles.edit3,'string','');
set(handles.edit2,'string','');
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
set(handles.edit3, 'enable', 'off')
