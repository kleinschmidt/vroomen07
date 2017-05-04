# Recalibration data from Vroomen et al. (2007)

This package contains the data from Vroomen, J., van Linden, S., de Gelder, B.,
& Bertelson, P. (2007).  Visual recalibration and selective adaptation in
auditory-visual speech perception: Contrasting build-up courses.
_Neuropsychologia_, 45(3),
572–7.
[doi:10.1016/j.neuropsychologia.2006.01.031](https://doi.org/10.1016/j.neuropsychologia.2006.01.031) (generously provided by Jean Vroomen).

There is both pre-training test classification data of the /aba/-/ada/ continuum
(including one session with the full continuum, and a second with the part of
the continuum that was later tested during adaptation) and mini test blocks
during incremental recalibration exposure.

## Installation

```r
devtools::install_github("kleinschmidt/vroomen07")
```

## Usage

```r
data(package="vroomen07")

#> Data sets in package ‘vroomen07’:
#> 
#> adapt
#> pretest
#> pretest_mid
```

For instance:

``` r
vroomen07::pretest
#> # A tibble: 3,224 × 10
#>    trial     movie   aud response  time               source
#>    <int>     <chr> <int>   <fctr> <dbl>                <chr>
#> 1      1 bd01n.wav     1        b 1.735 Data 13/Pre1pp10.DAT
#> 2      2 bd09n.wav     9        d 0.812 Data 13/Pre1pp10.DAT
#> 3      3 bd01n.wav     1        b 0.844 Data 13/Pre1pp10.DAT
#> 4      4 bd09n.wav     9        d 0.781 Data 13/Pre1pp10.DAT
#> 5      5 bd01n.wav     1        b 0.781 Data 13/Pre1pp10.DAT
#> 6      6 bd09n.wav     9        d 0.812 Data 13/Pre1pp10.DAT
#> 7      7 bd06n.wav     6        d 0.813 Data 13/Pre1pp10.DAT
#> 8      8 bd03n.wav     3        b 0.797 Data 13/Pre1pp10.DAT
#> 9      9 bd02n.wav     2        b 0.859 Data 13/Pre1pp10.DAT
#> 10    10 bd03n.wav     3        b 0.891 Data 13/Pre1pp10.DAT
#> # ... with 3,214 more rows, and 4 more variables: session_time <dttm>,
#> #   subject <dbl>, response_raw <chr>, session <int>
```

## Documentation

Datasets are documented in the usual way:

```r
?vroomen07::adapt
```

## Data preparation

See `data-raw/parse_data.Rmd` (or the HTML file generated from that notebook)
for how the data was prepared.
