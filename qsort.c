#define num 2000
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
     
   





void quicksort(int k[num], int left, int right)
{

    int i, j, pivot, temp;

    if (left < right)
    {

        pivot = left;

        i = left;

        j = right;

        while (i < j)
        {

            while (k[i] <= k[pivot] && i < right)

                i++;

            while (k[j] > k[pivot])

                j--;

            if (i < j)
            {

                temp = k[i];

                k[i] = k[j];

                k[j] = temp;
            }
        }

        temp = k[pivot];

        k[pivot] = k[j];

        k[j] = temp;

        quicksort(k, left, j - 1);

        quicksort(k, j + 1, right);
    }
}



int main(){ 
   
   clock_t start, end;
   double cpu_time_used;
     
    
    
    
    
    int k[num];
     char file_name[64];
     //read file into array k
     printf("enter the filename\n");
     if (fgets(file_name, 64, stdin) == NULL){
        exit(-1);
     }
     file_name[strlen(file_name)-1] = '\0';
     FILE * input;
     FILE * output; 
     input = fopen(file_name, "r");
     if (input == NULL){ 
        exit(-1);
     }
     output = fopen("sortedC.txt", "w+");
     int j = 0;
     while(!feof(input)){ 
        fscanf(input, "%d", &k[j++]);
     }
    if (output == NULL){ 

        exit(-1);
     }

    // for (int i = 0; i < num; i++) {
    //     printf("%d\n", k[i]);
    // }
    
    start = clock();
    quicksort(k,0,j-1);
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("%lf",  cpu_time_used);
    for (int i = 0; i < num; i++) {
        fprintf(output,"%d \n", k[i]);
        
    }
}