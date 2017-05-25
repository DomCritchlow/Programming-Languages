(*Dominic Critchlow*)
(*CSCI 4230*)
(*Assignment 4*)

(* #1 *)
let quadratic a b c =
  if (b *. b -. 4. *.a*.c) < 0.0
  then raise (Failure "No_Real_Roots")
  else ( (-.b +. sqrt (b*.b -. 4.0*.a*.c))/.(2.0*.a) , (-.b -. sqrt (b*.b -. 4.0*.a*.c))/.(2.0*.a)) ;;

(* #2 *)
let third ( _, _, c ) = c;;

(* #3 *)
let rec reverse list1 =
  match list1 with
  | [] -> []
  | (head :: tail) -> reverse(tail) @ (head :: []);;

(* #4 *)
let rec member item list1 =
  match list1 with
  | []-> false
  | (head::tail) ->
  if head = item
  then true
  else member item tail;;

(* #5 *)
let rec union list1 list2 =
  match list1 with
  |[] -> list2
  |(head::tail)->
  if (member head list2)
  then union tail list2
  else union tail (head::list2);;

(* #6 *)
let rec intersect list1 list2 =
  match list1 with
  |[] -> []
  |(head :: tail) ->
  if member head list2
  then head :: intersect tail list2
  else intersect tail list2 ;;

(* #7 *)
 let rec partition item list1 =
  match list1 with
  |[]-> ([],[])
  |(head::tail) ->
  if head < item
  then (head :: fst(partition item tail) , snd(partition item tail))
  else (fst(partition item tail) , head :: snd(partition item tail))

(* #8 *)
let rec quicksort list1 =
 match list1 with
 |[] -> []
 |(head::tail) ->
  quicksort (fst(partition head tail)) @
  (head :: [])@
  quicksort (snd(partition head tail));;
