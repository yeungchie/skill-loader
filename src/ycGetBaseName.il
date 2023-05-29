; 获取给定文件路径的文件名

procedure(ycGetBaseName(file)
    when(pcreMatchp("^\\*.+\\*$" file)
        file = getWorking()
    )
    file = simplifyFilename(strcat(file "/") t)
    car(last(parseString(file "/"))) || "/"
); ycGetBaseName

; END