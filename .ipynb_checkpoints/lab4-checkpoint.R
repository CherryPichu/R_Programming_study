# read/write ----
## 파일 읽고 쓰기
## 프로젝트를 진행할 경우, 직접 파일을 만드는 경우는 드뭄. 
## 이미 존재하는 파일을 읽고 결과를 출력.

## 로컬 환경에서는 파일 읽기전 작업 디렉토리 확인이 중요함

getwd() ## 현재 작업하고 있는 디렉토리 확인
setwd("작업하고자하는 디렉토리 경로") ##디렉토리 변경 

## base의 read.table, read.csv
  # file : 읽어올 csv,text 파일
  # header : 기본값은 TRUE로 첫 줄을 변수명으로 읽을 것인지 결정
  # sep : 기본값은 콤마(,)로 열을 구분하는 기호를 전달
  # quote : 기본값은 큰따옴표(")로 각 열을 감싸는 문자 지정. 
  # fill : 기본값은 TRUE로 행 별로 열의 길이가 다를 때는 FALSE를 사용

help("read.table")
?read.table

readr_read <- read.csv(file = "Pre_Season_Batter.csv", header = T)

View(readr_read)
str(readr_read)
class(readr_read)

## base의 write(quote = T or F)
write.table(x = readr_read, file = "base_read.txt", sep = "\t", quote = FALSE)





# 조건문(if, if-else, ifelse) ----

# if , if-else 
# sample 1
grade <- 65
if(grade >= 70){
  print("합격")
} else {
  print("불합격")
}

# sample 2
vec1 <- c(10, 20, 30)
if(vec1 == 10){
  print("인사부")
} else{
  print("총무부")
}  ### -----> warning 발생

# if - else if - else
# sample 3
grade <- 78
if(grade >= 90){
  print("인사부")
} else if(grade >= 70){
  print("개발부")
} else {
  print("혁신부")
}

# warning!
vec1 <- c(10, 20, 30)
for(value in vec1){
  if(value == 20){
    print("총무부")
  } else if(value == 10){
    print("인사부")
  } else{
    print("총무부")
  }
}

# ifelse
vec1 <- c(10,20,30)
vec1_v2 <- ifelse(vec1 == 10, "인사부", "총무부")
vec1_v2
class(vec1_v2)

## 중복 사용 가능
vec1_v3 <- ifelse(vec1 == 10, "인사부", 
                  ifelse(vec1 == 20, "재무부", "총무부"))
vec1_v3







# lapply or sapply
lapply(X = vec1, FUN = function(value){
  return_value <- NULL
  if(value == 10){
    return_value <- "인사부"
  } else{
    return_value <- "총무부"
  }
}) %>% unlist()

## ifelse를 데이터 프레임에 적용!!
new <- ifelse(cars$speed >= 20, "겁나 빠름",
              ifelse(cars$speed >= 10, "쬐금 빠름", "평범.."))
view(new)

cars$new <- new
View(cars)

## dplyr::mutate 이용(!)
cars %>% dplyr::mutate(., new2=ifelse(dist >= 45, "멀다", "가깝나..(?)"))





# 반복문 ----
## for
# 인자가 벡터라면 ----> 각 인덱스에 해당하는 값이 value로 넘거짐
for(value in 1:10){
  print(value)
}

# 인자가 데이터 프레임이라면 ----> 각 열이 벡터로 변환되어 value로 넘겨짐
DF <- read.csv("Pre_Season_Batter.csv")
for(value in DF){
  print(head(value))
}

# 인자가 리스트라면 ----> 각 요소가 value로 넘겨짐
DF2 <- read.csv("Regular_Season_Batter_Day_by_Day_b4.csv")
DF_list <- list(DF, DF2)

for(value in DF_list){
  print(value)
}

index <- 1
while(index <= 10){
  print(index)
  index <- index + 1
}

## 무한루프,..!
index <- 1
while(TRUE){
  print(index)
  index <- index + 1
}

