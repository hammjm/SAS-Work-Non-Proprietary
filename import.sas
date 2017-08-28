*Different common imports*;

*CSV import*;
proc import out = WORK.dataone 
            datafile= "C:\Users\jhamm\Desktop\dataone.csv" 
            dbms=csv REPLACE;
     getnames=yes;
     datarow=2; 
run;

*Deliminited text*;
proc import out = WORK.datatext 
            DATAFILE= "C:\datatext.txt" 
            DBMS=TAB REPLACE;
     getnames=yes;
     datarow=2; 
RUN;
