
library(tidyverse)
library(magrittr)

# Set working directory to directory of script:

tryCatch(
  setwd(dirname(rstudioapi::getSourceEditorContext()$path)),
  error = function(e) setwd("experiments/Pilot02/scripts/"))

# Read data and whip into shape:

rbind(
  read_csv("../data/responses_1.csv"),
  read_csv("../data/responses_2.csv")) %>%
  mutate(subj = 1:n()) %>%
  select(subj,
         time            = Timestamp,
         age1            = `Wie alt ist Politiker 1?`,
         prog1           = `Wie fortschrittlich ist Politiker 1?`,
         racism1         = `Wie rassistisch ist Politiker 1?`,
         honesty1        = `Wie ehrlich ist Politiker 1?`,
         helpful1        = `Wie hilfsbereit ist Politiker 1?`,
         intel1          = `Wie intelligent ist Politiker 1?`,
         christian1      = `Wie christlich ist Politiker 1?`,
         friendly1       = `Wie freundlich ist Politiker 1?`,
         party1          = `Zu welcher Partei gehört Politiker 1?`,
         age2            = `Wie alt ist Politiker 2?`,
         prog2           = `Wie fortschrittlich ist Politiker 2?`,
         racism2         = `Wie rassistisch ist Politiker 2?`,
         honesty2        = `Wie ehrlich ist Politiker 2?`,
         helpful2        = `Wie hilfsbereit ist Politiker 2?`,
         intel2          = `Wie intelligent ist Politiker 2?`,
         christian2      = `Wie christlich ist Politiker 2?`,
         friendly2       = `Wie freundlich ist Politiker 2?`,
         party2          = `Zu welcher Partei gehört Politiker 2?`,
         age             = `Wie alt sind Sie?`,
         gender          = `Ihr Geschlecht`,
         education       = `Was ist Ihr höchster Bildungsabschluss?`,
         vote            = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
         wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
         wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
         wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
         wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
         wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
         comment         = `Haben Sie Kommentare zu unserer Umfrage?`) -> d
