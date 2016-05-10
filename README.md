# smiley-epsilon
A library of tools for numerical methods used in engineering applications.

## Repository Structure
```
.
├── figures
│   ├── functions
│   │   ├── f1.eps
│   │   ├── f2.eps
│   │   ├── f3.eps
│   │   ├── f4.eps
│   │   └── f5.eps
│   ├── jacobi.eps
│   └── roots
│       ├── f1.eps
│       └── f1.txt
├── functions
│   ├── delta1.m
│   ├── delta2.m
│   ├── delta3.m
│   ├── delta4.m
│   ├── delta5.m
│   ├── f1.m
│   ├── f2.m
│   ├── f3.m
│   ├── f4.m
│   └── f5.m
├── gauss_jordan.m
├── gauss_seidel_legacy.m
├── integration
│   ├── f_test.m
│   ├── integrate.m
│   ├── simpson13.m
│   ├── simpson38.m
│   ├── test.m
│   └── trapezoidal.m
├── jacobi.m
├── jacobi_test.m
├── LICENSE
├── matrices
│   └── linear_eq.mat
├── octave
│   ├── bisect.m
│   ├── bisect_test.m
│   ├── bisect_test_script.m
│   ├── bracketing.m
│   ├── compute_ea.m
│   ├── gauss_seidel.m
│   ├── newton_raphson.m
│   └── open_method.m
├── plot_f.m
├── README.md
└── roots
    ├── bracketing.m
    ├── compute_ea.m
    ├── generic_secant.m
    ├── legacy
    │   ├── bisect.m
    │   ├── bisect_test.m
    │   └── bisect_test_script.m
    ├── newton_raphson.m
    ├── solutions
    └── solveplot.m

```
## Scope

This readme is to describe folder structures and the nitty-gritty details of what each file can do. For an overall description, please see the reports compiled in Latex. **This readme is accompanied by two technical reports for each part**.

## Part 1

### Root finding for non-linear equations

1. Bisection Method
2. False Position Method
3. Secant Method
4. Modified Secant Method
5. Newton-Raphson Method


### Solving Systems of Linear equations
1. Gauss-Jordan Elimination
2. Jacobi Iteration of Gauss-Seidel


## Part 2

### Folder structures

```
.
├── f_test.m              The test function as a blackbox [please see the report]
├── integrate.m           Numerical Integration for given uneven segments
├── simpson13.m           Simpson's 1/3 rule
├── simpson38.m           Simpson's 3/8 rule
├── test.m                A test script to test the whole script
└── trapezoidal.m         The trapezoidal rule
```
## Implementation Notes

1. Since the goal is to eventually code an algorithm to evaluate the integral by using combinations of the rules [as written in the project requirements], we code only single application  of each of them and leave the multiple application for the combining algorithm.
