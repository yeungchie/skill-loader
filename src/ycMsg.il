;--------------------------
; Program  : skill-loader(ycMsg.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

; 显示 Message 附加函数名

procedure(ycMsg(format \@key tag("Message") port(poport) functionName \@rest vars "ttpgl")
    unless(functionName
        functionName = getCallingFunction(1)
    )
    unless(stringp(functionName)
        functionName = lsprintf("%A" functionName)
    )
    let((str)
        str = apply('lsprintf format vars)
        unless(pcreMatchp("\n$" str)
            str = strcat(str "\n")
        )
        fprintf(port "*%s* %s: %s" tag functionName str)
    )
    nil
)

; END