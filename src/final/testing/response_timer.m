function varargout = response_timer(varargin)
% RESPONSE_TIMER MATLAB code for response_timer.fig
%      RESPONSE_TIMER, by itself, creates a new RESPONSE_TIMER or raises the existing
%      singleton*.
%
%      H = RESPONSE_TIMER returns the handle to a new RESPONSE_TIMER or the handle to
%      the existing singleton*.
%
%      RESPONSE_TIMER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSE_TIMER.M with the given input arguments.
%
%      RESPONSE_TIMER('Property','Value',...) creates a new RESPONSE_TIMER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before response_timer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to response_timer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help response_timer

% Last Modified by GUIDE v2.5 14-Apr-2012 00:20:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @response_timer_OpeningFcn, ...
                   'gui_OutputFcn',  @response_timer_OutputFcn, ...
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


% --- Executes just before response_timer is made visible.
function response_timer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to response_timer (see VARARGIN)

% Initialization variables
handles.tStart = 0;
handles.totalQuestions = 10;
handles.currentQuestion = 0;
handles.times = [];

% Choose default command line output for response_timer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes response_timer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = response_timer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start_pushbutton.
function start_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to start_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.tStart == 0
    set(hObject, 'String', 'Next');
    handles.tStart = tic;
    handles.currentQuestion = 1;
else
    tElapsed = toc(handles.tStart);
    handles.times = [handles.times tElapsed];
    set(handles.question_text, 'String', ['Question ' num2str(handles.currentQuestion) ': ' num2str(tElapsed)]);
    if handles.currentQuestion < handles.totalQuestions
        handles.tStart = tic;
        handles.currentQuestion = handles.currentQuestion + 1;
    else
        set(hObject, 'Visible', 'off');
        set(handles.total_text, 'String', ['Total: ' num2str(sum(handles.times))]);
        set(handles.average_text, 'String', ['Average: ' num2str(sum(handles.times)/length(handles.times))]);
        set(handles.total_text, 'Visible', 'on');
        set(handles.average_text, 'Visible', 'on');
        set(handles.again_pushbutton, 'Visible', 'on');
        try
            load('response_timer_data.mat');
        catch exception
            A = [];
        end
        A = [A;handles.times];
        save('response_timer_data.mat', 'A');
    end
end

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on button press in again_pushbutton.
function again_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to again_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.tStart = 0;
handles.totalQuestions = 10;
handles.currentQuestion = 0;
handles.times = [];
set(handles.start_pushbutton, 'String', 'Start');
set(handles.start_pushbutton, 'Visible', 'on');
set(handles.total_text, 'Visible', 'off');
set(handles.average_text, 'Visible', 'off');
set(hObject, 'Visible', 'off');
set(handles.question_text, 'String', '');

% Update handles structure
guidata(handles.figure1, handles);