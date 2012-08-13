function v = str2int(v,p)

% STR2INT  Converts bitwise between Strings and Vectors of Integers
%
% INT = STR2INT( STR , Precision )
% STR = STR2INT( INT , Precision )
%
% STR:  RowVector of Characters, 0 <= double(STR) <= 255
%
% INT:  RowVector of Integers, MIN <= INT <= MAX
%
% Precision:  Number of bits per Integer,
%               
%             - StringInput, contains the Number of Bits,
%                 unsigned Integers will defined by the 1. Letter "u"
%
%             - NumericInput for Number of Bits, 
%                 unsigned Integers will defined by positive numbers
%
%       signed:  'int<B>'  |  -B ;  -2^(B-1) <= INT <= 2^(B-1)-1
%     unsigned: 'uint<B>'  |   B ;   0       <= INT <= 2^(B)-1 
%
%   Examples for StringInput of Precision:
%
%       signed Integer:  'int8',  'int16',  'int32',  'int64', ...
%     unsigned Integer: 'uint8', 'uint16', 'uint32', 'uint64', ...
%
%--------------------------------------------------------------------
% 
% Note: In the Conversion from String to Integer, the String will
%        appended by ZERO-Values, to get multiples of BitNumber.
%     
%--------------------------------------------------------------------
%
% see also: FREAD, FWRITE
%
%--------------------------------------------------------------------
% Example 1:  Write Integers to File, Read Characters
%
%  file = which('str2int');
%  prec = 'int32';                  % 4 Characters --> 1 Integer
%
%  tmp = tempname;
%  str = help(file);                % HelpString
%
%  app = mod( size(str,2) , 4 );    % Multiples of BitNumber
%  app = char( 32 * ones(1,app) );  %  easier to compare
%  str = cat( 2 , str , app );
%
%  int = str2int(str,prec);         % Convert to Integer       
%
%  fid = fopen(tmp,'wt');
%  fwrite(fid,int,prec);            % Write Integers
%  fclose(fid);
%
%  fid = fopen(tmp,'r');
%  txt = fread(fid,'char');         % Read Characters
%  fclose(fid);
%
%  delete(tmp);
%
%  txt = char(txt');
%
%  isequal(str,txt)                 % Compare with "str"
%
%--------------------------------------------------------------------
% Example 2:  Read Integers from File, Convert to String
%
%  fid = fopen(file,'r');
%  int = fread(fid,100,prec);       % Read 100 Integer32
%  fseek(fid,0,-1);                 % Rewind
%  txt = fread(fid,400,'char');     % Read 400 Characters
%  fclose(fid);
%
%  str = str2int(int,prec);         % Convert to String,
%                                   %  returns 400 Characters
%
%  txt = char(txt');
%
%  isequal(str,txt)                 % Compare with "str"
%
%--------------------------------------------------------------------
%

if nargin < 2
   error('Not enough Input Arguments.');
end

b = 8;  % Base

%**********************************************************
% Check Inputs

msg = cell(0,1);

%----------------------------------------------------------
% Check Value

is_num = isnumeric(v);

n = prod(size(v));

if ~( is_num | ischar(v) )
    msg = cat(1,msg,{'Value must be Numeric or a String.'});
elseif is_num
    if ~strcmp(class(v),'double')
        v = double(v);
    end
    if ~all( v == round(v) )
        msg = cat(1,msg,{'Numeric Values must be Integers.'});
    end
    if ~( n == size(v,2) )
        v = v(:)';
    end
else
    if ~( ( n == size(v,2) ) | isempty(v) )
        msg = cat(1,msg,{'Character-Value must be a String.'});
    end
end

%----------------------------------------------------------
% Check Precision

m = prod(size(p));

ok = ( isnumeric(p) & ( m == 1 ) );
if ok
   s = ( p < 0 );
   p = abs(p);
else
   if ~( ischar(p) & ~isempty(p) & ( m == size(p,2) ) )
       msg = cat(1,msg,{'Precision must be a single Numeric or a String'});
   else
      p  = lower(p);
      s  = ~( p(1) == 'u' );  % TRUE for Signed Integer
      ok = zeros(size(p));
      for c = '0123456789'
          ok = ( ok | ( p == c ) );
      end
      p(find(~ok)) = char(32);
      p = eval(p,'NaN');
      ok = ~( isnan(p) | ~( prod(size(p)) == 1 ) );
      if ~ok
          msg = cat(1,msg,{'String for Precision must return a single Numeric.'});
      end
   end
end

if ok
   if ( p < b )
      msg = cat(1,msg,{sprintf('Precision must be larger %.0f.',b)});
   else
      p = log(p/b) / log(2);
      if ~( mod(p,1) == 0 )
         str = sprintf('%.0f, ',b*2.^(0:3));
         str = sprintf('Precision must be in order: %s ...',str);
         msg = cat(1,msg,{str});
      else
         p = 2^p;
      end
   end
end

%----------------------------------------------------------

if ~isempty(msg)
    error(sprintf('%s\n',msg{:}));
end

%**********************************************************

if isempty(v)
   if is_num
      v = '';
   else
      v = [];
   end
   return
end

%**********************************************************

c = b*p;

b2 = 2^b;
c2 = 2^c;

%**********************************************************
% INTEGER --> STRING

if is_num

   v = v - c2 * floor( v / c2 );   % [ 0 .. 2^c-1 )

   v = v(ones(1,p),:);

   ind = ( 1 : p );
   
   bs  = ( ind - 1 ) * b;         % BitShift
   ba  = bitshift( b2-1 , bs );   % BitAnd

   for ii = ind

       v(ii,:) = bitand( v(ii,:) , ba(ii) );

       v(ii,:) = bitshift( v(ii,:) , -bs(ii) );

   end

   v = char(v(:)');

   return

end

%**********************************************************
% STRING --> INTEGER

v = cat( 2 , double(v) , 0*ones(1,mod(n,p)) );

v = v - b2 * floor( v / b2 );  % [ 0 .. 2^b-1 )

n = size(v,2);

ind = ( 0 : p : n-p ) + 1;

for ii = 1 : p-1

    v(ind) = v(ind) + bitshift( v(ind+ii) , ii*b );

end

v = v(ind);

if s
   v = v - c2 * ( v >= 2^(c-1) );
end