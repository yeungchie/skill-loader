;--------------------------
; Program  : skill-loader
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------

let((dir)
    dir = pcreReplace(pcreCompile("[^/]+$") get_filename(piport) "" 1)
    load(strcat(dir "src/ycGetBaseName.il"))
    load(strcat(dir "src/ycGetDirName.il"))
    load(strcat(dir "src/ycGetFileName.il"))
    load(strcat(dir "src/ycRealPath.il"))
    load(strcat(dir "src/ycLoad.il"))
    load(strcat(dir "src/ycLoadi.il"))
)

; END