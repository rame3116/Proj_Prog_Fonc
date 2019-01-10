open Graph

type chemin = id list 

val find_path : 'a graph -> id -> id -> id list -> chemin 
val afficher_chemin : chemin -> unit
