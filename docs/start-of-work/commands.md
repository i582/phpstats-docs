---
layout: default
title: Commands
nav_order: 4
parent: Start of work
---

# Commands in the interactive shell
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## info

The `info` command is used to get information about specific symbol.

The command accepts the following subcommands:

1. `class` — information about the specific class;
2. `interface` — information about the specific interface;
3. `trait` — information about the specific trait;
4. `func` or `method` — information about a specific function or method;
5. `namespace` — information about the specific namespace;
6. `file` — information about the specific file.

For each subcommand, you need to pass the required name, be it a class or a function or something else.
Please note that the search is **not strict**, so it is not necessary to enter the full name, however, if several options are suitable for the entered name, then you will receive the first of them, to get the desired one you need to specify the name.

### Example
{: .no_toc }

```
>>> info class Foo
```

Will show information about the `Foo` class:

```
>>> info class Foo
Show info about Foo class

Class \Foo
  File:                          /path/to/file/with/foo/foo.php
  Afferent coupling:             0.00
  Efferent coupling:             3.00
  Instability:                   1.00
  Lack of Cohesion in Methods:   -1.00
  Lack of Cohesion in Methods 4: 1
  Count class dependencies:      3
  Count dependent classes:       0
```

## list

The `list` command is used to list symbols.

The command accepts the following subcommands:

1. `classes` — list of classes;
2. `interfaces` or `ifaces` — list of interfaces;
3. `traits` — list of traits;
4. `funcs` — list of functions;
5. `methods` — list of methods;
6. `namespaces` — list of namespaces;
7. `files` — list of files.

For each subcommand, you need to pass the required name, be it a class or a function or something else.
Please note that the search is **not strict**, so it is not necessary to enter the full name, however, if several options are suitable for the entered name, then you will receive the first of them, to get the desired one you need to specify the name.

Also, each of the subcommands accepts the following flags:

1. `-c` — number of classes in the list;
2. `-o` — shift of the list from the beginning;
3. `--json` — path to the file for outputting information in the `json` format.
4. `--sort` — column number by which sorting will be performed;
5. `-r` — sort in reverse order.

The `func` subcommand also accepts the following flag:

1. `-e` — flag, when built-in functions will be displayed in the list.

The `namespace` subcommand also accepts the following flag:

1. `-l` — the level of namespaces to be displayed (default: 0 (top-level namespaces)).

### Example
{: .no_toc }

```
>>> list classes -c 5 -o 2
```

Shows a list of classes of 5 elements starting with the 3rd:

```
>>> list classes -c 5 -o 2
Showing 5 classes out of 4862 starting from 3

 #                    Name                      Aff      Eff    Instab   LCOM   LCOM 4   Class   Classes    Count fully  
                                                coup    coup                             deps    depends   typed methods 
--- ----------------------------------------- -------- ------- -------- ------ -------- ------- --------- ---------------
 3   \Symfony\Component\HttpFoundation\        233.00   12.00     0.05   0.82        2      12       233           6(84) 
     Request                                                                                                             
 4   \Symfony\Component\HttpFoundation\        163.00    5.00     0.03   0.36        2       5       163          47(60) 
     Response                                                                                                            
 5   \Symfony\Component\DependencyInjection\   158.00    0.00     0.00   0.33        1       0       158            0(3) 
     Reference                                                                                                           
 6   \Symfony\Component\Console\Command\       118.00    9.00     0.07   0.93        3       9       118           0(37) 
     Command                                                                                                             
 7   \Symfony\Component\HttpFoundation\        115.00    1.00     0.01   0.29        1       1       115           0(17) 
     ParameterBag                                                       
```

And the command:

```
>>> list classes -c 5 -o 2 --json classes.json
```

Will output information to the file `classes.json`:

```json
[
	{
		"name": "\\Symfony\\Component\\DependencyInjection\\Tests\\Compiler\\AutowirePassTest",
		"file": "/path/to/class",
		"type": "Class",
		"aff": 0,
		"eff": 54,
		"instab": 1,
		"lcom": -1,
		"lcom4": 55,
		"countDeps": 54,
		"countDepsBy": 0,
		"countFullyTypedMethods": 6
	},
	...
]
```

