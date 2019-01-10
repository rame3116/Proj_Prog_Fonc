open Graph
open Printf

(*Trouver un chemin *)
let rec find_path gr forbidden id1 id2 result =

  if id1=id2 then result
  else (


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

      explore gr forbidden id1 id2 result arcs_sort
  )

  
 (*Afficher un chemin*) 
let afficher_chemin chemin = 
	List.iter (fun i -> Printf.printf "%s ---> " i) chemin
	
	
	
(* A faire : 
	- La fonction from_text_infile pour le test (transforme v et e en graph) et essayer de tester find path 
	- Si on arrive a faire find_path on continue avec ça 
	- Si vendredi midi pas de find path gros recopiage 
	- Fonction d'affichage suffit ? 
	- Etapes ??? 
	
	*) 