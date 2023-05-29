; 获取当前文件路径

alias(__FILE__ ycGetFileName)
procedure(ycGetFileName(\@optional fileName "g")
    let((self dir)
        self = get_filename(piport)
        when(fileName
            unless(stringp(fileName)
                error("ycGetFileName: argument #1 should be a string - %A" fileName)
            )
            dir = ycGetDirName(self)
            self = strcat(dir "/" fileName)
        )
        self
    )
); ycGetFileName

; END