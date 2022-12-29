function varargout = CyclicSys(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CyclicSys_OpeningFcn, ...
                   'gui_OutputFcn',  @CyclicSys_OutputFcn, ...
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


% --- Executes just before CyclicSys is made visible.
function CyclicSys_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CyclicSys (see VARARGIN)

% Choose default command line output for CyclicSys
handles.output = hObject;

set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
set(handles.edit3, 'enable', 'off')
guidata(hObject, handles);

% UIWAIT makes CyclicSys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CyclicSys_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

if(get(handles.radiobutton1,'value')== 1)
    
    %Encode
    set(handles.edit2,'Enable','on');
    a = get(handles.edit1,'string');
    b = get(handles.edit3,'string');
    g = str2num(b);
    u = str2num(a);
    if mod(u,2)==u
        k=length(u)
        %poly2sym fun is used to write polynomial equation of binary vector g[1 0 1 1] but write it in reverse order [1 1 0 1] to get the right equation
        gx=poly2sym(g)
        %find is used to get index of non zero elements in vector g which will be in ex:1 2 4
        polyPowers = find(g) - 1;
        paritybits=max(polyPowers);
        n=k+paritybits;

        v=zeros([1,paritybits])
        v=[v u] 

        syms x
        zx=x^n+1

        %sym2poly returns the numeric vector of coefficients of the symbolic polynomial 
        %when you use deconv function  parameters must be vestors"Binary"
        %fliplr Flip array left to right

        zxb=sym2poly(zx)
        [h,r]=deconv(zxb,g)
        h=mod(h,2)
        hx=poly2sym(h)
        hcoeff=fliplr(h)

        %index in matlab for vector start from 1 
        m=hcoeff(1:paritybits+1);
        x=length(v)
        y=length(u)
        for j=0:paritybits-1
            v(paritybits-j)=sum(m.*v(x:-1:y));
            v(paritybits-j)=mod(v(paritybits-j),2)
            x=x-1;
            y=y-1;
        end 

        res = mat2str(v);
        set(handles.edit2, 'string', res);
    else
        f = msgbox('u must be a binary' ,'Error','error');
    end

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
        set(handles.edit1,'Enable','on');
        
end
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


function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
set(handles.edit1,'string','');
set(handles.edit3,'string','');
set(handles.edit2,'string','');
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
set(handles.edit3, 'enable', 'off')
