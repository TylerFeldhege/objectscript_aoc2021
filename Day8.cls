Class aoc2021.Day8 Extends aoc2021.Base
{

// <advent of code URL>

Parameter InputFile = "Day8Input.txt";

ClassMethod Run1(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line

       //w line,!
    }

    set digitCount = 0

    set ptr = 0
    while $LISTNEXT(inputList,ptr,currentOutput){
        set outputDigits = $P(currentOutput," | ",2)
        set outputDigitList = $LISTFROMSTRING(outputDigits," ")
        set ptr2 = 0 
        while $LISTNEXT(outputDigitList,ptr2,currentDigit){
            set digitLength = $LENGTH(currentDigit)
            if ##class(Ens.Util.FunctionSet).In(digitLength,"2,4,3,7"){
                set digitCount = digitCount + 1
            }
        }
    }

    w "Count: ",digitCount,!
    
    return digitCount
}

ClassMethod Run2(verbose = 0) As %String
{
    set stream=..GetInput(..#InputFile)

    set inputList = ""
    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set $LIST(inputList,*+1) = line
    }

    set sum = 0

    set ptr = 0
    while $LISTNEXT(inputList,ptr,currentInput){
        set currentLetterInput = $P(currentInput," | ",1,1)
        set currentLetterAnswer = $P(currentInput," | ",2,2)

        set sum = sum + ..calculateDigits(currentLetterInput,currentLetterAnswer)
    }

    w "sum: ",sum,!
    return sum
}

ClassMethod calculateDigits(input As %String, question As %String) As %String
{
    //set input = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab"
    //set question = "cdfeb fcadb cdfeb cdbaf"
    //w "started",!
    set possibleValues = "abcdefg"
    set inputList = $LISTFROMSTRING(input," ")
    set questionList = $LISTFROMSTRING(question," ")

    set result = ""

    set aValue = ""
    set bValue = ""
    set cValue = ""
    set dValue = ""
    set eValue = ""
    set fValue = ""
    set gValue = ""

    //FIND top left (B), bottom left (E), bottom right(F)
    for i=1:1:$LENGTH(possibleValues){
        set currentChar = $E(possibleValues,i,i)
        if ..findCharCount(input,currentChar) = "6"{
            set bValue = currentChar
            //w "bValue: ",bValue,!
        }
        if ..findCharCount(input,currentChar) = "4"{
            set eValue = currentChar
           // w "eValue: ",eValue,!

        }
        if ..findCharCount(input,currentChar) = "9"{
            set fValue = currentChar
            //w "fValue: ",fValue,!
        }
    }


    set ptr=0
    while $LISTNEXT(inputList,ptr,currentInput){
        //w "HIT",!
        if $LENGTH(currentInput) = "2"{
            set twoLetter = currentInput
            //w "twoLetter ",twoLetter,!
        }
        if $LENGTH(currentInput) = "3"{
            set threeLetter = currentInput
            //w "threeLetter ",threeLetter,!
        }
        if $LENGTH(currentInput) = "4"{
            set fourLetter = currentInput
        }
        if $LENGTH(currentInput) = "7"{
            set sevenLetter = currentInput
        }
    }



    //Find Top (A)
    //  Compare number with 2 letters to number with 3 letters.  The one missing is A
    for i=1:1:3{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(twoLetter,$E(threeLetter,i,i)){
            set aValue = $E(threeLetter,i,i)
            //w "aValue: ",aValue,!
        }
    }

    //Find Top Right (C)
    for i=1:1:3{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(aValue_fValue,$E(threeLetter,i,i)){
            set cValue = $E(threeLetter,i,i)
            //w "cValue: ",cValue,!
        }
    }

    //Find Middle (D)
    for i=1:1:4{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(bValue_cValue_fValue,$E(fourLetter,i,i)){
            set dValue = $E(fourLetter,i,i)
            //w "dValue: ",dValue,!
        }


    }

    //Find Bottom (G)
   for i=1:1:$LENGTH(possibleValues){
        set currentChar = $E(possibleValues,i,i)
        if ##class(Ens.Util.FunctionSet).DoesNotContain(aValue_bValue_cValue_dValue_eValue_fValue,currentChar){
            set gValue = currentChar
            //w "gValue: ",gValue,!
        }
   }


    set ptr = 0
    while $LISTNEXT(questionList,ptr,currentQuestion){
        set translatedLetters = ""
        for i=1:1:$LENGTH(currentQuestion){
            set currentChar = $E(currentQuestion,i,i)
            //w "currentChar : ",currentChar,!
            set translatedChar = ""

            if currentChar = aValue{
                set translatedChar = "a"
            }
            if currentChar = bValue{
                set translatedChar = "b"
            }
            if currentChar = cValue{
                set translatedChar = "c"
            }
            if currentChar = dValue{
                set translatedChar = "d"
            }
            if currentChar = eValue{
                set translatedChar = "e"
            }
            if currentChar = fValue{
                set translatedChar = "f"
            }
            if currentChar = gValue{
                set translatedChar = "g"
            }
            set translatedLetters = translatedLetters_translatedChar
        }

        //w "Translated Letters: ",translatedLetters,!

        set result = result_..convertLettersToNum(translatedLetters)
    }

    return result
}

ClassMethod convertLettersToNum(letters As %String) As %String
{
    set resultNum = ""

    // 0
    if $LENGTH(letters) = "6"{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"d"){
            return "0"
        }
    }

    // 1
    if $LENGTH(letters) = "2"{
        return "1"
    }

    // 2
    if $LENGTH(letters) = "5"{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"b"){
            if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"f"){
                return "2"
            }
        }
    }

    // 3
    if $LENGTH(letters) = "5"{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"b"){
            if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"e"){
                return "3"
            }
        }
    }
    // 4
    if $LENGTH(letters) = "4"{
        return "4"
    }

    // 5
    if $LENGTH(letters) = "5"{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"c"){
            if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"e"){
                return "5"
            }
        }
    }

    // 6
    if $LENGTH(letters) = "6"{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"c"){
            return "6"
        }
    }
    // 7
    if $LENGTH(letters) = "3"{
        return "7"
    }

    // 8 
    if $LENGTH(letters) = "7"{
        return "8"
    }

    // 9
    if $LENGTH(letters) = "6"{
        if ##class(Ens.Util.FunctionSet).DoesNotContain(letters,"e"){
            return "9"
        }
    }

    return ""
}

ClassMethod findCharCount(input As %String, char As %String) As %String
{
    set count = 0

    for i=1:1:$LENGTH(input){
        if $E(input,i,i)=char{
            set count = count + 1
        }
    }

    return count
}

}
