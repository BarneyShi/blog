---
title: Algorithm - 🔎 Binary search
date: 2021-11-18 01:06:47
tags:
- binary search
---
**`Note:`**

1. **`Searching for a target`**
- Return the index otherwise -1
```javascript
function binarySearch(array, target) {
  let left = 0, right = array.length - 1;
  // Here it's `Equal` coz if there is only one element left and it's not the answer. 
  // The loop will termiante and we can just return -1.
  while (left <= right) {
    const mid = left + ((right - left) >> 1);
    if (array[mid] === target) {
      return mid;
    } else if (array[mid] > k) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return -1;
}
```

2. **`Searching for the FIRST number that is BIGGER or EQUAL to the target`**
- Return the index otherwise -1
- Idea: Resize the window till only ONE element left coz if `array[mid] == target`, 
- it doesn't mean it's the FIRST one. Like `[2,2,2,4]`, array[1] = 2, but 0 is the ans.
```javascript

function binarySearch(array, target) {
  let left = 0, right = array.length - 1;
  // Don't use `<=` here because we are not just looking for the target, we are looking for `smaller` or `equal`.
  // If we use `<=`, when the while loop terminates, we lost our last `left` or `right`.
  while (left < right) {
    const mid = left + ((right - left) >> 1);
    if (array[mid] < k) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  if (array[left] >= target) return left;
  return -1;
}
```

3. **`Searching for the LAST number that is SMALLER or EQUAL to the target`**
- Return the index otherwise -1
- Idea: Resize the window till only ONE element left.
- Why it's `mid = left + ((1 + right - left) >> 1)`?
- Think about `[2,2], 2`. If we initialize `mid` as `(left + right) / 2 === 0`. It will fall into a `loop hole`.

```javascript
function binarySearch(array, target) {
  let left = 0, right = array.length - 1;
  // Don't use `<=` here because we are not just looking for the target, we are looking for `smaller` or `equal`.
  // If we use `<=`, when the while loop terminates, we lost our last `left` or `right`.
  while (left < right) {
    const mid = left + ((1 + right - left) >> 1);
    // <= ensure that the target is on the right of `mid`.
    if (array[mid] <= k) {
      left = mid;
    } else {
      right = mid - 1;
    }
  }
  if (array[left] >= target) return left;
  return -1;
}
```
