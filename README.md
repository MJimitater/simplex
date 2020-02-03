# simplex
A matlab implementation of the primal simplex algorithm for optimizing linear programs

`mySimplex.m` contains code to run the simplex algorithm.

Consider having the linear program min{cx|Ax=b, x≥0} in a tableau of the form

  |----------------|---|
  | costs/objective| 0 |
  |----------------|---|
  |                |b1 |
  |                |b2 |
  |    Matrix A    |...|
  |                |bn |
  |----------------|---|

This needs to be transformed into the matrix T of the form

T = [Kostenzeile,0; MatrixA_Zeile1, b1; MatrixA_Zeile2,b2; ...;MatrixA_Zeilen,bn]

in order for `mySimplex.m` to work.

Its best to call the function as in `[endtableau, x_opt,z_opt]=mySimplex(T)`,
in order to output not only the optimal solution _x_opt_ and its optimal objective value
_z_opt_, but also the corresponding _endtableau_ of the simplex algorithm.
