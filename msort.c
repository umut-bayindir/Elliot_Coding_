#define num 2000
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h> 

void meansort(int m, int n, int mean, int k[]) {
    int i, j, left_sum, right_sum, temp, pmean;
    if (m < n) {
        left_sum = 0;
        right_sum = 0;
        i = m;
        j = n;
        while (1) {
            while (k[i] <= mean && i != j) {
                left_sum += k[i];
                i++;
            }
            while (k[j] > mean && i != j) {
                right_sum += k[j];
                j--;
            }
            if (i != j) {
                temp = k[i];
                k[i] = k[j];
                k[j] = temp;
            } else {
                break;
            }
        }
        if (i == m) {
            return;
        }
        right_sum += k[j];
        pmean = (int) (left_sum / (i - m));
        meansort(m, i - 1, pmean, k);
        pmean = (int) (right_sum / (n - j + 1));
        meansort(j, n, pmean, k);
    }
}

int main(){ 

   clock_t start, end;
   double cpu_time_used;
   
    int mean;
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
    // printf("\n");
    int m = 0, n = num - 1;
    if(k[m] <= k[n]){ 
        mean = k[m] + 1;
    }else{ 
        mean = k[m];
    }
    start = clock();
    meansort(m,n,mean,k);
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("%lf",  cpu_time_used);
    for (int i = 0; i < num; i++) {
        fprintf(output,"%d \n", k[i]);
        
    }
}