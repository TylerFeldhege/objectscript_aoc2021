Class aoc2021.Day7 Extends aoc2021.Base
{

// <advent of code URL>

Parameter InputFile = "Day7Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set inputList = $LISTFROMSTRING(line,",")

        w line,!
    }

    set listMin = ""
    set listMax = ""

    set ptr=0
    while $LISTNEXT(inputList,ptr,currentNum){
        if listMin = ""{
            set listMin = currentNum
        }
        if listMax = ""{
            set listMax = currentNum
        }

        if currentNum < listMin {
            set listMin = currentNum
        }
        if currentNum > listMax{
            set listMax = currentNum
        }
    }

    w "Min: ",listMin,!
    w "Max: ",listMax,!

    set bestFuelCount = ""

    for i=listMin:1:listMax{
        set currentFuelCount = 0

        set ptr=0
        while $LISTNEXT(inputList,ptr,currentCrab){
            set currentFuelCount = currentFuelCount + $ZABS(i-currentCrab)
        }

        if bestFuelCount = ""{
            set bestFuelCount = currentFuelCount
        }

        if currentFuelCount < bestFuelCount{
            set bestFuelCount = currentFuelCount
        }
    }

    w "Fuel Count: ",bestFuelCount,!


    return bestFuelCount
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set inputList = $LISTFROMSTRING(line,",")

        w line,!
    }

    set listMin = ""
    set listMax = ""

    set ptr=0
    while $LISTNEXT(inputList,ptr,currentNum){
        if listMin = ""{
            set listMin = currentNum
        }
        if listMax = ""{
            set listMax = currentNum
        }

        if currentNum < listMin {
            set listMin = currentNum
        }
        if currentNum > listMax{
            set listMax = currentNum
        }
    }

    w "Min: ",listMin,!
    w "Max: ",listMax,!

    set bestFuelCount = ""

    for i=listMin:1:listMax{
        set currentFuelCount = 0

        set ptr=0
        while $LISTNEXT(inputList,ptr,currentCrab){

            set distance = $ZABS(i-currentCrab)
            set fuelTotal = ( distance * (distance+1))/2


            set currentFuelCount = currentFuelCount + fuelTotal
        }

        if bestFuelCount = ""{
            set bestFuelCount = currentFuelCount
        }

        if currentFuelCount < bestFuelCount{
            set bestFuelCount = currentFuelCount
        }
    }

    w "Fuel Count: ",bestFuelCount,!


    return bestFuelCount
}

}
