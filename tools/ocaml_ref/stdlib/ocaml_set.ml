(* OCaml 4.14 Stdlib Set.Make, with the element comparison as an explicit
   first argument `ord` of the functions that compare elements (same
   algorithms). Inline-record nodes are flat constructors in field order.
   Generated from set.ml; translated to the MoonBit package oset. *)

module Ocaml_set = struct

  type 'e t = Empty | Node of 'e t * 'e * 'e t * int

  let height = function
      Empty -> 0
    | Node(_, _, _, h) -> h



  let create l v r =
    let hl = match l with Empty -> 0 | Node(_, _, _, h) -> h in
    let hr = match r with Empty -> 0 | Node(_, _, _, h) -> h in
    Node(l, v, r, (if hl >= hr then hl + 1 else hr + 1))



  let bal l v r =
    let hl = match l with Empty -> 0 | Node(_, _, _, h) -> h in
    let hr = match r with Empty -> 0 | Node(_, _, _, h) -> h in
    if hl > hr + 2 then begin
      match l with
        Empty -> invalid_arg "Set.bal"
      | Node(ll, lv, lr, _) ->
          if height ll >= height lr then
            create ll lv (create lr v r)
          else begin
            match lr with
              Empty -> invalid_arg "Set.bal"
            | Node(lrl, lrv, lrr, _)->
                create (create ll lv lrl) lrv (create lrr v r)
          end
    end else if hr > hl + 2 then begin
      match r with
        Empty -> invalid_arg "Set.bal"
      | Node(rl, rv, rr, _) ->
          if height rr >= height rl then
            create (create l v rl) rv rr
          else begin
            match rl with
              Empty -> invalid_arg "Set.bal"
            | Node(rll, rlv, rlr, _) ->
                create (create l v rll) rlv (create rlr rv rr)
          end
    end else
      Node(l, v, r, (if hl >= hr then hl + 1 else hr + 1))



  let rec add ord x = function
      Empty -> Node(Empty, x, Empty, 1)
    | Node(l, v, r, _) as t ->
        let c = ord x v in
        if c = 0 then t else
        if c < 0 then
          let ll = add ord x l in
          if l == ll then t else bal ll v r
        else
          let rr = add ord x r in
          if r == rr then t else bal l v rr

  let singleton x = Node(Empty, x, Empty, 1)



  let rec add_min_element x = function
    | Empty -> singleton x
    | Node(l, v, r, _) ->
      bal (add_min_element x l) v r

  let rec add_max_element x = function
    | Empty -> singleton x
    | Node(l, v, r, _) ->
      bal l v (add_max_element x r)



  let rec join l v r =
    match (l, r) with
      (Empty, _) -> add_min_element v r
    | (_, Empty) -> add_max_element v l
    | (Node(ll, lv, lr, lh), Node(rl, rv, rr, rh)) ->
        if lh > rh + 2 then bal ll lv (join lr v r) else
        if rh > lh + 2 then bal (join l v rl) rv rr else
        create l v r



  let rec min_elt = function
      Empty -> raise Not_found
    | Node(Empty, v, _, _) -> v
    | Node(l, _, _, _) -> min_elt l

  let rec min_elt_opt = function
      Empty -> None
    | Node(Empty, v, _, _) -> Some v
    | Node(l, _, _, _) -> min_elt_opt l

  let rec max_elt = function
      Empty -> raise Not_found
    | Node(_, v, Empty, _) -> v
    | Node(_, _, r, _) -> max_elt r

  let rec max_elt_opt = function
      Empty -> None
    | Node(_, v, Empty, _) -> Some v
    | Node(_, _, r, _) -> max_elt_opt r



  let rec remove_min_elt = function
      Empty -> invalid_arg "Set.remove_min_elt"
    | Node(Empty, _, r, _) -> r
    | Node(l, v, r, _) -> bal (remove_min_elt l) v r



  let merge t1 t2 =
    match (t1, t2) with
      (Empty, t) -> t
    | (t, Empty) -> t
    | (_, _) -> bal t1 (min_elt t2) (remove_min_elt t2)



  let concat t1 t2 =
    match (t1, t2) with
      (Empty, t) -> t
    | (t, Empty) -> t
    | (_, _) -> join t1 (min_elt t2) (remove_min_elt t2)



  let rec split ord x = function
      Empty ->
        (Empty, false, Empty)
    | Node(l, v, r, _) ->
        let c = ord x v in
        if c = 0 then (l, true, r)
        else if c < 0 then
          let (ll, pres, rl) = split ord x l in (ll, pres, join rl v r)
        else
          let (lr, pres, rr) = split ord x r in (join l v lr, pres, rr)



  let empty = Empty

  let is_empty = function Empty -> true | _ -> false

  let rec mem ord x = function
      Empty -> false
    | Node(l, v, r, _) ->
        let c = ord x v in
        c = 0 || mem ord x (if c < 0 then l else r)

  let rec remove ord x = function
      Empty -> Empty
    | (Node(l, v, r, _) as t) ->
        let c = ord x v in
        if c = 0 then merge l r
        else
          if c < 0 then
            let ll = remove ord x l in
            if l == ll then t
            else bal ll v r
          else
            let rr = remove ord x r in
            if r == rr then t
            else bal l v rr

  let rec union ord s1 s2 =
    match (s1, s2) with
      (Empty, t2) -> t2
    | (t1, Empty) -> t1
    | (Node(l1, v1, r1, h1), Node(l2, v2, r2, h2)) ->
        if h1 >= h2 then
          if h2 = 1 then add ord v2 s1 else begin
            let (l2, _, r2) = split ord v1 s2 in
            join (union ord l1 l2) v1 (union ord r1 r2)
          end
        else
          if h1 = 1 then add ord v1 s2 else begin
            let (l1, _, r1) = split ord v2 s1 in
            join (union ord l1 l2) v2 (union ord r1 r2)
          end

  let rec inter ord s1 s2 =
    match (s1, s2) with
      (Empty, _) -> Empty
    | (_, Empty) -> Empty
    | (Node(l1, v1, r1, _), t2) ->
        match split ord v1 t2 with
          (l2, false, r2) ->
            concat (inter ord l1 l2) (inter ord r1 r2)
        | (l2, true, r2) ->
            join (inter ord l1 l2) v1 (inter ord r1 r2)



  type 'e split_bis =
      Split_found
    | Split_absent of 'e t * (unit -> 'e t)

  let rec split_bis ord x = function
      Empty ->
        Split_absent (Empty, (fun () -> Empty))
    | Node(l, v, r, _) ->
        let c = ord x v in
        if c = 0 then Split_found
        else if c < 0 then
          match split_bis ord x l with
          | Split_found -> Split_found
          | Split_absent (ll, rl) -> Split_absent (ll, (fun () -> join (rl ()) v r))
        else
          match split_bis ord x r with
          | Split_found -> Split_found
          | Split_absent (lr, rr) -> Split_absent (join l v lr, rr)

  let rec disjoint ord s1 s2 =
    match (s1, s2) with
      (Empty, _) | (_, Empty) -> true
    | (Node(l1, v1, r1, _), t2) ->
        if s1 == s2 then false
        else match split_bis ord v1 t2 with
            Split_absent(l2, r2) -> disjoint ord l1 l2 && disjoint ord r1 (r2 ())
          | Split_found -> false

  let rec diff ord s1 s2 =
    match (s1, s2) with
      (Empty, _) -> Empty
    | (t1, Empty) -> t1
    | (Node(l1, v1, r1, _), t2) ->
        match split ord v1 t2 with
          (l2, false, r2) ->
            join (diff ord l1 l2) v1 (diff ord r1 r2)
        | (l2, true, r2) ->
            concat (diff ord l1 l2) (diff ord r1 r2)

  type 'e enumeration = End | More of 'e * 'e t * 'e enumeration

  let rec cons_enum s e =
    match s with
      Empty -> e
    | Node(l, v, r, _) -> cons_enum l (More(v, r, e))

  let rec compare_aux ord e1 e2 =
      match (e1, e2) with
      (End, End) -> 0
    | (End, _)  -> -1
    | (_, End) -> 1
    | (More(v1, r1, e1), More(v2, r2, e2)) ->
        let c = ord v1 v2 in
        if c <> 0
        then c
        else compare_aux ord (cons_enum r1 e1) (cons_enum r2 e2)

  let compare ord s1 s2 =
    compare_aux ord (cons_enum s1 End) (cons_enum s2 End)

  let equal ord s1 s2 =
    compare ord s1 s2 = 0

  let rec subset ord s1 s2 =
    match (s1, s2) with
      Empty, _ ->
        true
    | _, Empty ->
        false
    | Node(l1, v1, r1, _), (Node(l2, v2, r2, _) as t2) ->
        let c = ord v1 v2 in
        if c = 0 then
          subset ord l1 l2 && subset ord r1 r2
        else if c < 0 then
          subset ord (Node(l1, v1, Empty, 0)) l2 && subset ord r1 t2
        else
          subset ord (Node(Empty, v1, r1, 0)) r2 && subset ord l1 t2

  let rec iter f = function
      Empty -> ()
    | Node(l, v, r, _) -> iter f l; f v; iter f r

  let rec fold f s accu =
    match s with
      Empty -> accu
    | Node(l, v, r, _) -> fold f r (f v (fold f l accu))

  let rec for_all p = function
      Empty -> true
    | Node(l, v, r, _) -> p v && for_all p l && for_all p r

  let rec exists p = function
      Empty -> false
    | Node(l, v, r, _) -> p v || exists p l || exists p r

  let rec filter p = function
      Empty -> Empty
    | (Node(l, v, r, _)) as t ->

        let l' = filter p l in
        let pv = p v in
        let r' = filter p r in
        if pv then
          if l==l' && r==r' then t else join l' v r'
        else concat l' r'

  let rec partition p = function
      Empty -> (Empty, Empty)
    | Node(l, v, r, _) ->

        let (lt, lf) = partition p l in
        let pv = p v in
        let (rt, rf) = partition p r in
        if pv
        then (join lt v rt, concat lf rf)
        else (concat lt rt, join lf v rf)

  let rec cardinal = function
      Empty -> 0
    | Node(l, _, r, _) -> cardinal l + 1 + cardinal r

  let rec elements_aux accu = function
      Empty -> accu
    | Node(l, v, r, _) -> elements_aux (v :: elements_aux accu r) l

  let elements s =
    elements_aux [] s

  let choose = min_elt

  let choose_opt = min_elt_opt

  let rec find ord x = function
      Empty -> raise Not_found
    | Node(l, v, r, _) ->
        let c = ord x v in
        if c = 0 then v
        else find ord x (if c < 0 then l else r)

  let rec find_first_aux v0 f = function
      Empty ->
        v0
    | Node(l, v, r, _) ->
        if f v then
          find_first_aux v f l
        else
          find_first_aux v0 f r

  let rec find_first f = function
      Empty ->
        raise Not_found
    | Node(l, v, r, _) ->
        if f v then
          find_first_aux v f l
        else
          find_first f r

  let rec find_first_opt_aux v0 f = function
      Empty ->
        Some v0
    | Node(l, v, r, _) ->
        if f v then
          find_first_opt_aux v f l
        else
          find_first_opt_aux v0 f r

  let rec find_first_opt f = function
      Empty ->
        None
    | Node(l, v, r, _) ->
        if f v then
          find_first_opt_aux v f l
        else
          find_first_opt f r

  let rec find_last_aux v0 f = function
      Empty ->
        v0
    | Node(l, v, r, _) ->
        if f v then
          find_last_aux v f r
        else
          find_last_aux v0 f l

  let rec find_last f = function
      Empty ->
        raise Not_found
    | Node(l, v, r, _) ->
        if f v then
          find_last_aux v f r
        else
          find_last f l

  let rec find_last_opt_aux v0 f = function
      Empty ->
        Some v0
    | Node(l, v, r, _) ->
        if f v then
          find_last_opt_aux v f r
        else
          find_last_opt_aux v0 f l

  let rec find_last_opt f = function
      Empty ->
        None
    | Node(l, v, r, _) ->
        if f v then
          find_last_opt_aux v f r
        else
          find_last_opt f l

  let rec find_opt ord x = function
      Empty -> None
    | Node(l, v, r, _) ->
        let c = ord x v in
        if c = 0 then Some v
        else find_opt ord x (if c < 0 then l else r)

  let try_join ord l v r =

    if (l = Empty || ord (max_elt l) v < 0)
    && (r = Empty || ord v (min_elt r) < 0)
    then join l v r
    else union ord l (add ord v r)

  let rec map ord f = function
    | Empty -> Empty
    | Node(l, v, r, _) as t ->

       let l' = map ord f l in
       let v' = f v in
       let r' = map ord f r in
       if l == l' && v == v' && r == r' then t
       else try_join ord l' v' r'

  let try_concat ord t1 t2 =
    match (t1, t2) with
      (Empty, t) -> t
    | (t, Empty) -> t
    | (_, _) -> try_join ord t1 (min_elt t2) (remove_min_elt t2)

  let rec filter_map ord f = function
    | Empty -> Empty
    | Node(l, v, r, _) as t ->

       let l' = filter_map ord f l in
       let v' = f v in
       let r' = filter_map ord f r in
       begin match v' with
         | Some v' ->
            if l == l' && v == v' && r == r' then t
            else try_join ord l' v' r'
         | None ->
            try_concat ord l' r'     end

end
