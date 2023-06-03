(TeX-add-style-hook
 "lbscript"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape")
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("scrreprt" "DIV=\\lbscript@DIV" "parskip=\\lbscript@parskip" "fontsize=\\lbscript@fontsize" "paper=\\lbscript@paper") ("scrartcl" "DIV=\\lbscript@DIV" "parskip=\\lbscript@parskip" "fontsize=\\lbscript@fontsize" "paper=\\lbscript@paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "main=english" "ngerman" "main=ngerman" "english") ("unicode-math" "math-style=ISO" "bold-style=ISO") ("xcolor" "dvipsnames" "table" "xcdraw") ("microtype" "stretch=10" "shrink=10") ("enumitem" "inline") ("circuitikz" "straightvoltages") ("scrlayer-scrpage" "headsepline" "footsepline" "plainfootsepline") ("biblatex" "backend=biber" "style=numeric" "citestyle=numeric" "autocite=inline" "defernumbers=true" "useprefix=true" "giveninits=true" "hyperref=true" "uniquename=init" "sortcites=false" "isbn=true" "url=true" "eprint=false" "doi=false" "sorting=none") ("physics" "arrowdel") ("minted" "newfloat") ("cleveref" "nameinlink") ("tcolorbox" "most")))
   (TeX-run-style-hooks
    "latex2e"
    "etoolbox"
    "kvoptions"
    "scrreprt"
    "scrreprt10"
    "scrartcl"
    "scrartcl10"
    "csquotes"
    "babel"
    "amsmath"
    "amsfonts"
    "amssymb"
    "amsthm"
    "mathtools"
    "fontspec"
    "unicode-math"
    "graphicx"
    "comment"
    "wrapfig"
    "xcolor"
    "booktabs"
    "microtype"
    "tensor"
    "setspace"
    "enumitem"
    "multicol"
    "import"
    "siunitx"
    "tikz"
    "circuitikz"
    "pgfplots"
    "cancel"
    "scrlayer-scrpage"
    "biblatex"
    "xpatch"
    "physics"
    "varwidth"
    "calc"
    "slashed"
    "pdfpages"
    "faktor"
    "minted"
    "transparent"
    "hyperref"
    "cleveref"
    "tabularx"
    "tcolorbox")
   (TeX-add-symbols
    '("arrupr" ["argument"] 1)
    '("arrr" ["argument"] 1)
    '("arrup" ["argument"] 1)
    '("arr" ["argument"] 1)
    '("arrupl" ["argument"] 1)
    '("arrl" ["argument"] 1)
    '("inkfig" ["argument"] 1)
    '("encircled" 1)
    '("mkbibnamefamily" 1)
    '("RomanNumeralCaps" 1)
    "Author"
    "Title"
    "Date"
    "Subtitle"
    "meinemail"
    "konst"
    "folglich"
    "antiparallel"
    "vkappa"
    "ha"
    "conj"
    "ran"
    "sgn"
    "spa"
    "Cov"
    "Var"
    "spec"
    "id"
    "End"
    "cha"
    "Eig"
    "Bij"
    "GL"
    "Hom"
    "rk"
    "graph"
    "im"
    "rg"
    "Grad"
    "supp"
    "supess"
    "pr"
    "sym"
    "diag"
    "sign"
    "ISO"
    "iso"
    "git"
    "wh"
    "svgwidth"
    "UrlBreaks")
   (LaTeX-add-environments
    '("conditions" LaTeX-env-args ["argument"] 0)
    "myproof")
   (LaTeX-add-bibliographies
    "references")
   (LaTeX-add-lengths
    "conditionwd"))
 :latex)

