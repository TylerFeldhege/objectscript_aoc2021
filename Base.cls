Class aoc2021.Base
{

// Use this snippet to display all the folders/files in a hardcoded directory.  This can be used to help confirm the Files directory in a new install

// set dir = "/irisrun/repo/src/aoc2021/Files"

// set rs = ##class(%File).FileSetFunc(dir, , , 1)

// do rs.%Display()

/// This can be determined by looking at the volumes in the docker-compose.yml file. The default src location changed between 2020 and 2021.
Parameter Folder = "/irisrun/repo/src/aoc2021/Files/";

ClassMethod GetInput(fn) As %Stream
{
   
    set fn=..#Folder_fn
    set stream = ##Class(%Stream.FileCharacter).%New()
    set sc=stream.LinkToFile(fn)
    return stream
}

}
