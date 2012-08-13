function varargout = survey(varargin)
% SURVEY MATLAB code for survey.fig
%      SURVEY, by itself, creates a new SURVEY or raises the existing
%      singleton*.
%
%      H = SURVEY returns the handle to a new SURVEY or the handle to
%      the existing singleton*.
%
%      SURVEY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SURVEY.M with the given input arguments.
%
%      SURVEY('Property','Value',...) creates a new SURVEY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before survey_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to survey_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help survey

% Last Modified by GUIDE v2.5 18-Apr-2012 14:33:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @survey_OpeningFcn, ...
                   'gui_OutputFcn',  @survey_OutputFcn, ...
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


% --- Executes just before survey is made visible.
function survey_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to survey (see VARARGIN)

% Initialization Variables

handles.Q = {
'What is your sex?',{'Male','Female'};
'What is your marital status?',{'Now married','Widowed','Divorced','Separated','Never married'};
'What is your ethnicity?',{'Hispanic or Latino','Not Hispanic or Latino'};
'What is your race?',{'American Indian or Alaska Native','Asian','Black or African American','Native Hawaiian or Other Pacific Islander','White'};
'What is your employment status?',{'Employed for wages','Self-employed','Out of work and looking for work','Out of work but not currently looking for work','A homemaker','A student','Retired','Unable to work'};
'When do you feel your best?',{'In the morning','During the afternoon and early evening','Late at night'};
'You usually walk...',{'Fairly fast, with long steps','Fairly fast, with small steps','Less fast, head up, looking the world in the face','Less fast, head down','Very slowly'};
'When talking to people, you...',{'Stand with your arms folded','Have your hands clasped','Have one or both of your hands on your hips','Touch or push the person to whom you are talking','Play with your ear or hair, touch your chin, or smooth your hair'};
'When relaxing, you sit with...',{'Your knees bent, with your legs neatly side by side','Your legs crossed','Your legs stretched out or straight','One leg curled under you'};
'When something really amuses you, you react with...',{'A big, appreciative laugh','A laugh, but not a loud one','A quiet chuckle','A sheepish smile'};
'When you go to a party or social gathering, you...',{'Make a loud entrance, so that everyone notices you','Make a quiet entrance, looking around for someone you know','Make the quietest entrance, trying to stay unnoticed'};
'You''re working very hard, concentrating hard, and you''re interrupted. You...',{'Welcome the break','Feel extremely irritated','Vary between these two extremes'};
'Which of the following colors do you like the most?',{'Red/orange','Black','Yellow/light blue','Green','Dark blue/purple','White','Brown/gray'};
'When you are in bed at night, in those last few moments before going to sleep, you are...',{'Stretched out on your back','Stretched out face down on your stomach','On your side, slightly curled','With your head on one arm','With your head under the covers'};
'You often dream that you are...',{'Falling','Fighting or struggling','Searching for something or somebody','Flying or floating','You usually have dreamless sleep','Your dreams are always pleasant'}
};

% Q{question,1} // Question
% Q{question,2}(answer_choice) // Answer Choices
% Q{question,2}{1,answer_choice} // Answer Choices

handles.numQuestions = length(handles.Q);
handles.currQuestion = 0;
handles.tStart = 0;
handles.times = [];

% Choose default command line output for survey
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes survey wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = survey_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in begin_pushbutton.
function begin_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to begin_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.currQuestion == 0)
    set(hObject, 'Visible', 'off');
    set(handles.question_text, 'String', handles.Q{1,1});
    set(handles.question_text, 'Visible', 'on');
    set(handles.answer_uipanel, 'Visible', 'on');
    handles.currQuestion = 1;
    showAnswerChoices(handles);
    handles.tStart = tic;
else
    handles.tStart = 0;
    handles.currQuestion = 0;
    handles.times = [];
    set(handles.question_text, 'ForegroundColor', [0 0 0]);
    set(handles.question_text, 'Visible', 'off');
    set(handles.begin_pushbutton, 'String', 'Start');
    for ii = 1:8
        set(handles.(['radiobutton' num2str(ii)]), 'Visible', 'off');
        set(handles.(['radiobutton' num2str(ii)]), 'Value', 0);
    end
end

guidata(hObject, handles);


% --- Executes on button press in yes_pushbutton.
function yes_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to yes_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try
    load('survey_data.mat');
catch exception
    A = [];
end
A = [A;handles.times];
save('survey_data.mat', 'A');

set(hObject, 'Visible', 'off');
set(handles.no_pushbutton, 'Visible', 'off');
set(handles.permission_text, 'Visible', 'off');
set(handles.begin_pushbutton, 'String', 'Again');
set(handles.begin_pushbutton, 'Visible', 'on');

guidata(hObject, handles);


% --- Executes on button press in no_pushbutton.
function no_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to no_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(hObject, 'Visible', 'off');
set(handles.yes_pushbutton, 'Visible', 'off');
set(handles.permission_text, 'Visible', 'off');
set(handles.begin_pushbutton, 'String', 'Again');
set(handles.begin_pushbutton, 'Visible', 'on');

guidata(hObject, handles);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

if handles.currQuestion == 1
    handles.times = [0];
end

nextQuestion(handles);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

if handles.currQuestion == 1
    handles.times = [1];
end

nextQuestion(handles);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3

nextQuestion(handles);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4

nextQuestion(handles);


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5

nextQuestion(handles);


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6

nextQuestion(handles);


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7

nextQuestion(handles);


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8

nextQuestion(handles);


function nextQuestion(handles)
tElapsed = toc(handles.tStart);
handles.times = [handles.times tElapsed];
if handles.currQuestion < length(handles.Q)
    handles.tStart = tic;
    handles.currQuestion = handles.currQuestion + 1;

    for ii = 1:8
        set(handles.(['radiobutton' num2str(ii)]), 'Visible', 'off');
        set(handles.(['radiobutton' num2str(ii)]), 'Value', 0);
    end

    showAnswerChoices(handles);
else
    set(handles.answer_uipanel, 'Visible', 'off');
    for ii = 1:8
        set(handles.(['radiobutton' num2str(ii)]), 'Visible', 'off');
    end
    set(handles.question_text, 'String', 'Thanks for taking the time to take this survey! Your cooperation is greatly appreciated.');
    set(handles.question_text, 'ForegroundColor', [1 0 0]);
    set(handles.permission_text, 'Visible', 'on');
    set(handles.yes_pushbutton, 'Visible', 'on');
    set(handles.no_pushbutton, 'Visible', 'on');
end

guidata(handles.figure1, handles);


function showAnswerChoices(handles)
for ii = 1:length(handles.Q{handles.currQuestion,2})
    set(handles.question_text, 'String', handles.Q{handles.currQuestion,1});
    set(handles.(['radiobutton' num2str(ii)]), 'Visible', 'on');
    set(handles.(['radiobutton' num2str(ii)]), 'String', handles.Q{handles.currQuestion,2}(ii));
end

guidata(handles.figure1, handles);
