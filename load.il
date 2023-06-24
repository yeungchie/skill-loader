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
    load(strcat(dir "src/ycError.il"))
    load(strcat(dir "src/ycWarn.il"))
    load(strcat(dir "src/ycLoadi.il"))
    load(strcat(dir "alias/load.il"))
)

; END