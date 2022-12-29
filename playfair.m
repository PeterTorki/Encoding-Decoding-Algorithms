function varargout = playfair(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @playfair_OpeningFcn, ...
                   'gui_OutputFcn',  @playfair_OutputFcn, ...
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


function playfair_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to playfair (see VARARGIN)

% Choose default command line output for playfair
handles.output = hObject;
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')
guidata(hObject, handles);

% UIWAIT makes playfair wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = playfair_OutputFcn(hObject, eventdata, handles) 
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

    
function figure1_CloseRequestFcn(hObject, eventdata, handles)
gui
delete(hObject);

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



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.edit1,'string','');
set(handles.edit3,'string','');
set(handles.edit2,'string','');
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.edit2, 'enable', 'off')
set(handles.edit1, 'enable', 'off')



% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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

function answer = same_line(a,b,inverse)
    answer = ((floor((inverse(a-'A'+1)-1)/5)+1) == (floor((inverse(b-'A'+1)-1)/5)+1));
    return


function answer = same_row(a,b,inverse)
answer = ((mod(inverse(a-'A'+1)-1,5)+1) == (mod(inverse(b-'A'+1)-1,5)+1));
return


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

 
if(get(handles.radiobutton1,'value')== 1)
    key = get(handles.edit2,'string');
    sentence = get(handles.edit1,'string');
        key= upper(key);
        key_len=length(key);
        playfair_table=zeros(5,5);
        alphabet_exist=zeros(1,26); % a table that, if the letter c (==char) isfound the it (the table) has 1 in index c-'A'+1 else it has 0
        alphabet_exist(10)=1; % index 10 is letter J which is the same (for the algorithm) to I, so I don't want it in my Playfair table
        j=1;
        for i=1:key_len
            num=key(i);
            if(alphabet_exist((num-'A')+1)==0)
                playfair_table(floor((j-1)/5)+1, mod(j-1,5)+1)=num;
                alphabet_exist((num-'A')+1)=1;
                j=j+1;
            end
        end
        for i=1:26
            if(alphabet_exist(i)==0)
                playfair_table(floor((j-1)/5)+1, mod((j-1),5)+1)=i+'A'-1;
                alphabet_exist(i)=1;
                j=j+1;
            end
        end
        playfair_table
        display(char(playfair_table));
        fprintf('\n');         
     
        sentence=upper(sentence); %????? ??? ????????
        s_len=length(sentence);
        
        % I place an X between any 2 consecutive same latter while also in the end
        % of the word if its length (after the additions of X's) is odd
        prev=sentence(1);
        i=2;
        while(i<=s_len)
            current=sentence(i);
            prev = sentence(i - 1);
            if(prev==current)
                sentence=insertAfter(sentence,i-1,'X');
                s_len = s_len+1;
                i = i+1;
            end
            i = i+2;
        end
        if(mod(s_len,2)==1)
            sentence=insertAfter(sentence,i-1,'Z');
            s_len=s_len+1;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % I create the inverse of Playfair by the sense that if Playfair has the
        % letter c (==char) on index i then the inverse has i on index c-'A'+1
        inverse = zeros(1, 25);
        for i=1:25
            inverse(playfair_table(floor((i-1)/5)+1,mod(i-1,5)+1)-'A'+1)=i;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        encrypted_sentence=zeros(1,s_len);
        decrypted_sentence=zeros(1,s_len);
         for i=1:s_len/2
             %encryption
             disp(char(sentence(i*2-1)) + ' ' + char(sentence(i*2)));
             
             if(same_line(sentence(i*2-1), sentence(i*2), inverse))
                 k=inverse(sentence(i*2-1)-'A'+1);
                 encrypted_sentence(i*2-1) = playfair_table(floor((k-1)/5)+1,mod(mod(k-1,5)+1,5)+1);
                 k=inverse(sentence(i*2)-'A'+1);
                 encrypted_sentence(i*2) = playfair_table(floor((k-1)/5)+1,mod(mod(k-1,5)+1,5)+1);
             elseif(same_row(sentence(i*2-1), sentence(i*2), inverse))
                 k=inverse(sentence(i*2-1)-'A'+1);
                 encrypted_sentence(i*2-1) = playfair_table(mod(floor((k-1)/5)+1,5)+1,mod(k-1,5)+1);
                 k=inverse(sentence(i*2)-'A'+1);
                 encrypted_sentence(i*2) = playfair_table(mod(floor((k-1)/5)+1,5)+1,mod(k-1,5)+1);
             else
                 k=inverse(sentence(i*2-1)-'A'+1);
                 k_2=inverse(sentence(i*2)-'A'+1);
                 encrypted_sentence(i*2-1) = playfair_table(floor((k-1)/5)+1,mod(k_2-1,5)+1);
                 encrypted_sentence(i*2) = playfair_table(floor((k_2-1)/5)+1,mod(k-1,5)+1);
             end
             %decryption
             if(same_line(encrypted_sentence(i*2-1), encrypted_sentence(i*2), inverse))
                 k=inverse(encrypted_sentence(i*2-1)-'A'+1);
                 decrypted_sentence(i*2-1) = playfair_table(floor((k-1)/5)+1,mod(mod(k-1,5)-1,5)+1);
                 k=inverse(encrypted_sentence(i*2)-'A'+1);
                 decrypted_sentence(i*2) = playfair_table(floor((k-1)/5)+1,mod(mod(k-1,5)-1,5)+1);
             elseif(same_row(encrypted_sentence(i*2-1), encrypted_sentence(i*2), inverse))
                 k=inverse(encrypted_sentence(i*2-1)-'A'+1);
                 decrypted_sentence(i*2-1) = playfair_table(mod(floor((k-1)/5)-1,5)+1,mod(k-1,5)+1);
                 k=inverse(encrypted_sentence(i*2)-'A'+1);
                 decrypted_sentence(i*2) = playfair_table(mod(floor((k-1)/5)-1,5)+1,mod(k-1,5)+1);
             else
                 k=inverse(encrypted_sentence(i*2-1)-'A'+1);
                 k_2=inverse(encrypted_sentence(i*2)-'A'+1);
                 decrypted_sentence(i*2-1) = playfair_table(floor((k-1)/5)+1,mod(k_2-1,5)+1);
                 decrypted_sentence(i*2) = playfair_table(floor((k_2-1)/5)+1,mod(k-1,5)+1);
             end
         end
          char(encrypted_sentence)
          set(handles.edit3, 'string', char(encrypted_sentence));
 
else if(get(handles.radiobutton2,'value') ==  1)
        keyword = get(handles.edit2,'string');
        message = get(handles.edit1,'string');
        keyword = convertCharsToStrings(keyword);
        keyword= upper(keyword);
        %keyword = "CINCINNATI"
        %message = "A TEST TO ENCRYPT USING PLAYFAIR CIPHER";
        
        message = upper(message);
        % Prepare message for encryption
        nospace = no_space(message);
        nodups = check_dups(nospace);
        split = get_pairs(nodups)';
        nodup = remove_dup(keyword);
        
        % Create matrix
        mat = make_matrix(nodup);
        
        % Encrypt message
        encrypted_message = encrypt(mat, split);
        
        % Prepare for message decryption
        enc_splitted = get_pairs(encrypted_message)';
        
        % Decrypt message
        decrypted_message = decrypt(mat, enc_splitted);
        decrypted_message = erase(decrypted_message, "X"); % Remove X in message
        
        % Display output
        disp("Playfair Matrix:");
        disp(mat);
        
        disp("Original Message:");
        disp(message);
        
        disp("Decrypted Message:");
        disp(encrypted_message);
         set(handles.edit3, 'string', char(encrypted_message));
    end
end

%% Break string into pairs
function split_txt = get_pairs(plain_txt)
    split_txt = "";
    for i = 1:strlength(plain_txt)
        if i == 1
            split_txt = append(split_txt, plain_txt{1}(i));
        elseif mod(i-1, 2) ~= 0
            split_txt = append(split_txt, plain_txt{1}(i));
        else
            split_txt = append(split_txt, ' ');
            split_txt = append(split_txt, plain_txt{1}(i));
        end
    end 
    split_txt = split(split_txt);
    

    %% Removing spaces from a string
function str = no_space(message)
    str = regexprep(message, '\s+', '');

%% Add X's for duplicates or odd numbered strings
function padded = check_dups(message)
    padded = "";
    for i = 1:strlength(message)
        if i == strlength(message)
            curr_char = message(i);
            padded = append(padded, curr_char);   
            if mod(strlength(padded), 2 )~= 0
                padded = append(padded, 'X');
            end
        elseif i ~= strlength(message)
            curr_char = message(i);
            next_char = message(i+1);

            if(curr_char == next_char)
                padded = append(padded, curr_char);
                padded = append(padded, 'X');
            else
                padded = append(padded, curr_char);
            end
        end
    end


%% Remove duplicate characters from keyword
function uniq_str = remove_dup(str)
    uniq_str = "";
    for i = 1:strlength(str)
        if contains(uniq_str, str{1}(i)) == 0
            uniq_str = append(uniq_str, str{1}(i));
        end
    end


%% Making the 5x5 matrix
function matrix = make_matrix(kw)
    mat_str = kw; 
    alph = 'A':'Z';
    alph(alph == 'J') = []; % Remove J from alphabet

    % combining the keyword and the alphabet to insert into matrix
    for i = 1:strlength(alph)
        if contains(kw, alph(i)) == 0
            mat_str = append(mat_str, alph(i));
        end
    end
    
    matrix = strings(5);
    index = 1;
    for row = 1:5   
        for col = 1:5
            %matrix(row, col) = str2arr(index);
            matrix(row, col) = mat_str{1}(index);
            index = index + 1;
        end
    end


%% Encrypting the message
function enc_message = encrypt(matrix, plaintext)
    enc_message = "";
    plaintext;
    for i = 1:length(plaintext)
        char1 = plaintext{i}(1);
        char2 = plaintext{i}(2);
        
        if char1 == "J"
            char1 = "I";
        elseif char2 == "J"
            char2 = "I";
        end
        
        [row1, col1] = find(matrix == char1);
        [row2, col2] = find(matrix == char2);
        
         if row1 == row2
            c1 = mod(col1 - 1 + 5, 5);
            if c1 == 0
                c1 = 5;
            end
            c2 = mod(col2 - 1 + 5, 5);
            if c2 == 0
                c2 = 5;
            end
            enc_message = append(enc_message, matrix(row1, c1));
            enc_message = append(enc_message, matrix(row2, c2));
         elseif col1 == col2
            enc_message = append(enc_message, matrix(mod(row1 - 1 + 5, 5), col1));
            enc_message = append(enc_message, matrix(mod(row2 - 1 + 5, 5), col2));
         else
            enc_message = append(enc_message, matrix(row1, col2));
            enc_message = append(enc_message, matrix(row2, col1));
         end
    end
    enc_message;


%% Decrypting the message
function denc_message = decrypt(matrix, message)
    denc_message = "";
    for i = 1:length(message)
        char1 = message(i);
        char2 = message(i);

        if char1 == "J"
            char1 = "I";
        elseif char2 == "J"
            char2 = "I";
        end
        
        [row1, col1] = find(matrix == char1);
        [row2, col2] = find(matrix == char2);
        
         if row1 == row2
            a = mod(col1 - 1, 5);
            if a == 0
                a = 5;
            end
            b = mod(col2 - 1, 5);
            if b == 0
                b = 5;
            end
            
            denc_message = append(denc_message, matrix(row1, a));
            denc_message = append(denc_message, matrix(row2, b));
         elseif col1 == col2
            a = mod(row1 - 1, 5);
            if a == 0
                a = 5;
            end
            b = mod(row2 - 1, 5);
            if b == 0
                b = 5;
            end
            denc_message = append(denc_message, matrix(a, col1));
            denc_message = append(denc_message, matrix(b, col2));
         else
            denc_message = append(denc_message, matrix(row1, col2));
            denc_message = append(denc_message, matrix(row2, col1));
         end
    end
    denc_message;
  
