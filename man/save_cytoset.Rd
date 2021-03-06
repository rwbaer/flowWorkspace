% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cytoset.R
\name{save_cytoset}
\alias{save_cytoset}
\alias{load_cytoset}
\title{save/load a cytoset to/from disk.}
\usage{
save_cytoset(cs, path, ...)

load_cytoset(path, ...)
}
\arguments{
\item{cs}{A \code{cytoset}}

\item{path}{A character scalar giving the path to save/load the GatingSet to/from.}

\item{...}{other arguments passed to \code{save_gs/load_gs}}
}
\value{
\code{load_cytoset} returns a cytoset object
}
\description{
Save/load a cytoset  to/from the disk.
}
\examples{
\dontrun{
	#G is a GatingSet
	save_cytoset(cs, outdir)
	cs <-load_cytoset(outdir)


}
}
