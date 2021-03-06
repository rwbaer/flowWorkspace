% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GatingSet_Methods.R
\name{compensate}
\alias{compensate}
\alias{compensate,GatingSetList,ANY-method}
\alias{compensate,cytoset,ANY-method}
\alias{compensate,cytoset,list-method}
\alias{compensate,cytoset,matrix-method}
\alias{compensate,cytoframe,matrix-method}
\alias{compensate,GatingSet,ANY-method}
\title{compensate the flow data asssociated with the GatingSet}
\usage{
\S4method{compensate}{GatingSet,ANY}(x, spillover)
}
\arguments{
\item{x}{\code{GatingSet}, \code{GatingSetList}, \code{cytoframe}, or \code{cytoset}}

\item{spillover}{\code{compensation} object or spillover matrix or a list of \code{compensation} objects}
}
\value{
a \code{GatingSet}, \code{GatingSetList}, \code{cytoframe}, or \code{cytoset} object with the underling flow data compensated.
}
\description{
The compensation is saved in the GatingSet and can be retrieved by \link{gh_get_compensations}.
}
\examples{
\dontrun{

cfile <- system.file("extdata","compdata","compmatrix", package="flowCore")
comp.mat <- read.table(cfile, header=TRUE, skip=2, check.names = FALSE)
## create a compensation object
comp <- compensation(comp.mat,compensationId="comp1")
#add it to GatingSet
gs <- compensate(gs, comp)
}
}
