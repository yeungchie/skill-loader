;--------------------------
; Program  : skill-loader(ycWarn.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 自动显示函数名的 warn

procedure(ycWarn(format \@key caller(t) functionName \@rest vars "tggl")
    unless(functionName
        functionName = getCallingFunction(1)
    )
    unless(stringp(functionName)
        functionName = lsprintf("%A" functionName)
    )
    let((tab tabp prefix)
        tab = ""
        prefix = ""
        when(caller
            foreach(x ycGetCallingStack(2)
                warn("%s%s%s" tab prefix x)
                when(tabp
                    tab = strcat(tab "   ")
                )
                tabp = t
                prefix = "└─ "
            )
        )
        warn("%s%s%s: %s" tab prefix functionName apply('lsprintf format vars))
    )
)

; END