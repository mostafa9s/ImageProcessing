gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageProcessing_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageProcessing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);


% Show a file dialog box to allow the user to select an image
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.tif;*.tiff', 'Image Files (*.jpg, *.jpeg, *.png, *.bmp, *.tif, *.tiff)'}, 'Select an image');

    imshow(handles.current_image, 'Parent', handles.axes1);

    imshow(handles.current_image, 'Parent', handles.axes1);
    % --- Executes on button press in GaussianFilter.
function GaussianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to GaussianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prompt the user for the standard deviation of the Gaussian filter
prompt = {'Enter the standard deviation of the Gaussian filter:'};
dlgtitle = 'Gaussian Filter';
dims = [1 35];
definput = {'1'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer)
    % User cancelled the dialog box
    return;
end
sigma = str2double(answer{1});

% Apply the Gaussian filter to the current image
filtered_image = imgaussfilt(handles.current_image, sigma);

% Show the filtered image in the GUI
imshow(filtered_image, 'Parent', handles.axes1);

% Update the handles structure to store the filtered image as the new current image
handles.current_image = filtered_image;
guidata(hObject, handles);

