rule all:
    input: "mtcars.png"
#snakemake documentation: rule "all" is a pseudo-rule that collects the target files-
#eg, your all rule must actually have, as *inputs* your intended outputs. Why? couldn't tell you. 
#Found under FAQ in documentation: "how do I run my rule on all files of a certain directory?"

rule mkdatabase:
    input: 
        "mtcars_database_snakemake.R"
    output: 
        "mtcars.sqlite3"
    shell: 
        "Rscript {input}"

rule mkplot:
    input: 
        "mtcars.sqlite3",
        "mtcars_plot_snakemake.py"
    output: 
        "mtcars.png"
    shell: "python mtcars_plot_snakemake.py" #why is this step actually so important?
#it seems a big issue you were having was thinking that the 'shell' part of this was a print() statement-- 
#it obviously is NOT. shell: python {input} won't cut it either, since you have two inputs. 

#I tried to do this another way, eg assigning the input files to variables and then changing the shell script:
# "python {variable}", for example, does not work. 

#snakemake rule called all is a "key hint" -Kevin 
#you would call snakemake --cores 1 mtcars.png

