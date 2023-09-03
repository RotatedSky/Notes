# Chapter1

强大的编程语言不仅仅是指导计算机执行任务的手段。语言还充当了一个框架，在这个框架内，我们可以组织关于过程的想法。因此，当我们描述一种语言时，我们应该特别注意语言提供的将简单的想法结合起来形成更复杂的想法的手段。每种强大的语言都有三种机制来实现这一点：
* __原始表达式__，表示语言所涉及的最简单实体的原始表达式
* __组合方式__，从更简单的实体构建复合元素
* __抽象方式__，将复合元素命名为单元并进行操作

## 1.1 The Elements of Programming

### 1.1.1 Expressions
前置表达式（prefix notion）

### 1.1.2 Naming and the Environment
define 定义的内容形成了一个环境

### 1.1.3 Evaluating Combinations
组合的演算有两个步骤：
1. 演算组合的子表达式【演算规则的递归性】
2. 最左边子表达式的值（操作符）作用于其他子表达式的值（操作数）

递归是一种处理层级结构（树形结构）的有效方法。

组合中的基础内容可以规定为：
* 数值类型的值就是字面值表示数值
* 内置操作符是执行相应操作的机器指令序列
* 其他名称的值是与环境中的这些名称关联的对象

### 1.1.4 Compound Procedures
Lisp 三元素：
* 数字和算术运算是原始数据和过程
* 组合的嵌套提供了一种组合操作的方法
* 将名称与值关联起来的定义提供了有限的抽象方法

```scheme
(define (<name> <formal parameters>) <body>)
```

组合过程被定义后，我们无法只通过名字分辨一个过程是否为组合过程。

### 1.1.5 The Substitution Model for Procedure Application
我们可以假设原始过程作用于参数的机制已经内置于解释器中。
对于组合过程的演算流程为：
1. 将组合过程作用于参数上
2. 将过程 body 的形参用对应的实参替换

代换模型可能会在 mutable-data 下失效。
演算顺序与二义性。
__normal-order evaluation__: 全展开后归约
__applicative-order evaluation__: 先参数演算后应用
对于可以使用替换建模并产生合法值的过程应用，正常顺序和适用顺序求值结果是相同的。

### 1.1.6 Conditional Expressions and Predicates
Predicates: 谓词

Lisp 条件分析：
```scheme
(cond (<p1> <e1>)
      (<p2> <e2>)
      ...
      (<pn> <en>))
```

```scheme
(cond (<p1> <e1>)
      (<p2> <e2>)
      ...
      (else <en>))
```

```scheme
(<p1> <e2>) ; clauses, 从句
; <p1> 是一个谓词（或者叫一个断言） 
```

```scheme
(if <predicate> <consequent> <alternative>)
```

复合谓词可以通过下面算符构建：
```scheme
(and <e1> ... <en>)
(or <e1> ... <en>)
(not <e>)
```
注意：
* 当前 Lisp 表达式中还没有赋值语句，= 是判断是否相等

解释器会按照从左到右的顺序对每个表达式进行演算。

### 1.1.7 Example: Square Roots by Newton's Method
square roots
```latex
y_{n+1} = \frac{y_{n}+x/y_{n}}{2}
```

### 1.1.8  Procedures as Black-Box Abstractions
* block structure (嵌套的定义)
We will use block structure extensively to help us break up large programs into tractable pieces.

* lexical scoping
Lexical scoping dictates that free variables in a procedure are taken to refer to bindings made by enclosing procedure definitions; that is, they are looked up in the environment in which the procedure was defined.

## 1.2 Procedures and the Processes They Generate
A procedure is a pattern for the local evolution of a computational process.
