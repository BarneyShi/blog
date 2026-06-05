---
title: Leetcode 307 - Range sum query - mutable (🌳 Binary Indexed Tree)
date: 2021-12-03 23:44:18
tags:
- binary indexed tree
---
**`Note:`**
- Just use `preSum` will have O(n) on updating, we need something faster.
- ![img](https://i.imgur.com/TH37Pz5.png)
- Create a `tree` array with size `2 * nums_length`.
  - Insert `nums[i]` into the end of `tree[]`.
  - Baed on `tree[i] = tree[2*i] + tree[2*i + 1]`, fill the preceding cells too. (Some cells might be left empty)
- Now even it's still an array, but it is equivalent to something like 
- ![img](https://i.imgur.com/fcA6F5B.png)
- How to update a num?
  - First, update `tree[len + index]`.
  - Then based on `pos = len + index`, update `tree[pos / 2] = tree[left] + tree[right]`.
  - Be careful that based on whether `pos` is `even` or `odd`, there are some adjustments for `left` and `right`.
  - If `pos` is even, `left = pos, right = pos + 1`.
  - If `pos` is odd, `left = pos - 1, right = pos`.
  - Then update `pos` as `pos / 2`, and do this till `pos === 0`.
- How to calculate sum?
  - Be clear that a `sum treeNode` can only work when `left` is `even` and `right` is `odd`.
  - Add `offset numsLen` to `left` and `right` first. 
  - If `left` is `odd`, we need to add `tree[left]` to sum, and do `left++`.
  - If `right` is `even`, we need to add `tree[right]` to sum, and do `right--`.
  - Next, we need to find the `parentNode` of leftNode and rightNode.
  - So, do `left >> 1` and `right >> 1`.
  - When we've found the parent node, it will be added to `sum`.
  - Return `sum`.
  
**`Question:`**

Given an integer array `nums`, handle multiple queries of the following types:

- Update the value of an element in `nums`.
- Calculate the sum of the elements of `nums` between indices `left` and `right` inclusive where `left <= right`.

Implement the `NumArray` class:

- `NumArray(int[] nums)` Initializes the object with the integer array `nums`.
- `void update(int index, int val)` Updates the value of `nums[index]` to be val.
- `int sumRange(int left, int right)` Returns the sum of the elements of `nums` between indices `left` and `right` inclusive `(i.e. nums[left] + nums[left + 1] + ... + nums[right])`.

**`Example:`**
```
Input
["NumArray", "sumRange", "update", "sumRange"]
[[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
Output
[null, 9, null, 8]

Explanation
NumArray numArray = new NumArray([1, 3, 5]);
numArray.sumRange(0, 2); // return 1 + 3 + 5 = 9
numArray.update(1, 2);   // nums = [1, 2, 5]
numArray.sumRange(0, 2); // return 1 + 2 + 5 = 8
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 */
var NumArray = function(nums) {
  const n = nums.length;
  let tree = [...Array(n * 2)];
  for (let i = n; i < 2*n; i++) {
    tree[i] = nums[i - n];
  }
  for (let i = n - 1; i >= 0; i--) {
    tree[i] = tree[2*i] + tree[2*i + 1];
  }
  this.n = n;
  this.tree = tree;
};

/** 
 * @param {number} index 
 * @param {number} val
 * @return {void}
 */
NumArray.prototype.update = function(index, val) {
  let pos = this.n + index;
  this.tree[pos] = val;
  // pos === 0 also means nums is empty. Also, pos will never be negative, so we can't use `=` here.
  while (pos > 0) {
    const left = pos % 2 === 0 ? pos : pos - 1;
    const right = pos % 2 === 0 ? pos + 1 : pos;
    this.tree[pos >> 1] = this.tree[left] + this.tree[right];
    pos = pos >> 1;
  }
};

/** 
 * @param {number} left 
 * @param {number} right
 * @return {number}
 */
NumArray.prototype.sumRange = function(left, right) {
  let sum = 0;
  left = this.n + left;
  right = this.n + right;
  while (left <= right) {
    if (left % 2 === 1) {
      sum += this.tree[left];
      left++;
    } 
    if (right % 2 === 0) {
      sum += this.tree[right];
      right--;
    }
    left = left >> 1;
    right = right >> 1;
  }
  return sum;
};

/**
 * Your NumArray object will be instantiated and called as such:
 * var obj = new NumArray(nums)
 * obj.update(index,val)
 * var param_2 = obj.sumRange(left,right)
 */
```