% function [xOffset, yOffset, xRadius, yRadius, theta] = ...
%    draw_ellipse( A, B, C, D, F, G, eColor )
%
% Plots an ellipse from its algebraic description ands returns
% translational rotational information.
%
%       Ax^2 + Bxy + Cy^2 + Dx + Fy + G = 0
%
% This algorithm is taken from 
%     http://mathworld.wolfram.com/QuadraticCurve.html
%
% All variable names are written to be consistent with the 
% variables found in the above web page. This algorithm is
% just a bunch of algebra with some trigonometry.
%
% Input:
%   A             - coefficient for the x^2 term
%   B             - coefficient for the xy term
%   C             - coefficient for the y^2 term
%   D             - coefficient for the x term
%   F             - coefficient for the y term
%   G             - constant term
%  eColor         - ellipse color to draw
%
% Output [optional]:
%   xOffset       - computed x component of translational offset
%   yOffset       - computed y component of translational offset
%   xRadius       - computed semi-major axis (x-direction)
%   yRadius       - computed semi-major axis (y-direction)
%   theta         - computed rotation angle
%
% P Lorenzen
%

function [xOffset, yOffset, xRadius, yRadius, theta] = ...
    draw_ellipse( A, B, C, D, F, G, eColor )

%% Set up general bivariate quadratic curve 
a = A; b = B/2; c = C; d = D/2; f = F/2; g = G;


%% Define the key quantities 
Delta = det( [a b d; b c f; d f g] );
J = det( [a b; b c] );
I = a + c;

%% Check for valid ellipse description 
if Delta == 0 || J <= 0 || (Delta/I) >= 0
  error('Parameters do not define a real ellipse');
end

%% Compute rotation angle
theta = 0.5*atan2(2*b,(c-a));

%% Change of coordinates 
aPrime = a*cos(theta)^2 - 2*b*cos(theta)*sin(theta) + c*sin(theta)^2;
bPrime = b*(cos(theta)^2-sin(theta)^2) + (a-c)*sin(theta)*cos(theta);
cPrime = a*sin(theta)^2 + 2*b*sin(theta)*cos(theta) + c*cos(theta)^2;
dPrime = d*cos(theta) - f*sin(theta);
fPrime = d*sin(theta) + f*cos(theta);
gPrime = g;

gPrimePrime = -gPrime + dPrime^2/aPrime + fPrime^2/cPrime;
aPrimePrime = aPrime / gPrimePrime;
cPrimePrime = cPrime / gPrimePrime;

%% Compute semi-major axes 
xRadius = sqrt( 1/aPrimePrime );
yRadius = sqrt( 1/cPrimePrime );
%% Compute center for translation, then rotate it by -theta
% since the ellipse function translates before rotation by theta.
xOffset = -dPrime / aPrime;
yOffset = -fPrime / cPrime;

xOff = xOffset*cos(-theta)-yOffset*sin(-theta);
yOff = xOffset*sin(-theta)+yOffset*cos(-theta);

%% Draw ellipse 
ellipse( xRadius, yRadius, -theta, xOff, yOff, eColor );
