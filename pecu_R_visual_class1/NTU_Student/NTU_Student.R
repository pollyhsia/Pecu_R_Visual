rm(list = ls(all = T))  #清除環境裡的和紀錄
library(png)            #可以按tab鍵讓你install的東西叫出來
library(animation)
ani.options("convert")

rawData = read.csv('NTU_Student.csv', header = T)
year = rawData$年度    #按tab鍵可以看見你assign過的變數或內建function 
                       #$只能用在dataframe!!

yearId =rawData[,1]    #同第6行  
                       #發現問題：1945-2015應該只有71年,但卻有72個rows...

rawData = rawData[-72,] #把最後一行刪掉

allLine = length(rawData[,1])  #如果不知道有幾個rows，用13~14行的方法
rawData = rawData[-allLine,]

barplot(as.matrix(rawData[1,c(-1,-2)]))  #畫出第一年各學院學生人數
                                         #要畫到1~72年--for loop

saveGIF(
for(yid in c(1:nrow(rawData))){
  barplot(as.matrix(rawData[yid,c(-1,-2)]),
          main = paste0("國立台灣大學", rawData[yid,1],
                        "年大學部總計", rawData[yid,2],"人"))
}, movie.name = "students.gif",
   interval = 0.3,
   ani.width = 1500,
   ani.height = 600
)