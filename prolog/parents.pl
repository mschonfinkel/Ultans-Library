/* ------------- Facts -------------  */
/* Spanish Branch of the Habsburgs    */

/* 1st gen */
sex(ferdinand_of_aragon, male).
sex(elizabeth_of_castille, female).
sex(maximiliam, male).
sex(mary_of_burgundy, female).

/* 2nd gen */
sex(joanna_of_castille, female).
sex(mary_of_aragon, female).
sex(manuel_i, male).
sex(phillip_i, male).

/* 3rd gen */
sex(isabella_of_portugal, female).
sex(catherine, female).
sex(anna_of_hungary, female).
sex(john_iii, male).
sex(charles_i, male).
sex(ferdinand_i, male).

/* 4rd gen */
sex(mary_of_portugal, female).
sex(mary_of_austria, female).
sex(anna, female).
sex(phillip_ii, male).
sex(maximiliam_ii, male).
sex(charles_ii, male).

parent(ferdinand_of_aragon, mary_of_aragon).
parent(ferdinand_of_aragon, joanna_of_castille).
parent(elizabeth_of_castille, mary_of_aragon).
parent(elizabeth_of_castille, joanna_of_castille).

parent(manuel_i, john_iii).
parent(manuel_i, isabella_of_portugal).
parent(mary_of_aragon, john_iii).
parent(mary_of_aragon, isabella_of_portugal).

parent(phillip_i, catherine).
parent(phillip_i, charles_i).
parent(phillip_i, ferdinand_i).
parent(joanna_of_castille, catherine).
parent(joanna_of_castille, charles_i).
parent(joanna_of_castille, ferdinand_i).

parent(john_iii, mary_of_portugal).
parent(catherine, mary_of_portugal).

parent(charles_i, phillip_ii).
parent(charles_i, mary_of_austria).
parent(isabella_of_portugal, phillip_ii).
parent(isabella_of_portugal, mary_of_austria).

parent(ferdinand_i, maximiliam_ii).
parent(ferdinand_i, charles_ii).
parent(ferdinand_i, anna).
parent(anna_of_hungary, maximiliam_ii).
parent(anna_of_hungary, charles_ii).
parent(anna_of_hungary, anna).

/* -------- Rules -------- */

/* Ancestor */
/*
X is ancestor of W if:
	Either:
		parent(X,W). (Induction base case)
	Or:
		There exists Z:
		(1) parent(X,Z),
		(2) ancestor(Z, W).
*/
ancestor(X,W) :- parent(X,W); (parent(X,Z), ancestor(Z,W)).

/* Father\Mother */
mother(X,Y) :- parent(X, Y), sex(X, female).
father(X,Y) :- parent(X, Y), sex(X, male).

/* Son\Daugther */
son(Y, X) :- parent(X, Y), sex(Y, male).
daugther(Y, X) :- parent(X, Y), sex(Y, female).

/* Granparent\Grandchildren */
/*    .X.
     /   \
  (...)   Y
           \
            Z
*/

grandparent(X,Z) :- parent(X, Y), parent(Y, Z).

grandfather(X,Y) :- grandparent(X, Y), sex(X, male).
grandmother(X,Y) :- grandparent(X, Y), sex(X, female).

grandchild(Y,X) :- grandparent(X,Y).

/* Brother\Sister  */
/*    .Z.
     /   \
    X     Y
*/
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(X,Y) :- sibling(X,Y), sex(X, male).
sister(X,Y) :- sibling(X,Y), sex(X, female).

/* Cousins\Uncle\Aunt\Nephew */
/*    .A.
     /   \
    W     Z
   / \   / \
      Y     X
*/
cousins(X,Y) :- parent(Z,X), parent(W,Y), sibling(Z,W).
uncle(X,Y) :- parent(Z,Y), sibling(X,Z), sex(X,male).
aunt(X,Y) :- parent(Z,Y), sibling(X,Z), sex(X,female).
nephew(Y,X) :- uncle(X,Y); aunt(X,Y).