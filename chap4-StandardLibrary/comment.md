# chap4

## 范围的 比较

在现代 C++（包括 C++11 及其之后的版本）中，表达式 `40 < j < 80` 并不会像你可能期望的那样进行范围检查。
这个表达式实际上是合法的，但它的行为可能不是你想要的。

C++ 中的比较操作符（`<`, `>`, `<=`, `>=`）是左结合的，这意味着 `40 < j < 80` 实际上会被解析为 `(40 < j) < 80`。首先，它会计算 `40 < j` 的结果，这会产生一个布尔值 `true` 或 `false`，分别对应于 `1` 或 `0` 的整数值。

然后，这个布尔值会与 `80` 进行比较。
所以，如果 `j` 大于 `40`，`(40 < j)` 会是 `true`（即 `1`），然后 `1 < 80` 也将是 `true`。
如果 `j` 小于或等于 `40`，`(40 < j)` 会是 `false`（即 `0`），然后 `0 < 80` 仍然是 `true`。
因此，无论 `j` 的值如何，只要它是一个有效的整数，`40 < j < 80` 总是返回 `true`，这显然不是正确的范围检查。

如果你想要检查 `j` 是否在 `40` 和 `80` 之间，你应该使用逻辑与操作符 `&&` 来组合两个独立的比较操作，如下所示：

```cpp
if (40 < j && j < 80) {
    // j 在 40 和 80 之间
}
```

这样的表达式才能正确地检查 `j` 是否大于 `40` 并且小于 `80`。
