#mtcars = r.mtcars  apparently unnecessary

import sqlite3 # Built into the Python language!
con = sqlite3.connect("mtcars.sqlite3") #this is not directly copied from the week 3 python script- 
#had to change the filename used. Not sure where mtcars_from_pandas.sqlite3 actually came from last week,
#either, as we never named a file that...
import pandas as pd
mtcarsdf = pd.read_sql("select * from mtcars", con)

import seaborn as sns
sns.set()

# Make the plot using seaborn
g = sns.FacetGrid(mtcarsdf, col="cyl")
plot = g.map(sns.scatterplot,"wt","mpg")
# Save plot to file
plot.savefig('mtcars.png')

#Why did this work when run as python mtcars_plot_snakemake.R in the ubuntu subshell but not here???
