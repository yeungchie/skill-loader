;--------------------------
; Program  : skill-loader(ycGetCallingStack.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

defmacro(ycGetCallingStack (\@optional level(0) "g")
    `when(getShellEnvVar("YEUNGCHIE_DISABLE_CALLER_DISPLAY") != "1"
        let((_level last func stack)
            _level = eval(,level)
            while((func = getCallingFunction(_level)) && (func != last)
                stack = cons(lsprintf("%A" func) stack)
                last = func
                _level++
            )
            stack
        )
    )
)

; END
