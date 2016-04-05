//
//  hash_map.c
//  HashMap
//
//  Created by chaoyang805 on 16/3/19.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "hash_map.h"
#include <string.h>

hash_map* hash_map_create() {
    hash_map* map = malloc(sizeof(hash_map));
    map->capacity = 512;
    map->load_factor = 0.75;
    map->size = 0;
    map->table = (Node**)malloc(sizeof(Node*) * map->capacity);
    return map;
}

any_pointer hash_map_put_at(hash_map* map,int index,Node* node) {

    Node* old = map->table[index];
    
    // 遍历oldValue,找到oldValue中有没有存在这个key的node
    for (Node* head = old; head != NULL; head = head->next) {
        
        if (head->hash == node->hash) {
            any_pointer oldValue = head->value;
            head->value = node->value;
            printf("update old\n");
            return oldValue;
        }
    }
    
    // 如果这个key在map中不存在，则插入到当前index中的头节点，同样返回null
    node->next = old;
    map->table[index] = node;
    map->size++;
    return NULL;
}

any_pointer hash_map_put(hash_map* map,const char* key,any_pointer value) {

    Node* node = node_create(key,value);
    int index = node->hash % map->capacity;
    return hash_map_put_at(map, index, node);
}

any_pointer hash_map_get(hash_map* map,const char* key) {
    Node* node = node_create(key, NULL);

    int hash = node->hash;
    free(node);
    int index = hash % map->capacity;
    
    Node* head = map->table[index];
    
    for (Node* it = head; it != NULL; it = it->next) {
        if (it->hash == hash) {
            return it->value;
        }
    }
    
    printf("don't have this key!!\n");
    return NULL;
}

any_pointer hash_map_remove(hash_map* map,const char* key) {
    Node* node = node_create(key, NULL);
    int hash = node->hash;
    free(node);
    
    int index = hash % map->capacity;
    
    Node* head = map->table[index];
    
    if (head == NULL) {
        printf("don't have this key\n");
        return NULL;
    }
    // 如果要删除的是头结点,且头结点的next为NULL
    if (head->hash == hash && head->next == NULL) {
        map->table[index] = NULL;
        free(head);
        head = NULL;
        printf("removed first");
    }
    
    for (Node* it = head,*prev = head; it != NULL;prev = it,it = it->next) {

        if (it->hash == hash) {
            if (it->next) {
                *it = *(it->next);
                printf("removed\n");
            }else {
                (*prev).next = NULL;
                printf("removed last\n");
            }
            break;
        }
    }
    return NULL;
}


void print_map(hash_map* map) {
    int index = 0;
    for (int i = 0; i < map->capacity; i++) {
        Node* head = map->table[i];
        if (head) {
            while (head) {
                printf("value %d is %s key %d is %s\n",index,head->value,index,head->key);
                head = head->next;
                index++;
            }
        }
    }
}






