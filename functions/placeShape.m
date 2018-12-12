function [x_aligned, f] = placeShape(im,x,nose_pt,layout)
% PLACESHAPE 
%
%	INPUT
%
%
%
%	OUTPUT
%
%
% John W. Miller
% 21-Apr-2017

if nargin < 4
    layout = 'standard';
end

% View the image
% f = figure('units','normalized','outerposition',[0.1 0.1 0.9 0.9]);
f = figure('units','normalized','outerposition',[.25 0.4 .3 .55]);
% hold on, imshow(im,[],'InitialMagnification','fit')
% text(0.07,0.95,'Click on center of nose. Or close by. Test your luck.','fontsize',FS,'units','normalized','color','r')
close all;
% Get input from user

[im_h,im_w]=size(im);

% [I,J] = ginput(1);
I=nose_pt(2)*im_w;
J=nose_pt(1)*im_h;
% Center shape on user's point
x_aligned = x;

switch lower(layout)
    case 'standard'
        x_aligned(1:2:end) = x_aligned(1:2:end)-x(27); % Center on middle of nose
        x_aligned(2:2:end) = x_aligned(2:2:end)-x(28);
    case 'muct'
        x_aligned(1:2:end) = x_aligned(1:2:end)-x(135); % Center on middle of nose
        x_aligned(2:2:end) = x_aligned(2:2:end)-x(136);
end
x_aligned(1:2:end) = x_aligned(1:2:end)+I;
x_aligned(2:2:end) = x_aligned(2:2:end)+J;

% Display centered shape


% plotLandmarks(x_aligned,'show_lines',1,'hold',1,'layout',layout)

% Varargout
if nargout == 2 % User wants the figure handle
    return
else
    pause(1), close(f)    
end

end % End of main