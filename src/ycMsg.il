;--------------------------
; Program  : skill-loader(ycMsg.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 显示 Message 附加函数名

procedure(ycMsg(format \@key caller(nil) tag("Message") port(poport) functionName \@rest vars "tgtpgl")
    when(functionName && !stringp(functionName)
        functionName = lsprintf("%A" functionName)
    )
    let((str tab tabp prefix stack)
        str = apply('lsprintf format vars)
        unless(pcreMatchp("\n$" str)
        str = strcat(str "\n")
        )
        tab = ""
        prefix = ""
        when(caller
            stack = reverse(ycGetCallingStack(1))
            unless(functionName
                functionName = car(stack)
            )
            foreach(x reverse(cdr(stack))
                fprintf(port "*%s* %s%s%s\n" tag tab prefix x)
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
        fprintf(port "*%s* %s%s%s: %s" tag tab prefix functionName str)
    )
    nil
)

; END