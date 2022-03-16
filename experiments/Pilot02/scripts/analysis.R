
# Set working directory to directory of script:

tryCatch(
  setwd(dirname(rstudioapi::getSourceEditorContext()$path)),
  error = function(e) setwd("experiments/Pilot02/scripts/"))

# Load general definitions (also loads standard packages such as
# tidyverse):

source("../../../scripts/general.R")

# Read data and whip into shape:


rbind(
  read_csv("../data/responses_1.csv") %>% mutate(list=1),
  read_csv("../data/responses_2.csv") %>% mutate(list=2)) %>%
  mutate(subj = 1:n()) %>%
  select(subj,
         list,
         time            = Timestamp,
         page1           = `Wie alt ist Politiker 1?`,
         pprog1          = `Wie fortschrittlich ist Politiker 1?`,
         pracism1        = `Wie rassistisch ist Politiker 1?`,
         phonesty1       = `Wie ehrlich ist Politiker 1?`,
         phelpful1       = `Wie hilfsbereit ist Politiker 1?`,
         pintel1         = `Wie intelligent ist Politiker 1?`,
         pchristian1     = `Wie christlich ist Politiker 1?`,
         pfriendly1      = `Wie freundlich ist Politiker 1?`,
         pparty1         = `Zu welcher Partei gehört Politiker 1?`,
         page2           = `Wie alt ist Politiker 2?`,
         pprog2          = `Wie fortschrittlich ist Politiker 2?`,
         pracism2        = `Wie rassistisch ist Politiker 2?`,
         phonesty2       = `Wie ehrlich ist Politiker 2?`,
         phelpful2       = `Wie hilfsbereit ist Politiker 2?`,
         pintel2         = `Wie intelligent ist Politiker 2?`,
         pchristian2     = `Wie christlich ist Politiker 2?`,
         pfriendly2      = `Wie freundlich ist Politiker 2?`,
         pparty2         = `Zu welcher Partei gehört Politiker 2?`,
         age             = `Wie alt sind Sie?`,
         gender          = `Ihr Geschlecht`,
         education       = `Was ist Ihr höchster Bildungsabschluss?`,
         party           = `Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen?`,
         wom.refugees    = `Wie bewerten Sie persönlich folgende Aussage: “Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.”`,
         wom.headscarf   = `Wie bewerten Sie persönlich folgende Aussage: “Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.”`,
         wom.citizenship = `Wie bewerten Sie persönlich folgende Aussage: “In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.”`,
         wom.islam       = `Wie bewerten Sie persönlich folgende Aussage: “Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.”`,
         wom.asylum      = `Wie bewerten Sie persönlich folgende Aussage: “Asyl soll weiterhin nur politisch Verfolgten gewährt werden.”`,
         comment         = `Haben Sie Kommentare zu unserer Umfrage?`) -> d

d %>%
  select(-page2, -pprog2, -pracism2, -phonesty2, -phelpful2, -pintel2, -pchristian2, -pfriendly2, -pparty2) %>%
  rename(page=page1, pprog=pprog1, pracism=pracism1, phonesty=phonesty1, phelpful=phelpful1, pintel=pintel1, pchristian=pchristian1, pfriendly=pfriendly1, pparty=pparty1) %>%
  mutate(
    sentence = 1,
    dog.whistle = ifelse(list==1, "Dog whistle", "Control")) -> d1

d %>%
  select(-page1, -pprog1, -pracism1, -phonesty1, -phelpful1, -pintel1, -pchristian1, -pfriendly1, -pparty1) %>%
  rename(page=page2, pprog=pprog2, pracism=pracism2, phonesty=phonesty2, phelpful=phelpful2, pintel=pintel2, pchristian=pchristian2, pfriendly=pfriendly2, pparty=pparty2) %>%
  mutate(
    sentence = 2,
    dog.whistle = ifelse(list==2, "Dog whistle", "Control")) -> d2

rbind(d1, d2) %>%
  arrange(subj, sentence) %>%
  mutate(
    sentence.label = ifelse(sentence==1, "Zukunft-unseres-Volkes", "Aufnahme-in-dt-Staatsvolk")) -> d

# Participant demographics:

library(stringdist)

d %>%
  select(subj, age, gender, education, party) %>%
  mutate(party = str_squish(party)) %>%
  unique() -> x

stringdistmatrix(x$party, names(colors.party), method="jw") -> m

x$party <- names(colors.party)[apply(m, 1, which.min)]

