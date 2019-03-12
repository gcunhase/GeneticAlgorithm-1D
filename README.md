## About
* Simple Genetic Algorithm with **minimization** function
    <p align="left">
    <img src="https://github.com/gcunhase/GeneticAlgorithm-1D/blob/master/ga.png" width="500" alt="Genetic Algorithm">
    </p>

* 1D functions:
    * *x*: population
    * *y*: fitness score

## Running
* Main function: `ga1d.m`
    * First section: Matlab native function, for result comparison
    * Second section: personal code
    * Change fitness function in lines 36 and 37

* Different selection functions:
    * Random
    * Roulette wheel
    * Tournament
    * [TODO] Rank
    * Breeder [[paper1](http://www.muehlenbein.org/breeder93.pdf), [paper2](https://pdfs.semanticscholar.org/26b4/c7112283a85c8b8af43aea73e3c8e8581e9d.pdf)] [[blog link](https://blog.sicara.com/getting-started-genetic-algorithms-python-tutorial-81ffa1dd72f9)]
    * [Roulette vs Rank paper](http://www.ijmlc.org/papers/146-C00572-005.pdf)
    * [Others](https://www.tutorialspoint.com/genetic_algorithms/genetic_algorithms_parent_selection.htm)

## Results
1. \[y = x^4-10x^3-5x^2+4\]
    > Roots: (0.61050, 0.0000344), (10.474, 0.125), (-0.54220+0.57583i, -0.0000217-0.0000448i), (-0.54220-0.57583i, -0.0000217+0.0000448i)
    
    > Population 10, gen 100 

    | Algorithm | Best |
    | --------- | ---- |
    | Matlab    | (7.8102, -1323) |
    | Breeder   | (7.67, -1341.4817) |
    | Random    | too random |
    | Roulette  | (7.82, -1344.2637) |
    | Tournament| (7.81, -1344.2517) |
    | Rank      | (, ) |

## Dependencies
* Tested with Matlab 2018b
* Global Optimization Toolbox: *ga* function in first section
* Communication System Toolbox: *de2bi* and *bi2de* functions in second section
