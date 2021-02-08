
Mtcars data: 
![mtcars](github png url here)

Answers to questions:
1. How do you delete all output from a snakemake work flow?
    * from documentation: command line interface section: snakemake --delete-all-output
2. How do you delete output from a single snakemake rule?
    * not sure, but perhaps you could make the output section of each particular rule output: temp("file"), and if it isn't called in another rule it should be deleted automatically
3. What is the citation for snakemake?
    * Köster, Johannes and Rahmann, Sven. “Snakemake - A scalable bioinformatics workflow engine”. Bioinformatics 2012.

Touch R file:
```
(base) paula@Paula-Surface-Book-2:~/InformaticsWeek4HW$ touch mtcars_database_snakemake.R
(base) paula@Paula-Surface-Book-2:~/InformaticsWeek4HW$ snakemake --cores 1 mtcars.png
Building DAG of jobs...
Using shell: /usr/bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       mkdatabase
        1       mkplot
        2

[Sun Feb  7 16:29:37 2021]
rule mkdatabase:
    input: mtcars_database_snakemake.R
    output: mtcars.sqlite3
    jobid: 1

[Sun Feb  7 16:29:39 2021]
Finished job 1.
1 of 2 steps (50%) done

[Sun Feb  7 16:29:39 2021]
rule mkplot:
    input: mtcars.sqlite3, mtcars_plot_snakemake.py
    output: mtcars.png
    jobid: 0

[Sun Feb  7 16:29:41 2021]
Finished job 0.
2 of 2 steps (100%) done
Complete log: /home/paula/InformaticsWeek4HW/.snakemake/log/2021-02-07T162937.893613.snakemake.log
```

Touch python file:
```
(base) paula@Paula-Surface-Book-2:~/InformaticsWeek4HW$ touch mtcars_plot_snakemake.py
(base) paula@Paula-Surface-Book-2:~/InformaticsWeek4HW$ snakemake --cores 1 mtcars.png
Building DAG of jobs...
Using shell: /usr/bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       mkplot
        1

[Sun Feb  7 16:30:58 2021]
rule mkplot:
    input: mtcars.sqlite3, mtcars_plot_snakemake.py
    output: mtcars.png
    jobid: 0

[Sun Feb  7 16:31:00 2021]
Finished job 0.
1 of 1 steps (100%) done
Complete log: /home/paula/InformaticsWeek4HW/.snakemake/log/2021-02-07T163058.562850.snakemake.log
```