ggsave("../generated/plots/demographics.pdf", plot.demographics(x), width=20, height=10, unit="cm")
ggsave("../generated/plots/demographics.png", plot.demographics(x), width=1500, height=500, unit="px", dpi=150)

# Do the Wahlomat questions correlate with the party that the participants would have voted for?

d %>%
  select(subj, age, gender, party,wom.citizenship,wom.refugees,wom.headscarf,wom.asylum,wom.islam) %>%
  mutate(party = str_squish(party)) %>%
  unique() -> x

stringdistmatrix(x$party, names(colors.party), method="jw") -> m

x$party <- names(colors.party)[apply(m, 1, which.min)]

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

ggplot(x,aes(x=wom.citizenship, fill=party)) +
  geom_bar(stat="count", width=1) +
  scale_fill_manual(values=colors.party) + 
  scale_x_discrete("In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.")
ggsave("../generated/plots/wom.citizenship-by-party.pdf",height=4,width=9)


ggplot(x,aes(x=wom.refugees , fill=party)) +
  geom_bar(stat="count", width=1) +
  scale_fill_manual(values=colors.party) + 
  scale_x_discrete("Asyl soll weiterhin nur politisch Verfolgten gewährt werden.")
ggsave("../generated/plots/wom.refugees-by-party.pdf",height=4,width=9)

ggplot(x,aes(x=wom.headscarf , fill=party)) +
  geom_bar(stat="count", width=1) +
  scale_fill_manual(values=colors.party) + 
  scale_x_discrete("Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.")
ggsave("../generated/plots/wom.headscarf-by-party.pdf",height=4,width=9)

ggplot(x,aes(x=wom.islam , fill=party)) +
  geom_bar(stat="count", width=1) +
  scale_fill_manual(values=colors.party) + 
  scale_x_discrete("Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.")
ggsave("../generated/plots/wom.islam-by-party.pdf",height=4,width=9)

ggplot(x,aes(x=wom.asylum , fill=party)) +
  geom_bar(stat="count", width=1) +
  scale_fill_manual(values=colors.party) + 
  scale_x_discrete("Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.")
ggsave("../generated/plots/wom.asylum-by-party.pdf",height=4,width=9)

# Analysis:

## Does the presence of a dog whistle have an impact on how the
## politician is evaluated:

pdf("../generated/plots/social_dimensions.pdf", 6, 6)

### Age:

d %>%
  group_by(sentence.label, dog.whistle, page) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(page, p)) +
  geom_col() +
  scale_x_discrete("How old (alt) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Progressive:

d %>%
  group_by(sentence.label, dog.whistle, pprog) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(pprog, p)) +
  geom_col() +
  scale_x_discrete("How progressive (fortschrittlich) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Racism:

d %>%
  group_by(sentence.label, dog.whistle, pracism) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(pracism, p)) +
  geom_col() +
  scale_x_discrete("How racist (rassistisch) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Honesty:

d %>%
  group_by(sentence.label, dog.whistle, phonesty) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(phonesty, p)) +
  geom_col() +
  scale_x_discrete("How honest (ehrlich) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Helpfulness:

d %>%
  group_by(sentence.label, dog.whistle, phelpful) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(phelpful, p)) +
  geom_col() +
  scale_x_discrete("How helpful (hilfsbereit) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Intelligence:

d %>%
  group_by(sentence.label, dog.whistle, pintel) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(pintel, p)) +
  geom_col() +
  scale_x_discrete("How intelligent (intelligent) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Christianity:

d %>%
  group_by(sentence.label, dog.whistle, pchristian) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(pchristian, p)) +
  geom_col() +
  scale_x_discrete("How christian (christlich) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Friendliness:

d %>%
  group_by(sentence.label, dog.whistle, pfriendly) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(pfriendly, p)) +
  geom_col() +
  scale_x_discrete("How friendly (freundlich) is the politician?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  facet_grid(vars(dog.whistle), vars(sentence.label))

### Party:

d %>%
  group_by(sentence.label, dog.whistle, pparty) %>%
  summarize(n = n()) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(pparty, p, fill=pparty)) +
  geom_col() +
  scale_fill_manual(values=colors.party) +
  scale_x_discrete("To which party does the politican belong?") +
  scale_y_continuous("", labels = scales::percent, limits=c(0, 1)) +
  theme(axis.text.x=element_text(angle = 45, hjust=1),
        legend.position="none") +
  facet_grid(vars(dog.whistle), vars(sentence.label))

dev.off()

