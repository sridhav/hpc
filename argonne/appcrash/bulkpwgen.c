/*3456789012345678901234567890123456789012345678901234567890123456789012345678*/

/*******************************************************************************

 This application is designed to take two numbers as input and return a
 list of passwords.
  
 This is a single file program without a makefile. It is built:

     gcc -g bulkpwgen.c -o bulkpwgen

*******************************************************************************/


/*******************************************************************************
include headers
*******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>


static char RANDOM_CHAR[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
static int CHAR_LEN = 0;

/*****************************************************************************
getrandomchar:
  
   Return a random character from static string
   character set. 

   In: none

   Out: a alpha numeric char

*****************************************************************************/

char genrandomchar() {
    return RANDOM_CHAR[random()%CHAR_LEN];
}

/*****************************************************************************
randomstr:

    Generate a randonm alphanumeric string

    In: len - string length

    Out: string with random chars

*****************************************************************************/

char* randomstr(int len)
{    
    int i;   
    char a;
    char * passwdstr;
    passwdstr = (char *) malloc((len+1)*sizeof(char));
    memset(passwdstr,'\0',(len+1)*sizeof(char));
    for(i=0; i<len; i++ )
    {
        a=genrandomchar();
        passwdstr[i]=a;
    }
    return passwdstr;
}



/*****************************************************************************
printpw:

    Generate a random alphanumeric strings and print them

    In: len - string length,
        gcnt - count of passwords 
    
    Out: None

*****************************************************************************/

void printpw(int gcnt, int plen)
{
    int i;
    for(i=0;i<gcnt;i++)
    {   
       printf("%d:\t%s\n",i+1,randomstr(plen));
    }
}


/*****************************************************************************
main:

    Main routine.                                                                    

    In: Two numbers via argv[1] and argv[2]                                                                                                        Out: Return code                                                                                  

*****************************************************************************/ 

int main(int argc, char *argv[])
{

    if (argc-1 != 2) {
      printf("Invalid number of arguments. \nUsage. ./bulkpwgen <number of passwords> <password length>.\nExample: ./bulkwgen 10 8.\n");
      exit(1);
    } 
    CHAR_LEN = strlen(RANDOM_CHAR);
    int pcnt=atoi(argv[1]);
    int plen=atoi(argv[2]);    
    printf("Generating %d unique passwords of length %d:\n",pcnt,plen);
    printpw(pcnt,plen);
    return 0;
}