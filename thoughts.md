
---
header-includes: |
            \usepackage{pifont}
            \usepackage{newunicodechar}
            \newunicodechar{🗹}{\ding{51}}
---

This file is a record of ongoing thinking about how to experimentally investigate dogwhistle content.

A compiled PDF version can be found [here](https://github.com/tmalsburg/DogWhistle/blob/master/thoughts.pdf).

# Guidelines for this document

1. Let’s cite the relevant papers using LaTeX and the BibTeX keys in our [bibliography](bibliography/bibliography.bib).
2. To compile this document using Pandoc and LaTeX open a command line shell and enter `make`.  This requires that the Pandoc utility and LaTeX are installed.

# Goals

## First phase of SFB

- Ultimately, we aim to develop quantifiable criteria.
- Better understanding of discriminatory speech.

## Second phase of SFB

- May also inform research on de-biasing AI language models.  Current approaches seem simplistic and will let more subtle expressions slip through.  Potentially an interesting connection to work in computational linguistics $\Rightarrow$ idea for second stage of the SFB.  (Inspired by Anne Lauscher talk at IMS.)

# Definitions of dog whistle content

## Merriam Webster

[Definition according to Merriam Webster](https://www.merriam-webster.com/dictionary/dog%20whistle):

> An expression or statement that has a secondary meaning intended to be understood only by a particular group of people.

## \textcite[][p. 2]{HendersonMcCready2019}

> language that sends one message to an outgroup while at the same time sending a second (often taboo, controversial, or inflammatory) message to an in group

But even people in the outgroup may recognize the message. 

## \textcite[][footnote]{Khoo2017}

> Code words are sometimes called “dog whistles” because (so the received view goes) they involve sending a message that can only be heard by audience members with suitably sensitive ears. Richard Morin is credited with introducing the term. He writes, “Subtle changes in question-wording sometimes produce remarkably different results . . . researchers call this the ‘Dog Whistle Effect’: Respondents hear something in the question that researchers do not.” (Morin 1998).

No other definition, only examples.  Similar to Henderson & McCready definition.

## \textcite{Mendelberg2001}

Tali Mendelberg proposes that using a code word allows the speaker and her audience to violate certain social norms while plausibly denying doing so.

This does not involve in/outgroup distinction, highlights plausible deniability.

## \textcite{Albertson2015}

> multivocal appeals, meaning appeals that have distinct meanings to different audiences

Here the ingroup/outgroup distinction is avoided, “distinct” meanings is pretty vague, “different audiences” is also pretty vague (no requirement that the additional meaning is taboo, controversial, or inflammatory)

## \textcite{WettsWiller2019}

> messages...in which race is not explicitly mentioned but instead is cued through coded language or accompanying visuals subtly connect racial prejudice to whites’ views of policies and candidates, a process commonly referred to as “dog whistling” (Haney-López 2014; Mendelberg 2001; Valentino, Hutchings, and White 2002).

Dog whistles limited to racial prejudice?  Controversial message is component of this definition, no in/outgroup, controversial message is not explicit but subtly coded.

## \textcite{CalfanoDjupe2009}

> These cues, or what we term “the code,” signal the in-group status of a GOP candidate to white evangelical voters. However, because the cues are so specific to evangelical culture, they are intended to pass unnoticed by other voters and therefore allow GOP candidates to avoid broadcasting very conservative issue positions that might alienate more moderate voters. Thus, the code is a highly sophisticated communication strategy that is designed to appeal to an in-group without rousing an out-group’s suspicions.

In/outgroup difference is made, cues can be recognized by outgroup, signal belonging to ingroup without being explicit.

## Our thinking

Dog whistle is an expression that is used by one party but not by another (lower bar, necessary condition, but perhaps not sufficient).  The phenomenon itself may be probabilistic, rather than categorical.  Perhaps this should be part of an improved definition of the term.  It may also be that the term/message isn't neutral, but rather may also send a message for everybody to different degrees, and that message, when integrated with the person's ideology, results in different effects.

We're more sensitive to dog whistles that are outgroup!

Different aspect potentially contributing to a definition: Dog whistles are not necessarily expressions that carries secondary meaning but a strategy where a semantic/pragmatic gap is artificially created and to be filled by the listener using their social and contextual knowledge.  For instance, when Gauland says “people don’t want a Boateng as their neighbor”, it’s technically not clear what he means by “a Boateng”.  Does he mean a soccer player or a black person?  But using social knowledge about the speaker, the audience can fill that missing meaning in.  Compare to some soccer fan saying “people would love to have a Boateng as their neighbor”, this would potentially be interpreted as meaning “a famous soccer player”.  In that way, dog whistles may be very similar to the rhetorical device where the speaker does not finish a controversial sentence because they know that the audience will be able to complete it in their minds without the speaker actually having to say the words: “If we let more migrants into the country, next new year’s eve in Cologne will …”  Another closely related rhetorical device is where the offensive part of the statement is replaced by something that’s effectively the opposite of the intended meaning and absurd given social knowledge about the speaker:  “If we let more migrants in the country, next new year’s eve in Cologne is going to be fun.”  What dog whistles offer in contrast to these rhetorical device is plausible deniability, because with dog whistles the (to-be-filled) gap meaning is not as obvious.  Seen in this way dog whistles are the result of a natural evolution of ways to circumvent taboo speech.  If true, this would explain why dog whistles are so difficult to characterize:  The properties of the dog whistle expression are irrelevant.  What matters is merely whether that expression leaves a meaning vacuum when used in a certain context.  Corollary: “Clankriminalität” is a dog whistle in the presence of a meaning vacuum, but the same expression immediately looses its dog whistle property in the absence of such a vacuum, e.g. when the text is otherwise openly xenophobic.  Question: How can we test for the presence of a meaning vacuum/gap?

One function of dog whistles is to communicate controversial ideas to ingroup members while having plausible deniability.  Here’s a related but different function:  Anna Prysłopska made me aware of the wonderful world of alt-right mom blogs.  Superficially these blogs are about benign topics like childcare and cooking, but the true aim is to sneak ideological content into the readers’ minds.  (One author of such a blog, [Mrs. Mid-west](https://www.mrsmidwest.com/), admitted this openly.)  Cooking recipes and parenting advice are just the honeypot.  These blogs, according to Anna, are chock-full with dog whistle material.  However, the purpose of dog whistles is not to hide controversial views from an outgroup but rather to accustom readers to these views in a subliminal way and to assimilate them ideologically.  These dog whistles do not just work with pre-defined in/outgroups, but they are used to redefine these groups (= propaganda).  The persuasion component is actually present in many of the examples that we considered, e.g., Gauland saying “einen Boateng”.  In sum, the core property, once again, seems to be plausible deniability.  And the functions of dog whistles are: 1. Covert communication with an ingroup.  2. Persuade outgroup members to become ingroup.

## Related phenomena

Virtue signaling, e.g. gender neutral language: Virtue signaling and dog whistles are related in that they are both ways to convey social meaning. But they are different in that the social meaning is covert with dog whistles whereas virtue signalling is quite overt. One defining property of dog whistles seems to be that they provide plausible deniability. As you correctly noted, this property makes them useful for subliminal persuasion.  Virtue signalling like the use of gender neutral language is also a tool for persuasion, but it's not subliminal and offers no plausible deniability.  The user of a dog whistle is working around a social taboo but the virtue signaller doesn't need to do that.

# Tasks used in previous empirical research on dog whistles

\textcite{Albertson2015}: Religious dog whistle "wonder-working power"; three conditions (dog whistle, obvious religious content+dog whistle, neither); participants viewed videos w speeches by candidate; response tasks: attitude toward candidate and whether they would vote for candidate (5-point Likert scale), emotion ratings regarding candidate (interested, upset, proud, moral...) on sliding scale, participants' religious denomination and beliefs about the Bible; outgroup was unfamiliar with religious connotation of "wonder-working power", they gave less favorable ratings with obvious religious appeal but not with WWP; for ingroup, both WWP and the obvious religious appeal lead to more favorable ratings of the candidate, the former resulted in even more favorable ratings.

\textcite{White2007}: Conditions in experiment were explicitly racial ("poor, Black and Hispanic families"), implicitly racial ("poverty, ...layoffs, ...healthcare...affordable housing"), and non-racial; participants read articles (fictitious debate between two Ohio congressmen—–one Democrat and one Republican—–on the proposed war in Iraq. All of the experimental conditions presented two-sided messages about the war: the Republican expressed a consistent statement in support of using force to remove Saddam Hussein from power, and the Democrat voiced opposition. What changed across the conditions were the terms in which the Democrat articulated his argument against the war); answered an extensive battery of post-test questions that included questions about their support for the war in Iraq, issue importance ratings, and racial and political attitudes; results: COMPLICATED DESIGN, NEED TO SPEND MORE TIME READING THIS 

\textcite{CalfanoDjupe2009}: Participants were asked a series of questions concerning their demographics, political interests, political knowledge, and political attitudes; they were  exposed to a picture and brief biographical sketch of a male candidate that included basic personal information (including age, family status, career background); candidates varied by race (white/black) and statement (land, worth, WWP, none); participants were asked to identify the candidate’s party (all candidates were male) and whether they would vote for him; results: white evangelicals identify candidates using the code as Republicans and indicate their likely support for such candidates. Roman Catholics and mainline Protestants are generally not affected by the code, although mainline Protestants do link candidates using the code to the GOP. Instead, support for such candidates among mainline Protestants is driven largely by party affiliation and other concerns, not by the code itself. This is almost precisely the way the code is intended to work—to gain the recognition and support of the in-group evangelicals and pass unnoticed by others, or at least not engender opposition from other likely supporters

\textcite{WettsWiller2019}: Participants assigned to the implicit racial appeal condition reported significantly less support for welfare than those assigned to the no racial appeal condition (p = .02). Participants in the explicit racial appeal condition were in between, not differing significantly from either the control condition or the implicit racial appeal condition; participants assigned to the implicit racial appeal condition reported significantly lower levels of the view that welfare recipients are deserving of aid (p = .02). Again, participants in the explicit racial appeal did not report significantly higher levels of this view than participants in either the control or implicit racial appeal conditions. After reading an anti-welfare message where racial cues were subtly implied, liberals high in racial resentment expressed less support for welfare programs than those who read an excerpt about global warming, while liberals low in racial resentment voiced approximately equivalent support across condition (Figure 1a). In contrast, moderates and conservatives high in racial resentment showed little effect of the implicit racial appeal condition on welfare support relative to the control condition. THIS STUDY DOES NOT ASSUME THAT DOGWHISTLES ARE A MESSAGE THAT ONLY SOME PERCEIVE.

References from Wetts & Willer 2019: Welfare (Mendelberg 1997, 2001; Peffley, Hurwitz, and Sniderman 1997), food stamps (White 2007), government spending (Valentino et al. 2002), crime (Domke 2001; Gilliam and Iyengar 2000; Hurwitz and Peffley 2005; Mendelberg 1997, 2001), and health care (Tesler 2012). Other research, however, has called into question whether implicit racial appeals are more effective than explicit appeals, including two studies employing experimental designs and large, nationally representative samples (Huber and Lapinski 2006; Valentino, Neuner, and Vandenbroek 2018). These studies suggest that racial appeals may no longer need to be implicit to engage white prejudice as explicit references to racial stereotypes may have become more socially acceptable (Valentino et al. 2018). Still other work suggests that implicit appeals may be more effective than explicit or race-neutral appeals in harnessing white prejudice but only among particular demographic groups (Hutchings, Walton, and Benjamin 2010).

# Starting point for an empirical investigation of German dog whistle expressions

- No clear definition of dog whistle content/expressions (in any language).
- No empirical investigation exists for German. 
- A few expressions have been discussed: e.g., Clankriminalität.

# Study to build test scales (from Beltrama & Staum-Casasanto 2017)
- We first conducted a preliminary study to construct the evaluation scales to be used to measure social meaning in the experiment. 
- Sixty subjects, who self-declared to be native speakers of American English and between 18 and 35 years old, were recruited and paid $0.50 for participating. 
- First, each subject saw a written sentence containing either an instance of lexical totally or speaker-oriented totally. The subjects were asked to provide four adjectives to describe the imagined speaker of the sentence. 
- Based on the most frequently recurring adjectives in the responses, a total of eight evaluation dimensions were selected as particularly salient in connection with the use of the intensifier. 
- Four of these dimensions, based on the participants’ responses, appear to be positively associated with the use of the intensifier. Following the literature on language attitudes (Lambert et al. 1960), we call them ‘Solidarity’ attributes. 
- The other four dimensions express identity categories that feature a negative association with totally. We label them ‘Status’ attributes. 
- The resulting eight scales are summarized as follows:
	- Solidarity: Friendliness, Coolness, Outgoingness, Excitability 
	- Status: Articulateness, Maturity, Intelligence, Seriousness

# Concrete proposal for first mini-pilot with "Volk":
- Hypothesis: "Volk" is a dogwhistle: It’s literal meaning is merely ’people’, but it has a conservative connotation, evoking admiration for Nazi Germany; speakers who use it thereby signal alignment with conservative/nazi values. 
- Expectation: Participants overall will be more likely to attribute right-wing stances to speakers using “Volk” than to speakers using the alternative formulations (no expectation that only participants with right-wing stances will attribute right-wing stances).
- Target materials:
  - “Kinder sind die Zukunft unseres Volkes.” / “Kinder sind die Zukunft unserer Gesellschaft.” (We need to specify that speaker is German politician.)
  - “Die Aufnahme in das deutsche Staatsvolk ist an strenge Bedingungen geknüpft” / “Der Erwerb der deutschen Staatsbürgerschaft ist an strenge Bedingungen geknüpft.”
- Each participant sees one target with “Volk” and one replacement.
- 2 Controls (everybody sees these two, used to remove data from participants not attending to the task?):
  - “Alle Ausländer sind gewalttätig.” Clearly racist, serves as baseline and sanity check.
  - “In Deutschland leben circa 22 Millionen Menschen mit Migrationshintergrund.” Clearly harmless / unbiased.
- 6 Fillers (to distract from the 4 items concerning immigration, everybody sees these):
  - “Klimaschutz muss sozial gerecht sein.”
  - “Jedes Kind hat ein Recht auf gute Kitas und Schulen, egal wo es lebt.”
  - “Die Digitalisierung ist eine der zentralen Infrastrukturen unseres Lebens.”
  - “Klimaschutz darf nicht zu Nachteilen im internationalen Wettbewerb führen.”
  - “Gesundheitsschutz und Pflege brauchen einen größeren Stellenwert.”
  - “Die Kulturlandschaft soll nach der Pandemie zu neuer Lebendigkeit finden.”

# Proposal for a pilot experiment to identify German dog whistles

## Research question

Which expressions are such that some but not all speakers of German perceive a message that is not part of the conventional content? In this pilot project, we focus broadly on the topic of migration/foreigners. Thus, the research question more specifically is: Which expressions are such that some speakers of German perceive that an expression conveys that the speaker has a racist attitude towards migrants / foreigners / refugees / asylum seekers?

## Participants

- Recruit native speakers of German living in Germany on Prolific.
- How many?
- Questionnaire to identify relevant aspects of their socio-political profile, present at the end of the experiment.
  - Age
  - Gender: männlich, weiblich, divers, möchte ich nicht antworten
  - Höchster Bildungsabschluss: kein Schulabschluss, Hauptschule, Realschule, Gymnasium, Bachelor, Master, Promotion
  - Wenn am Sonntag Bundestagswahl wäre, welche Partei würden Sie wählen? 
  - Relevante Wahl-O-Mat Fragen (stimme zu, neutral, stimme nicht zu):
    1. Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.  
    Stimme zu: AfD  
    Neutral: FDP  
    Stimme nicht zu: CDU/CSU, SPD, Links, Grün
    2. Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.  
    Stimme zu: Links, Grün  
    Neutral: FDP  
    Stimme nicht zu: CDU/CSU, SPD, AfD,
    3. In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.  
    Stimme zu: SPD, Links, Grün  
    Neutral: FDP  
    Stimme nicht zu: CDU/CSU, AfD
    4. Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.  
    Stimme zu: SPD, Links, Grün, FDP  
    Neutral: CDU/CSU  
    Stimme nicht zu: AfD
    5. Asyl soll weiterhin nur politisch Verfolgten gewährt werden.  
    Stimme zu: CDU/CSU, SPD, AFD, FDP  
    Stimme nicht zu: Links, Grün

Wahl-O-Mat questions 1-5 allow us to identify people who are critical of foreigners and migration (quantification: +1 (like AfD), 0 neutral, -1 (like Green/Left).

Further Wahl-O-Mat questions (purpose?):
1. Unternehmen sollen selbst entscheiden, ob sie ihren Beschäftigten das Arbeiten im Homeoffice erlauben.
2. Der kontrollierte Verkauf von Cannabis soll generell erlaubt sein.
3. Der Staat soll weiterhin für Religionsgemeinschaften die Kirchensteuer einziehen.
4. Spenden von Unternehmen an Parteien sollen weiterhin erlaubt sein.
5. Der für das Jahr 2038 geplante Ausstieg aus der Kohleverstromung soll vorgezogen werden.

## Materials

- Materials are of the form [Sprecher] sagte: “X”, where X is a short passage with a potential dog whistle (PDW), or a minimally different version without the PDW.

- Materials include PDWs that are conventionalized (“Volk”, “Let's go Brandon”, “inner city”) as well as ones that are not conventionalized but need context to be PDWs (“Hilfe vor Ort”); TAXONOMY

Potential target stimuli (original with PDW / minimal variant without PWD):
- Volk: “Kinder sind die Zukunft unseres Volkes” / “Kinder sind die Zukunft unserer Gesellschaft”.
- Hilfe vor Ort: “Hilfe vor Ort hat für die AfD höchste Priorität.” $\Rightarrow$ “Hilfe vor Ort hat für uns höchste Priorität.” / “Menschen zu helfen hat für uns höchste Priorität.” Needs context that makes clear that this is about refugees: “Bei der Flüchtlingsfrage hat/ist …”
- Kampf für Deutschland: “Auch 2022 geht unser Kampf für Deutschland weiter.” / “Auch 2022 geht unser Kampf für den Klimaschutz weiter.” / Auch 2022 setzen wir uns weiter für Deutschland ein (better, because same content)
- Identitätswahrende Migrationspolitik: “Vorbild einer identitätswahrenden Migrationspolitik können für Deutschland nicht klassische Einwanderungsländer von der Größe Kanadas oder Australiens sein, sondern eher Länder wie Japan, die eine ihrer Landesstruktur entsprechende Begrenzung und Steuerung der Migration verfolgen.”
$\Rightarrow$ “Vorbild einer identitätswahrenden Migrationspolitik sind Länder wie Japan.” / “Vorbild einer funktionierenden Migrationspolitik sind Länder wie Japan.”
- Clankriminalität: “Wenn die Linke die Razzien gegen die Clankriminalität in Berlin-Neukölln beenden will …” $\Rightarrow$ “Wer will Razzien gegen die Clankriminalität beenden?” / “Wer will Razzien gegen organisierte Kriminalität beenden?”
- Deutsches Staatsvolk: “die Aufnahme in das deutsche Staatsvolk, die definitiven Charakter hat, an strenge Bedingungen zu knüpfen”
$\Rightarrow$ “Die Aufnahme in das deutsche Staatsvolk ist an strenge Bedingungen geknüpft.” / “Der Erwerb der deutschen Staatsbürgerschaft ist an strenge Bedingungen geknüpft.”

Controls: 
- Type 1: Stimuli where everybody would agree that the expression is racist; this will allow us to exclude participants not attending to the task, but it also provides a point of comparison for PDWs (e.g., “Ausländer sind gewalttätig”)
- Type 2: Stimuli where everybody would agree that the expression is, e.g., green (exclude participants not giving high enough “green” ratings), inflammatory though not DW: e.g., “Steuererhöhung”.
  
Fillers: to distract participants from the target stimuli.

Each participant reads:
- Target stimuli with PDWs
- Target stimuli without PDWs
- Control stimuli (for exclusion)
- Filler stimuli (for distraction)
  
## Procedure

- On each trial, a participant reads a stimulus and rates the following:
  - Speakers' age, gender, education
  - Wenn am Sonntag Wahl wäre, wen würde Sprecher wählen? 
  - Which attributes (on a slider?)? **establish through pretest?**
    - Rassistisch
    - Umweltbewusst
    - Gebildet
  - What would the speaker answer on the following questions
    - Das Recht anerkannter Flüchtlinge auf Familiennachzug soll abgeschafft werden.
    - Das Tragen eines Kopftuchs soll Beamtinnen im Dienst generell erlaubt sein.
    - In Deutschland soll es generell möglich sein, neben der deutschen eine zweite Staatsbürgerschaft zu haben.
    - Islamische Verbände sollen als Religionsgemeinschaften staatlich anerkannt werden können.
    - Asyl soll weiterhin nur politisch Verfolgten gewährt werden.

## Analysis

Not yet started

# Taxonomy (develop in phase 1)

- Conventionalized dog whistle: independent of context or speaker, “inner city (crime)”
- Speaker-dependent dog whistle: “Clankriminalität”?  Used to activate stereotypes about certain ethnicities but Wikipedia (relatively neutral source) also has an entry for that term.  Quote from Wikipedia: “Ein paar Wissenschaftler wiesen auf eine ’stigmatisierende’ Verwendung des Begriffs ’Clankriminalität’ hin und erklärten, dass staatliche Maßnahmen gegen Clankriminalität vorrangig politisch motiviert seien und sich negativ auf präventive Maßnahmen und auf die Integration von dem noch nicht kriminell gewordenen Teil in den Familien auswirken würden.[14]”  So it’s supposedly only certain uses that are stigmatizing, not the term itself?
- Content-dependent dog whistle: “Hilfe vor Ort” harmless in the context of the 2021 floodings in Germany, loaded when talking about migration.

# Specific examples of dog whistles

## Clankriminalität

- Potentially stigmatizing certain ethnic groups.
- Contrary to dog whistle definition often not covert.  The fact that it is used to refer to certain ethnicities and subcultures is rarely hidden.
- Definition by the [Bund deutscher Kriminalbeamter](https://www.bdk.de/der-bdk/wer-wir-sind/positionen/2019-04-29-bdk-positionspapier-clankriminalitaet.pdf): “Definition: Clankriminalität ist die Begehung von Straftaten durch Angehörige ethnisch abgeschotteter Subkulturen.  Sie ist bestimmt von verwandtschaftlichen Beziehungen, einer gemeinsamen ethnischen Herkunft und einem hohen Maß an Abschottung der Täter, wodurch die Tatbegehung gefördert oder die Aufklärung der Tat erschwert wird. Dies geht einher mit einer eigenen Werteordnung und der grundsätzlichen Ablehnung der deutschen Rechtsordnung.  Dabei kann Clankriminalität einen oder mehrere der folgenden Indikatoren aufweisen: 1. Eine starke Ausrichtung auf die zumeist patriarchalisch-hierarchisch geprägte Familienstruktur.  2. Eine mangelnde Integrationsbereitschaft mit Aspekten einer räumlichen Konzentration.  3. Das Provozieren von Eskalationen auch bei nichtigen Anlässen oder geringfügigen Rechtsverstößen.  4. Die Ausnutzung gruppenimmanenter Mobilisierungs- und Bedrohungspotenziale.” See also section 3 in this document which adds more details (Heiratsregeln, Ehrverständnis, Paralleljustiz).  This document assumes that this is a clearly distinguished phenomenon that requires dedicated responses, and perhaps that’s also the justification for using the term (but that’s not made explicit).  Note that the existence of a clear and transparent definition (in the context of police work) is incompatible with plausible deniability.  Other uses of “Clankriminalität” may still have a payload that requires plausible deniability.
- “Clan” is also used in the context of the Sicilian Mafia, see e.g. [Wikipedia](https://de.wikipedia.org/wiki/Italienische_Mafia).
- “Clan” is also used in the context of Corsican organized crime, e.g. [Süddeutsche Zeitung](https://www.sueddeutsche.de/panorama/mafia-auf-korsika-moerderische-meeresbrise-1.61303) (2010, i.e. before Arab organized crime became a hot topic in Germany).  A Google search for “Korsische Clans” produces 1.2M hits.

### Sources:

- Bund Deutscher Kriminalbeamter, “Clankriminalität bekämpfen: Strategische Ausrichtung – nachhaltige Erfolge”, https://www.bdk.de/der-bdk/wer-wir-sind/positionen/2019-04-29-bdk-positionspapier-clankriminalitaet.pdf
- Clankriminalität (https://www.presseportal.de/pm/130241/5040654)
- https://www.afd.de/beatrix-von-storch-linkspartei-auch-unterstuetzer-der-organisierten-clan-kriminalitaet/
- AfD Wahlprogramm

## “Sex is real”

- Implied meaning: Only people assigned female at birth (based on sex markers) are women.

## “Das muss man auch einmal klar sagen.” (Gysi, Bundestagsrede)

Similarly: “Jede Wahrheit braucht einen Mutigen, der sie ausspricht.”  (Campaign of the Bild-Zeitung, allegedly an Einstein quote but not substantiated, [many times caricatured](https://www.google.com/search?q=jede+wahrheit+braucht+einen+mutigen+der+sie+ausspricht&hl=en&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjKmcao5r31AhUn57sIHUHzBj8Q_AUoAXoECAEQAw&biw=1704&bih=856&dpr=1.5)).

Implied meaning:
- They speak the truth.
- Others don’t speak the truth.
- The truth is suppressed.
- Speaking this truth breaks a taboo is an inconvenient truth.
- The one speaking those truths is virtuous and courageous.
- Bild attributed their slogan to Einstein, Gandhi, ML King, which adds more layers of meaning.

But does any of that require plausible deniability?  Do we expect sensitivity to meaning to differ between in- and outgroup?

## “Kerneuropa” (Gysi, Bundestagsrede, 2015-06-18)

- Potentially alluding to the idea that France and Germany are trying to dominate the rest of the EU.

## “Hilfe vor Ort”

- Dog whistly when used in the context of immigration from the middle east.
- Not dog whistly when used in the context of 2021 floodings in Rhineland-Palatinate and North Rhine-Westphalia.
- Hilfe vor Ort: “Hilfe vor Ort hat für die AfD höchste Priorität” (AfD Wahlprogramm)

## “Volk”

- “Kinder sind die Zukunft unseres Volkes.” (AdD Wahlprogramm)
- “Wir sind das Volk”, Georg Büchner, /Dantons Tod/, 1. Akt, 2. Szene (1835)
- “Wir sind das Volk”, DDR-Protestbewegung, 1989/190.
- “Wir sind ein Volk”, Wendezeit, 1990-
- “Wir sind das Volk”, PEGIDA-Bewegung, 2014-, Suggestion, dass PEGIDA die Mehrheit der Gesellschaft repräsentiert, aber auch Abgrenzung von Migranten.
- “Das Volk ist jeder, der in diesem Land lebt.”
Merkel speaking out against individual groups appropriating the concept of the people for themselves.  Also Merkel’s response to PEGIDA and possibly her rejection of the Dog Whistle use of the term.  NZZ Article about Merkel’s statement, its context, and the history of the concept and related concepts (e.g., “Staatsvolk”).
- “Wirr ist das Volk!”, Titanic, Die Partei, 2016.

## “Brauchtum”

- AfD Wahlprogramm

## “Massenzuwanderung”

- “Die desaströsen Folgen der unregulierten Massenzuwanderung seit 2015 sind unübersehbar und verschärfen sich weiter: überproportionale Zuwandererkriminalität, Terroranschläge und islamischer Separatismus belegen dies ebenso wie dreistellige Milliardenkosten, Wohnraummangel und die hohe Arbeitslosigkeit unter den Zuwanderern.” (AfD Wahlprogramm)

## “Deutsches Staatsvolk”

- “die Aufnahme in das deutsche Staatsvolk, die definitiven Charakter hat, an strenge Bedingungen zu knüpfen” (https://www.afd.de/staatsvolk)

## “Identitätswahrende Migrationspolitik”
- “Vorbild einer identitätswahrenden Migrationspolitik können für Deutschland nicht klassische Einwanderungsländer von der Größe Kanadas oder Australiens sein, sondern eher Länder wie Japan, die eine ihrer Landesstruktur entsprechende Begrenzung und Steuerung der Migration verfolgen.” (AfD Wahlprogramm)

## “Kampf (für Deutschland)”

- “Auch 2022 geht unser Kampf für Deutschland weiter.”  (https://afd.de)

# Sources of PDWs

- https://www.afd.de/wahlprogramm-asyl-einwanderung/
- FDP
- https://www.tagesschau.de/ausland/amerika/usa-brandon-trump-republikaner-schlachtruf-101.html
- Bundestagscorpus und Reden der AfD
- https://die-linke.de
- Mindestsicherung
- Polizeistaat
- Ausdrücke in Anführungszeichen bei der AfD / Annotation von dog whistles?
- Gender-gerechte Sprache
- Klimadebatte
- Covid-Skeptizismus, Debatten zur Impfpflicht
- Stuttgart 21 Debatte?

# Saxony’s prime minister Michael Kretschmer demands “vernünftiges Verhältniss zu Russland” (reasonable relationship with Russia).
- https://www.zeit.de/news/2022-03/02/kretschmer-fordert-vernuenftiges-verhaeltnis-zu-russland?utm_referrer=https%3A%2F%2Fwww.google.com%2F
- Pragmatic Analysis: The literal content is self-evidently true because nobody would argue for an unreasonable relationship to any country.  So there is a content gap / ambiguity / violation of maxim of quantity.  Intended meaning not clear.
- Some might fill this gap with something like “we should not confront Russia over what they are doing in Ukraine”.  But this can’t be said explicitly in the first week of war, it’s a taboo.
- Further, Kretschmer can claim plausible deniability and pretend that he meant something more benign than what his accusers are saying.
- Summary:
  1. Presence of a taboo. 🗹
  2. Violation of maxim of quantity. 🗹
  3. Meaning can be enriched with a controversial meaning that’s violating the taboo (i.e. literal meaning is not incompatible with implied meaning). 🗹
  4. Plausible deniability. 🗹

# References

