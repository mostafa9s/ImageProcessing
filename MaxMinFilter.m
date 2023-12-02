function MaxFilter_Callback(hObject, eventdata, handles)
% hObject    handle to MaxFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the current image
image = handles.current_image;

% Prompt the user for the filter size
prompt = {'Enter the filter size:'};
dlgtitle = 'Max Filter';
dims = [1 35];
definput = {'3'};
answer = inputdlg(prompt, dlgtitle, dims, definput);
if isempty(answer)
    % User cancelled the dialog box
    return;
end
filter_size = str2double(answer{1});

% Apply the max filter using imdilate
max_filtered_image = imdilate(image, ones(filter_size));

% Update the GUI with the max filtered image
axes(handles.axes1);
imshow(max_filtered_image);

% Update the handles structure
handles.current_image = max_filtered_image;
guidata(hObject, handles);



function MinFilter_Callback(hObject, eventdata, handles)
% hObject    handle to the MinFilter button
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the current image
image = handles.current_image;

% Prompt the user for the size of the min filter
prompt = {'Enter the size of the min filter (odd integer):'};
dlgtitle = 'Min Filter';
dims = [1 35];
definput = {'3'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer)
    % User cancelled the dialog box
    return;
end
filter_size = str2double(answer{1});

% Apply the min filter using imerode
se = strel('square', filter_size);
filtered_image = imerode(image, se);

% Update the GUI with the filtered image
axes(handles.axes1);
imshow(filtered_image);

% Update the handles structure
handles.current_image = filtered_image;
guidata(hObject, handles);
