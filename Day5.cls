Class aoc2021.Day5 Extends aoc2021.Base
{

// https://adventofcode.com/2021/day/5

Parameter InputFile = "Day5Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line

        w line,!
    }

    set pointList = ""

    set ptr=0
    while $LISTNEXT(inputList,ptr,currentPath){
        set startingPoint = $P(currentPath," -> ",1)
        set endingPoint = $P(currentPath," -> ",2)

        set startX = $P(startingPoint,",",1)
        set startY = $P(startingPoint,",",2)
        set endX = $P(endingPoint,",",1)
        set endY = $P(endingPoint,",",2)

        w "starting and ending: ",startingPoint," ",endingPoint,!

        if startX = endX{
            w "Vert",!
            //Vertical Line
            if startY<endY{
                set lowY = startY
                set highY = endY
            }else{
                set lowY = endY
                set highY = startY
            }

            for i = lowY:1:highY{
                set pointToAdd = startX_","_i
                w "Adding V: ",pointToAdd,!
                set $LIST(pointList,*+1) = pointToAdd
            }

        }elseif startY=endY{
            w "Hor1",!
            //Horizonal Line
            if startX<endX{
                set lowX = startX
                set highX = endX
            }else{
                set lowX = endX
                set highX = startX
            }

            for i = lowX:1:highX{
                set pointToAdd = i_","_startY
                w "Adding H: ",pointToAdd,!
                set $LIST(pointList,*+1) = pointToAdd
            }
        }else{
            //Diagonal Line - Do Nothing For Now
           

        }
    }

    w "num of total points: ",$LISTLENGTH(pointList),!
    set listOfMultiples = ""

    set ptr=0
    while $LISTNEXT(pointList,ptr,currentPoint){
        //If multiples not found.  If its single, it would not have been previously checked
        if '$LF(listOfMultiples,currentPoint){
            set count = ..countPointsInList(pointList,currentPoint)
            if count > 1{
                set $LIST(listOfMultiples,*+1) = currentPoint
            }
        }
    }

    set numberOfMultiplePoints = $LISTLENGTH(listOfMultiples)
    w "num of Mults: ",numberOfMultiplePoints,!

    return numberOfMultiplePoints
    
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

    set pointList = ""

    set ptr=0
    while $LISTNEXT(inputList,ptr,currentPath){
        set startingPoint = $P(currentPath," -> ",1)
        set endingPoint = $P(currentPath," -> ",2)

        set startX = $P(startingPoint,",",1)
        set startY = $P(startingPoint,",",2)
        set endX = $P(endingPoint,",",1)
        set endY = $P(endingPoint,",",2)

        w "starting and ending: ",startingPoint," ",endingPoint,!

        if startX = endX{
            w "Vert",!
            //Vertical Line
            if startY<endY{
                set lowY = startY
                set highY = endY
            }else{
                set lowY = endY
                set highY = startY
            }

            for i = lowY:1:highY{
                set pointToAdd = startX_","_i
                w "Adding V: ",pointToAdd,!
                set $LIST(pointList,*+1) = pointToAdd
            }

        }elseif startY=endY{
            w "Hor1",!
            //Horizonal Line
            if startX<endX{
                set lowX = startX
                set highX = endX
            }else{
                set lowX = endX
                set highX = startX
            }

            for i = lowX:1:highX{
                set pointToAdd = i_","_startY
                w "Adding H: ",pointToAdd,!
                set $LIST(pointList,*+1) = pointToAdd
            }
        }else{
            //Diagonal Line - Do Nothing For Now
            w "Diag",!

            set xDir = ""
            set yDir = ""
            if startX < endX {
                set xDir = 1
            }else{
                set xDir = -1
            }
            if startY < endY {
                set yDir = 1
            }else{
                set yDir = -1
            }

            w "xDir: ",xDir,!
            w "yDir: ",yDir,!
            set currentX = startX
            set currentY = startY
            
            set pointToAdd = currentX_","_currentY
            w "Adding D: ",pointToAdd,!
            set $LIST(pointList,*+1) = pointToAdd
            set count = 0
            while (currentX '= endX) && (currentY '= endY){
                if xDir = 1{
                    set currentX = currentX + 1
                }else{
                    set currentX = currentX - 1
                }

                if yDir = 1 {
                    set currentY = currentY + 1
                }else{
                    set currentY = currentY - 1
                }

                set pointToAdd = currentX_","_currentY
                w "Adding D: ",pointToAdd,!
                set $LIST(pointList,*+1) = pointToAdd

            }

        }
    }

    w "num of total points: ",$LISTLENGTH(pointList),!
    set listOfMultiples = ""

    set ptr=0
    while $LISTNEXT(pointList,ptr,currentPoint){
        //If multiples not found.  If its single, it would not have been previously checked
        if '$LF(listOfMultiples,currentPoint){
            set count = ..countPointsInList(pointList,currentPoint)
            if count > 1{
                set $LIST(listOfMultiples,*+1) = currentPoint
            }
        }
    }

    set numberOfMultiplePoints = $LISTLENGTH(listOfMultiples)
    w "num of Mults: ",numberOfMultiplePoints,!

    return numberOfMultiplePoints
    
    return $$$OK
}

ClassMethod countPointsInList(pointList, pointToCheck As %String) As %String
{
    set count = 0

    set ptr=0
    while $LISTNEXT(pointList,ptr,currentPoint){
        if currentPoint = pointToCheck{
            set count = count + 1
        }
    }

    return count
}

}
