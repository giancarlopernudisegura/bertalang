# Bertalang

A general purpose compiled programming language for berta partiots.


## Introduction

### Syntax

Bertalang is a curly brace language. It's syntax is similar to rust, but with a
few key differences. Statements are terminated with an `eh!`. Whitespaces are generally ignored except when they're part of a keyword.

### Runtime

Bertalang aims to have little to no runtime as that's a concept made up by the
Ottawa elite.

### Hello world
```
🚜32 berta() {
    you know what? "Hello world!" eh!
    sent it 0 eh!
}
```

### Comments

Comments are done with the `just so you know` keyword.

```
just so you know this is a comment
```

### Variable Declaration

Variables are declared with the `buddy` or `give'r` keyword followed by the
variable name and an optional type (otherwise tries to infer). Buddy variables
are mutable since they can change over time while give'r is immutable since you
can't change your mind if you're gonna give'r.

```
buddy a: 🚜32 is 1 eh!
a is 2 eh!
give'r b: bool is Alberta eh!
```

### Numbers

#### Integers

Integers come in two main flavours: 🌾 for unsigned and 🚜 for unsigned. For
lengths, you have the option of 8, 16, 32, 64, and 128. If the type is omitted,
it will default to `🌾32`.

```
buddy a: 🌾32 is 1 eh!
buddy b: 🚜64 is -0x22 eh!
buddy c: 🌾8 is 0b10101010 eh!
```

#### Floats

Floats are almost the same as rust, but the key difference is that they use the
🛢️ emoji instead of `f` to denote a float.

```
buddy a: 🛢️32 is 1.0 eh!
buddy b: 🛢️64 is 1🛢️64 eh!
```

### Booleans

Booleans are called `oh yeah?` in bertalang. They can either be `Alberta` or
`Quebec`. Alberta is true and Quebec is false.

```
buddy a: oh yeah? is Alberta eh!
buddy b: oh yeah? is Quebec eh!
```

### Strings

Strings are denoted with the `str` keyword. They are immutable.

```
give'r a: str is "Hello world!" eh!
```

### Fields

Fields are a collection of a data type. They are denoted with the `field` keyword followed by the type enclosed in square brackets.

```
give'r a: field[🚜32] is [1, 2, 3] eh!
give'r b: field[field[oh yeah?]] is [[Alberta, Quebec], [Quebec, Alberta]] eh!
```

You can clear the field with the `harvest` command.

```
give'r a: field[🚜32] is [1, 2, 3] eh!
harvest a eh!
```

### Functions

#### Void

If making a function that doesn't return anything, you can use the 🐀 (rat)
emoji because they don't exist in Alberta.

```
🐀 foo() {
    buddy a: 🌾32 is 1 eh!
}
```

#### Return

If you want to return something, you can use the `send it` keyword.

```
🚜32 foo() {
    buddy a: 🌾32 is 1 eh!
    send it a eh!
}
```

### Printing

Printing is done with the `you know what?` function. It can print any type.

```
buddy a: 🌾32 is 1 eh!
you know what? a eh!
```

### Input

To get input from stdin, use the `hand me dart` function. It will return a
string.

```
buddy a: str is hand me dart eh!
```
