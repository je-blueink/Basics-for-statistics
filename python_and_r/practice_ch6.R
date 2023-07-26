---
title: "study_hw_0921"
output:
  html_notebook: default
  github_document: default
---

**책 5. mtcars 자료를 대상으로 다음 작업을 수행하는 dplyr 코드를 작성하고, 실제 수행시킨 결과를 제시하시오.**

카뷰레터의 수(carb)가 5개 미만인 경우만을 뽑아서 카뷰레터 수에 따라 그룹화하고, 각 그룹별로 연비(mpg)의 평균, 배기량(disp)의 평균, 각 그룹에 속하는 자료의 개수를 구하여 평균 배기량이 낮은 순서부터 결과를 제시하시오.

* dplyr 패키지 불러오기, mtcars 데이터셋 확인

```{r}
library(dplyr)
data("mtcars")
head(mtcars)
```

* 카뷰레터(carb) 5개 미만인 경우 추출, 카뷰레터 수에 따라 그룹화, 각 그룹별로 연비(mpg)의 평균, 배기량(disp)의 평균, 각 그룹에 속하는 자료의 개수 구하기, 평균 배기량 낮은 순서로 정렬

```{r}
mtcars %>% filter(carb < 5) %>% group_by(carb) %>% 
  summarize(avr_mpg = mean(mpg), avr_disp = mean(disp), count = n()) %>%
  arrange(avr_disp)
```

---

**워크북 8. R에서 mtcars 데이터에서 mtcars 자료 중 자동변속기를 채용한(am==0) 자동차들의 경우를 추출하고자 한다. (  )안에 들어갈 명령은?**

```{r}
mtcars %>% filter(am==0)
```

---

**워크북 9. R에서 mtcars 데이터에서 mtcars 자료 중 자동변속기를 채용한 (am==0) 자동차들의 경우를 골라 카뷰레터 수(carb) 값에 따라 자동차 연비(mpg)의 평균을 구하고자 한다. (  )안에 들어갈 명령은?**

```{r}
mtcars %>% filter(am==0) %>% group_by(carb) %>% summarize(mean(mpg))
```

