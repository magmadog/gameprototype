#ifndef FIBONACHI_H
#define FIBONACHI_H

#include <gtest/gtest.h>
#include <stdio.h>
#include<string.h>
#include<fcntl.h>
extern "C" {
#include "common.h"
#include "text/text.h"
#include "text/_text.h"
#define STDOUT 1
#define STDERR 2
}
TEST (abc, test1)
{
    text txt = create_text();
    ASSERT_EQ(pos_return(txt), 0);
}

TEST(protest, show)
{
     int fptr;
     int oldstdout;

     fptr = open("DUMMY.BIL",O_CREAT|O_RDWR,S_IREAD|S_IWRITE);
     oldstdout = dup(STDOUT);
     dup2(fptr,STDOUT);

     char *filedir=(char*)malloc(1024);
     sprintf(filedir, "%s/load.txt", TESTIDIR);

     text txt = create_text();
     load(txt, filedir);
     show(txt);


close(fptr);
dup2(oldstdout,STDOUT);
     FILE *t2;
     t2 = fopen("DUMMY.BIL","rw");
     if(t2 == NULL){
            FAIL();
            return;
     }
     char *buf = (char*)malloc(sizeof(char)*512);
     int readcount = fread(buf,1,512,t2);

     FILE *d2;
     sprintf(filedir, "%s/proveka.txt", TESTIDIR);
     d2 =fopen(filedir,"rw");

     if(d2 == NULL){
            FAIL();
            return;
     }
     char *buf2 = (char*)malloc(sizeof(char)*512);
     int readcount2 = fread(buf2,1,512,d2);
     fclose(t2);
     fclose(d2);
     ASSERT_EQ(readcount,readcount2);

     while(!feof(d2) && !feof(t2)){

}

}

TEST(protest, s_first_line)
{
     int fptr;
     int oldstdout;
     fptr = open("DUMMY.PIL",O_CREAT|O_RDWR,S_IREAD|S_IWRITE);
     oldstdout = dup(STDOUT);
     dup2(fptr,STDOUT);
     close(fptr);

     char *filedir=(char*)malloc(1024);
     sprintf(filedir, "%s/load.txt", TESTIDIR);

     text txt = create_text();
     load(txt, filedir);
     c_to_pos(txt,0,0);
     s(txt);

     show(txt);
     dup2(oldstdout,STDOUT);

     FILE *t2;
     t2 = fopen("DUMMY.PIL","rw");
     if(t2 == NULL){
            FAIL();
            return;
     }
     char *buf1 = (char*)malloc(sizeof(char)*512);

     int readcount =  0;
     while(!feof(t2)){
     readcount+=fread(buf1,1,512,t2);
        }
     FILE *d2;

     sprintf(filedir, "%s/pp_first_line.txt", TESTIDIR);
     d2 =fopen(filedir,"rw");

     if(d2 == NULL){
            FAIL();
            return;
     }
     char *buf2 = (char*)malloc(sizeof(char)*512);
     int readcount2 = 0;
     while(!feof(d2)){
        readcount2+=fread(buf2,1,512,d2);
     }

     fclose(t2);
     fclose(d2);
     readcount += 4;
     ASSERT_EQ(readcount,readcount2);
     while(!feof(d2) && !feof(t2)){

}

}

TEST(protest, s_last_line)
{
     int fptr;
     int oldstdout;
     fptr = open("DUMMY.MIL",O_CREAT|O_RDWR,S_IREAD|S_IWRITE);
     oldstdout = dup(STDOUT);
     dup2(fptr,STDOUT);
     close(fptr);

     char *filedir=(char*)malloc(1024);
     sprintf(filedir, "%s/load.txt", TESTIDIR);

     text txt = create_text();
     load(txt, filedir);
     s(txt);


     show(txt);
     dup2(oldstdout,STDOUT);

     FILE *t2;
     t2 = fopen("DUMMY.MIL","rw");
     if(t2 == NULL){
            FAIL();
            return;
     }
     char *buf1 = (char*)malloc(sizeof(char)*512);

     int readcount =  0;
     while(!feof(t2)){
     readcount+=fread(buf1,1,512,t2);
        }
     FILE *d2;

     sprintf(filedir, "%s/pp_second_line.txt", TESTIDIR);
     d2 =fopen(filedir,"rw");

     if(d2 == NULL){
            FAIL();
            return;
     }
     char *buf2 = (char*)malloc(sizeof(char)*512);
     int readcount2 = 0;
     while(!feof(d2)){
     readcount2+=fread(buf2,1,512,d2);
        }

     fclose(t2);
     fclose(d2);
     readcount += 4;
     ASSERT_EQ(readcount,readcount2);

}

