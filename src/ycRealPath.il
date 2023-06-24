;--------------------------
; Program  : skill-loader(ycRealPath.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 读取相对路径为绝对路径

procedure(ycRealPath(\@optional file("") "t")
    unless(pcreMatchp("^[~/]" file)
        file = ycGetFileName(file)
    )
    simplifyFilename(file t)
); ycRealPath

; END