
library(tidyverse)
library(magrittr)
library(patchwork)

theme_set(theme_light())

# Color palettes:

c("männlich"             = "blue",
  "weiblich"             = "red",
  "keine Angabe"         = "grey") -> colors.gender

c("CDU"                  = "black",
  "SPD"                  = "red",
  "AfD"                  = "blue",
  "FDP"                  = "yellow",
  "Linke"                = "purple",
  "Grüne"                = "darkgreen",
  "Die Partei"           = "#B92837",
  "Humanisten"           = "#d90368",
  "Volt"                 = "#562883",
  "keine Angabe"         = "grey") -> colors.party

# Useful for constructing factors with "keine Angaben" or similar as
# the last level (for plotting):

move.to.end <- function(ss, s) {
  stopifnot(s %in% ss)
  c(ss[which(ss!=s)], s)
}
