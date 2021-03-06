% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/phase1_2_outcomes_to_cohorts.R
\name{phase1_2_outcomes_to_cohorts}
\alias{phase1_2_outcomes_to_cohorts}
\title{Break a phase I/II outcome string into a list of cohort parts.}
\usage{
phase1_2_outcomes_to_cohorts(outcomes)
}
\arguments{
\item{outcomes}{character string representing the doses given, outcomes
observed, and timing of analyses. See Description.}
}
\value{
a list with a slot for each cohort. Each cohort slot is itself a
list, containing elements:
* \code{dose}, the integer dose delivered to the cohort;
* \code{outcomes}, a character string representing the \code{E}, \code{T}
\code{N} or \code{B} outcomes for the patients in this cohort.
}
\description{
Break a phase I/II outcome string into a list of cohort parts.

Break a phase I/II outcome string into a list of cohort parts.

The outcome string describes the doses given, outcomes observed and the
timing of analyses that recommend a dose. The format of the string is
described in Brock _et al_. (2017).

The letters E, T, N & B are used to represents patients that experienced
(E)fficacy, (T)oxicity, (N)either and (B)oth. These letters are concatenated
after numerical dose-levels to convey the outcomes of cohorts of patients.
For instance, \code{2NET} represents a cohort of three patients that were
treated at dose-level 2, one of whom experienced toxicity only, one that
experienced efficacy only, and one that had neither.
The results of cohorts are separated by spaces and it is assumed that a
dose-finding decision takes place at the end of a cohort. Thus,
\code{2NET 1NN} builds on our previous example, where the next cohort of two
were treated at dose-level 1 and neither of these patients experienced
either event See examples.
}
\examples{
x = phase1_2_outcomes_to_cohorts('1NEN 2ENT 3TB')
length(x)
x[[1]]$dose
x[[1]]$outcomes
x[[2]]$dose
x[[2]]$outcomes
x[[3]]$dose
x[[3]]$outcomes

}
\references{
Brock, K., Billingham, L., Copland, M., Siddique, S., Sirovica, M., & Yap, C.
(2017). Implementing the EffTox dose-finding design in the Matchpoint trial.
BMC Medical Research Methodology, 17(1), 112.
https://doi.org/10.1186/s12874-017-0381-x
}
