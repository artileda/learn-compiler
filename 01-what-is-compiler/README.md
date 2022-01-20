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

This stage goal is ensuring the code valid whether it syntaxs and semantics.

- Source code file, is you code written in file like `.js`,`.ml` sort of.
- Lexing got many name (Tokenization, Scanner,etc), but the job is to make string from file to bunch of formal token (ofc, defined by you that why i said formal token because it defined, e.g `1` -> `T_NUMBER 1`, `'E'` -> `T_WORD E`, `let` -> `LET`).
- Parsing, previously we said bunch of token, the token will be use to build Abstract Syntax Tree (AST) in this process.
  -  Anyways human had sort like AST that call grammar, `Gwen choke banana` so if we turn it to grammar will look like `Gwen(noun) choke(verb) banana(noun)` is a sentence. so does the programming language too.
- Generating IR, before we get the IR code make sure our code is semantically correct, like the code fullfil   had a meaning(ofc, you make the standard since this is you language). 
  - for example if there some string like this `Banana moaning at Gwen` this a sentence, but what the meaning behind it ? Can a banana moaning at person ? this ofc nonsense (except in specific occasion, but not in here) so this process catch this mistake.
  - The IR Code will be used for generating our binary, that code representative form from out AST generate at parsing process.

#### Backend

This stage is synthesis the meaning in source code to object code (action if interpereter) who undertand by computer.

 Discalimer, after the front-end stage will go to here (backend stage), this part of compiler true shit, like optimitazion, desugarring and code generation. I pop this warn to inform there no uniform way what you doing i this stage, improvise is encourage. Because that i directly to code generation.

- Code generatior, turning IR to executable
  - For interpreter, in this process replace to execute IR to action in your computer.   

> WIP : Listen, I bit lazy and sleepy, maybe wanna sleep. if you dont mind to busy, please read those reference or what i already write on root repository [README.md](../README.md) that could be helpful, if not that fine. Running , lazy ,cry is fine but dont give up.

### Some pratices

Okay this part will show you how to make simple lexer, to split a string and put it to token (our defined data type). Regular expresion in OCaml i felt bit strange (or i not common with it) but that required for this part ([regexr.io](https://regexr.io) for debugging our regex with clean hand, i mean without too much code). We will not use any library, just plain OCaml with built-in feature (no stream and genlex).

Here the rule,
- Space ` ` will treated as blank, this will used as delimeter.
- To make regex in OCaml use this , `Str.regexp <the regex string>` e.g `Str.regexp " "`.
 - More detail you can look up at [Str](https://ocaml.org/api/Str.html).
- After splitting with blank we need to place the string to a token, the definition below here.
 -  `T_WORD` to storing a karakter
 -  `T_EQ` to repersent `=` symbol.
 -  `T_NUM` to storing a number.
 -  `T_ENDLINE` to storing a endline.
- All details of [OCaml regex](https://ocaml.org/api/Str.html#TYPEregexp).

This simple sample example.

```ocaml
(* Defining regex to capture string for token *)
let 
  rgx_word = Str.regexp "[a-zA-z]+[0-9]*" and
  rgx_num = Str.regexp "[0-9]" and
  rgx_eq = Str.regexp "=" and
  rgx_endline = Str.regexp "\n" 
;;

(* This for our coustom exception*)
exception UnrecognizeSymbol of string

(* This our token *)
type token = 
   T_WORD of string
   | T_EQ
   | T_NUM of int
   | T_ENDLINE
;;

(* To display token for debug purpose *)
let pp_token (t:token) =
  match t with
    | T_NUM i -> print_endline ("T_NUM" ^ (string_of_int i))
    | T_EQ -> print_endline "T_EQ"
    | T_ENDLINE -> print_endline "T_ENDLINE"
    | T_WORD w -> print_endline ("T_WORD " ^ w)
;;

(* to catch string pattern then make a token *)
let lexer (s: string) : token =
  (* 
    Str.string_match is for check is pattern exist or not in the string, 
    0 is the start postition in the string. 
  *)
  if Str.string_match rgx_word s 0 then T_WORD s
  else if Str.string_match rgx_num s 0 then T_NUM (int_of_string s)
  else if Str.string_match rgx_eq s 0 then T_EQ
  else if Str.string_match rgx_endline s 0 then T_ENDLINE
  else raise (UnrecognizeSymbol s) (* For exception in case there a not match with any defined regex*)
;;

(* begining, spliting string by space *)
let the_string = "let x = 1" in
let splitted_string = Str.split (Str.regexp " ") the_string in

(* to apply lexer function to all element inside splitted_string *)
let tokens = List.map lexer splitted_string in

(*See our token*)
List.map pp_token tokens

(*
this altenative syntax from line 33 to 41

"let x = 1" 
  |> Str.split (Str.regexp " ")
  |> List.map lexer
  |> List.map pp_token

*)
```

To run this code, first compile it : `ocamlc str.cma simple_lexer.ml -o smlex` then run it `./smlex`.

> If you dont mind, i had some task for you who read this, to read [simple_lexer.ml] and implement the task there, this is just for training purpose after read this and dont PR you task answer to here.

### REFERENCE

This is good resource if you wanna explore later without waitting my next expriment (although, the next experiment based this too):

- [Recitation: Parsing, CS Cornel](https://www.cs.cornell.edu/courses/cs3110/2015fa/l/12-interp/rec.html)
- [Benefits of OCaml,Flying Frog Consultation.](https://www.ffconsultancy.com/ocaml/benefits/parsing.html)