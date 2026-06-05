---
title: Leetcode 42 - 💦 Trapping rain water 💦
date: 2021-11-03 02:42:08
tags:
- monotonic stack
---
**`Note:`**
- To find how many water some cols can trap, we need to know the `highest walls` on both side.
- How can we quickly get a col that is higher than current col on the `left` or `right`? 
- A `decreasing monotonic stack`! Only store `indexes` in the stack.
- ![img](https://i.imgur.com/68P59WM.gif)
- When the current `height[i]` is higher than the `top` of the stack. We need to pop it out `stack.pop()`. 
- The question is, how wide does the `top` extend to both side?
- ![img](https://i.imgur.com/jMA6Gfd.png)
- There is one thing that we can be sure: 
  - `Area between cols in stack have been fill out with water if there are gaps between them`.
  - All other cols in `height` between two adjacent elements in `stack` are shorter than those two. We can def trap some water there.
- So, the `WDITH = i - newTop - 1`, which is cols of indexes `4, 5, 6, 7, 8`.
- The `HEIGHT = min(height[newTop], height[i]) - height[oldTop]`.
- Like I showed here ![img](https://i.imgur.com/rvwpo1T.png).

**`Question:`**

Given `n` non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining

**`Example:`**

![img](https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png)
```
Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
```

**`Code:`**
```javascript
/**
 * @param {number[]} height
 * @return {number}
 */
 var trap = function (height) {
  let monoStack = [];
  let res = 0;
  for (let i = 0; i < height.length; i++) {
    while (monoStack.length > 0 && height[monoStack[monoStack.length - 1]] < height[i]) {
      const top = monoStack.pop();
      if (monoStack.length > 0) {
        const areaWidth = i - monoStack[monoStack.length - 1] - 1;
        const areaHeight = Math.min(height[i], height[monoStack[monoStack.length - 1]]) - height[top];
        res += areaWidth * areaHeight;
      }
    }
    monoStack.push(i);
  }
  return res;
};
```