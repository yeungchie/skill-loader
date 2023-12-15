;--------------------------
; Program  : skill-loader(ycGetBaseName.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 获取给定文件路径的文件名

procedure(ycGetBaseName(file "t")
    when(pcreMatchp("^\\*.+\\*$" file)
        file = getWorking()
    )
    file = strcat(file "/")
    car(last(parseString(file "/"))) || "/"
); ycGetBaseName

; END