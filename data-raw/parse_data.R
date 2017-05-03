library(tidyverse)
library(magrittr)
library(forcats)
library(assertthat)


files <- Sys.glob("[dD]ata */*.[Dd][Aa][Tt]")

read_file <- function(fn) {
  readr::read_table(fn,
                    col_names = c("trial", "movie", "response", "time"),
                    col_types = "iccc",
                    comment="!") %>%
    ## manually parse time (decimal, sometimes with ',', sometimes with '.')
    mutate(time = time %>% stringr::str_replace(",", ".") %>% as.double(),
           source = fn,
           session_time = file.mtime(fn))
}


dat <-
  files %>%
  map(read_file) %>%
  lift(bind_rows)() %>%
  mutate(source_lower = str_to_lower(source)) %>%
  tidyr::extract(source_lower, "subject",
                 regex="pp([0-9]*)",
                 remove=TRUE, convert=TRUE) %>%
  mutate(subject = ifelse(str_detect(source, "Data 13"), subject + 16, subject),
         response_raw = response,
         response = factor(response_raw, levels=c("Z", "M")) %>% fct_recode(b="Z", d="M"))



pretest <- dat %>%
  filter(str_detect(source, regex("pre", ignore_case=TRUE))) %>%
  mutate(source_lower = str_to_lower(source)) %>%
  tidyr::extract(source_lower, "session", regex="pre([12])",
                 remove=TRUE, convert=TRUE) %>%
  tidyr::extract(movie, "aud", "bd([0-9]+)", convert=TRUE, remove=FALSE)





## get exposure levels for exposure blocks
## exposure videos are mixed into the test trials

dat_adapt <- filter(dat, str_detect(source, regex("v[bd]a", ignore_case=TRUE)))

exposures <-
  dat_adapt %>%
  filter(str_detect(movie, "^[vV]")) %>%
  tidyr::extract(movie, c("vid", "aud", "exposures"),
                 "[vV]([bd])a([0-9])k?R?([0-9]*)", convert=TRUE) %>%
  # movies with one exposure don't have R(n).avi like the rest, so fix these:
  mutate(exposures = ifelse(is.na(exposures), 1, exposures)) %>%
  select(trial, vid, aud, exposures, source) %>%
  mutate(vid = factor(vid),
         ambiguous = factor(ifelse(vid %in% c(1,9),
                                   "prototypical",
                                   "ambiguous"),
                            levels = c("prototypical", "ambiguous")))


adaptation <- 
  dat_adapt %>%
  left_join(exposures) %>%
  # fill in exposure=0 for test trials:
  mutate(exposures = ifelse(is.na(exposures), 0, exposures)) %>%
  group_by(source) %>%
  mutate(exposures = cumsum(exposures)) %>%
  # get rid of exposure trials
  filter(!str_detect(movie, "^[vV]")) %>%
  tidyr::extract(movie, "aud", "bd([0-9]*)", convert=TRUE, remove=FALSE)

## extract metadata for adaptation sessions
adapt_sessions <-
  dat_adapt %>%
  group_by(subject, source, session_time) %>% 
  summarise() %>%
  arrange(subject, session_time) %>% 
  mutate(source_lower=str_to_lower(source)) %>%
  tidyr::extract(source_lower, c("vid", "aud"), "v([bd])a([0-9])", convert=TRUE) %>%
  mutate(vid = factor(vid),
         ambiguous = factor(ifelse(vid %in% c(1,9),
                                   "prototypical",
                                   "ambiguous"),
                            levels = c("prototypical", "ambiguous")))



sessions <-
  adaptation %>%
  group_by(subject, aud, vid, session_time) %>%
  summarise() %>%
  mutate(block = rank(session_time))


assert_that(nrow(pretest) + nrow(exposures) + nrow(adaptation) == nrow(dat))

