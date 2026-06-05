---
title: Leetcode 380 - Insert delete getrandom O(1)
date: 2021-11-02 03:59:55
tags:
---
**`Note:`**
- Use an `array` and `Map`.
- `Array` is for generate a random using its length. Otherwise, we'll have to iterate map and it will cost lots of time.
- `Map` store `(val, index)`.
- Be careful when `delete`. 
  - Pop up the end first. If it is not the `val`, we need to swap it with the target in `array`.
  - In this way, we can always keep the array filled.

**`Question:`**

Implement the `RandomizedSet` class:

- `RandomizedSet()` Initializes the RandomizedSet object.
- `bool insert(int val)` Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
- `bool remove(int val)` Removes an item val from the set if present. Returns true if the item was present, false otherwise.
- `int getRandom()` Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.

You must implement the functions of the class such that each function works in average `O(1)` time complexity.

**`Example:`**
```
Input
["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
[[], [1], [2], [2], [], [1], [2], []]
Output
[null, true, false, true, 2, true, false, 2]

Explanation:
RandomizedSet randomizedSet = new RandomizedSet();
randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
randomizedSet.insert(2); // 2 was already in the set, so return false.
randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.
```

**`Code:`**
```javascript
var RandomizedSet = function () {
  this.array = [];
  this.map = new Map();
};

/** 
 * @param {number} val
 * @return {boolean}
 */
RandomizedSet.prototype.insert = function (val) {
  if (this.map.has(val)) return false;
  this.array.push(val);
  this.map.set(val, this.array.length - 1);
  return true;
};

/** 
 * @param {number} val
 * @return {boolean}
 */
RandomizedSet.prototype.remove = function (val) {
  if (!this.map.has(val)) return false;
  const index = this.map.get(val);
  const end = this.array.pop();
  if (end === val) {
    this.map.delete(val);
    return true;
  }
  this.map.set(end, index);
  this.array[index] = end;
  this.map.delete(val);
  return true;
};

/**
 * @return {number}
 */
RandomizedSet.prototype.getRandom = function () {
  const r = ~~(Math.random() * this.array.length);
  return this.array[r];
};

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * var obj = new RandomizedSet()
 * var param_1 = obj.insert(val)
 * var param_2 = obj.remove(val)
 * var param_3 = obj.getRandom()
 */
```