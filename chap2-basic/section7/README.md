# chap2_7 - 模板代码的组织结构与模板的显式实例化和声明

## 1 - 模板代码的组织结构

普通类：类定义 和 类实现要分别放在 .h 头文件 和 .cpp 源文件中

如果是类模板，成员函数的定义与实现放在了不同的文件中，将会出现链接错误

编译项目时，编译器会针对每个`.cpp`源文件作为一个编译单元来编译。

如果多个`.cpp`源文件都实例化出来了`MyClass<int>`类，那么链接时，编译器会选择其中一个`MyClass<int>`，
其他的丢弃掉，这叫做 贪婪实例化

## 2 - 模板的显式实例化，模板声明，代码组织结构

通过显式实例化，来避免生成多个类模板实例的开销

```cxx
#include "ca.hxx"

/* 类模板的实例化定义，一般只有一个.cpp文件里这么写，编译器为其生成代码。在其他的 .cpp文件中，可以extern template class A<float> */
template class A<float>;

/* 函数模板实例化定义 */
template void myfunc(int& v1, int& v2);
```

如果使用 msvc，不推荐使用 类模板实例化定义。

因此类模板实例化定义，这个会将普通成员函数都一次性实例化出来，这并不会节省编译时间。
