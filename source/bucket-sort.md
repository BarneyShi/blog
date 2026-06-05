---
title: Sort - Bucket sort
date: 2021-10-10 21:40:07
tags:
- sort
---
**`Time complexity:`** O(n + k), `k` is the num of buckets.
```
Given an array `arr` with length K, sort it.
```
![img](https://media.geeksforgeeks.org/wp-content/cdn-uploads/scene01729.jpg)
1. Create K buckets.
2. For each num assign it to a bucket who contains nums sitting between an `interval`. Like `0-5` or `6-10`.
3. Sort each bucket.
4. `Concat` all buckets.
