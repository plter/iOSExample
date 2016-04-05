//
//  main.c
//  HashMap
//
//  Created by chaoyang805 on 16/3/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include <stdio.h>
#include "hash_map.h"
#include <string.h>
typedef struct people_ {
    char* name;
    int age;
} people;
people* people_new(char* name,int age) {
    people* p = malloc(sizeof(people));
    p->name = name;
    p->age = age;
    return p;
}
int main(int argc, const char * argv[]) {
    // insert code here...
    hash_map* map = hash_map_create();
    hash_map_put(map, "name", "chaoyang");

    hash_map_put(map, "age", (int*)13);

    hash_map_put(map, "gender", "男");

    hash_map_put(map, "hello2", "nihao2");

    hash_map_put(map, "hello3", "nihao3");

    hash_map_put(map, "hello4", "nihao4");

    hash_map_put(map, "hello5", "nihao5");

    hash_map_put(map, "hello6", "nihao6");
    
    hash_map_put(map, "key500", "value11111");

    people* jike = people_new("jikexueyuan", 24);
    hash_map_put(map, "me", jike);
    people* find = hash_map_get(map, "me");
    printf("find me! name:%s,age:%d\n",find->name,find->age);
    hash_map_remove(map, "me");
    hash_map_get(map, "me");
    return 0;
}
