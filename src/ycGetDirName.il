; 获取给定文件路径的父目录名

alias(__DIR__ ycGetDirName)
procedure(ycGetDirName(\@optional file(ycGetFileName()) rel uniq "tgg")
    let((dir)
        dir = if(pcreMatchp("^\\*.+\\*$" file)
        then
            getWorkingDir()
        else
            unless(pcreMatchp("^[~/]|^\\.{1,2}/" file)
                file = strcat("./" file)
            )
            pcreReplace(pcreCompile("(?<=/)[^/]+/*$") file "" 0)
        )
        unless(rel
            dir = simplifyFilename(dir t)
        )
        when(uniq
            dir = pcreReplace(pcreCompile("/$") dir "" 1)
        )
        dir
    )
); ycGetDirName

; END