# at-issueness: pilot 1 (unembedded sentences)
# preprocessing.R

# set working directory to directory of script
this.dir <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(this.dir)


# load relevant packages and set background color
library(tidyverse)
theme_set(theme_bw())
R.Version()


# load the data
d = read.csv("list-xenia2.csv", sep =";", header=FALSE) 
nrow(d) #10 participants
head(d)
summary(d) 
view(d)
 
# make first row the column row
colnames(d) = as.character(d[1,])

# delete the first row
d = d[-1,]

# delete empty rows
d = d[!apply(d == "", 1, all),]


# replace timestamps with participant ID
colnames(d)[1] ="participantID"
d$participantID <- match(d$participantID, unique(sort(d$participantID)))
table(d$participantID)

# replace question column headers with shorter code (Xenia, I've given the items labels but
# you might have better ones, of course!)
colnames(d)
colnames(d)[2] ="afd-rechspopulistisch"
colnames(d)[3] ="gruen-neuzugezogen"
colnames(d)[4] ="spd-mutter"
colnames(d)[5] ="afd-rechstreu"
colnames(d)[6] ="gruen-asylindustrie"
colnames(d)[7] ="spd-fachkraeftemangel"
colnames(d)[8] ="afd-fluchtursachen"
colnames(d)[9] ="gruen-heimat"
colnames(d)[10] ="afd-fatal"
colnames(d)[11] ="spd-kriminell"
colnames(d)[12] ="gruen-inlaenderfreundlich"
colnames(d)[13] ="afd-nationalstaat"
colnames(d)[14] ="gruen-renten"
colnames(d)[15] ="spd-mehrwert"
# questions about the participants
colnames(d)[16] ="age"
colnames(d)[17] ="gender"
colnames(d)[18] ="education"
colnames(d)[19] ="migration"
colnames(d)[20] ="ethnicity"
colnames(d)[21] ="party"
# wahl-o-mat questions
colnames(d)[22] ="womNachzug"
colnames(d)[23] ="womKopftuch"
colnames(d)[24] ="womStaatsangehoerigkeit"
colnames(d)[25] ="womIslam"
colnames(d)[26] ="womAsyl"

colnames(d)

# get the data from wide into long format ----

# identify the columns that need to be pivoted (responses to trials, not info about age etc)
colnames(d)[1:26] #2-15

tmp = d %>%
  pivot_longer(cols = "afd-rechspopulistisch":"spd-mehrwert",
               names_to = "question", 
               values_to = "response")
view(tmp)

# now that we see that tmp works, make d = tmp
d = tmp

length(unique(d$participantID)) #10 participants

# now make separate columns for party and items from the question column
table(d$question)
d = d %>% 
  mutate(party = case_when(grepl("afd", question) ~ "afd",
                           grepl("spd", question) ~ "spd",
                           grepl("gruen", question) ~ "gruen",
                           TRUE ~ "ERROR"))
table(d$party)

d$item = d$question
d$item = gsub("afd-|spd-|gruen-", "", d$item)
table(d$item)
table(d$party,d$item)

# remove the question column 
d <- d %>% select(-question)

names(d)
summary(d)


# remove participants' data based on responses to controls
str(d$party)
controls <- subset(d, d$party == "spd")
view(controls)

# plot the controls data
ggplot(controls, aes(x=participantID,y=response)) +
  geom_point() +
  facet_wrap(. ~ item)

controls.good <- subset(controls, controls$item == "mehrwert"| controls$item == "fachkraeftemangel" )
controls.bad<- subset(controls, controls$item == "kriminell"| controls$item == "mutter" )

exclude.good <- subset(controls.good, controls.good$response < 4)
exclude.bad <- subset(controls.bad, controls.bad$response >2)
exclude.bad
# plot the controls data
ggplot(exclude.good, aes(x=participantID,y=response)) +
  geom_point() +
  facet_wrap(. ~ item)

# plot the controls data
ggplot(exclude.bad, aes(x=participantID,y=response)) +
  geom_point() +
  facet_wrap(. ~ item)

#exclude the participants who got the controls wrong

d <- droplevels(subset(d, !(d$participantID %in% exclude.good$participantID)))
d <- droplevels(subset(d, !(d$participantID %in% exclude.bad$participantID)))
length(unique(d$participantID)) #4 participants


# age and gender of remaining participants
table(d$age) #20-33
d$age<- as.numeric(d$age)
mean(d$age) #36
table(d$gender)
#"female"   "male" 
#2480     2560 
#62       64


## save cleaned up data ----
write_csv(d, "../data/d.csv")
