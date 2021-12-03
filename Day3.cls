Class aoc2021.Day3 Extends aoc2021.Base
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


    set highBinaryNumber = ""
    set binaryLength = $LENGTH($LIST(inputList,1))
    //w "binary length: "_binaryLength,!

    for i=1:1:binaryLength{
        set highBinaryNumber = highBinaryNumber_..getPositionValue(i,"high",inputList)
    }

    w "high number: ",highBinaryNumber,!
    w "high number: ",..BinaryToDecimal(highBinaryNumber),!
    set gamma = ..BinaryToDecimal(highBinaryNumber)

    set lowBinaryNumber = ""
    set binaryLength = $LENGTH($LIST(inputList,1))
    //w "binary length: "_binaryLength,!

    for i=1:1:binaryLength{
        set lowBinaryNumber = lowBinaryNumber_..getPositionValue(i,"low",inputList)
    }

    set epsilon = ..BinaryToDecimal(lowBinaryNumber)

    set power = gamma*epsilon
    w "Power ",power,!
    return $$$OK
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line

        //w line,!
    }

    set oxRating = ""
    set C2Rating = ""

    //Oxygen Generator Rating
    set oxyGenList = inputList
    for currentNum=1:1:$LENGTH($LIST(inputList,"1")){
        set currentIndexValue = ..getPositionValue(currentNum,"high",oxyGenList)
        w "currentIndexValue: ",currentIndexValue,!
        set newOxyGenList = ""
        set ptr=0
        WHILE $LISTNEXT(oxyGenList,ptr,currentOxyGenListValue){
            if $E(currentOxyGenListValue,currentNum) = currentIndexValue{
                set $LIST(newOxyGenList,*+1) = currentOxyGenListValue
            }
        }

        w "OxyGenLength: ",$LISTLENGTH(newOxyGenList),"- ",$LISTTOSTRING(newOxyGenList,","),!
        set oxyGenList = newOxyGenList
        if $LISTLENGTH(oxyGenList) = 1{
            w "OxyGenerator Value: ",$LIST(oxyGenList,1),!
            set oxRating = ..BinaryToDecimal($LIST(oxyGenList,1))
            
        }


    }

    

    //CO2  Rating
    set oxyGenList = inputList
    for currentNum=1:1:$LENGTH($LIST(inputList,"1")){
        set currentIndexValue = ..getPositionValue(currentNum,"low",oxyGenList)
        w "currentIndexValue: ",currentIndexValue,!
        set newOxyGenList = ""
        set ptr=0
        WHILE $LISTNEXT(oxyGenList,ptr,currentOxyGenListValue){
            if $E(currentOxyGenListValue,currentNum) = currentIndexValue{
                set $LIST(newOxyGenList,*+1) = currentOxyGenListValue
            }
        }

        w "OxyGenLength: ",$LISTLENGTH(newOxyGenList),"- ",$LISTTOSTRING(newOxyGenList,","),!
        set oxyGenList = newOxyGenList
        if $LISTLENGTH(oxyGenList) = 1{
            w "CO2 Value: ",$LIST(oxyGenList,1),!
            set C2Rating = ..BinaryToDecimal($LIST(oxyGenList,1))
        }


    }

    set lifeSupport = C2Rating*oxRating
    w "lifeSupport :",lifeSupport,!

    #; set highBinaryNumber = ""
    #; set binaryLength = $LENGTH($LIST(inputList,1))
    #; //w "binary length: "_binaryLength,!

    #; for i=1:1:binaryLength{
    #;     set highBinaryNumber = highBinaryNumber_..getPositionValue(i,"high",inputList)
    #; }

    #; w "high number: ",highBinaryNumber,!
    #; w "high number: ",..BinaryToDecimal(highBinaryNumber),!
    #; set gamma = ..BinaryToDecimal(highBinaryNumber)

    #; set lowBinaryNumber = ""
    #; set binaryLength = $LENGTH($LIST(inputList,1))
    #; //w "binary length: "_binaryLength,!

    #; for i=1:1:binaryLength{
    #;     set lowBinaryNumber = lowBinaryNumber_..getPositionValue(i,"low",inputList)
    #; }

    #; set epsilon = ..BinaryToDecimal(lowBinaryNumber)

    #; set power = gamma*epsilon
    #; w "Power ",power,!
    return $$$OK
}

ClassMethod getPositionValue(pos As %String, highorlow As %String, list As %String) As %String
{
    set zeroCount = 0
    set oneCount = 1

    set ptr = 0
    WHILE $LISTNEXT(list,ptr,currentline){
        set currentPiece = $E(currentline,pos,pos)
        if currentPiece = "0"{
            set zeroCount = zeroCount + 1
        }
        if currentPiece = "1"{
            set oneCount = oneCount + 1
        }

    }

    set returnValue = 0
    if oneCount > zeroCount{
        set returnValue = 1
    }else{
        set returnValue = 0
    }
  
    #; if oneCount = zeroCount{
    #;     return 1
    #; }

    if highorlow = "high"{
        return returnValue
    }else{
        return 'returnValue
    }
}

ClassMethod BinaryToDecimal(binary As %String)
{
      set num=0
      for i=1:1:$length(binary){
        set num=num*2+$extract(binary,i)

      } 
      quit num
}

}