## graph

The `graph` command is used to create dependency graphs for classes, files, functions, and namespaces.

See [Building graphs](/phpstats-docs/docs/capabilities/graphs/) for details.

## relation

The `relation` command is used to collect statistics on relationships between classes and functions.

See [Relationships between symbols](/phpstats-docs/docs/capabilities/relations/) and  [Function reachability](/phpstats-docs/docs/capabilities/function_reachability/) for details.

## brief

The `brief` command is used to view brief information about the project.

See [Brief information](/phpstats-docs/docs/capabilities/brief-information/) for details.

## metrics

The `metrics` command is used to view brief information about the metrics being collected.

### Example
{: .no_toc }

```
>>> metrics
```

Will display information about the collected metrics:

```
>>> metrics
A brief description of the metrics.

Afferent couplings (Ca):
        The number of classes in other packages that depend upon classes within
        the package is an indicator of the package's responsibility.

Efferent couplings (Ce):
        The number of classes in other packages that the classes in a package
        depend upon is an indicator of the package's dependence on externalities.

Instability (I):
        The ratio of efferent coupling (Ce) to total coupling (Ce + Ca) such that
        I = Ce / (Ce + Ca).
        This metric is an indicator of the package's resilience to change.
        The range for this metric is 0 to 1, with I=0 indicating a completely stable
        package and I=1 indicating a completely unstable package.

Abstractness (A):
        The ratio of the number of abstract classes in a group to the total number of classes.
        A = nA / nAll.
        nA   - the number of abstract classes in a group.
        nAll - the total number of classes.

        0 = the category is completely concrete.
        1 = the category is completely abstract.

Lack of Cohesion in Methods (LCOM):
        The result of subtracting from one the sum of the number of methods (CM_i)
        that refer to a certain class field (i) for all fields, divided by the number
        of methods (CM) multiplied by the number of fields (CF).

        LCOM = 1 - (\Sum{i eq [0, CF]}{CM_i}) / (CM * CF))

Lack of Cohesion in Methods 4 (LCOM4):
        The number of "connected components" in a class.
        A connected component is a set of related methods (and class-level variables).
        There should be only one such a component in each class.
        If there are 2 or more components, the class should be split into so many smaller classes.

        Which methods are related? Methods a and b are related if:

          - they both access the same class-level variable, or
          - a calls b, or b calls a.

        After determining the related methods, we draw a graph linking the related methods
        (use the 'graph lcom4' command to build the graph) to each other.
        LCOM4 equals the number of connected groups of methods.

          - LCOM4=1  indicates a cohesive class, which is the "good" class.
          - LCOM4>=2 indicates a problem. The class should be split into so many smaller classes.
          - LCOM4=0  happens when there are no methods in a class. This is also a "bad" class.

        Information from https://www.aivosto.com/project/help/pm-oo-cohesion.html#LCOM4

Cyclomatic complexity (CC):
        The number of decision points.
        Cyclomatic complexity is basically a metric to figure out areas of code that needs
        more attention for the maintainability. It would be basically an input to the refactoring.
        It definitely gives an indication of code improvement area in terms of avoiding deep
        nested loop, conditions etc.

        The decision points is conditional statements like if, for, while, foreach, case, default,
        continue, break, goto, catch, ternary. coalesce, or, and.

Count of magic numbers (CMN):
        Magic numbers are any number in code that isn't immediately obvious to someone
        with very little knowledge.

        Code with magic numbers is more difficult to understand and refactor, as it is not
        always obvious what the author meant by it. The more magic numbers, the more difficult
        it is to refactor the given code.

Count fully typed methods (CFTM):
	The number of methods in the class for which there is a type hint for each parameter, 
	as well as the return type.

PHPStats (c) 2020
```

## about

The `about` command is used to show general information about PhpStats.

# Additional commands

Also, in addition to the commands above, there are commands for interacting with the interactive shell.

1. `help` — shows a page with all valid commands;
2. `clear` — clears the console;
3. `exit` — exits the interactive shell.