TEST(protest, plb_first)
{
     int fptr;
     int oldstdout;
     fptr = open("PLBTEST1",O_CREAT|O_RDWR,S_IREAD|S_IWRITE);
     oldstdout = dup(STDOUT);
     dup2(fptr,STDOUT);
     close(fptr);

     char *filedir=(char*)malloc(1024);
     sprintf(filedir, "%s/load.txt", TESTIDIR);

     text txt = create_text();
     load(txt, filedir);
     c_to_pos(txt,1,1);
     plb(txt);

     dup2(oldstdout,STDOUT);

     FILE *t2;
     t2 = fopen("PLBTEST1","rw");
     if(t2 == NULL){
            FAIL();
            return;
     }
     char *buf1 = (char*)malloc(sizeof(char)*512);

     int readcount =  0;
     while(!feof(t2)){
     readcount+=fread(buf1,1,512,t2);
        }
     FILE *d2;

     sprintf(filedir, "%s/plb_test.txt", TESTIDIR);
     d2 =fopen(filedir,"rw");

     if(d2 == NULL){
            FAIL();
            return;
     }
     int readcount2 = pos_return(txt) + 1;

     fclose(t2);
     fclose(d2);
     ASSERT_EQ(readcount,readcount2);

}


TEST(protest, plb_second)
{
     int fptr;
     int oldstdout;
     fptr = open("PLBTEST2",O_CREAT|O_RDWR,S_IREAD|S_IWRITE);
     oldstdout = dup(STDOUT);
     dup2(fptr,STDOUT);
     close(fptr);

     char *filedir=(char*)malloc(1024);
     sprintf(filedir, "%s/load.txt", TESTIDIR);

     text txt = create_text();
     load(txt, filedir);
     c_to_pos(txt,1,6);
     plb(txt);

     dup2(oldstdout,STDOUT);

     FILE *t2;
     t2 = fopen("PLBTEST2","rw");
     if(t2 == NULL){
            FAIL();
            return;
     }
     char *buf1 = (char*)malloc(sizeof(char)*512);

     int readcount =  0;
     while(!feof(t2)){
     readcount+=fread(buf1,1,512,t2);
        }

     int readcount2 = pos_return(txt) + 1;

     fclose(t2);
     ASSERT_EQ(readcount,readcount2);

}


TEST(protest, showlassified)
{
     int fptr;
     int oldstdout;
     fptr = open("SEBO2",O_CREAT|O_RDWR,S_IREAD|S_IWRITE);
     oldstdout = dup(STDOUT);
     dup2(fptr,STDOUT);
     close(fptr);

     char *filedir=(char*)malloc(1024);
     sprintf(filedir, "%s/load.txt", TESTIDIR);

     text txt = create_text();
     load(txt, filedir);
     showclassified(txt);
     dup2(oldstdout,STDOUT);


     FILE *t2;
     t2 = fopen("SEBO2","rw");
     if(t2 == NULL){
            FAIL();
            return;
     }
     char *buf1 = (char*)malloc(sizeof(char)*512);

     int readcount =  0;
     while(!feof(t2)){
     readcount+=fread(buf1,1,512,t2);
        }
     FILE *d2;

     sprintf(filedir, "%s/SEBO_TEST2.txt", TESTIDIR);
     d2 =fopen(filedir,"rw");

     if(d2 == NULL){
            FAIL();
            return;
     }
     char *buf2 = (char*)malloc(sizeof(char)*512);
     int readcount2 = 1;
     while(!feof(d2)){
     readcount2+=fread(buf2,1,512,d2);
        }

     fclose(t2);
     fclose(d2);
     ASSERT_EQ(readcount,readcount2);

}
#endif
