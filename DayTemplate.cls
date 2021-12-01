Class aoc2021.DayTemplate Extends aoc2021.Base
{

// <advent of code URL>

Parameter InputFile = "Day1Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    while 'stream.AtEnd{
        set line = stream.ReadLine()

        w line,!
    }
    return $$$OK
}

}
