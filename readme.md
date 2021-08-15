# readme for socialNet application

## purpose

A R shiny application that generates an ego network of 10 alters named by the ego. This application was created as a teaching tool for PL4246, Networks in Psychology. 

Application flow: 

1. List 10 social contacts.  
2. Indicate whether the individual knows the other 9 individuals, repeat for each of the 10.  
3. Generates a 10x10 adjacency matrix that can be copied into a text editor for network analysis, see `sna.txt` and `example.R` for an example. 
   1. TRUE = node_i (row) knows node_j (column), FALSE otherwise 
   2. This matrix is not necessarily symmetrical. 

The application does not retain any personal data. 

## how to use

### local deployment

Assumes you have R and RStudio installed and know your way around it. 

The following packages are needed: `shiny`, `shinyjs`, `shinyPsych`

Note: `shinyPsych` is no longer updated, sadly. You need to download it directly from github and then manually install dependencies. Here is the code that worked for me (R 4.0.2), but cannot guarantee that it will continue to work in the future. 

```R
install.packages('devtools') # if needed
# from https://github.com/mdsteiner/ShinyPsych/ 
devtools::install_github("mdsteiner/ShinyPsych", 
                         build = TRUE, 
                         build_opts = c("--no-resave-data", "--no-manual")) 

# missing dependency: retimes 
# you may need to install retimes first then shinypsych
devtools::install_version("retimes", version="0.1-2")` # to get the version archived on CRAN 
```

Download the files in this repository by clicking on 'Code', 'Download ZIP'.

Open the `app.R` file in Rstudio, make sure your working directory is pointed to wherever the app files are at, and then click on 'Run App'. 

### online app 

A demo of this application can be found here: http://r-server.csqsiew.xyz/socialNet/ 

## final notes

last updated: 15th August 2021 

Please feel free to adapt for your own use. 

If you found this useful, feel free to tip me here: https://ko-fi.com/csqsiew or check out my work here: http://hello.csqsiew.xyz/ 

Thanks! :)

