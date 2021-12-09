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



    
    return $$$OK
}

}
