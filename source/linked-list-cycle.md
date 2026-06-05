---
title: Leetcode 141 - Linked list cycle
date: 2021-08-18 23:01:36
tags:
- leetcode
- linked list
---
Given `head`, the head of a linked list, determine if the linked list has a cycle in it.

   There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Internally, `pos` is used to denote the index of the node that tail's `next` pointer is connected to. **Note that `pos` is not passed as a parameter**.

   Return `true` *if there is a cycle in the linked list*. Otherwise, return `false`.

   **Note:** To make it use `O(1)` memory, we can replace `head.val` inplace. Make every current `head.val` equal `undefined`, then during the while loop, if `head.val = undefined`, then it means we have a `cycle`

   **Example 1:**

   ![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)

   ```
   Input: head = [3,2,0,-4], pos = 1
   Output: true
   Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
   ```

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
       if (head == null) return false;
       while(head != null) {
           if (head.val == undefined) {
               return true;
           }
           head.val = undefined;
           head = head.next;
       }
       return false;
   };
   ```
