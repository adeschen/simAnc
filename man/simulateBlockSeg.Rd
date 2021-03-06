% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simGenotypeInternal.R
\name{simulateBlockSeg}
\alias{simulateBlockSeg}
\title{simulateBlockSeg}
\usage{
simulateBlockSeg(snv, nbSim)
}
\arguments{
\item{snv}{a \code{data.frame}}

\item{nbSim}{\code{integer} number of simulation}
}
\value{
a \code{matrix} of 0,1 coding a selection of the left or right (father or mother haplotype)
if seg is NA always 0
LAF == 1 left is lap LAF == 0 left is 1-lap because of
the function genoMatrix(...)
}
\description{
Select for each SNV which haplotype (left or right, father or mother) are lap
}
\examples{

# TODO

}
\author{
Pascal Belleau, Astrid Deschenes and
Alexander Krasnitz
}
\keyword{internal}
