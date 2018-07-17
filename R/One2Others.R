# Get distance of a single samples to all the other samples
One2Others <- function(ts, ind, adj=NA) {
  # ts    A list of tSNE matrix
  # ind   Row index of a sample in the tSNE matrix whose to all other samples will be calculated
  # adj   Rescaling factor, a vector of positive number with the same length of <ts> if not NA
  
  d <- sapply(ts, function(a) {
    x <- a[ind, 1];
    y <- a[ind, 2];
    sqrt((x-a[,1])^2 + (y-a[,2])^2);
  });
  
  if (!identical(NA, adj) & length(adj)==length(ts)) {
    for (i in 1:ncol(d)) d[, i] <- adj[i] * d[, i];
  }; 
  
  rownames(d) <- rownames(ts[[1]]);
  
  d; 
}; 