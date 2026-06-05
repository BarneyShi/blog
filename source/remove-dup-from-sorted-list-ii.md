---
title: Leetcode 82 - Remove dup from sorted list II
date: 2022-05-24 21:03:46
tags:
- linked list
---
**`Note:`**
- 99% times we use `dummy` head for linked list questions.
- 99% times we need `double pointers`.
- Don't overthink.
  - If `right` has dups, just move it till there's not.
  - If not, just move `left` and `right` together.
  

**`Question:`**

Given the `head` of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list `sorted` as well.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2021/01/04/linkedlist1.jpg)
```
Input: head = [1,2,3,3,4,4,5]
Output: [1,2,5]
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
 * @return {ListNode}
 */
var deleteDuplicates = function(head) {
  let dummy = new ListNode(-1);
  dummy.next = head;
  let left = dummy;
  let right = head;

  while (right && right.next) {
    if (right.next && right.val !== right.next.val) {
      left = left.next;
      right = right.next;
    } else {
      const x = right.val;
      while (right && right.val === x) {
        right = right.next;
      }
      left.next = right;
    }
  }
  return dummy.next;
};
```

**`What if we want to preserve each node once?`**

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
 * @return {ListNode}
 */
var deleteDuplicates = function(head) {
  let dummy = new ListNode(-1);
  dummy.next = head;
  let left = dummy;
  let right = head;

  while (right && right.next) {
    if (right.next && right.val !== right.next.val) {
      left = left.next;
      right = right.next;
    } else {
      /** This line changed **/
      while (right.next && right.next.val === right.val) {
        right = right.next;
      }
      left.next = right;
    }
  }
  return dummy.next;
};
```