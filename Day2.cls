Class aoc2021.Day2 Extends aoc2021.Base
{

// https://adventofcode.com/2021/day/2

Parameter InputFile = "Day2Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line

        w line,!
    }

    set hpos = 0
    set dpos = 0

    set ptr = 0
    WHILE $LISTNEXT(inputList,ptr,currentCommand){
        set direction = $P(currentCommand," ",1,1)
        set spaces = $P(currentCommand," ",2,2)
        if direction = "forward"{
            set hpos = hpos + spaces
        }
        if direction = "down"{
            set dpos = dpos + spaces
        }
        if direction = "up"{
            set dpos = dpos - spaces
        }
    }
    
    w "hpos: ",hpos,!
    w "dpos: ",dpos,!

    set result = hpos*dpos
    w "result: ",result,!

    return $$$OK
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line

        w line,!
    }

    set hpos = 0
    set dpos = 0
    set aim = 0

    set ptr = 0
    WHILE $LISTNEXT(inputList,ptr,currentCommand){
        set direction = $P(currentCommand," ",1,1)
        set spaces = $P(currentCommand," ",2,2)
        if direction = "forward"{
            set hpos = hpos + spaces
            set dpos = dpos + (aim*spaces)
        }
        if direction = "down"{
            //set dpos = dpos + spaces
            set aim = aim + spaces
        }
        if direction = "up"{
            //set dpos = dpos - spaces
            set aim = aim - spaces
        }
    }
    
    w "hpos: ",hpos,!
    w "dpos: ",dpos,!

    set result = hpos*dpos
    w "result: ",result,!

    return $$$OK
}

}
