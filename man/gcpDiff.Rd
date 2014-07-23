\name{gcpDiff}
\alias{gcpDiff}
\title{
  Diffence on xyz coordinates between ground control points (GCP)
}
\description{
  This function estimates the difference, absolute difference, and squared 
  difference on x, y and z coordinates of two sets of ground control points
  (GCPs). It also estimates the module (difference vector), its square and
  azimuth. The result is an object of class \code{data.frame} ready to be used 
  to define a object of class \code{spsurvey.object}.
}
\usage{
gcpDiff(measured, predicted, type = "xy", aggregate = FALSE, rounding = 0)
}
\arguments{
  \item{measured}{
  Reference ground control points. An object of class 
  \code{\linkS4class{SpatialPointsDataFrame}}. A column named \sQuote{siteID}
  giving case names is mandatory. See \sQuote{Details}, item
  \sQuote{Type of data}.
  }
  \item{predicted}{
  Point data being validated. An object of class
  \code{\linkS4class{SpatialPointsDataFrame}}. A column named \sQuote{siteID}
  giving case names is mandatory. See \sQuote{Details}, item
  \sQuote{Type of data}.
  }
  \item{type}{
  Type of data under analysis. Defaults to \code{type = "xy"}. \sQuote{Details},
  item \sQuote{Type of data}.
  }
  \item{aggregate}{boolean for aggregating the data when it comes from
  Cluster sampling. Used only when \code{type = "z"}. Defaults to 
  \code{aggregate = FALSE}. See \sQuote{Details}, item 
  \sQuote{Data aggregation}.
  }
  \item{rounding}{
  Rounding level of the data in the output data frame.
  }
}
\details{

\subsection{Type_of_data}{

Two types of validation data that can be submitted to function
\code{gcpDiff()}: those coming from horizontal (positional) validation exercises
(\code{type = "xy"}), and those coming from vertical validation exercises
(\code{type = "z"}).

Horizontal (positional) validation exercises compare the position of 
\code{measured} point data with the position of \code{predicted} point data. 
Horizontal displacement (error) is measured in both \sQuote{x} and \sQuote{y} 
coordinates, and is used to calculate the error vector (module) and its azimuth. 
Both objects \code{measured} and \code{predicted} used with function 
\code{gcpDiff()} must be of class \code{SpatialPointsDataFrame}. They must have 
at least one column named \sQuote{siteID} giving the identification of evary
case. Matching of case IDs is mandatory. Other columns are discarded.

Vertical validation exercises are interested in comparing the \code{measured} 
value of a variable at a given location with that \code{predicted} by some
model. In this case, error statistics are calculated only for the the vertical 
displacement (error) in the \sQuote{z} coordinate. Both objects \code{measured} 
and \code{predicted} used with function \code{gcpDiff()} must be of class
\code{SpatialPointsDataFrame}. They also must have a column named 
\sQuote{siteID} giving the identification of evary case. Again, matching of case
IDs is mandatory. However, both objects must have a column named \sQuote{z} 
which contains the values of the \sQuote{z} coordinate. Other columns are 
discarded.
}
\subsection{Data_aggregation}{

Validation is sometimes performed using cluster or transect sampling. Before 
estimation of error statistics, the data needs to be aggregated by cluster or
transect. The function \code{gcpDiff()} aggregates validation data of
\code{type = "z"} calculating the mean value per cluster. Thus, aggregation can
only be properly done if the \sQuote{siteID} column of both objects 
\code{measured} and \code{predicted} provides the identification of clusters. 
Setting \code{aggregate = TRUE} will return aggregated estimates of error
statistics. If the data has been aggregated beforehand, the parameter 
\code{aggregate} can be set to \code{FALSE}.
}
\subsection{Case_matching}{

There are circumstances in which the number of cases in the object 
\code{measured} is larger than that in the object \code{predicted}. The function
\code{gcpDiff()} compares the number of cases in both objects and automatically 
drops those cases of object \code{measured} that do not match the cases of
object \code{predicted}. However, case matching can only be done if case IDs are
exactly the same for both objects. Otherwise, estimated error statistics will 
have no meaning at all.
}
}
\value{
An object of class \code{data.frame} ready to be used to feed the argument 
'data.cont' when creating a \code{spsurvey.analysis} object.
}
\references{
Kincaid, T. M. and Olsen, A. R. (2013). spsurvey: Spatial Survey
  Design and Analysis. R package version 2.6. URL: 
  \url{http://www.epa.gov/nheerl/arm/}.
}
\author{
Alessandro Samuel-Rosa <\email{alessandrosamuelrosa@gmail.com}>
}
\note{
Data of \code{type = "xy"} cannot be submitted to cluster aggregation at the 
present version (1.0) of \pkg{pedometrics}-package.
}
\seealso{
\code{\link[pedometrics]{coordenadas}},
\code{\link[pedometrics]{gcpVector}},
\code{\link[spsurvey]{spsurvey.analysis}}.
}
\examples{
\dontrun{
## Create an spsurvey.analysis object
my.spsurvey <- 
  spsurvey.analysis(design = coordenadas(my.data),
                    data.cont = delta(ref.data, my.data),
                    popcorrect = TRUE, pcfsize = length(my.data$id),
                    support = rep(1, length(my.data$id)),
                    wgt = rep(1, length(my.data$id)), vartype = "SRS")
}
}
\keyword{methods}