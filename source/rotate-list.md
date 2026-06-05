---
title: Leetcode 61 - Rotate list
date: 2021-11-23 01:43:19
tags:
- linked list
- double pointers
---
**`Note:`**
- Use `stack` to store vals and rotate them is really naive.
- Use `double pointers` to find the new head;
- ![img](https://i.imgur.com/OS2apqx.png)

**`Question:`**

Given the `head` of a linked list, rotate the list to the right by `k` places.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/13/rotate1.jpg)
```
Input: head = [1,2,3,4,5], k = 2
Output: [4,5,1,2,3]
```

**`Code:`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
var rotateRight = function(head, k) {
  if (!head || k === 0) return head;
  let tmp = head;
  let length = 0;
  while (tmp) {
    length++;
    tmp = tmp.next;
  }
  k %= length;
  if (k === 0) return head;
  
  let slow = head;
  let fast = head;
  while (k > 0) {
    fast = fast.next;
    k--;
  }
  while (fast.next) {
    slow = slow.next;
    fast = fast.next;
  }
  let res = slow.next;
  slow.next = null;
  fast.next = head;
  return res;
};
```