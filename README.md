# Simplex
A matlab implementation of the Primal Simplex algorithm for optimizing linear optimization programs

`mySimplex.m` contains code to run the simplex algorithm.

Consider having the linear program ![\min \{ cx \, | \, Ax=b, x \geq 0\}](https://render.githubusercontent.com/render/math?math=%5Cmin%20%5C%7B%20cx%20%5C%2C%20%7C%20%5C%2C%20Ax%3Db%2C%20x%20%5Cgeq%200%5C%7D) in a tableau of the form

| costs c  | 0 |
| :-------:|:-:|
| Matrix A | b | 

This needs to be transformed into the matrix T of the form

`T = [c,0; MatrixA_row1, b1; MatrixA_row2,b2; ...;MatrixA_rown,bn]`

in order for `mySimplex.m` to work.

Its best to call the function as in `[endtableau, x_opt,z_opt]=mySimplex(T)`,
in order to output not only the optimal solution `x_opt` and its optimal objective value
`z_opt`, but also the corresponding `endtableau` of the simplex algorithm.
