---
layout: default
title: Start of work
nav_order: 4
has_children: true
permalink: docs/start-of-works
---

# Start of work

After the configuration file has been created in the folder with the analyzed project, it's time to start.

The `collect` subcommand is used to start the analysis. Write the following in the terminal to start:

```
$ ~/go/bin/phpstats collect
```

If everything is configured correctly, then the analysis of the project will begin and, after it is over, you will receive the following:

```
Started
Indexing [./tests]
Linting
11 / 11 [------------------------------------------------------------------------] 100.00% ? p/s
Entering interactive mode (type "help" for commands)
>>>
```

After completing the analysis, you will be taken to an **interactive shell**. This interactive shell is used for **all interactions with data**, *getting lists, building graphs* and more. In order to **get help** on the available commands in the program, enter `help`.

In the next section, we'll take a look at each command separately.