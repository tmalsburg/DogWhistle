
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
  if (! s %in% ss) {
    warning("String to be moved to end not in vector.")
    return(ss)
  }
  c(ss[which(ss!=s)], s)
}

# Plot demographics:

plot.demographics <- function(x) {

  ## Age:

  ggplot(x, aes(age)) +
    geom_histogram(breaks=seq(0, 100, 3)) +
    scale_x_continuous("Age",
      limits=c(0, 100),
      breaks=seq(0, 100, 10)) +
    scale_y_continuous(
      breaks=seq(0, 100, 2)) +
    geom_vline(xintercept=18, col="red") -> p.age

  ## Gender:

  x %>%
    group_by(gender) %>%
    summarize(count=n()) %>%
    arrange(desc(count)) %>%
    mutate(gender=factor(gender,
                      levels=move.to.end(gender, "keine Angabe"),
                      labels=move.to.end(gender, "keine Angabe"))) %>%
    ggplot(aes(x=gender, y=count, fill=gender)) +
    geom_bar(stat="identity", width=1, color="white") +
    scale_x_discrete("Gender") +
    scale_fill_manual(values=colors.gender) +
    theme(axis.text.x=element_text(angle = 45, hjust=1),
          legend.position="none") -> p.gender

  ## Party:

  x %>%
    group_by(party) %>%
    summarize(count=n()) %>%
    arrange(desc(count)) %>%
    mutate(party=factor(party,
                      levels=move.to.end(party, "keine Angabe"),
                      labels=move.to.end(party, "keine Angabe"))) %>%
    ggplot(aes(x=party, y=count, fill=party)) +
    geom_bar(stat="identity", width=1, color="white") +
    scale_fill_manual(values=colors.party) +
    scale_x_discrete("Party") +
    theme(axis.text.x=element_text(angle = 45, hjust=1),
          legend.position="none") -> p.party
  
  ## Education:
  
  x %>%
    group_by(education) %>%
    summarize(count=n()) %>%
    arrange(desc(count)) %>%
    mutate(education=factor(education,
                        levels=move.to.end(education, "keine Angabe"),
                        labels=move.to.end(education, "keine Angabe"))) %>%
    ggplot(aes(x=education, y=count, fill=education)) +
    geom_bar(stat="identity", width=1, color="white") +
    #scale_fill_manual(values=color.education) +
    scale_x_discrete("Education") +
    theme(axis.text.x=element_text(angle = 45, hjust=1),
          legend.position="none") -> p.education  

  p.age + p.gender + p.party + p.education

}
