;--------------------------
; Program  : skill-loader(ycError.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 自动显示函数名的 error

procedure(ycError(format \@key caller(t) functionName \@rest vars "tggl")
    when(functionName && !stringp(functionName)
        functionName = lsprintf("%A" functionName)
    )
    let((tab tabp prefix stack)
        tab = ""
        prefix = ""
        when(caller
            stack = reverse(ycGetCallingStack(1))
            unless(functionName
                functionName = car(stack)
            )
            foreach(x reverse(cdr(stack))
                errset(error("%s%s%s" tab prefix x) t)
                when(tabp
                    tab = strcat(tab "   ")
                )
                tabp = t
                prefix = "└─ "
            )
        )
        unless(functionName
            functionName = getCallingFunction(1)
        )
        error("%s%s%s: %s" tab prefix functionName apply('lsprintf format vars))
    )
)

; END