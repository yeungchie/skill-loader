; 读取相对路径为绝对路径
procedure(ycReadRelPath(\@optional file("") "t")
    let((path)
        path = if(pcreMatchp("^[~/]" file)
            file
            sprintf(nil "%s/%s" ycGetDirName() file)
        )
        simplifyFilename(path t)
    )
); ycReadRelPath
; END