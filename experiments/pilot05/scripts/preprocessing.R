
# Set working directory to directory of script:

tryCatch(
  setwd(dirname(rstudioapi::getSourceEditorContext()$path)),
  error = function(e) setwd("experiments/Pilot02/scripts/"))

# Load general definitions (also loads standard packages such as
# tidyverse):

source("../../../scripts/general.R")

# read in the raw data ----
d1 = read_csv("../data/responses_1.csv") %>% mutate(list=1) %>% 
  rename(
       time            = Timestamp,
       control.c     = `Wie widersprüchlich ist Politiker 1?`,
       control.nc      = `Wie widersprüchlich ist Politiker 2?`,
       target       = `Wie widersprüchlich ist Politiker 3?`,
       age             = `Wie alt sind Sie?`,
       gender          = `Ihr Geschlecht`,
       education       = `Was ist Ihr höchster Bildungsabschluss?`,
       party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
       wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
       wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
       wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
       wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
       wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
       comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

d1 = read_csv("../data/responses_1.csv") %>% mutate(list=1) %>% 
  rename(
    time            = Timestamp,
    control.c     = `Wie widersprüchlich ist Politiker 1?`,
    control.nc      = `Wie widersprüchlich ist Politiker 2?`,
    target       = `Wie widersprüchlich ist Politiker 3?`,
    age             = `Wie alt sind Sie?`,
    gender          = `Ihr Geschlecht`,
    education       = `Was ist Ihr höchster Bildungsabschluss?`,
    party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
    wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
    wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
    wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
    wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
    wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
    comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

d2 = read_csv("../data/responses_2.csv") %>% mutate(list=2) %>% 
  rename(
    time            = Timestamp,
    control.c     = `Wie widersprüchlich ist Politiker 1?`,
    control.nc      = `Wie widersprüchlich ist Politiker 2?`,
    target       = `Wie widersprüchlich ist Politiker 3?`,
    age             = `Wie alt sind Sie?`,
    gender          = `Ihr Geschlecht`,
    education       = `Was ist Ihr höchster Bildungsabschluss?`,
    party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
    wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
    wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
    wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
    wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
    wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
    comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

d3 = read_csv("../data/responses_3.csv") %>% mutate(list=3) %>% 
  rename(
    time            = Timestamp,
    control.c     = `Wie widersprüchlich ist Politiker 1?`,
    control.nc      = `Wie widersprüchlich ist Politiker 2?`,
    target       = `Wie widersprüchlich ist Politiker 3?`,
    age             = `Wie alt sind Sie?`,
    gender          = `Ihr Geschlecht`,
    education       = `Was ist Ihr höchster Bildungsabschluss?`,
    party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
    wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
    wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
    wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
    wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
    wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
    comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

d4 = read_csv("../data/responses_4.csv") %>% mutate(list=4) %>% 
  rename(
    time            = Timestamp,
    control.c     = `Wie widersprüchlich ist Politiker 1?`,
    control.nc      = `Wie widersprüchlich ist Politiker 2?`,
    target       = `Wie widersprüchlich ist Politiker 3?`,
    age             = `Wie alt sind Sie?`,
    gender          = `Ihr Geschlecht`,
    education       = `Was ist Ihr höchster Bildungsabschluss?`,
    party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
    wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
    wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
    wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
    wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
    wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
    comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

d5 = read_csv("../data/responses_5.csv") %>% mutate(list=5) %>% 
  rename(
    time            = Timestamp,
    control.c     = `Wie widersprüchlich ist Politiker 1?`,
    control.nc      = `Wie widersprüchlich ist Politiker 2?`,
    target       = `Wie widersprüchlich ist Politiker 3?`,
    age             = `Wie alt sind Sie?`,
    gender          = `Ihr Geschlecht`,
    education       = `Was ist Ihr höchster Bildungsabschluss?`,
    party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
    wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
    wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
    wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
    wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
    wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
    comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

d6 = read_csv("../data/responses_6.csv") %>% mutate(list=6) %>% 
  rename(
    time            = Timestamp,
    control.c     = `Wie widersprüchlich ist Politiker 1?`,
    control.nc      = `Wie widersprüchlich ist Politiker 2?`,
    target       = `Wie widersprüchlich ist Politiker 3?`,
    age             = `Wie alt sind Sie?`,
    gender          = `Ihr Geschlecht`,
    education       = `Was ist Ihr höchster Bildungsabschluss?`,
    party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
    wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
    wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
    wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
    wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
    wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
    comment         = `Haben Sie Kommentare zu unserer Umfrage?`)

nrow(d1) #19
nrow(d2) #17
nrow(d3) #18
nrow(d4) #20
nrow(d5) #19
nrow(d6) #18

# get the data into shape

d <- rbind(d1,d2,d3,d4,d5,d6) %>% 
  mutate(subj = 1:n()) 


d %>%
  mutate(party = str_squish(party)) %>%
  unique() -> d

nrow(d) #111

# long format
d <- d%>%
  pivot_longer(cols = control.c:target,
               names_to = "item", 
               values_to = "rating")

str(d$item)  
str(d$list)
d$list <- as.factor(d$list)
table(d$list)

d = d %>%
  mutate(item = case_when(
    list==1 & item == "target" ~ "1a - geht unser Kampf für Deutschland weiter", 
    list==2 & item == "target" ~ "1b - setzen wir uns für Deutschland ein",
    list==3 & item == "target" ~ "2a - Hilfe vor Ort",
    list==4 & item == "target" ~ "2b - lokale Unterstützung", 
    list==5 & item == "target" ~ "3a - Aufnahme in das deutsche Staatsvolk",
    list==6 & item == "target" ~ "3b - Erwerb der deutschen Staatsangehörigkeit",
    TRUE ~ item))

table(d$item)

d$pair <- "1"
table(d$pair)

d = d %>%
  mutate(pair = case_when(
    list==1 ~ "1",
    list==2 ~ "1",
    list==3 ~ "2",
    list==4 ~ "2",
    list==5 ~ "3",
    list==6 ~ "3",
    TRUE ~ pair))
                       
nrow(d) # 333
head(d)

# exclude participants who didn't judge the control items appropriately
# contradictory: 4 or 5
# non-contradictory: 1 or 2
control.c <- d %>%
  filter(item == "control.c") %>%
  filter(rating < 4)
control.c # 0 participants

control.nc <- d %>%
  filter(item == "control.nc") %>%
  filter(rating > 2)
control.nc # 2 participants

d <- droplevels(subset(d, !(d$subj %in% control.c$subj | d$subj %in% control.nc$subj)))
nrow(d) #327 (data from 2 participants excluded)

# check that all is well
table(d$rating,d$item)  


# save the preprocessed data
write.csv(d, "../generated/data/d-preprocessed.csv")

length(unique(d$subj)) #109

# participant information
names(d)

str(d$age)
table(d$age) #one participant entered non-sense
d$age <- as.numeric(d$age)
min(d$age,na.rm=T) #18
max(d$age,na.rm=T) #65
mean(d$age,na.rm=T) #29.1
ggplot(d, aes(x=age)) +
  geom_histogram()

str(d$gender)
table(d$gender)
#divers männlich weiblich 
#15 189       123

library(stringdist)

stringdistmatrix(d$party, names(colors.party), method="jw") -> m

d$party <- names(colors.party)[apply(m, 1, which.min)]

ggsave("../generated/plots/demographics.pdf", plot.demographics(d), width=20, height=10, unit="cm")
ggsave("../generated/plots/demographics.png", plot.demographics(d), width=1500, height=500, unit="px", dpi=150)

