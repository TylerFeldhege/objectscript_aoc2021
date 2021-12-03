Class aoc2021.DayTemplate Extends aoc2021.Base
{

// <advent of code URL>

Parameter InputFile = "Day3Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line

        w line,!
    }



    
    return $$$OK
}

}
