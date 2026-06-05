---
title: C# - Delegates
date: 2022-06-20 23:17:12
tags:
  - oop
  - c#
---

- Scenario: A delegate is like a `placeholder` for some methods. Pass the method you want to execute to the delegate, and it will be executed every time.

- Example:

```csharp
public delegate void MyDelegate(string msg); // declare a delegate

// set target method
MyDelegate del = new MyDelegate(MethodA);
// or
MyDelegate del = MethodA;
// or set lambda expression
MyDelegate del = (string msg) =>  Console.WriteLine(msg);

// target method
static void MethodA(string message)
{
    Console.WriteLine(message);
}

// To invoke. "Hello World" is being passed as a param to MethodA.
del("Hello World!");
```

- Multiple delegates example
- Scenario: Use one delegate to point to multiple functions.
- Note: 
  - Methods to be invoked in the order of invocation.
  - If the delegate returns some value, it'd be decided by the last invoked function.
```csharp
public class Sample
  {
    static void Main()
    {
        SampleDelegate del1 = new SampleDelegate(SampleMethodOne);
        SampleDelegate del2 = new SampleDelegate(SampleMethodTwo);
        SampleDelegate del3 = new SampleDelegate(SampleMethodThree);
        // In this example del4 is a multicast delegate. You use +(plus)
        // operator to chain delegates together and -(minus) operator to remove.
        SampleDelegate del4 = del1 + del2 + del3 - del2;

        del4();
    }

    public static void SampleMethodOne()
    {
        Console.WriteLine("SampleMethodOne Invoked");
    }

    public static void SampleMethodTwo()
    {
        Console.WriteLine("SampleMethodTwo Invoked");
    }

    public static void SampleMethodThree()
    {
        Console.WriteLine("SampleMethodThree Invoked");
    }
  }
```
