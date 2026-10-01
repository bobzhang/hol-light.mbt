(* OCaml 4.14 Stdlib Map.Make, with the key comparison as an explicit
   first argument `ord` of the functions that compare keys (same
   algorithms, so the same comparisons, callback order and tree shapes).
   Inline-record nodes are flat constructors in field order. Generated
   from map.ml; translated to the MoonBit package omap. *)

module Ocaml_map = struct

  type ('k, 'a) t =
      Empty
    | Node of ('k, 'a) t * 'k * 'a * ('k, 'a) t * int

  let height = function
      Empty -> 0
    | Node(_, _, _, _, h) -> h

  let create l x d r =
    let hl = height l and hr = height r in
    Node(l, x, d, r, (if hl >= hr then hl + 1 else hr + 1))

  let singleton x d = Node(Empty, x, d, Empty, 1)

  let bal l x d r =
    let hl = match l with Empty -> 0 | Node(_, _, _, _, h) -> h in
    let hr = match r with Empty -> 0 | Node(_, _, _, _, h) -> h in
    if hl > hr + 2 then begin
      match l with
        Empty -> invalid_arg "Map.bal"
      | Node(ll, lv, ld, lr, _) ->
          if height ll >= height lr then
            create ll lv ld (create lr x d r)
          else begin
            match lr with
              Empty -> invalid_arg "Map.bal"
            | Node(lrl, lrv, lrd, lrr, _)->
                create (create ll lv ld lrl) lrv lrd (create lrr x d r)
          end
    end else if hr > hl + 2 then begin
      match r with
        Empty -> invalid_arg "Map.bal"
      | Node(rl, rv, rd, rr, _) ->
          if height rr >= height rl then
            create (create l x d rl) rv rd rr
          else begin
            match rl with
              Empty -> invalid_arg "Map.bal"
            | Node(rll, rlv, rld, rlr, _) ->
                create (create l x d rll) rlv rld (create rlr rv rd rr)
          end
    end else
      Node(l, x, d, r, (if hl >= hr then hl + 1 else hr + 1))

  let empty = Empty

  let is_empty = function Empty -> true | _ -> false

  let rec add ord x data = function
      Empty ->
        Node(Empty, x, data, Empty, 1)
    | Node(l, v, d, r, h) as m ->
        let c = ord x v in
        if c = 0 then
          if d == data then m else Node(l, x, data, r, h)
        else if c < 0 then
          let ll = add ord x data l in
          if l == ll then m else bal ll v d r
        else
          let rr = add ord x data r in
          if r == rr then m else bal l v d rr

  let rec find ord x = function
      Empty ->
        raise Not_found
    | Node(l, v, d, r, _) ->
        let c = ord x v in
        if c = 0 then d
        else find ord x (if c < 0 then l else r)

  let rec find_first_aux v0 d0 f = function
      Empty ->
        (v0, d0)
    | Node(l, v, d, r, _) ->
        if f v then
          find_first_aux v d f l
        else
          find_first_aux v0 d0 f r

  let rec find_first f = function
      Empty ->
        raise Not_found
    | Node(l, v, d, r, _) ->
        if f v then
          find_first_aux v d f l
        else
          find_first f r

  let rec find_first_opt_aux v0 d0 f = function
      Empty ->
        Some (v0, d0)
    | Node(l, v, d, r, _) ->
        if f v then
          find_first_opt_aux v d f l
        else
          find_first_opt_aux v0 d0 f r

  let rec find_first_opt f = function
      Empty ->
        None
    | Node(l, v, d, r, _) ->
        if f v then
          find_first_opt_aux v d f l
        else
          find_first_opt f r

  let rec find_last_aux v0 d0 f = function
      Empty ->
        (v0, d0)
    | Node(l, v, d, r, _) ->
        if f v then
          find_last_aux v d f r
        else
          find_last_aux v0 d0 f l

  let rec find_last f = function
      Empty ->
        raise Not_found
    | Node(l, v, d, r, _) ->
        if f v then
          find_last_aux v d f r
        else
          find_last f l

  let rec find_last_opt_aux v0 d0 f = function
      Empty ->
        Some (v0, d0)
    | Node(l, v, d, r, _) ->
        if f v then
          find_last_opt_aux v d f r
        else
          find_last_opt_aux v0 d0 f l

  let rec find_last_opt f = function
      Empty ->
        None
    | Node(l, v, d, r, _) ->
        if f v then
          find_last_opt_aux v d f r
        else
          find_last_opt f l

  let rec find_opt ord x = function
      Empty ->
        None
    | Node(l, v, d, r, _) ->
        let c = ord x v in
        if c = 0 then Some d
        else find_opt ord x (if c < 0 then l else r)

  let rec mem ord x = function
      Empty ->
        false
    | Node(l, v, _, r, _) ->
        let c = ord x v in
        c = 0 || mem ord x (if c < 0 then l else r)

  let rec min_binding = function
      Empty -> raise Not_found
    | Node(Empty, v, d, _, _) -> (v, d)
    | Node(l, _, _, _, _) -> min_binding l

  let rec min_binding_opt = function
      Empty -> None
    | Node(Empty, v, d, _, _) -> Some (v, d)
    | Node(l, _, _, _, _)-> min_binding_opt l

  let rec max_binding = function
      Empty -> raise Not_found
    | Node(_, v, d, Empty, _) -> (v, d)
    | Node(_, _, _, r, _) -> max_binding r

  let rec max_binding_opt = function
      Empty -> None
    | Node(_, v, d, Empty, _) -> Some (v, d)
    | Node(_, _, _, r, _) -> max_binding_opt r

  let rec remove_min_binding = function
      Empty -> invalid_arg "Map.remove_min_elt"
    | Node(Empty, _, _, r, _) -> r
    | Node(l, v, d, r, _) -> bal (remove_min_binding l) v d r

  let merge_trees t1 t2 =
    match (t1, t2) with
      (Empty, t) -> t
    | (t, Empty) -> t
    | (_, _) ->
        let (x, d) = min_binding t2 in
        bal t1 x d (remove_min_binding t2)

  let rec remove ord x = function
      Empty ->
        Empty
    | (Node(l, v, d, r, _) as m) ->
        let c = ord x v in
        if c = 0 then merge_trees l r
        else if c < 0 then
          let ll = remove ord x l in if l == ll then m else bal ll v d r
        else
          let rr = remove ord x r in if r == rr then m else bal l v d rr

  let rec update ord x f = function
      Empty ->
        begin match f None with
        | None -> Empty
        | Some data -> Node(Empty, x, data, Empty, 1)
        end
    | Node(l, v, d, r, h) as m ->
        let c = ord x v in
        if c = 0 then begin
          match f (Some d) with
          | None -> merge_trees l r
          | Some data ->
              if d == data then m else Node(l, x, data, r, h)
        end else if c < 0 then
          let ll = update ord x f l in
          if l == ll then m else bal ll v d r
        else
          let rr = update ord x f r in
          if r == rr then m else bal l v d rr

  let rec iter f = function
      Empty -> ()
    | Node(l, v, d, r, _) ->
        iter f l; f v d; iter f r

  let rec map f = function
      Empty ->
        Empty
    | Node(l, v, d, r, h) ->
        let l' = map f l in
        let d' = f d in
        let r' = map f r in
        Node(l', v, d', r', h)

  let rec mapi f = function
      Empty ->
        Empty
    | Node(l, v, d, r, h) ->
        let l' = mapi f l in
        let d' = f v d in
        let r' = mapi f r in
        Node(l', v, d', r', h)

  let rec fold f m accu =
    match m with
      Empty -> accu
    | Node(l, v, d, r, _) ->
        fold f r (f v d (fold f l accu))

  let rec for_all p = function
      Empty -> true
    | Node(l, v, d, r, _) -> p v d && for_all p l && for_all p r

  let rec exists p = function
      Empty -> false
    | Node(l, v, d, r, _) -> p v d || exists p l || exists p r



  let rec add_min_binding k x = function
    | Empty -> singleton k x
    | Node(l, v, d, r, _) ->
      bal (add_min_binding k x l) v d r

  let rec add_max_binding k x = function
    | Empty -> singleton k x
    | Node(l, v, d, r, _) ->
      bal l v d (add_max_binding k x r)



  let rec join l v d r =
    match (l, r) with
      (Empty, _) -> add_min_binding v d r
    | (_, Empty) -> add_max_binding v d l
    | (Node(ll, lv, ld, lr, lh),
       Node(rl, rv, rd, rr, rh)) ->
        if lh > rh + 2 then bal ll lv ld (join lr v d r) else
        if rh > lh + 2 then bal (join l v d rl) rv rd rr else
        create l v d r



  let concat t1 t2 =
    match (t1, t2) with
      (Empty, t) -> t
    | (t, Empty) -> t
    | (_, _) ->
        let (x, d) = min_binding t2 in
        join t1 x d (remove_min_binding t2)

  let concat_or_join t1 v d t2 =
    match d with
    | Some d -> join t1 v d t2
    | None -> concat t1 t2

  let rec split ord x = function
      Empty ->
        (Empty, None, Empty)
    | Node(l, v, d, r, _) ->
        let c = ord x v in
        if c = 0 then (l, Some d, r)
        else if c < 0 then
          let (ll, pres, rl) = split ord x l in (ll, pres, join rl v d r)
        else
          let (lr, pres, rr) = split ord x r in (join l v d lr, pres, rr)

  let rec merge ord f s1 s2 =
    match (s1, s2) with
      (Empty, Empty) -> Empty
    | (Node(l1, v1, d1, r1, h1), _) when h1 >= height s2 ->
        let (l2, d2, r2) = split ord v1 s2 in
        concat_or_join (merge ord f l1 l2) v1 (f v1 (Some d1) d2) (merge ord f r1 r2)
    | (_, Node(l2, v2, d2, r2, _)) ->
        let (l1, d1, r1) = split ord v2 s1 in
        concat_or_join (merge ord f l1 l2) v2 (f v2 d1 (Some d2)) (merge ord f r1 r2)
    | _ ->
        assert false

  let rec union ord f s1 s2 =
    match (s1, s2) with
    | (Empty, s) | (s, Empty) -> s
    | (Node(l1, v1, d1, r1, h1),
       Node(l2, v2, d2, r2, h2)) ->
        if h1 >= h2 then
          let (l2, d2, r2) = split ord v1 s2 in
          let l = union ord f l1 l2 and r = union ord f r1 r2 in
          match d2 with
          | None -> join l v1 d1 r
          | Some d2 -> concat_or_join l v1 (f v1 d1 d2) r
        else
          let (l1, d1, r1) = split ord v2 s1 in
          let l = union ord f l1 l2 and r = union ord f r1 r2 in
          match d1 with
          | None -> join l v2 d2 r
          | Some d1 -> concat_or_join l v2 (f v2 d1 d2) r

  let rec filter p = function
      Empty -> Empty
    | Node(l, v, d, r, _) as m ->

        let l' = filter p l in
        let pvd = p v d in
        let r' = filter p r in
        if pvd then if l==l' && r==r' then m else join l' v d r'
        else concat l' r'

  let rec filter_map f = function
      Empty -> Empty
    | Node(l, v, d, r, _) ->

        let l' = filter_map f l in
        let fvd = f v d in
        let r' = filter_map f r in
        begin match fvd with
          | Some d' -> join l' v d' r'
          | None -> concat l' r'
        end

  let rec partition p = function
      Empty -> (Empty, Empty)
    | Node(l, v, d, r, _) ->

        let (lt, lf) = partition p l in
        let pvd = p v d in
        let (rt, rf) = partition p r in
        if pvd
        then (join lt v d rt, concat lf rf)
        else (concat lt rt, join lf v d rf)

  type ('k, 'a) enumeration = End | More of 'k * 'a * ('k, 'a) t * ('k, 'a) enumeration

  let rec cons_enum m e =
    match m with
      Empty -> e
    | Node(l, v, d, r, _) -> cons_enum l (More(v, d, r, e))

  let compare ord cmp m1 m2 =
    let rec compare_aux e1 e2 =
        match (e1, e2) with
        (End, End) -> 0
      | (End, _)  -> -1
      | (_, End) -> 1
      | (More(v1, d1, r1, e1), More(v2, d2, r2, e2)) ->
          let c = ord v1 v2 in
          if c <> 0 then c else
          let c = cmp d1 d2 in
          if c <> 0 then c else
          compare_aux (cons_enum r1 e1) (cons_enum r2 e2)
    in compare_aux (cons_enum m1 End) (cons_enum m2 End)

  let equal ord cmp m1 m2 =
    let rec equal_aux e1 e2 =
        match (e1, e2) with
        (End, End) -> true
      | (End, _)  -> false
      | (_, End) -> false
      | (More(v1, d1, r1, e1), More(v2, d2, r2, e2)) ->
          ord v1 v2 = 0 && cmp d1 d2 &&
          equal_aux (cons_enum r1 e1) (cons_enum r2 e2)
    in equal_aux (cons_enum m1 End) (cons_enum m2 End)

  let rec cardinal = function
      Empty -> 0
    | Node(l, _, _, r, _) -> cardinal l + 1 + cardinal r

  let rec bindings_aux accu = function
      Empty -> accu
    | Node(l, v, d, r, _) -> bindings_aux ((v, d) :: bindings_aux accu r) l

  let bindings s =
    bindings_aux [] s

  let choose = min_binding

  let choose_opt = min_binding_opt

end
