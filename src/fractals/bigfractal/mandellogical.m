%Author : Ankur Pawar
rand_name='bigmandel';  
fid=fopen([rand_name '.bmp'],'w');
   y  =  linspace(-1.5,0.6,4500);
   x  =  linspace(-1.26,1.26,4500);
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
cmap=[bone(50);flipud(bone(50))];
%colormap(cmap);


  i=66;fwrite(fid,  i,'uint8');  %magic word
  i=77;fwrite(fid,  i,'uint8');
  
  i=len_x*len_y*3+54;fwrite(fid,  i,'uint32');
  
  i= 0;fwrite(fid,  i,'uint32');  %unused
  
  i=54;fwrite(fid,  i,'uint32');  %offset where the data is present

  i=40;fwrite(fid,  i,'uint32');  %no.bytes in header
  
  i=  len_y;fwrite(fid,  i,'uint32'); % width in pixel

  i=  len_x;fwrite(fid,  i,'uint32');%height in pixel

  i= 1;fwrite(fid,  i,'uint8');  %no of color plane
  i= 0;fwrite(fid,  i,'uint8');

  i=24;fwrite(fid,  i,'uint8');  %no of bits per pixel
  i= 0;fwrite(fid,  i,'uint8');

  i= 0;fwrite(fid,  i,'uint8');  %compression (0 for no compression)
  i= 0;fwrite(fid,  i,'uint8');
  i= 0;fwrite(fid,  i,'uint8');
  i= 0;fwrite(fid,  i,'uint8');

  i=len_x*len_y*3;fwrite(fid,  i,'uint32'); %size of raw bmp data
  

  i= 0;fwrite(fid,  i,'uint32'); % h resolution
  
  i= 0;fwrite(fid,  i,'uint32'); % v resolution

  i= 0;fwrite(fid,  i,'uint32');% no. of color in pallete

  i= 0;fwrite(fid,  i,'uint32'); % all colors are important

 
 


tic
for m=1:len_x
    for n=len_y:-1:1
     b = x(m); 
     a = y(n);
    xn = 0;   
    yn = 0;
     k = 0;
     while (k<=100)&&((xn^2+yn^2)<4)
       xnew = xn^2 - yn^2 + a;
       ynew = 2*xn*yn + b;  
         xn = xnew;
         yn = ynew;
          k = k+1;
     end
     zval(n)=k;
      
    end
    rgb=ind2rgb8(zval,cmap);
    rgb=squeeze(rgb);
    rgb=rgb';
    fwrite(fid,  rgb,'uint8');
   
end
toc
st=fclose(fid);


    
