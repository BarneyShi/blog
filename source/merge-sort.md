---
title: Sort - Merge sort
date: 2021-10-14 21:31:55
tags:
- sort
---
**`Note:`**
- ![img](https://i.imgur.com/4RSmbE3.png)
- Write a recursion method to split array, so we can concat them in order then.
- Split by cut each subarray in half.
- Write a `merge helper` to concat two subarrays in order. When one of them is empty, `append` the other one to the end.

```javascript
function mergeSort(unsortedArray) {
  if (unsortedArray.length <= 1) return unsortedArray;

  const middle = Math.floor(unsortedArray.length / 2);
  const left = unsortedArray.splice(0, middle);
  const right = unsortedArray;
  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  let sortedArray = [];
  while (left.length && right.length) {
    if (left[0] < right[0]) {
      sortedArray.push(left.shift());
    } else {
      sortedArray.push(right.shift());
    }
  }
  // Either `left` or `right` will be empty, but the other one must be not. So, we still need to concat them together.
  return [...sortedArray, ...left, ...right];
}

console.log(mergeSort([2,4,1,5,3,6,2]))

```
