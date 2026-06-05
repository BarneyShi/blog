---
title: Sort - Quicksort
date: 2021-08-21 21:51:51
tags:
- sort
---
- `Note`:
  - ![img](https://i.imgur.com/V6jl43g.png)
  - If we choose `array[left]` as the pivot, `right` pointer MUST `move first`.
  - Because if we move `left` pointer first, when it stops, `array[left] > pivot`, then when we `swap array[left], array[start]`, we'll swap a big value into left.
- Analysis:
  - Average time complexity: `O(nlogn)` - Every time, `n` elements are operated, and if we choose `pivot` wisely, it's exactly the `middle`, so we only need to recursively do `logn` times. So it's `O(nlogn)`.
  - Worst time complexity: It happens when the `pivot` is always picked as the `largest` or `smallest` value. So it's `O(n^2)`.

- Steps: 
  1. Choose an element as a pivot
  2. Next, partition the remaining items into two disjoint sublists,
  such that all items greater than the pivot follow it, and all
  elements less than the pivot precede it.
  3. Start recursion.

- Note: The tricky part is how to implememnt `partition`.
```javascript
const partition = (array, left, right) => {
  const start = left;
  const pivot = array[start];
  while (left < right) {
    while (left < right && array[right] >= pivot) {
      right--;
    }
    while (left < right && array[left] <= pivot) {
      left++;
    }
    [array[left], array[right]] = [array[right], array[left]];
  }
  [array[left], array[start]] = [array[start], array[left]];
  return left;
}
const quickSort = (array, left, right) => {
  if (left >= right) return;
  const pivot = partition(array, left, right);
  quickSort(array, left, pivot - 1);
  quickSort(array, pivot + 1, right);
}
```
                  