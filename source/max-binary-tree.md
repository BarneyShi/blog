---
title: Leetcode 654 - Max binary tree
date: 2021-09-29 01:23:27
tags:
- binary tree
---
**`Note:`**
- `Recursion`

You are given an integer array nums with no duplicates. A maximum binary tree can be built recursively from nums using the following algorithm:

- Create a root node whose value is the maximum value in nums.
- Recursively build the left subtree on the subarray prefix to the left of the maximum value.
- Recursively build the right subtree on the subarray suffix to the right of the maximum value.
Return the maximum binary tree built from nums.

**Example**

![img](https://assets.leetcode.com/uploads/2020/12/24/tree1.jpg)
```
Input: nums = [3,2,1,6,0,5]
Output: [6,3,5,null,2,0,null,null,1]
Explanation: The recursive calls are as follow:
- The largest value in [3,2,1,6,0,5] is 6. Left prefix is [3,2,1] and right suffix is [0,5].
    - The largest value in [3,2,1] is 3. Left prefix is [] and right suffix is [2,1].
        - Empty array, so no child.
        - The largest value in [2,1] is 2. Left prefix is [] and right suffix is [1].
            - Empty array, so no child.
            - Only one element, so child is a node with value 1.
    - The largest value in [0,5] is 5. Left prefix is [0] and right suffix is [].
        - Only one element, so child is a node with value 0.
        - Empty array, so no child.
```

```javascript
/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {number[]} nums
 * @return {TreeNode}
 */
var constructMaximumBinaryTree = function(nums) {
  if (nums.length === 0) return null;
  const rootVal = Math.max(...nums);
  const root = new TreeNode(rootVal);
  
  const rootIndex = nums.indexOf(rootVal);
  const leftTree = nums.slice(0, rootIndex);
  const rightTree = nums.slice(rootIndex + 1);
  root.left = constructMaximumBinaryTree(leftTree);
  root.right = constructMaximumBinaryTree(rightTree);
  return root;
};
```