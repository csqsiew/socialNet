x <- read.delim('sna.txt', sep = ' ')
row.names(x) <- colnames(x)

library(igraph)

g <- graph_from_adjacency_matrix(as.matrix(x))
g
