Class aoc2021.Day1 Extends aoc2021.Base
{

// https://adventofcode.com/2021/day/1

Parameter InputFile = "Day1Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set currentDepth = ""
    set previousDepth = ""
    set increaseCount = 0

    while 'stream.AtEnd{
        set line = stream.ReadLine()

        set previousDepth = currentDepth
        set currentDepth = line

        if ((currentDepth>previousDepth)&&(previousDepth '= "")){
            set increaseCount = increaseCount + 1
        }
    }

    w increaseCount,!
    return $$$OK
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
    }

    set tripleList = ""
    FOR i=1:1:$LISTLENGTH(inputList) {
        set index1 = i
        set index2 = i+1
        set index3 = i+2

        if index3 <= $LISTLENGTH(inputList){
            set $LIST(tripleList,*+1) = $LIST(inputList,index1) + $LIST(inputList,index2) + $LIST(inputList,index3)
        }
    }


    set previousTrip = ""
    set currentTrip = ""
    set increaseCount = 0

    set ptr = 0
    WHILE $LISTNEXT(tripleList,ptr,currentTripValue){
        set previousTrip = currentTrip
        set currentTrip = currentTripValue

        if ((currentTrip>previousTrip)&&(previousTrip '= "")){
            set increaseCount = increaseCount + 1
        }
    }

    w increaseCount,!
    return $$$OK
}

}
