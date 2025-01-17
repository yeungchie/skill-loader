;--------------------------
; Program  : skill-loader(ycWarn.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 自动显示函数名的 warn

procedure(ycWarn(format \@key caller(t) functionName \@rest vars "tggl")
    when(functionName && !stringp(functionName)
        functionName = lsprintf("%A" functionName)
    )
    let((tab tabp prefix stack)
        tab = ""
        prefix = ""
        if(caller
        then
            stack = reverse(ycGetCallingStack(1))
            unless(functionName
                functionName = car(stack)
            )
            foreach(x reverse(cdr(stack))
                warn("%s%s%s" tab prefix x)
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
        warn("%s%s%s: %s" tab prefix functionName apply('lsprintf format vars))
    )
)

; END