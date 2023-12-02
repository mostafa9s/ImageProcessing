gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageProcessing_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageProcessing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);


% Show a file dialog box to allow the user to select an image
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.tif;*.tiff', 'Image Files (*.jpg, *.jpeg, *.png, *.bmp, *.tif, *.tiff)'}, 'Select an image');

% Get the current image
image = handles.current_image;

% Prompt the user for the translation distance
prompt = {'Enter the horizontal translation distance (in pixels):', ...
          'Enter the vertical translation distance (in pixels):'};
dlgtitle = 'Translate Image';
dims = [1 35];
definput = {'50', '50'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer)
    % User cancelled the dialog box
    return;
end
dx = str2double(answer{1});
dy = str2double(answer{2});

% Translate the image using imtranslate
translated_image = imtranslate(image, [dx, dy]);

% Update the GUI with the translated image
axes(handles.axes1);
imshow(translated_image);

% Update the handles structure
handles.current_image = translated_image;
guidata(hObject, handles);


% --- Executes on button press in ShearImageHorizontally.
function ShearImageHorizontally_Callback(hObject, eventdata, handles)
% hObject    handle to ShearImageHorizontally (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to ShearImageVertically (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the current image
image = handles.current_image;

% Prompt the user for the shear angle
prompt = {'Enter the shear angle (in degrees):'};
dlgtitle = 'Shear Image Vertically';
dims = [1 35];
% Get the current image
image = handles.current_image;

% Prompt the user for the shear angle
prompt = {'Enter the shear angle (in degrees):'};
dlgtitle = 'Shear Image Horizontally';
dims = [1 35];
definput = {'30'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer)
    % User cancelled the dialog box
    return;
end
angle = str2double(answer{1});

% Shear the image horizontally using imwarp
tform = affine2d([1 0 0; tand(angle) 1 0; 0 0 1]);
sheared_image = imwarp(image, tform);


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

