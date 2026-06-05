---
title: Leetcode 478 - Generate Random Point in a Circle
date: 2022-01-03 00:01:51
tags:
- math
---
**`Note:`**
- Why would `radius * random()` gave wrong answers?
- Because the relation between $\frac{randRadius^2}{radius^2}$ is not linear. We get `randRadius` from `random * radius`, and then they become squared relations.
- I don't want to involve too much math so choose another way to solve this.
- ![img](https://i.imgur.com/RIliCUe.png)
- From origin `[x - radius, y - radius]`, use `random * 2 * radius` to get randomized points.
- If they are in the circle not outside, we return them.

**`Question:`**

Given the radius and the position of the center of a circle, implement the function `randPoint` which generates a uniform random point inside the circle.

Implement the `Solution` class:

- `Solution(double radius, double x_center, double y_center)` initializes the object with the radius of the circle `radius` and the position of the center `(x_center, y_center)`.
- `randPoint()` returns a random point inside the circle. A point on the circumference of the circle is considered to be in the circle. The answer is returned as an array `[x, y]`.

**`Example:`**
```
Input
["Solution", "randPoint", "randPoint", "randPoint"]
[[1.0, 0.0, 0.0], [], [], []]
Output
[null, [-0.02493, -0.38077], [0.82314, 0.38945], [0.36572, 0.17248]]

Explanation
Solution solution = new Solution(1.0, 0.0, 0.0);
solution.randPoint(); // return [-0.02493, -0.38077]
solution.randPoint(); // return [0.82314, 0.38945]
solution.randPoint(); // return [0.36572, 0.17248]
```

**`Code:`**
```javascript
/**
 * @param {number} radius
 * @param {number} x_center
 * @param {number} y_center
 */
var Solution = function(radius, x_center, y_center) {
  this.radius = radius;
  this.x = x_center;
  this.y = y_center;  
};

/**
 * @return {number[]}
 */
Solution.prototype.randPoint = function() {
  const x = this.x;
  const y = this.y;
  const radius = this.radius;
  while (true) {
    const x1 = x - radius + Math.random() * 2 * radius;
    const y1 = y - radius + Math.random() * 2 * radius;
    if (Math.pow(x1 - x, 2) + Math.pow(y1 - y, 2) <= Math.pow(radius, 2)) {
      return [x1, y1];
    }
  }
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(radius, x_center, y_center)
 * var param_1 = obj.randPoint()
 */
```