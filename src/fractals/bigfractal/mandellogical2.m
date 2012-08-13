%Author Ankur Pawar
%256 color             35000^2 891sec   15000 165sec
%rand_name=num2str(rand);
%rand_name=rand_name(3:end);
rand_name='bigmandel2';  
fid=fopen([rand_name '.bmp'],'w');
   y  =  linspace(-1.5,0.6,1500);         %640
   x  =  linspace(-1.26,1.26,1500);       %480

   
len_x =  length(x);
len_y =  length(y);
 xnew =  0; 
 ynew =  0;
    a =  0;    
    b =  0;
   xn =  0;   
   yn =  0;
rough =  0;
    c =  zeros(len_x,1);
 zval =  zeros(len_y,1);  
noofcolors=100;
cmap=flipud(pink(noofcolors));


  i=66;fwrite(fid,  i,'uint8');  %magic word
  i=77;fwrite(fid,  i,'uint8');
  
  i=len_x*len_y*3+54;fwrite(fid,  i,'uint32');
  
  i= 0;fwrite(fid,  i,'uint32');  %unused
  
  i=54;fwrite(fid,  i,'uint32');  %offset where the data is present

  i=40;fwrite(fid,  i,'uint32');  %no.bytes in header
  
  i=len_y;fwrite(fid,  i,'uint32'); % width in pixel

  i=len_x;fwrite(fid,  i,'uint32');%height in pixel

  i= 1;fwrite(fid,  i,'uint8');  %no of color plane
  i= 0;fwrite(fid,  i,'uint8');

  i= 8;fwrite(fid,  i,'uint8');  %no of bits per pixel
  i= 0;fwrite(fid,  i,'uint8');

  i= 0;fwrite(fid,  i,'uint8');  %compression (0 for no compression)
  i= 0;fwrite(fid,  i,'uint8');
  i= 0;fwrite(fid,  i,'uint8');
  i= 0;fwrite(fid,  i,'uint8');

  i=len_x*len_y*3;fwrite(fid,  i,'uint32'); %size of raw bmp data
  

  i= 0;fwrite(fid,  i,'uint32'); % h resolution
  
  i= 0;fwrite(fid,  i,'uint32'); % v resolution

  i= 256;fwrite(fid,  i,'uint32');% no. of color in pallete

  i= 0;fwrite(fid,  i,'uint32'); % all colors are important

%256 color pallete
colorpallete=zeros(256,4);  
colpalt=ind2rgb8(1:noofcolors,fliplr(cmap)); 
colpalt=squeeze(colpalt);
colpalt=[colpalt zeros(noofcolors,1)];
colorpallete(1:noofcolors,:)=colpalt;
colorpallete=colorpallete';
fwrite(fid, colorpallete  ,'uint8');
%
tic

for m=1:len_x
    for n=len_y:-1:1
     b = x(m); 
     a = y(n);
    xn = 0;   
    yn = 0;
     k = 0;
     while (k<noofcolors)&&((xn^2+yn^2)<4)
       xnew = xn^2 - yn^2 + a;
       ynew = 2*xn*yn + b;  
         xn = xnew;
         yn = ynew;
          k = k+1;
     end
     zval(n)=k;
      
    end
    fwrite(fid,  zval ,'uint8');
   
end
toc
st=fclose(fid);