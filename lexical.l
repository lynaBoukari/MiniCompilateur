%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int i = 0;

int count = 1;
int line = 1;
int lenght;




%}
DIGIT [0-9]
letter [a-zA-Z]
ID [A-Z]({letter}|{DIGIT})*
ent (([1-9]{DIGIT}*)|(0))
flot {ent}+"."(0)*{ent}
sautLigne [\n]
commentair ("/*"(.|\n)*"*/")
car ['].[']
ch ['][a-zA-Z0-9,.=!@$%<>:]*[']
affectation "="
operateur_comparaison ("==="|"!=="|">"|"<"|">=="|"<==")
operateur_logique ("!"|"&"|"|")
operateur_arithmetique ("*"|"+"|"-"|"%"|"/")
finInstruction ("\n")
separateur ("["|"]"|"|"|"("|")"|"#"|"{"|"}"|"$"|"@"|":")
corp ("{"(.)*"}")



%%

 


{car} {lenght = strlen(yytext);count+=strlen(yytext);
	printf("%s est un caractere , ligne = %d\n",yytext,line);
	

}



{flot} {
	count+=strlen(yytext);
	printf("%s est un flottant , ligne = %d\n",yytext,line);
	
	
}
{ent} {
	count+=strlen(yytext);
	printf("%s est un entier , ligne = %d\n",yytext,line);
	
	
}

{finInstruction} {count+=strlen(yytext);
printf("%s fin d'instruction , ligne = %d\n",yytext,line);

}


vrai {
        count+=strlen(yytext);
      	printf("%s est un boolean de type vrai , ligne = %d\n",yytext,line);

	 }

faux {  
        count+=strlen(yytext);
	      printf("%s est un boolean de type faux , ligne = %d\n",yytext,line);
      
	}   

importer { 
     count+=strlen(yytext);
     printf("%s est un mot cle , line = %d\n",yytext,line);
}

tableau {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}

$Prog {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}

var {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}

const {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
ent {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
flot {count+=strlen(yytext);
printf("%s is a key word  line = %d\n",yytext,line);

}
car {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
ch {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line); 

}

lire {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
ecrire {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
lireDe {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
ecrireDans {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}

tq {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
pour {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
faireTq {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}
si {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}

ssi {count+=strlen(yytext);
printf("%s est un mot cle, ligne = %d\n",yytext,line);

}
sinon {count+=strlen(yytext);
printf("%s est un mot cle , ligne = %d\n",yytext,line);

}

{operateur_arithmetique} {count+=strlen(yytext);
printf("%s  est un operateur a arithmetique , ligne = %d\n",yytext,line);
}
{operateur_logique} {count+=strlen(yytext);
printf("%s est un operateur logique , ligne = %d\n",yytext,line);

}


{separateur} {count+=strlen(yytext);
printf("%s est un separateur , ligne = %d\n",yytext,line);

}

{ID} {
      count+=strlen(yytext);
      printf("%s est un Id , ligne %d , colonne %d\n",yytext,line,count);       
      }
	
{ch} { 
	lenght = strlen(yytext);
	count+=strlen(yytext);
	printf("%s est un String , ligne  = %d\n",yytext,line);
	
}


[ \t] { count+=strlen(yytext);}

. 	{printf("Erreur %s code %d ligne %d colonne %d\n",yytext,yytext[0],line,count); count+=strlen(yytext);}



%%

int yywrap(){
}
int main(){
    yylex();
    printf(" \n fin \n" );
return 0;
}
