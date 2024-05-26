clc;
close all;
clear all;

plaintext='iambeautiful'
binary = dec2bin(plaintext)

len=length(binary)*7
serial= reshape(binary.',len,1).' 
len1=length(serial)
pad=128-len1
a=zeros(1,pad)
message = cat(2, serial, a)
messagelen=length(message)

   c = num2cell(reshape(message, 8, 16), 1)
   s00=c{1}
   s10=c{2}
   s20=c{3}
   s30=c{4}
   s01=c{5}
   s11=c{6}
   s21=c{7}
   s31=c{8}
   s02=c{9}
   s12=c{10}
   s22=c{11}
   s32=c{12}
   s03=c{13}
   s13=c{14}
   s23=c{15}
   s33=c{16}
   
   
   x1=reshape(s00,[1,8])
   y1= dec2hex(bin2dec(x1))
   
    x2=reshape(s10,[1,8])
   y2= dec2hex(bin2dec(x2))
   
    x3=reshape(s20,[1,8])
   y3= dec2hex(bin2dec(x3))
   

   
    x4=reshape(s30,[1,8])
   y4= dec2hex(bin2dec(x4))

   
    x5=reshape(s01,[1,8])
   y5= dec2hex(bin2dec(x5))

   
    x6=reshape(s11,[1,8])
   y6= dec2hex(bin2dec(x6))

   
    x7=reshape(s21,[1,8])
   y7= dec2hex(bin2dec(x7))

   
    x8=reshape(s31,[1,8])
   y8= dec2hex(bin2dec(x8))

   
    x9=reshape(s02,[1,8])
   y9= dec2hex(bin2dec(x9))

   
    x10=reshape(s12,[1,8])
   y10= dec2hex(bin2dec(x10))

   
    x11=reshape(s22,[1,8])
   y11= dec2hex(bin2dec(x11))

    x12=reshape(s32,[1,8])
   y12= dec2hex(bin2dec(x12))

    x13=reshape(s03,[1,8])
   y13= dec2hex(bin2dec(x13))

    x14=reshape(s13,[1,8])
   y14= dec2hex(bin2dec(x14))

   
    x15=reshape(s23,[1,8])
   y15= dec2hex(bin2dec(x15))

    x16=reshape(s33,[1,8])
   y16= dec2hex(bin2dec(x16))

  


plaintext={y1 ,y2, y3 ,y4 ,y5, y6 ,y7 ,y8 ,y9 ,y10 ,y11 ,y12 ,y13 ,y14 ,y15 ,y16 }
 
plaintext
data=hex2dec(plaintext);
disp('plain text in decimal form')
data1=reshape(data,4,4)
 
%sub bytes
s_box={'63' '7c' '77' '7b' 'f2' '6b' '6f' 'c5' '30' '01' '67' '2b' 'fe' 'd7' 'ab' '76'
'ca' '82' 'c9' '7d' 'fa' '59' '47' 'f0' 'ad' 'd4' 'a2' 'af' '9c' 'a4' '72' 'c0'
'b7' 'fd' '93' '26' '36' '3f' 'f7' 'cc' '34' 'a5' 'e5' 'f1' '71' 'd8' '31' '15'
'04' 'c7' '23' 'c3' '18' '96' '05' '9a' '07' '12' '80' 'e2' 'eb' '27' 'b2' '75'
'09' '83' '2c' '1a' '1b' '6e' '5a' 'a0' '52' '3b' 'd6' 'b3' '29' 'e3' '2f' '84'
'53' 'd1' '00' 'ed' '20' 'fc' 'b1' '5b' '6a' 'cb' 'be' '39' '4a' '4c' '58' 'cf'
'd0' 'ef' 'aa' 'fb' '43' '4d' '33' '85' '45' 'f9' '02' '7f' '50' '3c' '9f' 'a8'
'51' 'a3' '40' '8f' '92' '9d' '38' 'f5' 'bc' 'b6' 'da' '21' '10' 'ff' 'f3' 'd2'
'cd' '0c' '13' 'ec' '5f' '97' '44' '17' 'c4' 'a7' '7e' '3d' '64' '5d' '19' '73'
'60' '81' '4f' 'dc' '22' '2a' '90' '88' '46' 'ee' 'b8' '14' 'de' '5e' '0b' 'db'
'e0' '32' '3a' '0a' '49' '06' '24' '5c' 'c2' 'd3' 'ac' '62' '91' '95' 'e4' '79'
'e7' 'c8' '37' '6d' '8d' 'd5' '4e' 'a9' '6c' '56' 'f4' 'ea' '65' '7a' 'ae' '08'
'ba' '78' '25' '2e' '1c' 'a6' 'b4' 'c6' 'e8' 'dd' '74' '1f' '4b' 'bd' '8b' '8a'
'70' '3e' 'b5' '66' '48' '03' 'f6' '0e' '61' '35' '57' 'b9' '86' 'c1' '1d' '9e'
'e1' 'f8' '98' '11' '69' 'd9' '8e' '94' '9b' '1e' '87' 'e9' 'ce' '55' '28' 'df'
'8c' 'a1' '89' '0d' 'bf' 'e6' '42' '68' '41' '99' '2d' '0f' 'b0' '54' 'bb' '16'};
s_box=hex2dec(s_box);
s_box=reshape(s_box,16,16);
for row=1:4
     for col=1:4
       a1=data1(row,col);
       h1=dec2hex(a1,2);
       i=hex2dec(h1(1,1))+1;
       j=hex2dec(h1(1,2))+1;
       tsbox(row,col)=s_box(i,j);
     end
end
disp('state matrix after s_box substitution');
tsbox
%shift rows
sr=[];
sr1=[sr tsbox(1,:)];
sr2=circshift(tsbox(2,:),[1,-1]);
sr3=circshift(tsbox(3,:),[2,-2]);
sr4=circshift(tsbox(4,:),[3,-3]);
disp('after shift rows')
sr=[sr1;sr2;sr3;sr4]
b=sr;
x=1;
 
for k=1:4
    a=b(1:4,x);
    
x=x+1;
 
    i=1;
    d1=mixpoly(a(i,1),2,283);
    d2=mixpoly(a(i+1,1),3,283);
    d3=a(i+2,1);
    d4=a(i+3,1);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(1,k)=bitxor(d5,d6);
    
    
    d1=a(i,1);
    d2=mixpoly(a(i+1,1),2,283);
    d3=mixpoly(a(i+2,1),3,283);
    d4=a(i+3,1);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(2,k)=bitxor(d5,d6);
    
    
    d1=a(i,1);
    d2=a(i+1,1);
    d3=mixpoly(a(i+2,1),2,283);
    d4=mixpoly(a(i+3,1),3,283);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(3,k)=bitxor(d5,d6);
    
    
    d1=mixpoly(a(i,1),3,283);
    d2=a(i+1,1);
    d3=a(i+2,1);
    d4=mixpoly(a(i+3,1),2,283);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(4,k)=bitxor(d5,d6);
end
disp('after mix column');
d7
d8=de2bi(d7,8,'left-msb');
key={'00','11', '22', '33' ,'44' ,'55' ,'66' ,'77' ,'88', '99', 'a2', 'b5', '6c', '8d' ,'1e' ,'0f'}
key2=hex2dec(key);
key1=reshape(key2,4,4);
d9=de2bi(key1,8,'left-msb');
s1=bitxor(d8,d9);
s2=bi2de(s1,'left-msb');
s3=reshape(s2,4,4);
s3=s3';
disp('after round key')
s3
s4=dec2hex(s3);
s4=s4';
c1=[];
for i=1:16
     c1=[c1 s4((1:2),i)'];
end
ciphertext=c1;
 
ciphertext
 
%decryption
%add roundkey
r_text=s3';
a=de2bi(r_text,8,'left-msb');
b=de2bi(key1,8,'left-msb');
r_text1=bitxor(a,b);
r_text1=bi2de(r_text1,'left-msb');
r2=reshape(r_text1,4,4);
disp('state matrix after add round key');
r2
%inverse mix columns
b=r2;
x=1;
for k=1:4
    a=b(1:4,x);
    
x=x+1;
 
    i=1;
    d1=mixpoly(a(i,1),14,283);
    d2=mixpoly(a(i+1,1),11,283);
    d3=mixpoly(a(i+2,1),13,283);
    d4=mixpoly(a(i+3,1),9,283);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(1,k)=bitxor(d5,d6);
    
    
    d1=mixpoly(a(i,1),9,283);
    d2=mixpoly(a(i+1,1),14,283);
    d3=mixpoly(a(i+2,1),11,283);
    d4=mixpoly(a(i+3,1),13,283);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(2,k)=bitxor(d5,d6);
    
    
    d1=mixpoly(a(i,1),13,283);
    d2=mixpoly(a(i+1,1),9,283);
    d3=mixpoly(a(i+2,1),14,283);
    d4=mixpoly(a(i+3,1),11,283);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(3,k)=bitxor(d5,d6);
    
    
    d1=mixpoly(a(i,1),11,283);
    d2=mixpoly(a(i+1,1),13,283);
    d3=mixpoly(a(i+2,1),9,283);
    d4=mixpoly(a(i+3,1),14,283);
    d5=bitxor(d1,d2);
    d6=bitxor(d3,d4);
    d7(4,k)=bitxor(d5,d6);
end
disp('state matrix after inverse mixcolumns');
r_text3=d7;
r_text3
%invrese shiftrows
dr1=r_text3(1,1:4);
dr2=circshift(r_text3(2,(1:4)),[0,1]);
dr3=circshift(r_text3(3,(1:4)),[0,2]);
dr4=circshift(r_text3(4,(1:4)),[0,3]);
r_text4=[dr1; dr2; dr3; dr4];
disp('state matrix after inverse shiftrows');
r_text4
 
%inverse sub bytes substitution
inv_s_box={'52' '09' '6a' 'd5' '30' '36' 'a5' '38' 'bf' '40' 'a3' '9e' '81' 'f3' 'd7' 'fb'
'7c' 'e3' '39' '82' '9b' '2f' 'ff' '87' '34' '8e' '43' '44' 'c4' 'de' 'e9' 'cb'
'54' '7b' '94' '32' 'a6' 'c2' '23' '3d' 'ee' '4c' '95' '0b' '42' 'fa' 'c3' '4e'
'08' '2e' 'a1' '66' '28' 'd9' '24' 'b2' '76' '5b' 'a2' '49' '6d' '8b' 'd1' '25'
'72' 'f8' 'f6' '64' '86' '68' '98' '16' 'd4' 'a4' '5c' 'cc' '5d' '65' 'b6' '92'
'6c' '70' '48' '50' 'fd' 'ed' 'b9' 'da' '5e' '15' '46' '57' 'a7' '8d' '9d' '84'
'90' 'd8' 'ab' '00' '8c' 'bc' 'd3' '0a' 'f7' 'e4' '58' '05' 'b8' 'b3' '45' '06'
'd0' '2c' '1e' '8f' 'ca' '3f' '0f' '02' 'c1' 'af' 'bd' '03' '01' '13' '8a' '6b'
'3a' '91' '11' '41' '4f' '67' 'dc' 'ea' '97' 'f2' 'cf' 'ce' 'f0' 'b4' 'e6' '73'
'96' 'ac' '74' '22' 'e7' 'ad' '35' '85' 'e2' 'f9' '37' 'e8' '1c' '75' 'df' '6e'
'47' 'f1' '1a' '71' '1d' '29' 'c5' '89' '6f' 'b7' '62' '0e' 'aa' '18' 'be' '1b'
'fc' '56' '3e' '4b' 'c6' 'd2' '79' '20' '9a' 'db' 'c0' 'fe' '78' 'cd' '5a' 'f4'
'1f' 'dd' 'a8' '33' '88' '07' 'c7' '31' 'b1' '12' '10' '59' '27' '80' 'ec' '5f'
'60' '51' '7f' 'a9' '19' 'b5' '4a' '0d' '2d' 'e5' '7a' '9f' '93' 'c9' '9c' 'ef'
'a0' 'e0' '3b' '4d' 'ae' '2a' 'f5' 'b0' 'c8' 'eb' 'bb' '3c' '83' '53' '99' '61'
'17' '2b' '04' '7e' 'ba' '77' 'd6' '26' 'e1' '69' '14' '63' '55' '21' '0c' '7d'};
 
inv_s_box=hex2dec(inv_s_box);
inv_s_box=reshape(inv_s_box,16,16);
detext=[];
for row=1:4
     for col=1:4
       a1=r_text4(row,col);
       h1=dec2hex(a1,2);
       i=hex2dec(h1(1,1))+1;
       j=hex2dec(h1(1,2))+1;
       detext(row,col)=inv_s_box(i,j);
          
     end
end
disp('state matrix after inverse s_box substitution');
detext
d=dec2hex(detext);
d=d';
d1=[];
for i=1:16
     d1=[d1 d((1:2),i)'];
end
decrypttext=d1;
decrypttext
cons=length(decrypttext)/2
 paralleloutput= reshape(decrypttext.',2,cons).' 
 


%mix poly
function ab = mixpoly(a, b,mod_pol)
 
ab=0;
for i_bit = 1 : 8
    if bitget (a, i_bit)
        b_shift = bitshift (b, i_bit - 1);
         ab = bitxor (ab, b_shift);
          end
        
end
for i_bit = 16 : -1 : 9
 if bitget (ab, i_bit)
     mod_pol_shift = bitshift (mod_pol, i_bit - 9);
          ab = bitxor (ab, mod_pol_shift);
        
    end
  end

end
