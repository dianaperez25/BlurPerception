function [Test, Standard, TestPosition, StandardPosition] = createStimTextures(Condition,window, xCenter,yCenter)

%Read the image files
  Test = imread(Condition.test);
Standard = imread(Condition.standard);

% Resize the images
Test = imresize(Test,.5);
Standard = imresize(Standard,.5);

% blur the images
Test = Test(:,:,1);
Standard = Standard(:,:,1);
Test = imgaussfilt(Test, Condition.testBlur);
Standard = imgaussfilt(Standard, 7);

% Get the size of the test and standard
[a1, a2, a3] = size(Test);
[b1, b2, b3] = size(Standard);

% Create destination left rect and right rect
testBaseRect = [0 0 a2 a1];
standardBaseRect = [0 0 b2 b1];
leftRect = CenterRectOnPointd(testBaseRect, (xCenter-(xCenter/3)), yCenter);
rightRect = CenterRectOnPointd(standardBaseRect, (xCenter+(xCenter/3)), yCenter);

% Make the standard and test into textures
Test = Screen('MakeTexture', window, Test);
Standard = Screen('MakeTexture', window, Standard);

% position the standard and test images
if strcmp(Condition.testPosition,'left');
    TestPosition = leftRect;
    StandardPosition = rightRect;
elseif strcmp(Condition.testPosition,'right');
    TestPosition = rightRect;
    StandardPosition = leftRect;
end

end

