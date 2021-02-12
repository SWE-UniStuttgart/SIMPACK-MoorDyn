function [ FLines,Line1_Tens,Line2_Tens,Line3_Tens ] = MoorDyn_caller_Activefloat(X,XD,Time,CoupTime)
coder.extrinsic('libpointer');
coder.extrinsic('calllib');
 Line1_Tens = 0;
 Line2_Tens = 0;
 Line3_Tens = 0;
 FLines_value=zeros(1,6);
 FLines_p = libpointer('doublePtr',FLines_value);
 calllib('MoorDyn','LinesCalc',X,XD,FLines_p,Time,CoupTime);
 Line1_Tens = calllib('MoorDyn','GetFairTen',1);
 Line2_Tens = calllib('MoorDyn','GetFairTen',2);
 Line3_Tens = calllib('MoorDyn','GetFairTen',3);
 FLines=FLines_p.value; 
 
end