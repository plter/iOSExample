//
//  node.h
//  HashMap
//
//  Created by chaoyang805 on 16/3/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#ifndef node_h
#define node_h

#include <stdio.h>
#include <stdlib.h>
#endif /* node_h */
typedef void* any_pointer;

typedef struct node_ {
    const char* key;
    int hash;
    any_pointer value;
    struct node_* next;
} Node;

Node* node_create(const char* key,any_pointer value);
int hashcode(const char *s, int len);