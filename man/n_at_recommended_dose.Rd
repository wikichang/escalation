% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{n_at_recommended_dose}
\alias{n_at_recommended_dose}
\title{Number of patients treated at the recommended dose.}
\usage{
n_at_recommended_dose(x, ...)
}
\arguments{
\item{x}{Object of class \code{\link{selector}}}

\item{...}{arguments passed to other methods}
}
\value{
an integer
}
\description{
Get the number of patients evaluated at the recommended dose.
}
\examples{
# CRM example
skeleton <- c(0.05, 0.1, 0.25, 0.4, 0.6)
target <- 0.25
outcomes <- '1NNN 2NTN'
fit <- get_dfcrm(skeleton = skeleton, target = target) \%>\% fit(outcomes)
fit \%>\% n_at_recommended_dose()
}
