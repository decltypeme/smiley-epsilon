# smiley-epsilon
A library of tools for numerical methods used in engineering applications.

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
