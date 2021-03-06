% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotCor.R
\name{plotCor}
\alias{plotCor}
\title{Correlation plot}
\usage{
plotCor(r, r2, col, breaks, col.names, ...)
}
\arguments{
\item{r}{Square matrix with correlation values.}

\item{r2}{(optional) A second square matrix with correlation values.}

\item{col}{(optional) Color table to use for \code{image} -- see \code{\link[graphics]{image}} for details. The
default is a colorblind-friendly palette (\code{"RdBu"}) created using \code{\link[RColorBrewer]{brewer.pal}}.}

\item{breaks}{(optional) Break points in sorted order to indicate the intervals for assigning the colors.
See \code{\link[fields]{image.plot}} for more details.}

\item{col.names}{(optional) Character vector with short (up to 5 characters) column names.}

\item{...}{(optional) Additional parameters passed to plotting functions.}
}
\value{
A correlation plot.
}
\description{
Plotting correlation matrices.
}
\details{
A correlation plot in an alternative and interesting way of showing the strength of correlations between
variables. This is done by using a diverging color palette, where the darker the color, the stronger the
absolute correlation.

\code{plotCor} also enables comparing correlations between the same variables at different points in time or
space or for different observations. This can be done by passing two square correlation matrices using
arguments \code{r} and \code{r2}. The lower triangle of the resulting correlation plot will contain correlations
from \code{r}, correlations from \code{r2} will be in the upper triangle, and the diagonal will be empty.
}
\examples{
data(meuse, package = "sp")
cols <- c("cadmium", "copper", "lead", "zinc", "elev", "dist", "om")

# A single correlation matrix
r <- cor(meuse[1:20, cols], use = "complete")
r <- round(r, 2)
plotCor(r)

# Two correlation matrices: r2 goes in the upper triangle
r2 <- cor(meuse[21:40, cols], use = "complete")
r2 <- round(r2, 2)
plotCor(r, r2)

}
\author{
Alessandro Samuel-Rosa \email{alessandrosamuelrosa@gmail.com}
}
