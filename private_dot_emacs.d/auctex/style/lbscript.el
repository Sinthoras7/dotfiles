(TeX-add-style-hook
 "lbscript" ;; Replace with the real name of your class
 (lambda ()
   (TeX-run-style-hooks "scrartcl" ;; or which .cls you load
                        "csquotes"))
 :latex)
