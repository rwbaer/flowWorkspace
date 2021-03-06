% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cytoframe.R
\name{cf_keyword_insert}
\alias{cf_keyword_insert}
\alias{cf_keyword_rename}
\alias{cf_keyword_delete}
\title{\code{cytoframe} keyword access methods}
\usage{
cf_keyword_insert(cf, keyword, value)

cf_keyword_delete(cf, keyword)

cf_keyword_rename(cf, from, to)
}
\arguments{
\item{cf}{a \code{cytoframe}}

\item{keyword}{the keyword name to insert/delete/replace}

\item{value}{the value to associate with the supplied keyword}

\item{from}{the old keyword name (for renaming)}

\item{to}{the new keyword name (for renamiing)}
}
\description{
These methods allow for direct insertion, deletion, or renaming
of keywords in \code{\link{cytoframe}} objects.
}
