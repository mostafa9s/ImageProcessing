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
% --- Executes on button press in ShearImageVertically.
function ShearImageVertically_Callback(hObject, eventdata, handles)
% hObject    handle to ShearImageVertically (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the current image
image = handles.current_image;

% Prompt the user for the shear angle
prompt = {'Enter the shear angle (in degrees):'};
dlgtitle = 'Shear Image Vertically';
dims = [1 35];
definput = {'30'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer)
    % User cancelled the dialog box
    return;
end
angle = str2double(answer{1});

% Shear the image vertically using imwarp
tform = affine2d([1 tand(angle) 0; 0 1 0; 0 0 1]);
sheared_image = imwarp(image, tform);

% Update the GUI with the sheared image
axes(handles.axes1);
imshow(sheared_image);

% Update the handles structure
handles.current_image = sheared_image;
guidata(hObject, handles);

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

% Update the handles structure to store the filtered image as the new current image
handles.current_image = filtered_image;
guidata(hObject, handles);
function varargout = testing_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
% Initialize current_image as an empty matrix
handles.current_image = [];

% start function
function startpc_Callback(hObject, eventdata, handles)
% in code baraye peydakardan webcam id system
webcam_info = imaqhwinfo('winvideo');
webcam_id = webcam_info.DeviceIDs;
handles.vid = videoinput('winvideo' , 1, 'YUY2_640X480');
guidata(hObject, handles);
% Stop the webcam
stop(handles.vid);

% Capture the current frame
captured_frame = getdata(handles.vid, 1);

% Display the captured frame in its original color
axes(handles.axes1);
imshow(captured_frame);  % Display the raw (color) captured frame

% Update the handles structure with the captured frame
handles.current_image = captured_frame;

% Store the original captured frame in the handles structure
handles.original_image = captured_frame;

% Perform additional image processing functions here if needed

% Update the handles structure
guidata(hObject, handles);
