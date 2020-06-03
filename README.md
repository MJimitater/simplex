# Simplex
A matlab implementation of the Primal Simplex algorithm for optimizing linear optimization programs.

`mySimplex.m` contains code to run the simplex algorithm.

Consider having the linear program ![\min \{ cx \, | \, Ax=b, x \geq 0\}](https://render.githubusercontent.com/render/math?math=%5Cmin%20%5C%7B%20cx%20%5C%2C%20%7C%20%5C%2C%20Ax%3Db%2C%20x%20%5Cgeq%200%5C%7D) in a tableau of the form

| costs c  | 0 |
| :-------:|:-:|
| Matrix A | b | 

This needs to be transformed into the matrix ![T](https://render.githubusercontent.com/render/math?math=T) of the form

![\begin{align*} T =      \begin{bmatrix}     c_1 & \ldots &  c_n  &  0 \\     A_{1,1} & \ldots & A_{1,n} & b_1\\     \vdots  & \vdots & \vdots & \vdots \\     A_{n,1} & \ldots & A_{n,n} & b_n\\     \end{bmatrix} \end{align*}](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Balign*%7D%20T%20%3D%20%20%20%20%20%20%5Cbegin%7Bbmatrix%7D%20%20%20%20%20c_1%20%26%20%5Cldots%20%26%20%20c_n%20%20%26%20%200%20%5C%5C%20%20%20%20%20A_%7B1%2C1%7D%20%26%20%5Cldots%20%26%20A_%7B1%2Cn%7D%20%26%20b_1%5C%5C%20%20%20%20%20%5Cvdots%20%20%26%20%5Cvdots%20%26%20%5Cvdots%20%26%20%5Cvdots%20%5C%5C%20%20%20%20%20A_%7Bn%2C1%7D%20%26%20%5Cldots%20%26%20A_%7Bn%2Cn%7D%20%26%20b_n%5C%5C%20%20%20%20%20%5Cend%7Bbmatrix%7D%20%5Cend%7Balign*%7D)

in order for `mySimplex.m` to work.

Its best to call the function as in `[endtableau, x_opt,z_opt]=mySimplex(T)`,
in order to output not only the optimal solution `x_opt` and its optimal objective value
`z_opt`, but also the corresponding `endtableau` of the simplex algorithm.
