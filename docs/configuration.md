---
layout: default
title: Configuration
nav_order: 3
---

# Configuration
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
After installing **PhpStats**, you need to create a configuration file for the analyzed project. 

**Note: This part of the setup needs to be done for each project that you want to analyze!**

The first step is to go to the root folder of the project you want to analyze.

Then, in the terminal, write the following command:

```
$ ~/go/bin/phpstats init
```

Answer the wizard's questions. Please note that when you enter the path to the source code, the correctness of the path is checked, so adding a path that does not exist will not allowed.

After that, a configuration file will appear in the project folder.

This completes the **PhpStats** configuration for currently analyzed projects.

## Configuration file structure

PhpStats uses the [yaml](https://cloudslang-docs.readthedocs.io/en/v1.0/yaml_overview.html) markup language for the configuration file.

By default, when PhpStats starts, the config file is searched for in the current working folder with the name `phpstats.yml`, if you want to use the file from another location, then use the `--config-path` flag at startup to set the path to the file.

For example:

```
$ ~/go/bin/phpstats collect --config-path path/to/config
```

### projectName

`type: string`

Name of the project. Shown in the output of the brief command.

### include
`type: string array`

Directories and files for analysis relative to the configuration files directory.

### exclude
`type: string array`

Directories and files excluded from analysis.

Please note that for correct work, you need to add a slash at the end
so that only the necessary folders are excluded, and not all that have the same value in the path.

For example:
`"src/utils"` can exclude both the desired `"src/utils"` folder and the `"src/utilsForMe"` folder for example.

By default, it is empty

### port
`type: number`

The port on which the server will be launched
to interact with the analyzer from other programs.

By default, it is `8080`

### cacheDir
`type: string`

The path where the cache will be stored.
Caching can significantly speed up data collection.

By default, it is set to the value of the `$TMP/phpstats`.

### disableCache
`type: bool`

Disables caching.

By default, it is `false`

### projectPath
`type: string`

Path to the project relative to which all imports are allowed.

By default, it is equal to the analyzed directory.

### extensions
`type: string array`

File extensions to be included in the analysis.

By default, it is `[php, inc, php5, phtml]`.
