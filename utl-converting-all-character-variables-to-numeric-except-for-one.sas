Convert all variables to numeric except variable roger and keep the same names.                                                   
                                                                                                                                  
github                                                                                                                            
https://tinyurl.com/yxrktplb                                                                                                      
https://github.com/rogerjdeangelis/utl-converting-all-character-variables-to-numeric-except-for-one                               
                                                                                                                                  
SAS Forum                                                                                                                         
https://tinyurl.com/y2bntc8g                                                                                                      
https://communities.sas.com/t5/New-SAS-User/converting-all-character-variables-to-numeric-except-for-one/m-p/582942               
                                                                                                                                  
macros                                                                                                                            
https://tinyurl.com/y9nfugth                                                                                                      
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                        
                                                                                                                                  
varlist by                                                                                                                        
Søren Lassen, s.lassen@post.tele.dk                                                                                               
                                                                                                                                  
*_                   _                                                                                                            
(_)_ __  _ __  _   _| |_                                                                                                          
| | '_ \| '_ \| | | | __|                                                                                                         
| | | | | |_) | |_| | |_                                                                                                          
|_|_| |_| .__/ \__,_|\__|                                                                                                         
        |_|                                                                                                                       
;                                                                                                                                 
                                                                                                                                  
* the excluded variable is 'roger';                                                                                               
                                                                                                                                  
data have;                                                                                                                        
   array vals[5] $2 mary jane mike joan roger ('11' '22' '33' '44' '99');                                                         
run;quit;                                                                                                                         
                               |  RULES                                                                                           
 Variables in Creation Order   |                                                                                                  
                               |                                                                                                  
#    Variable    Type    Len   |                                                                                                  
                               |                                                                                                  
1    MARY        Char      2   |  MARY    Num   8                                                                                 
2    JANE        Char      2   |  JANE    Num   8                                                                                 
3    MIKE        Char      2   |  MIKE    Num   8                                                                                 
4    JOAN        Char      2   |  JOAN    Num   8   => Convert all to numeric same name                                           
                                                                                                                                  
5    ROGER       Char      2   |  ROGER   Char  2   => Do not covert to numeric                                                   
                                                                                                                                  
WORK.HAVE total obs=1                                                                                                             
                                                                                                                                  
  MARY    JANE    MIKE    JOAN    ROGER                                                                                           
                                                                                                                                  
   11      22      33      44      99                                                                                             
                                                                                                                                  
*            _               _                                                                                                    
  ___  _   _| |_ _ __  _   _| |_                                                                                                  
 / _ \| | | | __| '_ \| | | | __|                                                                                                 
| (_) | |_| | |_| |_) | |_| | |_                                                                                                  
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                 
                |_|                                                                                                               
;                                                                                                                                 
                                                                                                                                  
Up to 40 obs from WANT total obs=1                                                                                                
                                                                                                                                  
Obs    MARY    JANE    MIKE    JOAN    ROGER                                                                                      
                                                                                                                                  
 1      11      22      33      44      99                                                                                        
                                                                                                                                  
 Variables in Creation Order                                                                                                      
                                                                                                                                  
#    Variable    Type    Len                                                                                                      
                                                                                                                                  
1    MARY        Num       8                                                                                                      
2    JANE        Num       8                                                                                                      
3    MIKE        Num       8                                                                                                      
4    JOAN        Num       8                                                                                                      
5    ROGER       Char      2  * did not convert                                                                                   
*                                                                                                                                 
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                               
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                               
| .__/|_|  \___/ \___\___||___/___/                                                                                               
|_|                                                                                                                               
;                                                                                                                                 
                                                                                                                                  
* list of all variables except roger or ROGER or Roger ..;                                                                        
%array(vars,values=%utl_varlist(have,prx=/[^roger]/i));                                                                           
                                                                                                                                  
proc sql;                                                                                                                         
  create                                                                                                                          
       table want as                                                                                                              
  select                                                                                                                          
        %do_over(vars,phrase=                                                                                                     
           input(?,best.) as ?,between=comma)                                                                                     
       ,roger                                                                                                                     
  from                                                                                                                            
       have                                                                                                                       
;quit;                                                                                                                            
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
