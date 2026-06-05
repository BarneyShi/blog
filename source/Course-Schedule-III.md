---
title: Leetcode 630 - Course Schedule III
date: 2021-12-13 19:30:50
tags:
- heap
- greedy
---
**`Note:`**
- Sort course by `ending` time.
- Use `sum` to track total time.
- Add every `duration` to a `maxHeap`.
- If adding curr course' duration will exceed its ending time, compare it with the `top` of the maxHeap.
- If curr course's `duration < topDuration`, pop the heap and add curr course to `sum` as well as the heap.
- Return the length of `heap`. 

**`Question:`**

There are `n` different online courses numbered from `1` to `n`. You are given an array `courses` where `courses[i] = [durationi, lastDayi]` indicate that the `ith` course should be taken continuously for `durationi` days and must be finished before or on `lastDayi`.

You will start on the `1st` day and you cannot take two or more courses simultaneously.

Return the maximum number of courses that you can take.

**`Example:`**
```
Input: courses = [[100,200],[200,1300],[1000,1250],[2000,3200]]
Output: 3
Explanation: 
There are totally 4 courses, but you can take 3 courses at most:
First, take the 1st course, it costs 100 days so you will finish it on the 100th day, and ready to take the next course on the 101st day.
Second, take the 3rd course, it costs 1000 days so you will finish it on the 1100th day, and ready to take the next course on the 1101st day. 
Third, take the 2nd course, it costs 200 days so you will finish it on the 1300th day. 
The 4th course cannot be taken now, since you will finish it on the 3300th day, which exceeds the closed date.
```

**`Code:`**
```javascript
/**
 * @param {number[][]} courses
 * @return {number}
 */
var scheduleCourse = function(courses) {
  let queue = new maxHeap();
  courses.sort((a, b) => a[1] - b[1]);
  let sum = 0;
  for (const course of courses) {
    if (course[0] + sum <= course[1]) {
      sum += course[0];
      queue.insert(course[0]);
    } else if (queue.heap.length > 0 && queue.heap[0] > course[0]) {
      sum = sum - queue.pop() + course[0];
      queue.insert(course[0]);
    }
  }
  return queue.heap.length;
};
/* MaxHeap */
class maxHeap {

  constructor() {
    this.heap = [];
  }

  swap(i, j) {
    [this.heap[i], this.heap[j]] = [this.heap[j], this.heap[i]];
  }

  getParentIndex(i) {
    return (i - 1) >> 1;
  }

  getLeftChildIndex(i) {
    return 2 * i + 1;
  }

  getRightChildIndex(i) {
    return 2 * i + 2;
  }

  shiftDown(i) {
    const leftIndex = this.getLeftChildIndex(i);
    const rightIndex = this.getRightChildIndex(i);
    if (leftIndex < this.heap.length && this.heap[leftIndex] > this.heap[i]) {
      this.swap(i, leftIndex);
      this.shiftDown(leftIndex);
    }
    if (rightIndex < this.heap.length && this.heap[rightIndex] > this.heap[i]) {
      this.swap(i, rightIndex);
      this.shiftDown(rightIndex);
    }
  }

  shiftUp(i) {
    if (i === 0) return;
    if (this.heap[i] > this.heap[this.getParentIndex(i)]) {
      this.swap(i, this.getParentIndex(i));
      this.shiftUp(this.getParentIndex(i));
    }
  }

  insert(val) {
    this.heap.push(val);
    this.shiftUp(this.heap.length - 1);
  }

  pop() {
    const first = this.heap[0];
    const last = this.heap.pop();
    if (this.heap.length !== 0) {
      this.heap[0] = last;
      this.shiftDown(0);
    }
    return first;
  }
}
```