;--------------------------
; Program  : skill-loader(ycLoad.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; load 函数优化

procedure(ycLoad(file \@optional pwd ignore "tgg")
    let((path args)
        path = strcat(ycGetDirName() file)
        unless(isFile(path)
            ycError("not a valid file - %A" path)
        )
        unless(isReadable(path)
            ycError("can't access file - %A" path)
        )
        args = list(if(ignore 'loadi 'load) path)
        when(pwd
            unless(stringp(pwd)
                ycError("argument #2 should be a string or nil - %A" pwd)
            )
            args = append1(args pwd)
        )
        apply('funcall args)
    )
); ycLoad

; END