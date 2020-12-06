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
Please note that the search is **not strict**, so it is not necessary to enter the full name, however, if several symbols are suitable for the entered name, then you will receive the first of them, to get the desired one you need to specify the name.

### Example
{: .no_toc }

```
>>> info class Foo
```

Will show information about the `Foo` class:

```
>>> info class Foo
Show information about \Foo class

   Afferent coupling:             1.00
   Efferent coupling:             1.00
   Instability:                   0.50
   Lack of Cohesion in Methods:   -1.00
   Lack of Cohesion in Methods 4: 1
   Count class dependencies:      1
   Count dependent classes:       1
   Count fully typed methods:     0(1)
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
Please note that the search is **not strict**, so it is not necessary to enter the full name, however, if several symbols  are suitable for the entered name, then you will receive the first of them, to get the desired one you need to specify the name.

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

 #                    Name                     Aff    Eff    Instab   LCOM   LCOM   Class   Classes    Fully
                                               coup   coup   ility            4     deps    depends    typed
                                                                                                      methods
--- ----------------------------------------- ------ ------ -------- ------ ------ ------- --------- ---------
 3   \Symfony\Component\HttpFoundation\         233     12     0.05   0.82      2      12       233     6(84)
     Request
 4   \Symfony\Component\HttpFoundation\         163      5     0.03   0.36      2       5       163    47(60)
     Response
 5   \Symfony\Component\DependencyInjection\    158      0     0.00   0.33      1       0       158      0(3)
     Reference
 6   \Symfony\Component\Console\Command\        118      9     0.07   0.93      3       9       118     0(37)
     Command
 7   \Symfony\Component\HttpFoundation\         115      1     0.01   0.29      1       1       115     0(17)
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

See [Metrics](/phpstats-docs/docs/capabilities/metrics/) for details.

## about

The `about` command is used to show general information about PhpStats.

# Additional commands

Also, in addition to the commands above, there are commands for interacting with the interactive shell.

1. `help` — shows a page with all valid commands;
2. `clear` — clears the console;
3. `exit` — exits the interactive shell.
