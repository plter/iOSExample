//
//  node.c
//  HashMap
//
//  Created by chaoyang805 on 16/3/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "node.h"
#include <string.h>
int hashcode(const char *s, int len) {
    
    const unsigned char *name = (const unsigned char *)s;
    
    unsigned long h = 0, g;
    
    int i;
    
    for(i=0;i<len;i++)
        
    {
        
        h = (h << 4) + (unsigned long)(name[i]); //hash左移4位，當前字元ASCII存入hash
        
        if ((g = (h & 0xF0000000UL))!=0)
            
            h ^= (g >> 24);
        
        h &= ~g; //清空28-31位。
        
    }
    
    return (int)h;
    
}


Node* node_create(const char* key,any_pointer value) {
    Node* node = malloc(sizeof(Node));
    node->key = key;
    node->value = value;
    node->hash = hashcode(key,strlen(key));
    node->next = NULL;
    return node;
}