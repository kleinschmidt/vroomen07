
#' Incremental recalibration test data from Vroomen et al. (2007)
#'
#' Subjects were tested on forced choice b/d classification throughout
#' recalibration/selective adaptation, after 1, 2, 4, 8, 16, 32, 64, 128, and
#' 256 cumulative exposures.  Adaptors were audiovisual stimuli, with visual /b/
#' or /d/ and audio from a 1-9 /b/-to-/d/ continuum.  Test stimuli were taken
#' from the middle of the continuum, based on the pre-test classification (most
#' ambiguous plus/minus one).
#'
#' @format A data frame with 26,406 observations of 13 variables
#' \describe{
#' \item{trial}{}
#' \item{aud}{Test stimulus}
#' \item{response}{Factor with levels "b" and "d"}
#' \item{time}{Reaction time, in seconds}
#' \item{source}{Name of the raw data file this observations came from}
#' \item{session_time}{The date and time of this session, based on the timestamp
#'   on the source data file}
#' \item{subject}{The subject number}
#' \item{response_raw}{Character of response key from raw data file.  Anything
#'   other than "Z" and "M" are coded as NA in response}
#' \item{exposures}{Number of cumulative adaptor exposures before this test
#'   trial}
#' \item{exposure_vid}{Video category of adaptor (factor, levels "b" or "d")}
#' \item{exposure_aud}{The continuum number of the adaptor audio component}
#' \item{ambiguous}{Whether the adaptor is "ambiguous" or "unambiguous" (factor)}
#' \item{session}{The session number (1-16 for most subjects, a few have more),
#'   based on the file modified times}
#' }
#'
#' @source Vroomen, J., van Linden, S., de Gelder, B., & Bertelson, P. (2007).
#'   Visual recalibration and selective adaptation in auditory-visual speech
#'   perception: Contrasting build-up courses.  Neuropsychologia, 45(3), 572–7.
#'   \url{https://doi.org/10.1016/j.neuropsychologia.2006.01.031}
#' 
"adapt"

#' Pre-test calibration data
#'
#' Before recalibration, subjects classified the audio /aba/-to-/ada/ continuum
#' (1 to 9) to determine where their maximally ambiguous stimulus was.  A second
#' pre-test was done for some subjects, using only the three maximally ambiguous
#' stimuli that were later tested during adaptation.
#'
#' @format A data frame with 3,224 observations of 10 variables
#' \describe{
#' \item{trial}{Trial number}
#' \item{movie}{The stimulus file from this trial}
#' \item{aud}{Test stimulus}
#' \item{response}{Factor with levels "b" and "d"}
#' \item{time}{Reaction time, in seconds}
#' \item{source}{Name of the raw data file this observations came from}
#' \item{session_time}{The date and time of this session, based on the timestamp
#'   on the source data file}
#' \item{subject}{The subject number}
#' \item{response_raw}{Character of response key from raw data file.  Anything
#'   other than "Z" and "M" are coded as NA in response}
#' }
#'
#' @source Vroomen, J., van Linden, S., de Gelder, B., & Bertelson, P. (2007).
#'   Visual recalibration and selective adaptation in auditory-visual speech
#'   perception: Contrasting build-up courses.  Neuropsychologia, 45(3), 572–7.
#'   \url{https://doi.org/10.1016/j.neuropsychologia.2006.01.031}
#' 
#' @seealso \link{\code{pretest_ambig}} for a second pre-test using the three
#'   most ambiguous stimuli from this pretest.
"pretest"

#' Pre-test calibration data
#'
#' A second pre-test was done for some subjects, using only the three maximally
#' ambiguous stimuli that were later tested during adaptation.
#'
#' @format A data frame with 3,224 observations of 10 variables
#' \describe{
#' \item{trial}{Trial number}
#' \item{movie}{The stimulus file from this trial}
#' \item{aud}{Test stimulus}
#' \item{response}{Factor with levels "b" and "d"}
#' \item{time}{Reaction time, in seconds}
#' \item{source}{Name of the raw data file this observations came from}
#' \item{session_time}{The date and time of this session, based on the timestamp
#'   on the source data file}
#' \item{subject}{The subject number}
#' \item{response_raw}{Character of response key from raw data file.  Anything
#'   other than "Z" and "M" are coded as NA in response}
#' }
#'
#' @source Vroomen, J., van Linden, S., de Gelder, B., & Bertelson, P. (2007).
#'   Visual recalibration and selective adaptation in auditory-visual speech
#'   perception: Contrasting build-up courses.  Neuropsychologia, 45(3), 572–7.
#'   \url{https://doi.org/10.1016/j.neuropsychologia.2006.01.031}
#' 
#' @seealso \link{\code{pretest}} for the full continuum pretest data.
"pretest_ambig"

