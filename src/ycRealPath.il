;--------------------------
; Program  : skill-loader(ycRealPath.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 读取相对路径为绝对路径

procedure(ycRealPath(\@optional file("") dontResolveLinks "tg")
    unless(pcreMatchp("^[~/]" file)
        file = ycGetFileName(file)
    )
    if(dontResolveLinks
    then
        let((dir base)
            dir = ycGetDirName(file)
            base = ycGetBaseName(file)
            strcat(simplifyFilenameUnique(dir) "/" base)
        )
    else
        simplifyFilenameUnique(file)
    )
); ycRealPath

; END