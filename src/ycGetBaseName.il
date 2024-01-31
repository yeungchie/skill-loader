;--------------------------
; Program  : skill-loader(ycGetBaseName.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 获取给定文件路径的文件名

procedure(ycGetBaseName(file "t")
    cond(
        (blankstrp(file)
            file
        )
        (file == "~"
            getLogin()
        )
        (t
            when(pcreMatchp("^\\*.+\\*$" file)
                file = getWorkingDir()
            )
            car(last(parseString(file "/"))) || "/"
        )
    )
); ycGetBaseName

; END