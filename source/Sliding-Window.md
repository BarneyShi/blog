---
title: Sliding Window 🪟
date: 2021-12-15 20:30:36
tags:
- sliding window
---

Here, I provide a template for `sliding window` that can handle most questions.

```javascript
function slidingWindow(nums) {
  const length = nums.length;
  const WINDOW_SIZE = K;
  // Sum is optional. 
  let sum = 0; 
  let ans = 0;

  for (let left = 0, right = 0; right < length; right++) {
    sum += nums[right];
    // The condition here is flexible.
    while (left < right && right - left + 1 >= WINDOW_SIZE) {
      sum -= nums[left];
      left++;
    }
    ans = Math.max(ans, right - left + 1);
    right++;
  }
}
```