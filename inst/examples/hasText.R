require(shakespeare)
tp <- Play("tempest")
sps <- tp$speeches # length 642 with EPILOGUE
last <- sps$el(640)
ev <- XRPython::RPython()
class(ev$Get(last))
printSpeech(last)
last$findText("free")
last$findText("deliver")
last$findText("prom")
last$findText("prom", tokens = FALSE)
last$findText("promise", ignoreCase = FALSE)
spsv <- vector("list", sps$size())
for(i in seq_along(spsv)) spsv[[i]] <- sps$el(i-1)
sizes <- sapply(spsv, function(x)x$lines$size())
mx <- which.max(sizes)
printSpeech(spsv[[mx]])
spsv[[mx]]$findText("free", .get=TRUE)
spsv[[mx]]$findText("that", .get=TRUE)
sp0 <- sps$el(570)
act5 <- getActs(tp)$el(4)
sp5 <- getSpeeches(act5)
yy = SpeechList(searchSpeeches("free", sp5))
yyf <- speechFragments(sp5,yy)
for(i in seq_len(yyf$size())-1) printSpeech(yyf$el(i))
hp = Play("hamlet")
hpn <- searchSpeeches("nunnery", hp$speeches)
hpnf <- speechFragments(hp$speeches, hpn)
for(i in seq_len(hpnf$size())-1) printSpeech(hpnf$el(i))
