;--------------------------
; Program  : skill-loader(ycGetFileName.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 获取当前文件路径

procedure(ycGetFileName(\@optional fileName "g")
    let((self dir)
        self = get_filename(piport)
        when(fileName
            unless(stringp(fileName)
                ycError("argument #1 should be a string or nil - %A" fileName)
            )
            dir = ycGetDirName(self)
            self = strcat(dir "/" fileName)
        )
        self
    )
); ycGetFileName

; END