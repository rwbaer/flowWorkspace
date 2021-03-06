% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GatingHierarchy_Methods.R
\name{gh_get_transformations}
\alias{gh_get_transformations}
\alias{getTransformations}
\alias{getTransformations,GatingHierarchy-method}
\title{Return a list of transformations or a transformation in a GatingHierarchy}
\usage{
gh_get_transformations(
  x,
  channel = NULL,
  inverse = FALSE,
  only.function = TRUE,
  ...
)
}
\arguments{
\item{x}{A \code{GatingHierarchy} object}

\item{channel}{\code{character} channel name}

\item{inverse}{\code{logical} whether to return the inverse transformation function. Valid when only.funtion is TRUE}

\item{only.function}{\code{logical} whether to return the function or the entire transformer object(see \code{scales} package) that contains transform and inverse and breaks function.}

\item{...}{other arguments
equal.spaced \code{logical} passed to the breaks functio to determine whether to break at 10^n or equally spaced intervals}
}
\value{
lists of functions(or transform objects when only.function is FALSE), with each element of the list representing a transformation applied to a specific
channel/parameter of a sample.
}
\description{
Return a list of all the transformations or a transformation in a GatingHierarchy
}
\details{
Returns a list of the transformations or a transformation in the flowJo workspace.
The list is of length \code{L}, where \code{L} is the number of distinct transformations applied to samples
in the \code{flowjo_workspace}. Each element of \code{L} is itself a \code{list} of length \code{M},
where \code{M} is the number of parameters that were transformed for a sample or group of samples
in a \code{flowjo_workspace}. For example, if a sample has 10 parameters, and 5 are transformed during analysis,
using two different sets of transformations, then L will be of length 2, and each element of L will be of length 5.
The elements of \code{L} represent channel- or parameter-specific transformation functions that map from raw intensity values
to channel-space used by flowJo.
}
\examples{
\dontrun{
	#Assume gh is a GatingHierarchy
	gh_get_transformations(gh); # return a list transformation functions
 gh_get_transformations(gh, inverse = TRUE); # return a list inverse transformation functions
 gh_get_transformations(gh, channel = "FL1-H") # only return the transfromation associated with given channel
 gh_get_transformations(gh, channel = "FL1-H", only.function = FALSE) # return the entire transform object
}
}
