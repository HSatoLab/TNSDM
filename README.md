# TNSDM

TNSDM is a MATLAB implementation of a constrained multi-objective evolutionary optimization algorithm that combines two-stage non-dominated sorting and directed mating.

This code is designed to work with the [PlatEMO](https://github.com/BIMK/PlatEMO) platform for evolutionary multi-objective optimization.

## Keywords

MATLAB, PlatEMO, evolutionary algorithms, multi-objective optimization, constrained optimization, two-stage non-dominated sorting, directed mating

## How to run

  1. Download [PlatEMO](https://github.com/BIMK/PlatEMO/releases).

  2. Copy the TNSDM directory into "Algorithms/Multi-objective optimization".

  3. Run TNSDM in the same manner as other algorithms in PlatEMO.

## Paper
Minami Miyakawa, Keiki Takadama, and Hiroyuki Sato, ``Two-stage Non-dominated Sorting and Directed Mating for Solving Problems with Multi-objectives and Constraints,'' *In Proceedings of the 15th annual conference on Genetic and evolutionary computation (GECCO '13)*, Association for Computing Machinery, New York, NY, USA, pp. 647--654, 2013.
https://doi.org/10.1145/2463372.2463449

```
@inproceedings{10.1145/2463372.2463449,
author = {Miyakawa, Minami and Takadama, Keiki and Sato, Hiroyuki},
title = {Two-stage non-dominated sorting and directed mating for solving problems with multi-objectives and constraints},
year = {2013},
isbn = {9781450319638},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/2463372.2463449},
doi = {10.1145/2463372.2463449},
abstract = {We propose a novel constrained MOEA introducing a parents selection based on a two-stage non-dominated sorting of solutions and directed mating in the objective space. In the parents selection, first, we classify the entire population into several fronts by non-dominated sorting based on constraint violation values. Then, we re-classify each obtained front by non-dominated sorting based on objective function values, and select the parents population from upper fronts. The two-stage non-dominated sorting leads to find feasible solutions having better objective function values in the evolutionary process of infeasible solutions. Also, in the directed mating, we select a primary parent from the parents population and pick solutions dominating the primary parent from the entire population including infeasible solutions. Then we select a secondary parent from the picked solutions and apply genetic operators. The directed mating utilizes valuable genetic information of infeasible solutions to enhance convergence of each primary parent toward its search direction in the objective space. We compare the search performance of the two proposed algorithms using greedy selection (GS) and tournament selection (TS) in the directed mating with the conventional CNSGA-II and RTS algorithms on SRN, TNK, OSY and m objectives k knapsacks problems. We show that the proposed algorithms achieve higher search performance than CNSGA-II and RTS on all benchmark problems used in this work.},
booktitle = {Proceedings of the 15th Annual Conference on Genetic and Evolutionary Computation},
pages = {647–654},
numpages = {8},
keywords = {constraint-handling, directed mating, evolutionary multi-objective optimization, two-stage non-dominated sorting},
location = {Amsterdam, The Netherlands},
series = {GECCO '13}
}
```
