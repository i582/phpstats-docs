---
layout: default
title: Configuration
nav_order: 3
---

# Configuration

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