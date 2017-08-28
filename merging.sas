*CSV import tends to be most common*;
proc import out = WORK.dataone 
            datafile= "C:\Users\jhamm\Desktop\dataone.csv" 
            dbms=csv REPLACE;
     getnames=yes;
     datarow=2; 
run;

proc import out = WORK.datatwo 
            datafile= "C:\Users\jhamm\Desktop\datatwo.csv" 
            dbms=csv REPLACE;
     getnames=yes;
     datarow=2; 
run;

*Either method used needs the data to be sorted by ID*;
proc sort data = WORK.dataone nodupkey out=work.x;
	by Customer_ID;
	run;
  
proc sort data = WORK.datatwo nodupkey out=work.y;
	by Customer_ID;
	run;
  
*Merging by lowest occurance of ID (only by matched, no extra)*;  
data work.mrgdta;
	merge x(in=a)
	      y(in=y);
		  by Customer_ID ;
		  if a and y ;
run;

*Another way to do this but with the One-to-One method*;
data work.onetoone;
	set WORK.dataone;
	set WORK.datatwo;
	run;
