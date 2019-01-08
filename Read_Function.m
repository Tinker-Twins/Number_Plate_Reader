function letter = Read_Function(snap)

load Templates                          % Loads the templates of characters in the memory.
snap=imresize(snap,[42 24]);            % Resize the input image so it can be compared with the template's images.
comp=[ ];
for n=1:length(Templates)
    sem=corr2(Templates{1,n},snap);     % Correlation of the input image with every image in the template for best matching.
    comp=[comp sem];                    % Record the value of correlation for each template's character.
end
vd=find(comp==max(comp));               % Find the index which corresponds to the highest matched character.

% Accodrding to the index assign to 'letter'.

% Alphabets
if vd==1 || vd==2
    letter='A';
    fprintf('A');
elseif vd==3 || vd==4
    letter='B';
    fprintf('B');
elseif vd==5
    letter='C';
    fprintf('C');
elseif vd==6 || vd==7
    letter='D';
    fprintf('D');
elseif vd==8
    letter='E';
    fprintf('E');
elseif vd==9
    letter='F';
    fprintf('F');
elseif vd==10
    letter='G';
    fprintf('G');
elseif vd==11
    letter='H';
    fprintf('H');
elseif vd==12
    letter='I';
    fprintf('I');
elseif vd==13
    letter='J';
    fprintf('J');
elseif vd==14
    letter='K';
    fprintf('K');
elseif vd==15
    letter='L';
    fprintf('L');
elseif vd==16
    letter='M';
    fprintf('M');
elseif vd==17
    letter='N';
    fprintf('N');
elseif vd==18 || vd==19
    letter='O';
    fprintf('O');
elseif vd==20 || vd==21
    letter='P';
    fprintf('P');
elseif vd==22 || vd==23
    letter='Q';
    fprintf('Q');
elseif vd==24 || vd==25
    letter='R';
    fprintf('R');
elseif vd==26
    letter='S';
    fprintf('S');
elseif vd==27
    letter='T';
    fprintf('T');
elseif vd==28
    letter='U';
    fprintf('U');
elseif vd==29
    letter='V';
    fprintf('V');
elseif vd==30
    letter='W';
    fprintf('W');
elseif vd==31
    letter='X';
    fprintf('X');
elseif vd==32
    letter='Y';
    fprintf('Y');
elseif vd==33
    letter='Z';
    fprintf('Z');

% Numerals
elseif vd==34
    letter='1';
    fprintf('1');
elseif vd==35
    letter='2';
    fprintf('2');
elseif vd==36
    letter='3';
    fprintf('3');
elseif vd==37 || vd==38
    letter='4';
    fprintf('4');
elseif vd==39
    letter='5';
    fprintf('5');
elseif vd==40 || vd==41 || vd==42
    letter='6';
    fprintf('6');
elseif vd==43
    letter='7';
    fprintf('7');
elseif vd==44 || vd==45
    letter='8';
    fprintf('8');
elseif vd==46 || vd==47 || vd==48
    letter='9';
    fprintf('9');
else
    letter='0';
    fprintf('0');
end
end