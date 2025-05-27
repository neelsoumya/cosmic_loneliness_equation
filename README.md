# cosmic_loneliness_equation

## Introduction

Cosmic loneliness equation

## Code

`script.R` Code to calculate the minimum value of the lifetime of an advanced civilization so that it can detect the presence of another advanced radio transmitting civilization

https://github.com/neelsoumya/cosmic_loneliness_equation/blob/main/script.R

`app.R` an interactive graphical user interface for playing around with the parameters

https://github.com/neelsoumya/cosmic_loneliness_equation/blob/main/cosmic_loneliness/app.R

`distance_function_plot_drake.ipynb`: IPython notebook to plot function of distance

https://github.com/neelsoumya/cosmic_loneliness_equation/blob/main/distance_function_plot_drake.ipynb

`drake_generalization.R`: Stochastic version of Drake equation

https://github.com/neelsoumya/cosmic_loneliness_equation/blob/main/drake_generalization.R

## Installation

* Install R

    https://www.r-project.org/

* and R Studio

https://www.rstudio.com/products/rstudio/download/preview/

* Install the following packages in R:

```r
install.packages('rmarkdown')
install.packages('knitr')
install.packages('ggplot2')
install.packages('shiny')

```

or

run the following script `installer_R.R` from the command line

```r
R --no-save < installer_R.R

```

* Download a zip file of this repository and unzip it

or

clone it 

```r
git clone https://github.com/neelsoumya/cosmic_loneliness_equation

cd cosmic_loneliness_equation
```

* Go to this new directory and set working directory to this directory in R Studio.

```r
setwd('~/cosmic_loneliness_equation')
```

In R Studio run the script `script.R` (by clicking on the `Source` button)

or

Go to your terminal

and type

```r
R --no-save < script.R
```


* The shiny app `app.R` is an interactive graphical user interface for playing around with the parameters

https://github.com/neelsoumya/cosmic_loneliness_equation/blob/main/cosmic_loneliness/app.R

It can be run with the following command from the R command line (from the root of the directory)

```r
library(shiny)
shiny::runApp('cosmic_loneliness')

```

or open the file `app.R`

https://github.com/neelsoumya/cosmic_loneliness_equation/blob/main/cosmic_loneliness/app.R

in R Studio and click on the button named `Run App`


## Application

A free instance of this shiny application can also be accessed here

https://sb2333medschl.shinyapps.io/cosmic_loneliness



## Resources

http://www.netlogoweb.org/launch#http://ccl.northwestern.edu/netlogo/models/models/Sample%20Models/Biology/Fireflies.nlogo

https://www.wolframalpha.com/input?i2d=true&i=Divide%5B1%2CPower%5B%5C%2840%29x-10%5C%2841%29%2C2%5D%2B5%5D

https://ccl.northwestern.edu/netlogo/models/Daisyworld


## Manuscript and citation

Forthcoming

## Contact

Soumya Banerjee

sb2333@cam.ac.uk

neel.soumya@gmail.com


