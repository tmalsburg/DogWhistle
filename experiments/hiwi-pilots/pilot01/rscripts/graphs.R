# dog whistles pilot 1: does the political party of the speaker have an effect on 
# dog whistle interpretation?
# graphs.R

# set working directory to directory of script
this.dir <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(this.dir)

# color-blind-friendly palette
cbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# load clean data ----
d = read.csv("../data/d.csv")
nrow(d) #1456

# which properties do the participants have?

# gender
d %>% 
  select(gender, participantID) %>% 
  unique() %>% 
  group_by(gender) %>% 
  summarize(count=n())

# age
d %>% 
  select(age, participantID) %>% 
  unique() %>% 
  group_by(age) %>% 
  summarize(count=n())

# ethnicity
d %>% 
  select(ethnicity, participantID) %>% 
  unique() %>% 
  group_by(ethnicity) %>% 
  summarize(count=n())

# education
d %>% 
  select(education, participantID) %>% 
  unique() %>% 
  group_by(education) %>% 
  summarize(count=n())

# migration
d %>% 
  select(migration, participantID) %>% 
  unique() %>% 
  group_by(migration) %>% 
  summarize(count=n())

# how did the participants answer the 5 WOM questions? ----

names(d)
# what does "ich stimme zu" mean for the different questions?
# migrationsfeindlich or migrationsfreundlich?
# [8] "womNachzug": "ich stimme zu" = feindlich
# [9] "womKopftuch": "ich stimme zu" = freundlich
# [10] "womStaatsangehörigkeit" "ich stimme zu" = freundlich
# [11] "womIslam" "ich stimme zu" = freundlich
# [12] "womAsyl" "ich stimme zu" = feindlich

table(d$womNachzug)

# define numeric values for each position (higher = more feindlich)
d$womNachzug.num <- ifelse(d$womNachzug == "Ich stimme zu", 1, 
                             ifelse(d$womNachzug == "Neutral", 0, -1))
d$womKopftuch.num <- ifelse(d$womKopftuch == "Ich stimme nicht zu", 1, 
                              ifelse(d$womKopftuch == "Neutral", 0, -1))
d$womStaatsangehoerigkeit.num <- ifelse(d$womStaatsangehoerigkeit == "Ich stimme nicht zu", 1, 
                                ifelse(d$womStaatsangehoerigkeit == "Neutral", 0, -1))
d$womIslam.num <- ifelse(d$womIslam == "Ich stimme nicht zu", 1, 
                          ifelse(d$womIslam == "Neutral", 0, -1))
d$womAsyl.num <- ifelse(d$womAsyl == "Ich stimme zu", 1, 
                           ifelse(d$womAsyl == "Neutral", 0, -1))


# how conservative is each participant? 

d$mean.wom.score = (d$womNachzug.num + d$womKopftuch.num + d$womStaatsangehoerigkeit.num + d$womIslam.num + d$womAsyl.num) / 5
# lowest possible: -1 (least conservative)
# highest possible: 1 (most conservative)

d %>%
  group_by(participantID,mean.wom.score) %>% 
  tally

# sort participants by their mean.wom.score
d = d %>%
  mutate(participantID = fct_reorder(as.factor(participantID),mean.wom.score))  

# merge partyChoice to sensible categories: AfD (blau), FDP, Grüne, Linke, SPD, CDU, other
table(d$partyChoice)
d$partyChoice <- as.factor(d$partyChoice)
levels(d$partyChoice)

# plot participants by their mean.wom.score, color code by party
ggplot(d, aes(x=participantID, y=mean.wom.score,color=party,fill=partyChoice)) +
  geom_point(shape=21, size=3, alpha=1,color="black") +
  scale_fill_manual(values=c("#56B4E9", "black", "yellow","#009E73","#E69F00", "#56B4E9", "#009E73","#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")) +
  xlab("Participant") +
  ylab("Mean wom score (higher = more conservative)")
ggsave("../graphs/mean-response-to-wom-questions-by-participant.pdf",height=4,width=9)

# does the politician's party modulate the response? ----

table(d$party)
# only consider the target data
t = d %>%
  filter(party != "spd")
table(t$party)

table(t$party,t$dw,t$item)

# calculate mean response for each target item
means = t %>%
  group_by(item, party, dw) %>%
  summarize(Mean = mean(response)) %>%
  ungroup 
means

means = means %>%
  mutate(item = fct_relevel(item,levels(means$Mean)))
t = t %>%
  mutate(item = fct_relevel(item,levels(means$Mean)))


# make a boxplot, add the mean response
ggplot(t, aes(x=party, y=response)) +
  geom_boxplot() + 
  facet_wrap(item ~ dw, ncol = 5) +
  geom_point(data = means, aes(x=party, y=Mean), shape=20, size=3, alpha=1, color = "blue") +
  xlab("Item") +
  ylab("Mean response \n (1 = pro migration, 5 = against migration)") 
ggsave("../graphs/response-by-item-and-party.pdf",height=5,width=8)

# further questions to ask:
# how should the participants demographic information enter the model? (predictor or random effect?)
# what can we say about how the ingroup vs outgroup responds to the items?

