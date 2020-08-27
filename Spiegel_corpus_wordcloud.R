
# This is copied and pasted from the console. Corpus analysis from the initial Spiegel newspaper dataset, covering a week of time in June 2020



> View(data_230620_starting_point)
> 
  > install.packages ("tm")
Error: unexpected input in "install.packages (""
> install.packages ("wordcloud")
Error: unexpected input in "install.packages (""
> install.packages ("RColorBrewer")
Error: unexpected input in "install.packages (""
> library(wordcloud2) 
Error in library(wordcloud2) : there is no package called 'wordcloud2'
> library(reshape)
Error in library(reshape) : there is no package called 'reshape'
> library(tm)
Loading required package: NLP
> library(wordcloud)
Loading required package: RColorBrewer
> 
  > install.packages("tm")  # for text mining
Error in install.packages : Updating loaded packages
> install.packages("SnowballC") # for text stemming

Restarting R session...

> install.packages("tm")  # for text mining
Installing package into 'C:/Users/UIIN/Documents/R/win-library/3.6'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/tm_0.7-7.zip'
Content type 'application/zip' length 1370663 bytes (1.3 MB)
downloaded 1.3 MB

package 'tm' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\UIIN\AppData\Local\Temp\Rtmp2FfPme\downloaded_packages
> install.packages("SnowballC") # for text stemming
Installing package into 'C:/Users/UIIN/Documents/R/win-library/3.6'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/SnowballC_0.7.0.zip'
Content type 'application/zip' length 454097 bytes (443 KB)
downloaded 443 KB

package 'SnowballC' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\UIIN\AppData\Local\Temp\Rtmp2FfPme\downloaded_packages
> install.packages("wordcloud") # word-cloud generator 
Installing package into 'C:/Users/UIIN/Documents/R/win-library/3.6'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/wordcloud_2.6.zip'
Content type 'application/zip' length 599319 bytes (585 KB)
downloaded 585 KB

package 'wordcloud' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\UIIN\AppData\Local\Temp\Rtmp2FfPme\downloaded_packages
> install.packages("RColorBrewer") # color palettes
Installing package into 'C:/Users/UIIN/Documents/R/win-library/3.6'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/RColorBrewer_1.1-2.zip'
Content type 'application/zip' length 55569 bytes (54 KB)
downloaded 54 KB

package 'RColorBrewer' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\UIIN\AppData\Local\Temp\Rtmp2FfPme\downloaded_packages
> # Load
  > library("tm")
Loading required package: NLP
> library("SnowballC")
> library("wordcloud")
Loading required package: RColorBrewer
> library("RColorBrewer")
> corpus = Corpus(VectorSource(data_230620_starting_point$Keywords))
> corpus[[1]][1]
$content
[1] "Panorama, Stuttgart, Polizei, Gewalt gegen Polizisten, Baden-Württemberg"

> corpus = tm_map(corpus, PlainTextDocument)
> corpus = tm_map(corpus, tolower)
> corpus = tm_map(corpus, removePunctuation)
> corpus = tm_map(corpus, stripWhitespace)
> corpus[[1]][1] 
$content
[1] "panorama stuttgart polizei gewalt gegen polizisten badenwürttemberg"

> corpus = tm_map(corpus, removeWords, c("cloth", stopwords("english")))
> DTM <- TermDocumentMatrix(corpus)
> mat <- as.matrix(DTM)
> f <- sort(rowSums(mat),decreasing=TRUE)
> dat <- data.frame(word = names(f),freq=f)
> head(dat, 5)
word freq
coronavirus coronavirus  232
politik         politik  208
wirtschaft   wirtschaft  183
panorama       panorama  151
ausland         ausland  114
> corpus = tm_map(corpus, removeWords, c("cloth", stopwords("german")))
> corpus = tm_map(corpus, removeWords, c("ausland", stopwords("german")))
> set.seed(100)
> wordcloud(words = dat$word, freq = dat$freq, random.order=TRUE)
> 
  > corpus[[1]][1]
$content
[1] "panorama stuttgart polizei gewalt  polizisten badenwürttemberg"

> DTM <- TermDocumentMatrix(corpus)
> 
  > set.seed(100)
> wordcloud(words = dat$word, freq = dat$freq, random.order=TRUE)
> 
  > set.seed(500)
> wordcloud(words = dat$word, freq = dat$freq, random.order=TRUE)
> 
  > dtm <- TermDocumentMatrix(docs)
Error in TermDocumentMatrix(docs) : object 'docs' not found
> m <- as.matrix(dtm)
Error in as.matrix(dtm) : object 'dtm' not found
> v <- sort(rowSums(m),decreasing=TRUE)
Error in is.data.frame(x) : object 'm' not found
> d <- data.frame(word = names(v),freq=v)
Error in data.frame(word = names(v), freq = v) : object 'v' not found
> head(d, 10)
Error in head(d, 10) : object 'd' not found
> set.seed(1234)
> wordcloud(words = d$word, freq = d$freq, min.freq = 1,
            +           max.words=200, random.order=FALSE, rot.per=0.35, 
            +           colors=brewer.pal(8, "Dark2"))
Error in wordcloud(words = d$word, freq = d$freq, min.freq = 1, max.words = 200,  : 
                     object 'd' not found
                   > DTM <- TermDocumentMatrix(corpus)
                   > mat <- as.matrix(DTM)
                   > f <- sort(rowSums(mat),decreasing=TRUE)
                   > dat <- data.frame(word = names(f),freq=f)
                   > head(dat, 5)
                   word freq
                   coronavirus coronavirus  232
                   politik         politik  208
                   wirtschaft   wirtschaft  183
                   panorama       panorama  151
                   deutschland deutschland  113
                   > set.seed(100)
                   > wordcloud(words = dat$word, freq = dat$freq, random.order=TRUE)
                   > set.seed(100)
                   > wordcloud(words = dat$word, freq = dat$freq, random.order=FALSE)
                   > corpus = tm_map(corpus, removeWords, c("ausland", "panorama", "stopwords("german")))
Error: unexpected symbol in "corpus = tm_map(corpus, removeWords, c("ausland", "panorama", "stopwords("german"
> corpus = tm_map(corpus, removeWords, c("panorama", "stopwords("german")))
                                                            Error: unexpected symbol in "corpus = tm_map(corpus, removeWords, c("panorama", "stopwords("german"
                                                                                                                                                       > corpus = tm_map(corpus, removeWords, c("panorama", stopwords("german")))
                                                                                                                                                       > set.seed(100)
                                                                                                                                                       > wordcloud(words = dat$word, freq = dat$freq, random.order=FALSE)