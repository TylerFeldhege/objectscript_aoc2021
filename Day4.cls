Class aoc2021.Day4 Extends aoc2021.Base
{

// https://adventofcode.com/2021/day/4

Parameter InputFile = "Day4Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    set bingoNumbers = ""
    set currentBingoCard = ""
    set listOfBingoCards = ""
    set linecount = 0
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set linecount = linecount + 1

        if linecount = 1
        {
            set bingoNumbers = line
        }elseif (line = "")&&(linecount>2)
        {
            set $LIST(listOfBingoCards,*+1) = currentBingoCard
            set currentBingoCard = ""
        }elseif (linecount>2){
            set currentBingoLine = ""
            set $LIST(currentBingoLine,*+1) = $E(line,1,2)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,4,5)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,7,8)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,10,11)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,13,14)_"-0"
            set $LIST(currentBingoCard,*+1) = currentBingoLine
        }
    }
    set $LIST(listOfBingoCards,*+1) = currentBingoCard
    

    //For Each Input Number
    set currentInputNumbers = bingoNumbers
    for inputIndex=1:1:$LENGTH(currentInputNumbers,","){
        set currentInputNumber = $P(currentInputNumbers,",",inputIndex)
        w "current input: ",currentInputNumber,!
        if currentInputNumber < 10{
            set currentInputNumber = " "_currentInputNumber
        }
        for i=1:1:$LISTLENGTH(listOfBingoCards){
            set currentBingoCard = $LIST(listOfBingoCards,i)
            w "currentBingoCard: ",!
            d ..BingoCardToString(currentBingoCard)
            for j=1:1:$LISTLENGTH(currentBingoCard){
                set currentBingoLine = $LIST(currentBingoCard,j)
                for k=1:1:$LISTLENGTH(currentBingoLine){
                    set currentBingoNumber = $LIST(currentBingoLine,k)
                    if $P(currentBingoNumber,"-",1,1)=currentInputNumber{
                        set $P(currentBingoNumber,"-",2,2) = "1"
                        set $LIST(currentBingoLine,k) = currentBingoNumber
                        set $LIST(currentBingoCard,j) = currentBingoLine
                        set $LIST(listOfBingoCards,i) = currentBingoCard 
                    }

                }
            }

            //Check for winner
            if ..CheckBingoWinner(currentBingoCard){
                w "Winner: ",!
                d ..BingoCardToString(currentBingoCard)

                set winningScore = ..CalculateBingoScore(currentBingoCard,currentInputNumber)
                w "Winning Score: ",winningScore,!
        
                return winningScore
            }

        }
    }


    


    return winningScore
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    set bingoNumbers = ""
    set currentBingoCard = ""
    set listOfBingoCards = ""
    set linecount = 0
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set linecount = linecount + 1

        if linecount = 1
        {
            set bingoNumbers = line
        }elseif (line = "")&&(linecount>2)
        {
            set $LIST(listOfBingoCards,*+1) = currentBingoCard
            set currentBingoCard = ""
        }elseif (linecount>2){
            set currentBingoLine = ""
            set $LIST(currentBingoLine,*+1) = $E(line,1,2)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,4,5)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,7,8)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,10,11)_"-0"
            set $LIST(currentBingoLine,*+1) = $E(line,13,14)_"-0"
            set $LIST(currentBingoCard,*+1) = currentBingoLine
        }
    }
    set $LIST(listOfBingoCards,*+1) = currentBingoCard
    

    //For Each Input Number
    set currentInputNumbers = bingoNumbers
    for inputIndex=1:1:$LENGTH(currentInputNumbers,","){
        set currentInputNumber = $P(currentInputNumbers,",",inputIndex)
        w "current input: ",currentInputNumber,!
        if currentInputNumber < 10{
            set currentInputNumber = " "_currentInputNumber
        }
        for i=1:1:$LISTLENGTH(listOfBingoCards){





            set currentBingoCard = $LIST(listOfBingoCards,i)
            if currentBingoCard '= ""{
                w "currentBingoCard: ",!
                d ..BingoCardToString(currentBingoCard)
                for j=1:1:$LISTLENGTH(currentBingoCard){
                    set currentBingoLine = $LIST(currentBingoCard,j)
                    for k=1:1:$LISTLENGTH(currentBingoLine){
                        set currentBingoNumber = $LIST(currentBingoLine,k)
                        if $P(currentBingoNumber,"-",1,1)=currentInputNumber{
                            set $P(currentBingoNumber,"-",2,2) = "1"
                            set $LIST(currentBingoLine,k) = currentBingoNumber
                            set $LIST(currentBingoCard,j) = currentBingoLine
                            set $LIST(listOfBingoCards,i) = currentBingoCard 
                        }

                    }
                }

                //Check for winner
                if ..CheckBingoWinner(currentBingoCard){
                    set lastWinner = currentBingoCard
                    set lastWinningNumber = currentInputNumber
                    set $LIST(listOfBingoCards,i) = ""
                }
            }


        }
    }

    w "Last Winning Card: ",!

    d ..BingoCardToString(lastWinner)

    set winningScore = ..CalculateBingoScore(lastWinner,lastWinningNumber)
    w "Winning Score: ",winningScore,!


    return winningScore
}

ClassMethod CalculateBingoScore(bingoCard, winningNumber As %String) As %String
{
    set sumOfUnmarked = 0

    SET ptr=0
    WHILE $LISTNEXT(bingoCard,ptr,currentBingoLine) {
        set ptr2 = 0
        WHILE $LISTNEXT(currentBingoLine,ptr2,currentBingoNumber) {
            if $P(currentBingoNumber,"-",2,2) = "0"{
                set unmarkedNum = $P(currentBingoNumber,"-",1,1)
                set unmarkedNum = $ZSTRIP(unmarkedNum,"<"," ")
                set sumOfUnmarked = sumOfUnmarked + unmarkedNum
            }
        }

    }

    w "sumOfUnmarked: ",sumOfUnmarked,!
    return sumOfUnmarked*winningNumber
}

ClassMethod BingoCardToString(bingoCard)
{
    SET ptr=0
    WHILE $LISTNEXT(bingoCard,ptr,currentBingoLine) {
        w $LISTTOSTRING(currentBingoLine," "),!
    }
}

ClassMethod CheckBingoWinner(bingoCard As %String) As %Boolean
{
    
    // Check Horizontal Winner
    SET ptr=0
    WHILE $LISTNEXT(bingoCard,ptr,currentBingoLine) {
        set currentLineWinner = 1
        set ptr2 = 0
        WHILE $LISTNEXT(currentBingoLine,ptr2,currentBingoNumber) {
            if $P(currentBingoNumber,"-",2,2) = "0"{
                set currentLineWinner = 0
            }
         }
         if currentLineWinner = 1
         {
             return 1
         }
    }

    //Check Vertical Winner
    for column=1:1:5{
        set currentLineWinner = 1
        set ptr=0
        WHILE $LISTNEXT(bingoCard,ptr,currentBingoLine) {
            set currentNumberToCheck = $LIST(currentBingoLine,column)
            if $P(currentNumberToCheck,"-",2,2) = "0"{
                set currentLineWinner = 0
            }
        }
        if currentLineWinner = 1{
            return 1
        }
    }

    Return 0
}

}
