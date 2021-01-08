# QoppaS

An implementation of [Qoppa Scheme](http://mainisusuallyafunction.blogspot.de/2012/04/scheme-without-special-forms.html) in [Squeak](http://squeak.org/) using [Ohm-S](https://github.com/hpi-swa/Ohm-S).

# Usage

```smalltalk
"open a read eval print window"
QoppaRepl open
```

# Installation

```smalltalk
Metacello new
  baseline: 'QoppaS';
  repository: 'github://hpi-swa-lab/QoppaS/packages';
  load.
```

# Notes
This project was originally developed as part of a [project to enable multi-level debugging](https://github.com/abstraktor/multileveldebugging-QoppaS).
