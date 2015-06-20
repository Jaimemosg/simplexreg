\name{summary.simplexreg}
\alias{summary.simplexreg}
\alias{print.summary.simplexreg}
\alias{coef.simplexreg}
\alias{AIC.simplexreg}
\title{Extracting Information from Objects simplexreg}
\description{Methods for extracting information from fitted simplex regression model
objects of class \code{"simplexreg"}}
\usage{
## S3 method for class 'simplexreg'
\method{summary}{simplexreg}(object, type = "stdPerr", ...)

## S3 method for class 'simplexreg'
\method{coef}{simplexreg}(object, ...)

## S3 method for class 'simplexreg'
\method{AIC}{simplexreg}(object, ..., k = 2)
}
\arguments{
	\item{object}{fitted model object of class "simplexreg"}
	\item{type}{character specifying type of residuals to be included, see 
	\code{\link{residuals.simplexreg}}}
	\item{k}{numeric penalty per parameter to be used, default value is 2}
	\item{...}{currently not used}
}
\details{These functions make it possible to extract information from objects of class
\code{"simplexreg"}. Wald statistics as well as the p-values of regression coefficients 
are given in the \code{summary} output. If \code{GEE = FALSE}, based on the fitted 
coefficients, a \eqn{\chi^2} test is performed and the p-value is reported in the output. 
Otherwise, coefficients of the autocorrelation \eqn{\alpha}, \eqn{\rho}, (see Song 
\emph{et. al} (2004)), are also involved. 

Model coefficients as well as their standard deviations could be extracted by the \code{\link{coef}}.
For simplex GEE models (\code{GEE = TRUE}), \code{\link{coef}} can also extract information about
\eqn{\alpha} and \eqn{\rho}. For simplex GLM models (\code{GEE = FALSE}), Akaike's 'An Information 
Criterion' could be calculated by the generic function \code{\link{AIC}}. 
}

\references{Barndorff-Nielsen,  O.E. and  Jorgensen, B. (1991)
     Some parametric models on the simplex.
     \emph{ Journal of  Multivariate Analysis,} \bold{ 39:} 106--116
     
     Jorgensen, B. (1997)
   \emph{ The Theory of Dispersion Models}. London: Chapman and Hall
   
    Song, P. and Qiu, Z. and Tan, M. (2004) Modelling Heterogeneous Dispersion in 
   Marginal Models for Longitudinal Proportional Data. \emph{ Biometrical Journal,} 
   \bold{ 46:} 540--553
%% ~put references to the literature/web site here ~
}
\author{Chengchun Shi
}

\seealso{\code{\link{simplexreg}}, \code{\link{residuals.simplexreg}}}
\examples{
## fit the model
data("sdac", package = "simplexreg")
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age, type = "hetero", link = "logit", 
  data = sdac)

data("retinal", package = "simplexreg")
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time, type = "hetero", 
  link = "logit", corr = "AR1", id = ID, data = retinal)  
  
## extract information
summary(sim.glm2, type = "appstdPerr")
coef(sim.glm2)
AIC(sim.glm2)

summary(sim.gee2, type = "stdscor")
coef(sim.gee2)
}