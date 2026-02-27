#=========================================================#
## ===================== OVERVIEW ====================== ##
#=========================================================#

## This script is meant to assess how fatty acids are related to various
## under-ice conditions. In particular, we assessed how the proportion of 
## white ice was related to certain fatty acids' abundance. This script is 
## divided into XX key sections. 
## 1. Plot fatty acids ~ white ice proportion
## 2. Run models for relating fatty acids ~ white ice proportion.
## 3. Relating Chlorophyll Concentration with PAR


# 1. Load libraries -------------------------------------------------------

library(tidyverse)
library(broom)


# 2. Load and aggregate data ----------------------------------------------

chem_memo <- read_csv("../Data/memo_chem_data_full.csv")

full_dat <- read_csv("../Data/full_dat.csv") %>%
  group_by(lakeid, winter_yr, season, month) %>%
  summarize(across(.cols = c('sumSAFA', 'sumMUFA', 'sumPUFA',
                            'c18.2w6', 'c18.3w6', 'c18.3w3',
                            'c18.4w3', 'c18.5w3', 'c20.4w6',
                            'c20.5w3', 'c22.6w3'
                            ), 
                   .fns = ~ mean(.x, na.rm = TRUE))) %>%
  mutate(totalfa = sumSAFA + sumMUFA + sumPUFA,
         sumSAFA = sumSAFA / totalfa,
         sumPUFA = sumPUFA / totalfa,
         sumMUFA = sumMUFA / totalfa,
         c18.2w6 = c18.2w6 / totalfa,
         c18.3w6 = c18.3w6 / totalfa,
         c18.3w3 = c18.3w3 / totalfa,
         c18.4w3 = c18.4w3 / totalfa,
         c18.5w3 = c18.5w3 / totalfa,
         c20.4w6 = c20.4w6 / totalfa,
         c20.5w3 = c20.5w3 / totalfa,
         c22.6w3 = c22.6w3 / totalfa)


chem_bio <- left_join(x = full_dat, 
                      y = chem_memo,
                      by = c('lakeid' = 'lakeid',
                             'winter_yr' = 'year4',
                             'month' = 'month')) %>%
  filter(season == "iceon") 


# 3. Plot fatty acids ~ white ice -----------------------------------------

chem_bio %>%
  mutate(prop_white_ice = whiteice / totice) %>%
  pivot_longer(cols = c(`c18.2w6`:`c22.6w3`), names_to = "efa", values_to = "prop") %>%
  mutate(efa = case_when(efa == "c18.2w6" ~ "18:2\u03C96",
                         efa == "c18.3w6" ~ "18:3\u03C96",
                         efa == "c18.3w3" ~ "18:3\u03C93",
                         efa == "c18.4w3" ~ "18:4\u03C93",
                         efa == "c18.5w3" ~ "18:5\u03C93",
                         efa == "c20.4w6" ~ "20:4\u03C96",
                         efa == "c20.5w3" ~ "20:5\u03C93",
                         efa == "c22.6w3" ~ "22:6\u03C93")) %>%
  ggplot() +
  geom_point(aes(x = avsnow, y = prop)) +
  geom_smooth(aes(x = avsnow, y = prop), method = "lm") +
  facet_wrap(vars(efa), scales = "free") +
  ylab("Proportion of essential fatty acid") +
  xlab("Average snow depth (cm)") +
  theme_bw() +
  theme(axis.text = element_text(size = 12),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 18),
        strip.text = ggtext::element_markdown(size = 16))


# 4. Run models for fatty acids ~ white ice -------------------------------

efa_summary <- chem_bio %>%
  mutate(prop_white_ice = whiteice / totice) %>%
  pivot_longer(cols = c(`c18.2w6`:`c22.6w3`), names_to = "efa", values_to = "prop") %>%
  group_by(efa) %>%
  nest() %>%
  mutate(model_lm = map(.x = data,
                        .f = ~ lm(prop ~ prop_white_ice, data = .x)),
         model_glance = map(.x = model_lm,
                             .f = ~ tidy(.x))) %>%
  unnest(cols = c(model_glance)) %>%
  filter(term == "prop_white_ice") %>%
  select(-data, -model_lm, -term)

fa_summary <- chem_bio %>%
  mutate(prop_white_ice = whiteice / totice) %>%
  pivot_longer(cols = c(sumSAFA, sumMUFA, sumPUFA), names_to = "efa", values_to = "prop") %>%
  group_by(efa) %>%
  nest() %>%
  mutate(model_lm = map(.x = data,
                        .f = ~ lm(prop ~ prop_white_ice, data = .x)),
         model_glance = map(.x = model_lm,
                            .f = ~ tidy(.x))) %>%
  unnest(cols = c(model_glance)) %>%
  filter(term == "prop_white_ice") %>%
  select(-data, -model_lm, -term)

write_csv(x = bind_rows(efa_summary, fa_summary), file = "../Data/model_whiteice_summaries.csv")

