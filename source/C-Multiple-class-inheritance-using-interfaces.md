---
title: C# - Multiple class inheritance using interfaces
date: 2022-06-20 01:14:01
tags:
- c#
- oop
---
We have two interfaces `IA, IB`, and two classes implementing them.
If we want to have another class implement both `IA, IB`. Instead of writing repetitive code, we can simply reuse `A, B`. 
```csharp
interface IA
{
  void AMethod();
}
class A: IA
{
  public void AMethod()
  {
    //...
  }
}

interface IB
{
  void BMethod();
}
class B: IB
{
  public void BMethod()
  {
    //...
  }
}
```
It'd be like:
```csharp
class AB: IA, IB
{
  A a = new A();
  B b = new B();
  public void AMethod()
  {
    a.AMethod();
  }
  public void BMethod()
  {
    b.BMethod();
  }
}
```