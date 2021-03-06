---
layout: default
title: Relations
nav_order: 3
parent: Capabilities
---

# Relationships between symbols
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**PhpStats** allows you to see relationship between classes and methods. For example, how are the two classes related, whether they use each other's methods and which ones.

To get a relation, use the `relation all` command.

The command accepts the following flags:

1. `--classes` — a comma-separated list of classes without spaces for which you want to find a relationship with other classes or functions;
2. `--funcs` — a comma-separated list of functions without spaces for which you want to find a relationship with other classes or functions.

For example:

```
>>> relation all --classes='Foo,Boo' --funcs='Foo::method,someFunc'
```

Will output all relationships, between classes, functions and between each class and function. This extended syntax is used to **easily specify a large number of symbols**, however, if you only need to find relationships between two classes, then it is enough to write the following:

```
>>> relation all --classes='Foo,Boo'
```

And for two functions:

```
>>> relation all --funcs='Foo::method,someFunc'
```

And for function and class:

```
>>> relation all --classes='Foo' --funcs='someFunc'
```

## Collected relationships

### For **class-class** relations:

- Whether one class is **extends** another and vice versa;
- Whether the class **implements** the interface or vice versa;
- What methods, fields and constants are **used by one class used by another** and in which methods this happens.

For example:

```
>>> relation all --classes 'TargetClass,RelatedClass'
Class \TargetClass connection with class \RelatedClass.

    Class \TargetClass extends class \RelatedClass:         true
    Class \TargetClass implements interface \RelatedClass:  false
    Class \TargetClass uses
         method   \RelatedClass::relatedMethod
            in method \TargetClass::targetMethod.
         field    \RelatedClass::field
            in method \TargetClass::targetMethod.
         constant \RelatedClass::CONSTANT
            in method \TargetClass::targetMethod.

    Class \RelatedClass extends class \TargetClass:         false
    Class \RelatedClass implements interface \TargetClass:  false
    Class \RelatedClass uses
         method   \TargetClass::targetMethod
            in method \RelatedClass::relatedMethod.
         field    \TargetClass::some
            in method \RelatedClass::relatedMethod.
```

### For **class-function** relations:

- Function **belong** to class;
- The class is **used inside** the function;
- **Used class** members in functions;
- The function is **used in the class** (*+ all methods where this function is used*).
For example:

```
>>> relation all --classes 'TargetClassA' --funcs 'TargetClassB::targetMethod'
Class \TargetClassA connection with function \TargetClassB::targetMethod.

    Class \TargetClassA contains function \TargetClassB::targetMethod:   false
    Method \TargetClassB::targetMethod uses class \TargetClassA:         true
       Uses:
        method   \TargetClassA::targetMethod1
        field    \TargetClassA::field
        constant \TargetClassA::CONSTANT

    Class \TargetClassA uses function \TargetClassB::targetMethod:       true
    Uses in the following methods:
        \TargetClassA::targetMethod2
        \TargetClassA::targetMethod1
```

### For **function-function** relations:

- Functions **belong to the same class**;
- Does the **first function use the second** and vice versa;
- Whether the **first function is reachable from the second through calls** and vice versa (see [Function reachability](/phpstats-docs/docs/capabilities/function_reachability/) for details.).

For example:

```
>>> relation all --funcs someOtherFunc,someFunc
Function \someOtherFunc connection with function \someFunc.

    Functions belong to the same class:                             false
    Function \someFunc is used in function \someOtherFunc:          false
    Function \someOtherFunc is used in function \someFunc:          false
    Is function \someFunc reachable from function \someOtherFunc:   true
       To get the graph, enter command
        graph func-reachability --web --parent \someOtherFunc --child \someFunc --depth 10
       To get text output of paths, enter the command
        relation func-reachability --parent \someOtherFunc --child \someFunc --show --depth 10

    Is function \someOtherFunc reachable from function \someFunc:   false
```