## 01 What is Compiler

If you do code and the code turn out to be another file (.exe ELF,native executable i guess) when it runnin' show many things , that what compiler done. So if you wanna definiton, compilers is program that turn your programming code into thing that computer understand let call it binary program, thus the binary do everything that written in the source code. 

So compiler turning you code to be understandable by computer, but there not only compiler to get this job done. Compiler had a cousin lets call it, Interpreter. What makes it differ is interpreter does not produce binary like compiler does instead do the what inside you code directly, that is pretty big different between compiler and interpreter. there pretty much common between compiler and interpreter in messing with your code so do not insecure yet, maybe in way to evaluate AST or IR that we meet two road way.

The most important, compiler or interpreter should be able to preserve meaning, from idea those poured into code and running as it code semantic meaning. Damn, my language sound quite academic let parse it more friendly.

### What inside compiler?

There are sort of process dealing with string handling, such reading, split and yeah matching a pattern from a file to produce binary executable, let i draw it for ya:

```
+-----------+          +--------+           +---------+
|Source Code|  Lexing  |Bunch of|  Parsing  |Abstract |
|   File    +--------->|  Token +---------->|Syntax   |
+-----------+          +--------+           |Tree     |
                                            +--+------+
                                               |
              +------+          +---------+    |   Generating
              |Object|<---------+ IR Code |<---+   Intermediate
              |Code  |          +---------+        Represetnative
              +------+ Generating                  (IR)
                       Code
```

Ok, let me explain a bit:

#### Front-end 

- Source code file, is you code written in file like `.js`,`.ml` sort of.
- Lexing got many name (Tokenization,etc), but the job is to make string from file to bunch of formal token (ofc, defined by you that why i said formal token because it defined, e.g `1` -> `T_NUMBER 1`, `'E'` -> `T_WORD E`, `let` -> `LET`).
- Parsing, previously we said bunch of token, the token will be use to build Abstract Syntax Tree (AST) in this process.
  -  Anyways human had sort like AST that call grammar, `Gwen choke banana` so if we turn it to grammar will look like `Gwen(noun) choke(verb) banana(noun)` is a sentence. so does the programming language too.
- Generating IR, before we get the IR code make sure our code is semantically correct, like the code fullfil   had a meaning(ofc, you make the standard since this is you language). 
  - for example if there some string like this `Banana moaning at Gwen` this a sentence, but what the meaning behind it ? Can a banana moaning at person ? this ofc nonsense (except in specific occasion, but not in here) so this process catch this mistake.
  - The IR Code will be used for generating our binary, that code representative form from out AST generate at parsing process.

#### Backend

 Discalimer, after the front-end stage will go to here (backend stage), this part of compiler true shit, like optimitazion, desugarring and code generation. I pop this warn to inform there no uniform way what you doing i this stage, improvise is encourage. Because that i directly to code generation.

- Code generatior, turning IR to executable
  - For interpreter, in this process replace to execute IR to action in your computer.   

> WIP : Listen, I bit lazy and sleepy, maybe wanna sleep. if you dont mind to busy, please read those reference or what i already write on root repository [README.md](../README.md) that could be helpful, if not that fine. Running , lazy ,cry is fine but dont give up.