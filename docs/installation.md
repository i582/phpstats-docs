---
layout: default
title: Installation
nav_order: 2
---

# Installation

{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## For Linux

TODO.

## For MacOS

TODO.

## For Windows

TODO.

## From source

The first step is to install the Go toolkit if you don't already have it. To do this, go to the official [site](https://golang.org/dl/) and download the required package for your system.

After installing the downloaded package, run the following command:

```
go get -u -v github.com/i582/phpstats
```

After that, to run **PhpStats**, just write the following in the terminal:

```
$ ~/go/bin/phpstats
```

If you want to build dependency graphs, then you must also install [Graphviz](https://graphviz.org/download/). After installation, make sure the path to `graphviz` is in the `Path` environment variable.

