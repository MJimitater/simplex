# simplex
A matlab implementation of the Primal Simplex algorithm for optimizing linear optimization programs

`mySimplex.m` contains code to run the simplex algorithm.

Consider having the linear program `min{cx|Ax=b, x≥0}` in a tableau of the form

```
  |----------------|---|
  | costs c        | 0 |
  |----------------|---|
  |                |b1 |
  |                |b2 |
  |    Matrix A    |...|
  |                |bn |  
  |----------------|---|
  ```

This needs to be transformed into the matrix T of the form

`T = [c,0; MatrixA_row1, b1; MatrixA_row2,b2; ...;MatrixA_rown,bn]`

in order for `mySimplex.m` to work.

Its best to call the function as in `[endtableau, x_opt,z_opt]=mySimplex(T)`,
in order to output not only the optimal solution `x_opt` and its optimal objective value
`z_opt`, but also the corresponding `endtableau` of the simplex algorithm.
