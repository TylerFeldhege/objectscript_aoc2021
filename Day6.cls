Class aoc2021.Day6 Extends aoc2021.Base
{

// <advent of code URL>

Parameter InputFile = "Day6Input.txt";

ClassMethod Run1Brute(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set fishList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set fishList = $LISTFROMSTRING(line,",")
    }

    w "Initial Fish List: ",$LISTTOSTRING(fishList,","),!

    set currentDayFishList = fishList
    
    set daysToCalculate = 80

    for currentDay=1:1:daysToCalculate{
 
        set tomorrowsFishList = ""

        set ptr=0
        while $LISTNEXT(currentDayFishList,ptr,currentFish){
            set newFishValue = currentFish - 1
            if newFishValue < 0 {
                set $LIST(tomorrowsFishList,*+1) = 6
                set $LIST(tomorrowsFishList,*+1) = 8
            }else{
                set $LIST(tomorrowsFishList,*+1) = newFishValue
            }
        }

        //w "After Day :",currentDay,":",$LISTTOSTRING(tomorrowsFishList,","),!
        w "Fish Count: ",$LISTLENGTH(tomorrowsFishList),!,!
        set currentDayFishList = tomorrowsFishList
    }

    return $$$OK
}

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set fishList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set fishList = $LISTFROMSTRING(line,",")
    }

    //Build Initial Counts (age-count~age-count~age-count)
    set initalFishCounts = ""
    set $LIST(initalFishCounts,1)= ..CountListValues(fishList,"0")
    set $LIST(initalFishCounts,2)= ..CountListValues(fishList,"1")
    set $LIST(initalFishCounts,3)= ..CountListValues(fishList,"2")
    set $LIST(initalFishCounts,4)= ..CountListValues(fishList,"3")
    set $LIST(initalFishCounts,5)= ..CountListValues(fishList,"4")
    set $LIST(initalFishCounts,6)= ..CountListValues(fishList,"5")
    set $LIST(initalFishCounts,7)= ..CountListValues(fishList,"6")
    set $LIST(initalFishCounts,8)= ..CountListValues(fishList,"7")
    set $LIST(initalFishCounts,9)= ..CountListValues(fishList,"8")

    w "Initial Fish Counts: "_$LISTTOSTRING(initalFishCounts,","),!


    set currentFishCounts = initalFishCounts

    set daysToCalculate = 80

    for currentDay=1:1:daysToCalculate{

        set tomorrowsFishCounts = ""
        set $LIST(tomorrowsFishCounts,1)= $LIST(currentFishCounts,2) //Age 0 (Was Age 1)
        set $LIST(tomorrowsFishCounts,2)= $LIST(currentFishCounts,3) //Age 1
        set $LIST(tomorrowsFishCounts,3)= $LIST(currentFishCounts,4) //Age 2
        set $LIST(tomorrowsFishCounts,4)= $LIST(currentFishCounts,5) //Age 3
        set $LIST(tomorrowsFishCounts,5)= $LIST(currentFishCounts,6) //Age 4
        set $LIST(tomorrowsFishCounts,6)= $LIST(currentFishCounts,7) //Age 5
        set $LIST(tomorrowsFishCounts,7)= $LIST(currentFishCounts,8)+$LIST(currentFishCounts,1) //Age 6
        set $LIST(tomorrowsFishCounts,8)= $LIST(currentFishCounts,9) //Age 7
        set $LIST(tomorrowsFishCounts,9)= $LIST(currentFishCounts,1) //Age 8

        set totalTomorrowcount = 0
        set ptr=0
        while $LISTNEXT(tomorrowsFishCounts,ptr,currentCount){
            set totalTomorrowcount = totalTomorrowcount + currentCount
        }
        w "After Day "_currentDay_" Fish Counts :",$LISTTOSTRING(tomorrowsFishCounts,","),!
        w "After Day "_currentDay_": "_totalTomorrowcount,!

        set currentFishCounts = tomorrowsFishCounts
    
    }

    return totalTomorrowcount
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set fishList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set fishList = $LISTFROMSTRING(line,",")
    }

    //Build Initial Counts (age-count~age-count~age-count)
    set initalFishCounts = ""
    set $LIST(initalFishCounts,1)= ..CountListValues(fishList,"0")
    set $LIST(initalFishCounts,2)= ..CountListValues(fishList,"1")
    set $LIST(initalFishCounts,3)= ..CountListValues(fishList,"2")
    set $LIST(initalFishCounts,4)= ..CountListValues(fishList,"3")
    set $LIST(initalFishCounts,5)= ..CountListValues(fishList,"4")
    set $LIST(initalFishCounts,6)= ..CountListValues(fishList,"5")
    set $LIST(initalFishCounts,7)= ..CountListValues(fishList,"6")
    set $LIST(initalFishCounts,8)= ..CountListValues(fishList,"7")
    set $LIST(initalFishCounts,9)= ..CountListValues(fishList,"8")

    w "Initial Fish Counts: "_$LISTTOSTRING(initalFishCounts,","),!


    set currentFishCounts = initalFishCounts

    set daysToCalculate = 256

    for currentDay=1:1:daysToCalculate{

        set tomorrowsFishCounts = ""
        set $LIST(tomorrowsFishCounts,1)= $LIST(currentFishCounts,2) //Age 0 (Was Age 1)
        set $LIST(tomorrowsFishCounts,2)= $LIST(currentFishCounts,3) //Age 1
        set $LIST(tomorrowsFishCounts,3)= $LIST(currentFishCounts,4) //Age 2
        set $LIST(tomorrowsFishCounts,4)= $LIST(currentFishCounts,5) //Age 3
        set $LIST(tomorrowsFishCounts,5)= $LIST(currentFishCounts,6) //Age 4
        set $LIST(tomorrowsFishCounts,6)= $LIST(currentFishCounts,7) //Age 5
        set $LIST(tomorrowsFishCounts,7)= $LIST(currentFishCounts,8)+$LIST(currentFishCounts,1) //Age 6
        set $LIST(tomorrowsFishCounts,8)= $LIST(currentFishCounts,9) //Age 7
        set $LIST(tomorrowsFishCounts,9)= $LIST(currentFishCounts,1) //Age 8

        set totalTomorrowcount = 0
        set ptr=0
        while $LISTNEXT(tomorrowsFishCounts,ptr,currentCount){
            set totalTomorrowcount = totalTomorrowcount + currentCount
        }
        w "After Day "_currentDay_" Fish Counts :",$LISTTOSTRING(tomorrowsFishCounts,","),!
        w "After Day "_currentDay_": "_totalTomorrowcount,!

        set currentFishCounts = tomorrowsFishCounts
    
    }

    return totalTomorrowcount
}

ClassMethod CountListValues(fishList, value As %String) As %String
{
    set count = 0
    set ptr=0
    while $LISTNEXT(fishList,ptr,currentFish){
        if currentFish = value{
            set count = count + 1
        }
    }
    return count
}

}
