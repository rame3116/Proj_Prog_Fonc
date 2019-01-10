type id = string

type 'a out_arcs = (id * 'a) list

(* A graph is just a list of pairs: a node & its outgoing arcs. *)
type 'a graph = (id * 'a out_arcs) list

type chemin = id list

exception Graph_error of string

let empty_graph = []

let node_exists gr id = List.mem_assoc id gr

let out_arcs gr id =
  try List.assoc id gr
  with Not_found -> raise (Graph_error ("Node " ^ id ^ " does not exist in this graph."))

let find_arc gr id1 id2 =
  let out = out_arcs gr id1 in
    try Some (List.assoc id2 out)
    with Not_found -> None

let add_node gr id =
  if node_exists gr id then raise (Graph_error ("Node " ^ id ^ " already exists in the graph."))
  else (id, []) :: gr

let add_arc gr id1 id2 lbl =

  (* Existing out-arcs *)
  let outa = out_arcs gr id1 in

  (* Update out-arcs.
   * remove_assoc does not fail if id2 is not bound.  *)
  let outb = (id2, lbl) :: List.remove_assoc id2 outa in

  (* Replace out-arcs in the graph. *)
  let gr2 = List.remove_assoc id1 gr in
    (id1, outb) :: gr2

let v_iter gr f = List.iter (fun (id, out) -> f id out) gr

let v_fold gr f acu = List.fold_left (fun acu (id, out) -> f acu id out) acu gr

let rec map (gr : 'a graph) f = 
  let rec inter f l = match l with
    |[]->[]
    |(idarc,label)::rest-> (idarc, f label)::(inter f rest)
  in

    match gr with
      |[]->[]
      |(idno,li) :: rest-> (idno, (inter f li)) :: (map rest f)



let map = (map : ('a graph -> ('a -> 'b) -> 'b graph))



let rec find_path gr forbidden id1 id2 result =

  if id1=id2 then result
  else (
<<<<<<< HEAD


    let arcs_sort = out_arcs gr id1 in
=======
>>>>>>> 88728d373711ac555364d68a2fb864d6274f27b1

    (*id1 n'est pas dans forbidden, on le rajoutera et arcs_sort est la liste de id1*)
    let rec explore gr forbidden id1 id2 result arcs_sort = match arcs_sort with
      |[] -> [] (*Mettre la liste vide ici pour montrer que y'a pas de chemin*)
      |(noeud,_)::rest -> (if (List.exists (fun x -> if x = noeud then true else false) forbidden) then explore gr forbidden id1 id2 result rest 
                           else (match find_path gr (id1::forbidden) noeud id2 (id1::result) with
                                  |[] -> explore gr (noeud::forbidden) id1 id2 result rest
                                  |l -> l
                                )
                          )
    in

<<<<<<< HEAD
      explore gr forbidden id1 id2 result arcs_sort
  )

let find_path =(find_path : ('a graph -> id list -> id -> id -> id list -> chemin))



=======
    let arcs_sort = out_arcs gr id1 in

    (*id1 n'est pas dans forbidden, on le rajoutera et arcs_sort est la liste de id1*)
    let rec explore gr forbidden id1 id2 result arcs_sort = match arcs_sort with
      |[] -> [] (*Mettre la liste vide ici pour montrer que y'a pas de chemin*)
      |(noeud,_)::rest -> (if (List.exists (fun x -> if x = noeud then true else false) forbidden) then explore gr forbidden id1 id2 result rest 
                           else (match find_path gr (id1::forbidden) noeud id2 (id1::result) with
                                  |[] -> explore gr (noeud::forbidden) id1 id2 result rest
                                  |l -> l
                                )
                          )
    in

      explore gr fobidden id1 id2 result arcs_sort
  )
>>>>>>> 88728d373711ac555364d68a2fb864d6274f27b1

(*let rec do_list f = function (* fonction prédéfinie en Caml *)
  | [] −> ()
  | t::q −> f t ; do_list f q




*)

<<<<<<< HEAD
=======
	
		
		
		
		
		
		
>>>>>>> 88728d373711ac555364d68a2fb864d6274f27b1
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
