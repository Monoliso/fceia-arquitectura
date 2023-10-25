#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

enum { NS_PER_SECOND = 1000000000 };
#define CANT_ELEM 100000000

void sub_timespec(struct timespec t1, struct timespec t2, struct timespec *td)
{
    td->tv_nsec = t2.tv_nsec - t1.tv_nsec;
    td->tv_sec  = t2.tv_sec - t1.tv_sec;
    if (td->tv_sec > 0 && td->tv_nsec < 0)
    {
        td->tv_nsec += NS_PER_SECOND;
        td->tv_sec--;
    }
    else if (td->tv_sec < 0 && td->tv_nsec > 0)
    {
        td->tv_nsec -= NS_PER_SECOND;
        td->tv_sec++;
    }
}

void sum(float *a, float *b, int len);
void sum_simd(float *a, float *b, int len);

int main(void)
{
    float *a1 = malloc(sizeof(float)*CANT_ELEM);
    float *a2 = malloc(sizeof(float)*CANT_ELEM);
    float *b1 = malloc(sizeof(float)*CANT_ELEM);
    float *b2 = malloc(sizeof(float)*CANT_ELEM);
    for(int i=0; i<CANT_ELEM; ++i){
        a1[i] = i;
        b2[i] = i;
        a2[i] = i;
        b2[i] = i;
    }

    struct timespec start, finish, delta;
    clock_gettime(CLOCK_REALTIME, &start);
    
    sum(a1, b1, CANT_ELEM);

    clock_gettime(CLOCK_REALTIME, &finish);
    sub_timespec(start, finish, &delta);
    printf("sum time: %d.%.9ld\n", (int)delta.tv_sec, delta.tv_nsec);

    clock_gettime(CLOCK_REALTIME, &start);
    
    sum_simd(a2, b2, CANT_ELEM);

    clock_gettime(CLOCK_REALTIME, &finish);
    sub_timespec(start, finish, &delta);
    printf("sum_simd time: %d.%.9ld\n", (int)delta.tv_sec, delta.tv_nsec);

    return 0;
}