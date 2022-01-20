(* Defining regex to capture string for token *)
let 
  rgx_word = Str.regexp "[a-zA-z]+[0-9]*" and
  rgx_num = Str.regexp "[0-9]" and
  (* Task: regex to capture charachter "let", and see how i put naming *)
  rgx_eq = Str.regexp "=" and
  rgx_endline = Str.regexp "\n" 
;;

exception UnrecognizeSymbol of string

(* This our token *)
type token = 
   T_WORD of string
   | T_EQ
   (* Task: make T_LET variant*)
   | T_NUM of int
   | T_ENDLINE
;;

(* To display token for debug purpose *)
let pp_token (t:token) =
  match t with
    | T_NUM i -> print_endline ("T_NUM" ^ (string_of_int i))
    | T_EQ -> print_endline "T_EQ"
    (* Task: display token for T_LET*)
    | T_ENDLINE -> print_endline "T_ENDLINE"
    | T_WORD w -> print_endline ("T_WORD " ^ w)
;;

(* to catch string pattern then make a token *)
let lexer (s: string) : token =
  (* 
     Warning: regex matching order had significant influent to result a token, so 
     make sure to put the larger range regex at bottom and the small pattern range regex 
     top in order to make sure pattern capture not overlap (sophisticated capturing may put at top like small range, imo).
  *)
  if Str.string_match rgx_word s 0 then T_WORD s
  else if Str.string_match rgx_num s 0 then T_NUM (int_of_string s)
  (* TASK: Implement to capture string for token T_LET *)
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
this altenative syntax from line 47 to 54

"let x = 1" 
  |> Str.split (Str.regexp " ")
  |> List.map lexer
  |> List.map pp_token

*)