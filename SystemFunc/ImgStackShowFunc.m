function ImgStackShowFunc(ImgStack)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%name:ImgStackShowFunc.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%author:luyang
%date:20170123
%function:
%显示图像，支持8bit和16bit的单通道灰度图。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Show image stack.');
disp(' ');
[rows, cols, frameNum] = size(ImgStack);


hFig = figure('Position', [100 100 cols rows], 'Units', 'normalized', 'Resize', 'off');

handles.axes1 = axes('Units', 'pixels', 'Position', [0 30 cols rows]);

%Create slider and listener object for smooth visualization
handles.SliderFrame = uicontrol('Style', 'slider', ...
                        'Position', [0 0 (cols - 50) 30], 'Min', 1, 'Max', frameNum, ...
                            'Value', 1, 'SliderStep', [1 1], ...
                                'Callback', @XSliderCallback);
handles.SliderxListener = addlistener(handles.SliderFrame, 'Value', 'PostSet', @(s,e) XListenerCallBack);

handles.Edit1 = uicontrol('Style', 'Edit', 'Position', [(cols - 50) 0 50 30], 'String', '1');


%Use setappdata to store the image stack and in callbacks, use getappdata to retrieve it and use it. Check the docs for the calling syntax.
setappdata(hFig, 'ImgStack', ImgStack); %// You could use %//setappdata(0,'MyMatrix',MyMatrix) to store in the base workspace. 

%Display 1st frame
imshow(ImgStack(:, :, 1));

%IMPORTANT. Update handles structure.
guidata(hFig, handles);

    %Listener callback, executed when you drag the slider.
    function XListenerCallBack

        %Retrieve handles structure. Used to let MATLAB recognize the
        %edit box, slider and all UI components.
        handles = guidata(gcf);

        %Here retrieve ImgStack using getappdata.
        ImgStack = getappdata(hFig, 'ImgStack');

        %Get current frame
        CurrentFrame = round((get(handles.SliderFrame, 'Value')));
        set(handles.Edit1, 'String', num2str(CurrentFrame));

        %Display appropriate frame.
        imshow(ImgStack(:, :, CurrentFrame), 'Parent', handles.axes1);

        guidata(hFig, handles);
    end


    %Slider callback; executed when the slider is release or you press the arrows.
    function XSliderCallback(~,~)

        handles = guidata(gcf);

        %// Here retrieve MyMatrix using getappdata.
        ImgStack = getappdata(hFig, 'ImgStack');

        CurrentFrame = round((get(handles.SliderFrame, 'Value')));
        set(handles.Edit1, 'String', num2str(CurrentFrame));

        imshow(ImgStack(:, :, CurrentFrame), 'Parent', handles.axes1);

        guidata(hFig, handles);
    end
end


