;--------------------------
; Program  : skill-loader(ycLoad.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; load 函数优化

procedure(ycLoad(file \@optional pwd ignore "tgg")
    let((path args)
        path = ycRealPath(file)
        unless(isFile(path)
            error("ycLoad: not a valid file - %A" path)
        )
        unless(isReadable(path)
            error("ycLoad: can't access file - %A" path)
        )
        args = list(if(ignore 'loadi 'load) path)
        when(pwd
            unless(stringp(pwd)
                error("ycLoad: argument #2 should be a string - %A" pwd)
            )
            args = append1(args pwd)
        )
        apply('funcall args)
    )
); ycLoad

; END