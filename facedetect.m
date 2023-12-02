%Face Detection code section


function testing_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
axes(handles.axes1);
imshow('blank.jpg');
axis off;
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

%face detection function
function facedetect_Callback(hObject, eventdata, handles)
triggerconfig(handles.vid ,'manual');
set(handles.vid, 'TriggerRepeat',inf);
set(handles.vid, 'FramesPerTrigger',1);
handles.vid.ReturnedColorspace = 'rgb';
 handles.vid.Timeout = 5;
start(handles.vid);
while(1)

facedetector = vision.CascadeObjectDetector;                                                 
trigger(handles.vid); 
handles.im = getdata(handles.vid, 1);
bbox = step(facedetector, handles.im);
hello = insertObjectAnnotation(handles.im,'rectangle',bbox,'Face');
imshow(hello);
end
guidata(hObject, handles);


% --- Executes on button press in Stop button for face detection.
function stopc_Callback(hObject, eventdata, handles)
handles.output = hObject;

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
