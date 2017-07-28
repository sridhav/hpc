### Parallel

This project contains the following files

* intcurve-gather.c
    This program uses MPI Gather for ordering the output.
    compile:

        mpicc -lm -o intcurve intcurve-gather.c 
    
    run:

        mpiexec -np 16 ./intcurve 

* intcurve-barrier.c
    This program uses MPI Barrier for ordering the output. [has performance issues]
    compile:
        
        mpicc -lm -o intcurve intcurve-barrier.c 

    run:
        
        mpiexec -np 16 ./intcurve 

* intcurve-updated.c
    This program uses MPI Gather and has some improvements in the code
    compile:

        mpicc -lm -o intcurve intcurve-updated.c 
        
    run:
         
        mpiexec -np 16 ./intcurve 

* ordered.sh
   Its a bash script to order the output.
   Update the bash script to the location of mpiexec.

   compile:
         
        mpicc -lm -o intcurve intcurve.c 
        
   run:
         
        ./ordered.sh -np 16 ./intcurve 
        