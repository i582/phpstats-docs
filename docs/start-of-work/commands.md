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

The `info` command is used to get information about classes, files, functions and namespaces.

The command accepts the following subcommands:

1. `class` or `interface` — information about the class or interface;
2. `func` or `method` — information about a function or method;
3. `namespace` — information about the namespace;
4. `file` — information about the file.

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

The `list` command is used to list classes, files, functions, and namespaces.

The command accepts the following subcommands:

1. `class` — list of classes;
2. `interface` or `ifaces` — list of interfaces;
3. `func` — list of functions;
4. `method` — list of methods;
5. `namespace` — list of namespaces;
6. `file` — list of files.

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
 #                      Name                      Aff     Eff    Instab   LCOM    LCOM 4   Class   Classes
                                                  coup   coup                              deps    depends
--- -------------------------------------------- ------ ------- -------- ------- -------- ------- ---------
 3   \Symfony\Component\DependencyInjection\      0.00   54.00     1.00   undef       55      54         0
     Tests\Compiler\AutowirePassTest
 4   \Symfony\Bundle\FrameworkBundle\             5.00   53.00     0.91   undef        2      53         5
     FrameworkBundle
 5   \Symfony\Component\Console\Tests\            0.00   48.00     1.00    0.95       79      48         0
     ApplicationTest
 6   \Symfony\Bundle\FrameworkBundle\Tests\       3.00   46.00     0.94    0.99        1      46         3
     DependencyInjection\FrameworkExtensionTest
 7   \Symfony\Component\Messenger\Tests\          0.00   44.00     1.00   undef        1      44         0
     DependencyInjection\MessengerPassTest
```

And the command:

```
>>> list classes -c 5 -o 2 --json classes.json
```

Will output information to the file `classes.json`:

```
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
		"countDepsBy": 0
	},
	...
]
```

## graph

The `graph` command is used to create dependency graphs for classes, files, functions, and namespaces.

See [Building graphs](/phpstats/docs/capabilities/graphs/) for details.

## relation

The `relation` command is used to collect statistics on relationships between classes and functions.

See [Relationships between symbols](/phpstats/docs/capabilities/relations/) for details.

## brief

The `brief` command is used to view brief information about the project.

See [Brief information](/phpstats/docs/capabilities/brief-information/) for details.

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

PHPStats (c) 2020
```

## about

The `about` command is used to show general information about PhpStats.

# Additional commands

Also, in addition to the commands above, there are commands for interacting with the interactive shell.

1. `help` — shows a page with all valid commands;
2. `clear` — clears the console;
3. `exit` — exits the interactive shell.
