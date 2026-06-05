---
title: Leetcode Interview - Intersection of Two Linked Lists LCCI
date: 2021-10-11 22:15:01
tags:
- double pointers
- array
---
**`Note:`**
- Pattern: When using `2-pointer`, let one pointer `moves first` can have some surprising results.
- Get the lengths of two linked lists.
- Create two pointers, let the pointer pointing to the longest list moves `diff` steps (Diff = | lengthA - lengthB |).
- When `pointerA === pointerB`, we got the result!


**`Question:`**

Given two (singly) linked lists, determine if the two lists intersect. Return the inter­ secting node. Note that the intersection is defined based on reference, not value. That is, if the kth node of the first linked list is the exact same node (by reference) as the jth node of the second linked list, then they are intersecting.

**`Example:`**
```
Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
Output: Reference of the node with value = 8
Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,0,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
```

**`Code:`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
  let lengthA = 0, lengthB = 0;
  lengthA = getListLength(headA);
  lengthB = getListLength(headB);

  let diff = Math.abs(lengthB - lengthA);

  let pointerA = headA, pointerB = headB;
  if (lengthB > lengthA) {
    [pointerA, pointerB] = [pointerB, pointerA];
  }
  while (diff-- > 0) {
    pointerA = pointerA.next;
  }
  while (pointerA && pointerB && pointerA !== pointerB) {
    pointerA = pointerA.next;
    pointerB = pointerB.next;
  }
  return pointerA ? pointerA : null;
};

function getListLength(node) {
  let i = 0;
  let head = node;
  while (head) {
    i++;
    head = head.next;
  }
  return i;
}
```