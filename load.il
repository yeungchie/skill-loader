;--------------------------
; Program  : skill-loader
; Language : Cadence Skill
; Author   : YEUNGCHIE
; Version  : 2023.05.28
;--------------------------

let((dir)
    dir = pcreReplace(pcreCompile("[^/]+$") get_filename(piport) "" 1)
    load(strcat(dir "src/ycGetBaseName.il"))
    load(strcat(dir "src/ycGetDirName.il"))
    load(strcat(dir "src/ycGetFileName.il"))
    load(strcat(dir "src/ycReadRelPath.il"))
    load(strcat(dir "src/ycLoad.il"))
)

; END