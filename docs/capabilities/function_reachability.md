---
layout: default
title: Function reachability
nav_order: 4
parent: Capabilities
---

# Function reachability
{: .no_toc }

**PhpStats** allows you to flexibly get information about the reachability of a function from another function.

Use the `relation func-reachability` command to get reachability information. The command displays whether the function is reachable and, if the `--show` flag is provided, displays all reachability paths.

The command accepts the following flags:

1. `--parent` — the name of the function **from which** the reachability will be checked;
2. `--child` — the name of the function **for which** reachability will be checked;
3. `--depth` — max search depth. Reachability will only be found if the function is called through no more than depth functions. Greater depth for large projects can lead to long run times;
4. `--exclude` — a comma-separated list of functions without spaces to be excluded from found paths. Thus, if the path contains a function from this list, then this path will not be displayed;
5. `--show` — show reachability paths;
6. `-c` — number of paths for output (by default: 10);
7. `-o` — offset of the first path for output (default: 0);
8. `--json` — path to the file for outputting information in the `json` format.

For example:

```
relation func-reachability --parent \someOtherFunc --child \someFunc --show --depth 10
```

Gives the following output:

```
>>> relation func-reachability --parent \someOtherFunc --child \someFunc --show --depth 10
Is function \someFunc reachable from function \someOtherFunc: true  (1 paths)
Showing 1 paths out of 1 starting from 1:

    [(3 calls)
    \someOtherFunc
     -> \SomeClass::Method
        -> \SomeClass::OtherMethod
           -> \someFunc]

```

And the command:

```
>>> relation func-reachability --parent \someOtherFunc --child \someFunc --show --depth 10 --json reachability.json
```

Will output information to the file `reachability.json`:

```json
{
	"parentFunctions": "\\someOtherFunc",
	"childFunctions": "\\someFunc",
	"excluded": null,
	"count": 1,
	"offset": 0,
	"paths": [
		[
			"\\someOtherFunc",
			"\\SomeClass::Method",
			"\\SomeClass::OtherMethod",
			"\\someFunc"
		]
	]
}
```

By default, all paths are sorted in ascending order of the number of calls. Due to the possible large number of paths, by default only the first 10 reachability paths are displayed.

For function reachability it is also possible to build a graph, see [here](/phpstats-docs/docs/capabilities/graphs/#function-reachability) for details.