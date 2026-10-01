(* The body of `Map.Make (Ord)` used by the translator's functor
   specialization: OCaml 4.14's Map.S over Ocaml_map, passing Ord.compare.
   Each function has the arity of the Stdlib definition (map.ml), so
   partial applications behave alike. *)
type key = Ord.t
type 'a t = (key, 'a) Ocaml_map.t
let empty = Ocaml_map.empty
let is_empty m = Ocaml_map.is_empty m
let mem x m = Ocaml_map.mem Ord.compare x m
let add x data m = Ocaml_map.add Ord.compare x data m
let update x f m = Ocaml_map.update Ord.compare x f m
let singleton x d = Ocaml_map.singleton x d
let remove x m = Ocaml_map.remove Ord.compare x m
let merge f s1 s2 = Ocaml_map.merge Ord.compare f s1 s2
let union f s1 s2 = Ocaml_map.union Ord.compare f s1 s2
let compare cmp m1 m2 = Ocaml_map.compare Ord.compare cmp m1 m2
let equal cmp m1 m2 = Ocaml_map.equal Ord.compare cmp m1 m2
let iter f m = Ocaml_map.iter f m
let fold f m accu = Ocaml_map.fold f m accu
let for_all p m = Ocaml_map.for_all p m
let exists p m = Ocaml_map.exists p m
let filter p m = Ocaml_map.filter p m
let filter_map f m = Ocaml_map.filter_map f m
let partition p m = Ocaml_map.partition p m
let cardinal m = Ocaml_map.cardinal m
let bindings s = Ocaml_map.bindings s
let min_binding m = Ocaml_map.min_binding m
let min_binding_opt m = Ocaml_map.min_binding_opt m
let max_binding m = Ocaml_map.max_binding m
let max_binding_opt m = Ocaml_map.max_binding_opt m
let choose m = Ocaml_map.choose m
let choose_opt m = Ocaml_map.choose_opt m
let split x m = Ocaml_map.split Ord.compare x m
let find x m = Ocaml_map.find Ord.compare x m
let find_opt x m = Ocaml_map.find_opt Ord.compare x m
let find_first f m = Ocaml_map.find_first f m
let find_first_opt f m = Ocaml_map.find_first_opt f m
let find_last f m = Ocaml_map.find_last f m
let find_last_opt f m = Ocaml_map.find_last_opt f m
let map f m = Ocaml_map.map f m
let mapi f m = Ocaml_map.mapi f m
