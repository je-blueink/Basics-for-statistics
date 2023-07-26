Python pandas와 R의 dplyr
================

**책 5. mtcars 자료를 대상으로 다음 작업을 수행하는 dplyr 코드를
작성하고, 실제 수행시킨 결과를 제시하시오.**

카뷰레터의 수(carb)가 5개 미만인 경우만을 뽑아서 카뷰레터 수에 따라
그룹화하고, 각 그룹별로 연비(mpg)의 평균, 배기량(disp)의 평균, 각 그룹에
속하는 자료의 개수를 구하여 평균 배기량이 낮은 순서부터 결과를
제시하시오.

- dplyr 패키지 불러오기, mtcars 데이터셋 확인

``` r
library(dplyr)
```

    ## Warning: 패키지 'dplyr'는 R 버전 4.2.3에서 작성되었습니다

    ## 
    ## 다음의 패키지를 부착합니다: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
data("mtcars")
head(mtcars)
```

    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

- 카뷰레터(carb) 5개 미만인 경우 추출, 카뷰레터 수에 따라 그룹화, 각
  그룹별로 연비(mpg)의 평균, 배기량(disp)의 평균, 각 그룹에 속하는
  자료의 개수 구하기, 평균 배기량 낮은 순서로 정렬

``` r
mtcars %>% filter(carb < 5) %>% group_by(carb) %>% 
  summarize(avr_mpg = mean(mpg), avr_disp = mean(disp), count = n()) %>%
  arrange(avr_disp)
```

    ## # A tibble: 4 × 4
    ##    carb avr_mpg avr_disp count
    ##   <dbl>   <dbl>    <dbl> <int>
    ## 1     1    25.3     134.     7
    ## 2     2    22.4     208.    10
    ## 3     3    16.3     276.     3
    ## 4     4    15.8     309.    10

------------------------------------------------------------------------

**워크북 8. R에서 mtcars 데이터에서 mtcars 자료 중 자동변속기를
채용한(am==0) 자동차들의 경우를 추출하고자 한다. ( )안에 들어갈
명령은?**

``` r
mtcars %>% filter(am==0)
```

    ##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    ## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    ## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    ## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    ## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    ## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    ## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    ## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    ## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    ## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    ## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2

------------------------------------------------------------------------

**워크북 9. R에서 mtcars 데이터에서 mtcars 자료 중 자동변속기를 채용한
(am==0) 자동차들의 경우를 골라 카뷰레터 수(carb) 값에 따라 자동차
연비(mpg)의 평균을 구하고자 한다. ( )안에 들어갈 명령은?**

``` r
mtcars %>% filter(am==0) %>% group_by(carb) %>% summarize(mean(mpg))
```

    ## # A tibble: 4 × 2
    ##    carb `mean(mpg)`
    ##   <dbl>       <dbl>
    ## 1     1        20.3
    ## 2     2        19.3
    ## 3     3        16.3
    ## 4     4        14.3
