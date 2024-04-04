;--------------------------
; Program  : skill-loader(ycGetCallingStack.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

procedure(ycGetCallingStack(\@optional level(0) "x")
    (getShellEnvVar("YEUNGCHIE_DISABLE_CALLER_DISPLAY") != "1") &&
    let((func stack)
        level++
        while(func = getCallingFunction(level)
            stack = cons(lsprintf("%A" func) stack)
            level++
        )
        cdr(stack)
    )
)

; END
