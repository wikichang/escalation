% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{prob_recommend}
\alias{prob_recommend}
\title{Probability of recommendation}
\usage{
prob_recommend(x, ...)
}
\arguments{
\item{x}{Object of type \code{\link{simulations}}.}

\item{...}{arguments passed to other methods}
}
\value{
vector of probabilities
}
\description{
Get the probabilities that each of the doses under investigation is
recommended.
}
\examples{
true_prob_tox <- c(0.12, 0.27, 0.44, 0.53, 0.57)
sims <- get_three_plus_three(num_doses = 5) \%>\%
  simulate_trials(num_sims = 50, true_prob_tox = true_prob_tox)
sims \%>\% prob_recommend
}
