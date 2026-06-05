---
title: Leetcode 350 - Intersection of two arrays II
date: 2021-08-18 22:47:30
tags:
- leetcode
- array
---
Given two arrays, write a function to compute their intersection.
**Example 1:**
```
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
```
**Example 2:**
```
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
```
**Note:**
- Each element in the result should appear as many times as it shows in both arrays.
- The result can be in any order.

`Thoughts`: Took a bit longer to understand what the question means by 'as many times'. Use `Map()` is the way. First, to build a map and record occurrences of each unique elements, then iterate over `nums2` and add elements to `res` if the value of element in Map is no less than `1`.
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersect = function(nums1, nums2) {
    let map = new Map();
    nums1.forEach(i => {
        if(map.has(i)) {
           map.set(i, map.get(i)+1); 
        } else {
            map.set(i, 1);
        }
    })
    return nums2.reduce((acc, cur) => {
       if(map.get(cur) >=1) {
           acc.push(cur);
           map.set(cur, map.get(cur) -1);
           return acc;
       }
        return acc;
    }, [])
};
```