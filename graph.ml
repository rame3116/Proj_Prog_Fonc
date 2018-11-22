type id = string

type 'a out_arcs = (id * 'a) list

(* A graph is just a list of pairs: a node & its outgoing arcs. *)
type 'a graph = (id * 'a out_arcs) list

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



let rec find_path gr forbidden id1 id2 result=

  if id1=id2 then result
  else 
    let arcs_sort = out_arcs gr id1 in
      ...

and explore gr forbidden id1 id2 result arcs_sort =




  	
  	let rec loop gr forbidden id1 id2 result =
    	(*if List.exists (fun x -> if x = id1 or x = id2 then true else false) forbidden then failwith "Vaut mieux pas que les id1 et 2 soient dans les id interdis" 

      	Liste forbidden a mettre à jour en fonction des noeuds déjà visités*)
    		match gr with 
      			| []->
      			|(noeuds,listarc) -> ( if List.exists (fun (x,_) -> if x = id2 then true else false) listarcs (*Vérifie si le chemin peut se terminer*) then id2::result (*Results = liste de noeud*)
                             			 else (*Créer un loop ici*)
                               			match listarc with 
                                 			|[]->
                                 			|[(idnoeusuiv,_)] -> if List.exists (fun (x,_) -> if x = idnoeusuiv then true else false) forbidden (*Vérifie si le l'arc est dans forbidden*) then 
                                       			
                                       							

                           )
                           	
		
	




  	in
  	let listefinale = [id1] in
    	loop gr forbidden id1 id2 listefinale
      	(*let fin = List.rev listefinale
        	fin*)
      	listefinale


	
	
