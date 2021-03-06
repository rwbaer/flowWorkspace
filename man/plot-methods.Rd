% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GatingHierarchy_Methods.R
\name{plot-methods}
\alias{plot-methods}
\alias{plot}
\alias{plot,GatingSet,missing-method}
\alias{plot,GatingSet,character-method}
\title{plot a gating tree}
\usage{
plot(x,y, ...)
}
\arguments{
\item{x}{\code{GatingHierarchy} or \code{GatingSet}. If \code{GatingSet}, the first sample will be used to extract gating tree.}

\item{y}{\code{missing} or \code{character} specifies.}

\item{...}{other arguments:
\itemize{
\item{boolean}: \code{TRUE|FALSE} logical specifying whether to plot boolean gate nodes. Defaults to FALSE.
\item{showHidden}: \code{TRUE|FALSE} logical whether to show hidden nodes
\item{layout}:
        See \code{\link[Rgraphviz]{layoutGraph}} in package Rgraphviz
\item{width}:
        See \code{\link[Rgraphviz]{layoutGraph}} in package Rgraphviz
\item{height}:
        See \code{\link[Rgraphviz]{layoutGraph}} in package Rgraphviz
\item{fontsize}:
     See \code{\link[Rgraphviz]{layoutGraph}} in package Rgraphviz
\item{labelfontsize}:
     See \code{\link[Rgraphviz]{layoutGraph}} in package Rgraphviz
\item{fixedsize}:
     See \code{\link[Rgraphviz]{layoutGraph}} in package Rgraphviz
}}
}
\description{
Plot a tree/graph representing the GatingHierarchy
}
\examples{
\dontrun{
 #gs is a GatingSet
 plot(gs) # the same as plot(gs[[1]])
 #plot a substree rooted from 'CD4'
 plot(gs, "CD4")

}

}
