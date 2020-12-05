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
8. Count of magic numbers in functions and methods.

