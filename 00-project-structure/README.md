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

If you in `gwen` now, y'll meet with three folder (and all folder had it own `dune` files) :

   - `bin`, this is where our project entrypoint, in here we could produce many binary with different purposes using same library, but i dunno how.
   - `lib`, this place where we most spend to code, feel free to make folder there, to import it just `Gwen.<folder name>` (`Gwen` is our project name and namespace by default you can change it at `dune` there)
   - `test`, folder to set all torture device for torturing `lib` folder content.

To be honest, in `bin` folder w'll meet with `main.ml` file, i kind not like it if you wanna change it change the name and do not forget for change `main` in `dune` file `name` fields it corresponded with file name without `.ml` postfix. (if you use vscode, i dunne it change it self when i change `dune` file)

To run it, `dune build bin/gwen.ml` then `dune exec bin/gwen.exe` ( there a way to use `dune run` but i forgor)


## Reference

- [Starting an OCaml app project using Dune, Bobby Priambodo](https://medium.com/@bobbypriambodo/starting-an-ocaml-app-project-using-dune-d4f74e291de8)
