---
title: Sort - ⤵️ Insertion sort
date: 2021-11-29 01:42:45
tags:
- sort
---
- Elements on the `left` are always `sorted`.
- Swap `arr[i]` with smaller neighbours till there is no more elements smaller than it.

![img](https://i.imgur.com/sAnP81g.gif)
```javascript
function insertSort(arr) {
  for (let i = 0; i < arr.length; i++) {
    let j = i - 1;
    while (j >= 0 && arr[j + 1] < arr[j]) {
      [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
      j--;
    }
  }
  return arr;
}
```