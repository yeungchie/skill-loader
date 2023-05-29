; 获取给定文件路径的父目录名

alias(__DIR__ ycGetDirName)
procedure(ycGetDirName(\@optional file(ycGetFileName()) rel "tg")
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
        if(rel dir simplifyFilename(dir t))
    )
); ycGetDirName

; END