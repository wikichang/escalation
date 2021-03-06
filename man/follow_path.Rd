% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/follow_path.R
\name{follow_path}
\alias{follow_path}
\title{Follow a pre-determined dose administration path.}
\usage{
follow_path(path)
}
\arguments{
\item{path}{Follow this outcome path. See \code{\link{parse_phase1_outcomes}}.}
}
\value{
an object of type \code{\link{selector_factory}} that can fit a
dose-finding model to outcomes.
}
\description{
This method creates a dose selector that will follow a pre-specified trial
path. Whilst the trial path is matched by realised outcomes, the selector
will recommend the next dose in the desired sequence. As soon as the observed
outcomes diverge from the desired path, the selector stops giving dose
recommendations. This makes it possible, for instance, to specify a fixed
escalation plan that should be followed until the first toxicity is seen.
This tactic is used by some model-based designs to get rapidly to the doses
where the action is. See, for example, the dfcrm package and Cheung (2011).
}
\examples{
model1 <- follow_path(path = '1NNN 2NNN 3NNN 4NNN')

fit1 <- model1 \%>\% fit('1NNN 2N')
fit1 \%>\% recommended_dose()
fit1 \%>\% continue()
# The model recommends continuing at dose 2 because the observed outcomes
# perfectly match the desired escalation path.

fit2 <- model1 \%>\% fit('1NNN 2NT')
fit2 \%>\% recommended_dose()
fit2 \%>\% continue()
# Uh oh. Toxicity has now been seen, the outcomes diverge from the sought
# path, hence this class recommends no dose now.
# At this point, we can hand over dose selection decisions to another class
# by chaining them together, like:
model2 <- follow_path(path = '1NNN 2NNN 3NNN 4NNN') \%>\%
  get_dfcrm(skeleton = c(0.05, 0.1, 0.25, 0.4, 0.6), target = 0.25)
fit3 <- model2 \%>\% fit('1NNN 2NT')
# Now the CRM model is using all of the outcomes to calculate the next dose:
fit3 \%>\% recommended_dose()
fit3 \%>\% continue()
}
\references{
Cheung. Dose Finding by the Continual Reassessment Method. 2011.
Chapman and Hall/CRC. ISBN 9781420091519
}
