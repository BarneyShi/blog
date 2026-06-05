---
title: Javascript - Pass by value or reference?
date: 2021-09-28 03:30:27
tags:
- javascript
---

**`Check this code`**
```javascript
function changeStuff(a, b, c)
{
  a = a * 10;
  b.item = "changed";
  c = {item: "changed"};
}

var num = 10;
var obj1 = {item: "unchanged"};
var obj2 = {item: "unchanged"};

changeStuff(num, obj1, obj2);

console.log(num);
console.log(obj1.item);
console.log(obj2.item);
```
```
10
changed
unchanged
```

**`Explain`**

It's `always` pass by value, but for objects the value of the variable is a reference. Because of this, when you pass an object and change its members, those changes persist outside of the function. This makes it look like pass by reference. But if you actually change the value of the object variable you will see that the change does not persist, proving it's really pass by value.

**`Another example`**
```javascript
function changeObject(x) {
  x = { member: "bar" };
  console.log("in changeObject: " + x.member);
}

function changeMember(x) {
  x.member = "bar";
  console.log("in changeMember: " + x.member);
}

var x = { member: "foo" };

console.log("before changeObject: " + x.member);
changeObject(x);
console.log("after changeObject: " + x.member); /* change did not persist */

console.log("before changeMember: " + x.member);
changeMember(x);
console.log("after changeMember: " + x.member); /* change persists */
```

**Exaplain**:

`Array/Object` is `passed by value`, but its elements are `passed by reference`. So when we want to `reassign` values to the `object`, it won't persist. So, `array.push(x)` or `array.pop()` will work. But `array = newArr` will not change the value of object in its `parent scope`. Because when we do `chagneObject(x)`, here `x` is passed by value. Another attempts trying to change `x = newArr` is in vain.