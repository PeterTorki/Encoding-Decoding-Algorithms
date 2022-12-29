function varargout = CyclicNonSys(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CyclicNonSys_OpeningFcn, ...
                   'gui_OutputFcn',  @CyclicNonSys_OutputFcn, ...
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


% --- Executes just before CyclicNonSys is made visible.
function CyclicNonSys_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
set(handles.edit3, 'enable', 'off')
guidata(hObject, handles);

% UIWAIT makes CyclicNonSys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CyclicNonSys_OutputFcn(hObject, eventdata, handles) 

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
    
    a = get(handles.edit1,'string');
    b = get(handles.edit3,'string');
    m = str2num(a); % str -> vector 
    b = str2num(b); % str -> vector
    g = flip(b);
    
    G = poly2sym(g); % binary -> Poly 
    U = poly2sym(m); % binary -> Poly
    V = (mod(sym2poly(G * U),2)); % mult of 2 polys , poly -> binary
    s = mat2str(V);
    set(handles.edit2, 'string', s);

else if(get(handles.radiobutton2,'value')== 1)
        
        a = get(handles.edit2,'string');
        b = get(handles.edit3,'string');
        v = str2num(a);
        G = str2num(b);
        [q,rem] = deconv(v,G)
        q = mod(q, 2);
        rem = mod(rem, 2);
        newrem = flip(rem);
        b = flip(v);
        for i = 1 : length(newrem)
            if newrem(i) == 1
                b(i) = 1 - b(i);
            end
        end
        s = mat2str(b);
        set(handles.edit1, 'string', s);
    end
end

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


function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);
