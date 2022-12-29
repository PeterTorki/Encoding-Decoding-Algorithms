function varargout = hill(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hill_OpeningFcn, ...
                   'gui_OutputFcn',  @hill_OutputFcn, ...
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


% --- Executes just before hill is made visible.
function hill_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.HCplain_text,'enable','off');
set(handles.HCoutput,'enable','off');
set(handles.HCkey,'enable','off');
set(handles.HCkey, 'enable', 'off')
set(handles.HCplain_text, 'enable', 'off')
handles.output = hObject;


guidata(hObject, handles);

% UIWAIT makes hill wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hill_OutputFcn(hObject, eventdata, handles) 
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
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function HCplain_text_Callback(hObject, eventdata, handles)
% hObject    handle to HCplain_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HCplain_text as text
%        str2double(get(hObject,'String')) returns contents of HCplain_text as a double


% --- Executes during object creation, after setting all properties.
function HCplain_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HCplain_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HCErad_but.
function HCErad_but_Callback(hObject, eventdata, handles)
set(handles.HCErad_but, 'Value', 1)
set(handles.HCDrad_but, 'Value', 0)
set(handles.HCkey, 'enable', 'on')
set(handles.HCplain_text, 'enable', 'on')

function HCDrad_but_Callback(hObject, eventdata, handles)
set(handles.HCDrad_but, 'Value', 1)
set(handles.HCErad_but, 'Value', 0)
set(handles.HCkey, 'enable', 'on')
set(handles.HCplain_text, 'enable', 'on')



function HCkey_Callback(hObject, eventdata, handles)
% hObject    handle to HCkey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HCkey as text
%        str2double(get(hObject,'String')) returns contents of HCkey as a double


% --- Executes during object creation, after setting all properties.
function HCkey_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HCkey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HCoutput_Callback(hObject, eventdata, handles)
% hObject    handle to HCoutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HCoutput as text
%        str2double(get(hObject,'String')) returns contents of HCoutput as a double


% --- Executes during object creation, after setting all properties.
function HCoutput_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HC_click.
function HC_click_Callback(hObject, eventdata, handles)
 Plaintext = get(handles.HCplain_text,'string');
    key = get(handles.HCkey,'string');
    k = str2num(key);
 
 if(get(handles.HCErad_but,'value')== 1)
        Ciphertext = '';
    lenk=size(k,2);
    Ciphertext=reshape(Plaintext,[],lenk)*0;
    [nr,ncol]=size(Ciphertext); 
    x=1;
    for j=1:nr
        for i=1:ncol
              Ciphertext(j,i)=Plaintext(x)
              x=x+1;
        end  
    end   
      Ciphertext=Ciphertext-97
      Ciphertext=upper(char(mod(Ciphertext*k,26)+97));
       
    h=1;
    for j=1:nr
        for i=1:ncol
            m(1,h)=Ciphertext(j,i);
            h=h+1;
        end  
    end
    Ciphertext=m;
    set(handles.HCoutput, 'string', Ciphertext);

 else if(get(handles.HCDrad_but,'value'))== 1
     Ciphertext = get(handles.HCplain_text,'string');
     
     lenk=size(k,2);
     plaintext=  reshape(Ciphertext,[],lenk)*0;
     [nr,ncol]=size(plaintext);

x=1;
for j=1:nr
    for i=1:ncol
          plaintext(j,i)=Ciphertext(x);
          x=x+1;
    end
end

plaintext=plaintext-65;
dk=int16(mod(det(k),26));

if gcd(dk,26) ~= 1
     f = msgbox('determinant has no inverse modulo 26','Error','error');
else 
[~,u,~]= gcd(dk,26);
inverse_dk= mod(u,26);
end

key_t=k';
adjugate_key=int16((det(key_t)*inv(key_t))');
key_inverse=mod(inverse_dk*adjugate_key,26);
plaintext=lower(char((mod(plaintext*double(key_inverse),26)+65)));

h=1;
for j=1:nr
    for i=1:ncol
        pl(1,h)=plaintext(j,i);
        h=h+1;
    end  
end
     plaintext=pl;
        set(handles.HCoutput, 'string',plaintext);
end
 end      

    
function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);
    
    
% --- Executes on button press in HC_clear.
function HC_clear_Callback(hObject, eventdata, handles)
set(handles.HCplain_text,'string','');
set(handles.HCoutput,'string','');
set(handles.HCkey,'string','');
set(handles.HCErad_but,'value',0);
set(handles.HCDrad_but,'value',0);
set(handles.HCkey, 'enable', 'off')
set(handles.HCplain_text, 'enable', 'off')
