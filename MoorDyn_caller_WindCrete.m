function [ FLines,Line1a_Tens,Line1b_Tens,Line2a_Tens,Line2b_Tens,Line3a_Tens,Line3b_Tens ] = MoorDyn_caller_WindCrete(X,XD,Time,CoupTime)
coder.extrinsic('libpointer');
coder.extrinsic('calllib');
%  Line1_Tens = 0;
%  Line2_Tens = 0;
%  Line3_Tens = 0;
 FLines_value=zeros(1,6);
 FLines_p = libpointer('doublePtr',FLines_value);
 calllib('MoorDyn','LinesCalc',X,XD,FLines_p,Time,CoupTime);
 Line1a_Tens = calllib('MoorDyn','GetFairTen',2);
 Line1b_Tens = calllib('MoorDyn','GetFairTen',3);
 Line2a_Tens = calllib('MoorDyn','GetFairTen',5);
 Line2b_Tens = calllib('MoorDyn','GetFairTen',6);;
 Line3a_Tens = calllib('MoorDyn','GetFairTen',8);
 Line3b_Tens = calllib('MoorDyn','GetFairTen',9);
 FLines=FLines_p.value; 
 
end