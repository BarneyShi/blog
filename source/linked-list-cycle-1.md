---
title: Leetcode 141 - Linked list cycle
date: 2021-09-06 21:13:38
tags:
- leetcode
- double pointers
---
Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.

**Example:**

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)
```
Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
```

**`Note:`**
- Use double pointers, a `fast` and a `slow` pointer.
- `fast` pointer moves `2` every iteration and `slow` pointer moves `1` every time. 
- If there is a cycle, the `fast` pointer will be `behind` `slow` pointer eventually.

```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
  if (head == null || head.next == null) return false;
  let fast = head, slow = head;
  while (fast.next !== null && fast.next.next !== null) {
    if (fast.next === slow) return true;
    slow = slow.next;
    fast = fast.next.next;
  }
  return false;
};
```
