//
//  hash_map.h
//  HashMap
//
//  Created by chaoyang805 on 16/3/19.
//  Copyright © 2016 jikexueyuan. All rights reserved.
//

#ifndef hash_map_h
#define hash_map_h

#include <stdio.h>
#include <stdlib.h>
#include "node.h"
#endif /* hash_map_h */

typedef struct hash_map_ {
    int capacity;
    int size;
    int load_factor;
    Node** table;
} hash_map;
// 创建map
hash_map* hash_map_create();

// put 返回旧的value，如果不存在就返回null
any_pointer hash_map_put(hash_map* map,const char* key,any_pointer value);

// 根据key获得value
any_pointer hash_map_get(hash_map* map,const char* key);
// 根据key删除某个value
any_pointer hash_map_remove(hash_map* map,const char* key);

void print_map(hash_map* map);