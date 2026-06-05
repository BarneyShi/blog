---
title: Leetcode 11 - Container with most water
date: 2021-10-22 20:24:10
tags:
- double pointers
- greedy
---
**`Note:`**
- My intuition is to use `double pointers` but how we should determine to move `left` or `right` pointer?
- No matter which we move, `W` will be smaller.
- To at least not make our next container smaller, we have to preserve the `higher` L. So, we should move the smaller pointer who has a `shorter L`.
- This can be proved by math, but we don't bother to.

**`Question:`**

Given n non-negative integers `a1, a2, ..., an` , where each represents a point at coordinate `(i, ai)`. n vertical lines are drawn such that the two endpoints of the line i is at `(i, ai)` and `(i, 0)`. Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

Notice that you may not slant the container.

**`Example:`**

![img](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)
```
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
```

**`Code:`**

**`Double pointers O(n)`**
```javascript
/**
 * @param {number[]} height
 * @return {number}
 */
var maxArea = function(height) {
  let left = 0, right = height.length - 1;
  let result = 0;
  while (left < right) {
    result = Math.max(result, (right - left) * Math.min(height[left], height[right]));
    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return result;
};
```