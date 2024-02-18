;--------------------------
; Program  : skill-loader(ycMsg.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 显示 Message 附加函数名

procedure(ycMsg(format \@key caller(t) tag("Message") port(poport) functionName \@rest vars "tgtpgl")
    unless(functionName
        functionName = getCallingFunction(1)
    )
    unless(stringp(functionName)
        functionName = lsprintf("%A" functionName)
    )
    let((str tab prefix)
        str = apply('lsprintf format vars)
        unless(pcreMatchp("\n$" str)
            str = strcat(str "\n")
        )
        tab = ""
        prefix = ""
        when(caller
            prefix = "└─ "
            foreach(x ycGetCallingStack(2)
                fprintf(port "*%s* %s%s%s\n" tag tab prefix x)
                tab = strcat(tab "   ")
            )
        )
        fprintf(port "*%s* %s%s%s: %s" tag tab prefix functionName str)
    )
    nil
)

; END