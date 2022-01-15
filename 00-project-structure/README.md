# 00 Project Structure

You know, writting project without organized directory is like making our time bomb and lowering morale, i think. So those kind of stuff that will be discussing in here brrrrr.

Maybe there some requirment you need to make (bout installing thing and yeah, creating folders)

- Installing OCaml , i didn't care what version but make sure major version is above 4, like 4.x.x (not mean to nsfw, if multicore that could be good).
- Now, make our OCaml setup, `opam install dune alcotest cmdliner menhir` with this w'll got:
  - Menhir (the parser generator, this is a tool)
  - Alcotest (since ounit make me angy, alcotest give me rainbow)
  - Cmdliner (for handling terminal thingy)
  - Dune (build system, like Makefile)
- Init our project with `dune init proj <your project names> --libs alcotest,cmdliner`.
  - for this occasion, `<your project names>` is `gwen`.
  - y'll get `gwen` folder.
- Now we're good.  

WIP : Listen I bit lazy and sleepy, maybe wanna sleep. 