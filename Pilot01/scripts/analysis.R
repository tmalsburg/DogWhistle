

library(tidyverse)
library(magrittr)


read_csv("Pilot01/data/Einschätzungen_zu_Politikern_1.csv") %>%
  filter(Timestamp != "2022/02/14 10:40:56 AM GMT+1") %>%  # That's Titus' test run.
  mutate(subj = 1:n()) %>%
  rename(
    a1.1 = `Eigenschaft #1...2`,
    a1.2 = `Eigenschaft #2...3`,
    a1.3 = `Eigenschaft #3...4`,
    a1.4 = `Eigenschaft #4...5`,
    a2.1 = `Eigenschaft #1...6`,
    a2.2 = `Eigenschaft #2...7`,
    a2.3 = `Eigenschaft #3...8`,
    a2.4 = `Eigenschaft #4...9`) %>%
  pivot_longer(2:9, names_to="response", values_to="attr") %>%
  rename(
    time = Timestamp,
    age = `Wie alt sind Sie?`,
    gender = `Was ist Ihr Geschlecht?`,
    vote = `Wenn nächsten Sonntag Wahl wäre, welche Partei würden Sie wählen?`) %>%
  mutate(
    sentence = gsub("a(.)\\.(.)", "\\1", response),
    a.index  = gsub("a(.)\\.(.)", "\\2", response)) %>%
  select(-response) %>%
  select(subj, time, sentence, a.index, attr, age, gender, vote) -> d1

read_csv("Pilot01/data/Einschätzungen_zu_Politikern_2.csv") %>%
  mutate(subj = 1:n()) %>%
  rename(
    a3.1 = `Eigenschaft #1...2`,
    a3.2 = `Eigenschaft #2...3`,
    a3.3 = `Eigenschaft #3...4`,
    a3.4 = `Eigenschaft #4...5`,
    a4.1 = `Eigenschaft #1...6`,
    a4.2 = `Eigenschaft #2...7`,
    a4.3 = `Eigenschaft #3...8`,
    a4.4 = `Eigenschaft #4...9`) %>%
  pivot_longer(2:9, names_to="response", values_to="attr") %>%
  rename(
    time = Timestamp,
    age = `Wie alt sind Sie?`,
    gender = `Was ist Ihr Geschlecht?`,
    vote = `Wenn nächsten Sonntag Wahl wäre, welche Partei würden Sie wählen?`) %>%
  mutate(
    sentence = gsub("a(.)\\.(.)", "\\1", response),
    a.index  = gsub("a(.)\\.(.)", "\\2", response)) %>%
  select(-response) %>%
  select(subj, time, sentence, a.index, attr, age, gender, vote) -> d2

rbind(d1, d2) %>%
  mutate(attr = str_squish(attr),
         attr = str_to_lower(attr)) -> d

# Ranking of attributes across items and conditions:

d %>%
  group_by(attr) %>%
  summarize(count = n()) %>%
  arrange(-count) %>%
  write_csv(file="Pilot01/generated/data/attribute_ranking_overall.csv")

# Ranking by item:

d %>%
  group_by(sentence, attr) %>%
  summarize(count = n()) %>%
  ungroup() %>%
  arrange(-count) -> x

x %>% filter(sentence==1) %>% select(attr.1=attr, count.1=count)-> x1
x %>% filter(sentence==2) %>% select(attr.2=attr, count.2=count)-> x2
x %>% filter(sentence==3) %>% select(attr.3=attr, count.3=count)-> x3
x %>% filter(sentence==4) %>% select(attr.4=attr, count.4=count)-> x4

min.n <- min(nrow(x1), nrow(x2), nrow(x3), nrow(x4))

bind_cols(x1[1:min.n,], x2[1:min.n,], x3[1:min.n,], x4[1:min.n,]) %>%
  write_csv(file="Pilot01/generated/data/attribute_ranking_by_sentence.csv")

# Attributes that appear more often in DogWhistle condition:

## Kinder sind die Zukunft unseres Volkes / unserer Gesellschaft:

d %>%
  filter(sentence %in% c(1,3)) %>%
  group_by(sentence, attr) %>%
  summarize(count = n()) %>%
  ungroup() %>%
  pivot_wider(names_from="sentence", values_from="count") %>%
  rename(
    dogwhistle = `1`,
    control = `3`) %>%
  mutate(
    control = ifelse(is.na(control), 0, control),
    dogwhistle = ifelse(is.na(dogwhistle), 0, dogwhistle),
    difference = dogwhistle - control) %>%
  arrange(-difference) %>%
  write_csv(file="Pilot01/generated/data/attribute_count_dogwhistle_vs_control_kinder.csv")
  
## Der Erwerb der deutschen Staatsbürgerschaft / Die Aufnahme in das
## deutsche Staatsvolk ist an strenge Bedingungen geknüpft:

d %>%
  filter(sentence %in% c(2,4)) %>%
  group_by(sentence, attr) %>%
  summarize(count = n()) %>%
  ungroup() %>%
  pivot_wider(names_from="sentence", values_from="count") %>%
  rename(
    dogwhistle = `4`,
    control = `2`) %>%
  mutate(
    control = ifelse(is.na(control), 0, control),
    dogwhistle = ifelse(is.na(dogwhistle), 0, dogwhistle),
    difference = dogwhistle - control) %>%
  arrange(-difference) %>%
  write_csv(file="Pilot01/generated/data/attribute_count_dogwhistle_vs_control_staatsvolk.csv")
