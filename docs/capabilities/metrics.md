---
layout: default
title: Metrics
nav_order: 1
parent: Capabilities
---
# Metrics
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**PhpStats** collects various quality metrics of the code, which can be used to determine the quality of the project as a whole, or, for example, of the class in particular.

There is no separate command for getting metrics, since metrics are displayed in the information about the symbol. So, for example, to get the LCOM4 metric for a certain class, you need to use the `info class` command for which write the name of the required class. The received class information will contain a field describing the LCOM4 metric. See the detailed description of the `info` command [here](/phpstats-docs/docs/start-of-work/commands#info).

Another option to get the value of the metrics is the `list` command, which will list classes, functions, etc. with all calculated metrics. See the detailed description of the `list` command [here](/phpstats-docs/docs/start-of-work/commands#list).

## Available metrics

PhpStats currently calculates the following metrics:

1. Afferent couplings:
2. Efferent couplings:
3. Instability:
4. Abstractness;
5. Lack of Cohesion in Methods;
6. Lack of Cohesion in Methods 4 (or the number of connected components of the class.);
7. Cyclomatic Complexity;
8. Count of magic numbers in functions and methods;
9. Count fully typed methods.

### Afferent couplings (Ca)

The number of classes in other packages that depend upon classes within the package is an indicator of the package's responsibility.

### Efferent couplings (Ce)

The number of classes in other packages that the classes in a package depend upon is an indicator of the package's dependence on externalities.

### Instability (I)

The ratio of efferent coupling (Ce) to total coupling (Ce + Ca).
```
I = Ce / (Ce + Ca)
```
This metric is an indicator of the package's resilience to change. The range for this metric is 0 to 1, with I=0 indicating a completely stable package and I=1 indicating a completely unstable package.

### Abstractness (A)

The ratio of the number of abstract classes in a group to the total number of classes.
```
A = nA / nAll.
```
- nA   — the number of abstract classes in a group;
- nAll — the total number of classes.

The range for this metric is 0 to 1:

- 0 — the category is completely concrete;
- 1 — the category is completely abstract.

### Lack of Cohesion in Methods (LCOM)

The result of subtracting from one the sum of the number of methods (CM_i) that refer to a certain class field (i) for all fields, divided by the number of methods (CM) multiplied by the number of fields (CF).

### Lack of Cohesion in Methods 4 (LCOM4)

The number of "connected components" in a class. 
A connected component is a set of related methods (and class-level variables). There should be only one such a component in each class. If there are 2 or more components, the class should be split into so many smaller classes.

Which methods are related? Methods a and b are related if:

- they both access the same class-level variable, or
- a calls b, or b calls a.

After determining the related methods, we draw a graph linking the related methods (use the 'graph lcom4' command to build the graph) to each other. LCOM4 equals the number of connected groups of methods.

- LCOM4=1  indicates a cohesive class, which is the "good" class.
- LCOM4>=2 indicates a problem. The class should be split into so many smaller classes.
- LCOM4=0  happens when there are no methods in a class. This is also a "bad" class.

Information from https://www.aivosto.com/project/help/pm-oo-cohesion.html#LCOM4

### Cyclomatic complexity (CC)

The number of decision points.

Cyclomatic complexity is basically a metric to figure out areas of code that needs more attention for the maintainability. It would be basically an input to the refactoring. It definitely gives an indication of code improvement area in terms of avoiding deep nested loop, conditions etc.

The decision points is conditional statements like `if`, `for`, `while`, `foreach`, `case`, `default`, `continue`, `break`, `goto`, `catch`, `ternary`, `coalesce`, `or`, `and`.

### Count of magic numbers (CMN)

Magic numbers are any number in code that isn't immediately obvious to someone with very little knowledge.

Code with magic numbers is more difficult to understand and refactor, as it is not always obvious what the author meant by it. The more magic numbers, the more difficult it is to refactor the given code.

### Count fully typed methods (CFTM)

The number of methods in the class for which there is a type hint for each parameter, as well as the return type.
