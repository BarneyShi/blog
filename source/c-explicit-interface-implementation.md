---
title: C# - Explicit interface implementation
date: 2022-06-20 00:36:28
tags:
- c#
- oop
---
- Note:
  - To handle case where two interfaces have the same method names.
  - Explicit implementation of an interface cannot have `access modifiers`.

For example:
```csharp
interface I1
{
  void InterfaceMethod();
}

interface I2
{
  void InterfaceMethod();
}

public class Program: I1, I2
{
  void I1.InterfaceMethod()
  {
    //...
  }
    void I2.InterfaceMethod()
  {
    //...
  }
  public static void Main()
  {
    Program p = new Program();
    // Explicitly cast
    ((I1) p).InterfaceMethod();
    ((I2) p).InterfaceMethod();
  }
}
```

- Explaination:
  - To ensure that when a member is explicitly implemented, it cannot be accessed through a `class instance`, but only through an `instance of the interface`.


