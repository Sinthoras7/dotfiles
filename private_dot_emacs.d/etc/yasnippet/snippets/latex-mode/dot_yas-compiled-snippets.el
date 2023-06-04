;;; Compiled snippets and support files for `latex-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
                     '(("«" "\\\\(𝜉\\\\)" "xi(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/xi(outside)" nil nil)
                       ("verb" "\\begin{verbatim}\n$0\n\\end{verbatim}\n" "\\begin{verbatim} ... \\end{verbatim}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/verb.yasnippet" nil nil)
                       ("vec(old)" "`(condition-case nil (progn (backward-sexp) (kill-sexp) (delete-char 1)) (error (setq argument 'nil)))`\\\\vec{`(if argument (current-kill 0))`}$0" "vec(old)"
                        (and
                         (texmathp)
                         'auto)
                        nil
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/vec(old)" nil nil)
                       ("vec"
                        (progn
                          (call-interactively #'lb-vec))
                        "vec"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/vec" nil nil)
                       (";." "\\\\vdots " "vdots" 'auto
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/vdots" nil nil)
                       ("use" "\\usepackage[$2]{$1}$0" "\\usepackage" nil
                        ("misc")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/use.yasnippet" nil nil)
                       ("url" "\\url{${1:$$(yas/choose-value '(\"http\" \"ftp\"))}://${2:address}}$0" "\\url" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/url.yasnippet" nil nil)
                       ("→" "\\\\(→\\\\)" "to-(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/to-(outside)" nil nil)
                       ("til"
                        (progn
                          (call-interactively #'lb-tilde))
                        "tilde"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/tilde" nil nil)
                       ("thus" "\\\\therefore " "therefore"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/therefore" nil nil)
                       ("theo" "\\begin{theorem}{$1}{$2}\n$0\n\\end{theorem}" "theorem" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/theorem" nil nil)
                       ("ten" "\\tensor{$1}{$2}" "tensor"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/tensor" nil nil)
                       ("ŧ" "𝜏" "tau"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/tau" nil nil)
                       ("tan" "\\\\tan" "tan"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/tan" nil nil)
                       ("tabx" "\\\\begin{tabularx}{\\linewidth}{$1}\n\\\\toprule\n$2 \\\\\\\\\n\\\\midrule\n\n\\\\\\\\ \\\\bottomrule\n\\end{tabularx}" "tabularx" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/tabularx" nil nil)
                       ("sunse" "⊋" "supsetneq-sunse"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/supsetneq-sunse" nil nil)
                       ("suse" "⊇" "supset"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/supset" nil nil)
                       ("sup" "\\\\sup_{$1 ∈ $2} $0" "supremum"
                        (texmathp)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/supremum" nil nil)
                       ("sum" "∑_{$1}$0" "sum"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/sum.yasnippet" nil nil)
                       ("ncc" "⊊" "subsetneq-ncc"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/subsetneq-ncc" nil nil)
                       ("cc" "⊆" "subset"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/subset" nil nil)
                       ("subfloat" "\\begin{figure}[ht]\n  \\centering\n  \\subfloat[${6:caption}]{\\includegraphics[$3]{figures/${1:path.png}}}${5:~}\n  \\subfloat[${7:caption}]{\\includegraphics[$4]{figures/${2:path.png}}}\n  \\caption{\\label{fig:${8:label}} $0}\n\\end{figure}\n" "subfloat" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/subfloat" nil nil)
                       ("subfig" "\\subfigure[${1:caption}]{\n  \\label{${2:\"waiting for reftex-label call...\"$(unless yas/modified-p (reftex-label nil 'dont-insert))}}\n  $0\n}\n" "\\subfigure" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/subfig.yasnippet" nil nil)
                       ("star" "\\\\star" "star"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/star" nil nil)
                       ("stackrel" "\\\\stackrel{$1}{$0}" "stackrel"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/stackrel" nil nil)
                       ("sqrt" "\\\\sqrt{$0}" "sqrt"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/sqrt" nil nil)
                       ("sqcap" "⊔" "sqcup"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/sqcup" nil nil)
                       ("begin" "\\begin{${1:$$(yas/choose-value (mapcar 'car (LaTeX-environment-list)))}}\n$0\n\\end{$1}" "\\begin{environment} ... \\end{environment}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/snippet-from-someone-kept-for-seeing-how-to-do-it" nil nil)
                       ("sin" "\\\\sin" "sin"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/sin" nil nil)
                       ("~~" "∼" "similar"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/similar" nil nil)
                       ("ſ" "\\\\(𝜎\\\\)" "sigma(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/sigma(outside)" nil nil)
                       ("seti" "`(delete-char 1)`\\\\left\\\\{ $1 \\\\right\\\\} $0" "set"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/set" nil nil)
                       ("sec" "\\\\sec" "sec"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/secans" nil nil)
                       ("scal" "⟨$1⟩" "scal(ar-product)"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/scala(r-product)" nil nil)
                       ("roman" "[label=(\\roman{*})]" "roman-enumitems" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/roman-enumitems" nil nil)
                       ("rsquig" "⇝" "rightsquigarrow"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/rightsquigarrow" nil nil)
                       ("rrar" "⇉" "rightrightarrows"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/rightrightarrows" nil nil)
                       ("rhdown" "⇁ $0" "rightharpoondown"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/rightharpoondown" nil nil)
                       ("res" "ℛ" "residuum"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/residuum" nil nil)
                       ("rems" "\\begin{remarks}{$1}{}\n\\begin{${2:$$(yas/choose-value '(\"itemize\" \"enumerate\"))}}\n\\item $0\n\\end{$2}\n\\end{remarks}" "remarks" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/remarks" nil nil)
                       ("rem" "\\begin{remark}{$1}{}\n$0\n\\end{remark}" "remark" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/remark" nil nil)
                       ("ref" "`(reftex-reference (kbd \"c\"))`" "\\ref" nil
                        ("references")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/ref.yasnippet" nil nil)
                       ("rd" "^{($1)}" "rd"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/rd" nil nil)
                       ("qq" "\\\\quad " "quad"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/quad" nil nil)
                       ("prop" "∝" "prop"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/propto" nil nil)
                       ("propo" "\\\\begin{proposition}{$1}{$2}\n$0\n\\\\end{proposition}" "proposition" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/proposition" nil nil)
                       ("prod" "\\prod_{$1}^{$2}$0\n" "\\prod_{n}^{}" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/prod.yasnippet" nil nil)
                       ("perp" "⟂" "perp"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/perp" nil nil)
                       ("pdv" "\\\\pdv{$1}$0" "partial derivative"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/partial derivative" nil nil)
                       ("parall" "∥" "parallel"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/parallel" nil nil)
                       ("oset" "\\\\overset{$2}{$1}" "overset"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/overset" nil nil)
                       ("ø" "𝜔" "omega"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/omega" nil nil)
                       ("nEE" "∄" "notexists"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/notexists" nil nil)
                       ("notin" "∉" "not in"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/not in" nil nil)
                       ("norm" "‖$1‖$0" "norm"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/norm" nil nil)
                       ("nmid" "∤" "nmid"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/nmid" nil nil)
                       (";;" "\\\\\\\\\n`(save-excursion (previous-line)(make-string (current-indentation) ?\\s))`&$0" "newline"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/newline" nil nil)
                       ("neq" "≠" "neq"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/neq" nil nil)
                       ("nabl" "\\\\vec{∇}" "nabla"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/nabla" nil nil)
                       ("µ" "\\\\(𝜇\\\\)\n" "mu(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/mu(outside)" nil nil)
                       ("minipage" "\\begin{minipage}[${1:htbp}]{${2:1.0}${3:\\linewidth}}\n  $0\n\\end{minipage}" "\\begin{minipage}[position][width] ... \\end{minipage}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/minipage.yasnippet" nil nil)
                       ("matrix" "\\begin{${1:$$(yas/choose-value '(\"pmatrix\" \"bmatrix\" \"Bmatrix\" \"vmatrix\" \"Vmatrix\" \"smallmatrix\"))}} $0 \\end{$1}" "\\begin{matrix} ... \\end{}" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/matrix.yasnippet" nil nil)
                       ("clap" "\\\\mathclap{$1}$0" "mathclap"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/mathclap" nil nil)
                       ("LL" "ℒ" "mathcal{L}"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/mathcal{L}" nil nil)
                       ("log" "\\\\log" "log"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/log" nil nil)
                       ("ln" "\\\\ln" "ln"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/ln" nil nil)
                       ("lst" "\\begin{lstlisting}[float,label=lst:${1:label},caption=nextHopInfo: ${2:caption}]\n$0\n\\end{lstlisting}" "listing" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/listing" nil nil)
                       ("limsup" "\\\\limsup_{${1:n} → ${2:∞}} $0" "limsup"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/limsup" nil nil)
                       ("lim" "\\\\lim_{${1:n} → ${2:∞}} $0" "limit" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/limit" nil nil)
                       ("<<" "≪" "lesser lesser"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/lesser lesser" nil nil)
                       ("leq" "≤" "less or equal"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/less or equal" nil nil)
                       ("lem" "\\begin{lemma}{$1}{$2}\n$0\n\\end{lemma}" "lemma" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/lemma" nil nil)
                       ("lapla" "\\\\laplacian" "laplacian"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/laplacian" nil nil)
                       ("ł" "\\\\(𝜆\\\\)" "lambda(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/lambda(outside)" nil nil)
                       ("lab" "\\label{${1:label$(unless yas/modified-p (reftex-label nil 'dont-insert))}}$0\n" "\\label" nil
                        ("references")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/label.yasnippet" nil nil)
                       ("ket" "\\\\ket{$0}" "ket"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/ket" nil nil)
                       ("item" "\\begin{itemize}\n\\item $0\n\\end{itemize}\n" "\\begin{itemize} ... \\end{itemize}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/itemize" nil nil)
                       ("it" "\\item $0" "\\item" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/it.yasnippet" nil nil)
                       ("inv" "^{-1}" "inverse"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/inverse" nil nil)
                       ("intert" "\\\\intertext{$1}\n$0" "intertext"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/intertext" nil nil)
                       ("interior"
                        (progn
                          (call-interactively #'lb-interior))
                        "interior"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/interior" nil nil)
                       ("integ" "${1:$$(yas/choose-value '(\"∫\" \"∮\" \"∫∫\" \"∫∫∫\" \"∫∫∫∫\" \"∱\" \"⨑\" \"∳\" \"∲\" \"⨏\"))}$0" "Indefinite integral (all)"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/integrals" nil nil)
                       ("inf" "\\\\inf_{$1 ∈ $2} $0" "infimum"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/infimum" nil nil)
                       ("ig" "\\includegraphics[width=${1:\\linewidth}]{`(call-interactively 'cdlatex-insert-filename)`}" "includegraphics" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/includegraphics" nil nil)
                       ("ini" "∈" "in"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/in" nil nil)
                       ("⟹" "\\\\(⟹\\\\)" "implies-(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/implies-(outside)" nil nil)
                       ("<=" "\\\\impliedby $0" "implied by"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/implied by" nil nil)
                       ("iff" "\\\\(\\iff\\\\)" "iff-symbol-outside"
                        (not
                         (texmathp))
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/iff-symbol-outside" nil nil)
                       ("iff" "\\iff" "if and only if"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/if and only if" nil nil)
                       ("href" "\\href{${1:url}}{${2:text}}$0" "\\href{url}{text}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/href.yasnippet" nil nil)
                       ("embed" "↪" "hookrightarrow"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/hookrightarrow" nil nil)
                       ("hat"
                        (progn
                          (call-interactively #'lb-hat))
                        "hat"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/hat" nil nil)
                       ("geq" "≥" "greater or equal"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/greater or equal" nil nil)
                       (">>" "≫" "greater greater"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/greater greater" nil nil)
                       ("frame" "\\begin{frame}{${1:Frame Title$(capitalize yas-text)}}\n$0\n\\end{frame}\n" "\\begin{frame} ... \\end{frame}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/frame.yasnippet" nil nil)
                       ("AA" "\\\\(∀\\\\)" "forall(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/forall(outside)" nil nil)
                       ("floor" "\\\\left\\\\lfloor $1 \\\\right\\\\rfloor $0" "floor function"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/floor function" nil nil)
                       ("fig" "\\begin{figure}[${1:htbp}]\n  \\centering \\includegraphics[width=${4:\\linewidth}]{`(call-interactively 'cdlatex-insert-filename)`}\n  \\caption{${2:caption}}\n  \\label{${3:\"waiting for reftex-label call...\"$(unless yas/modified-p (reftex-label nil 'dont-insert))}}\n\\end{figure}" "\\begin{figure} ... \\end{figure}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/fig.yasnippet" nil nil)
                       ("fff" "𝔽" "field"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/field" nil nil)
                       ("quo" "\\\\faktor{$1}{$2}" "faktor-(quotient-space)" 'texmathp nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/faktor-(quotient-space)" nil nil)
                       ("exp" "\\\\exp" "exp"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/exp" nil nil)
                       ("EE" "\\\\(∃\\\\)" "exists-EE-outside"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/exists-EE-outside" nil nil)
                       ("exa" "\\begin{example}{$1}{}\n$0\n\\end{example}" "example" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/example" nil nil)
                       ("eval" "\\\\eval_{$1} $0" "eval"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/eval" nil nil)
                       ("eqv" "≡" "equiv"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/equiv" nil nil)
                       ("eqs" "\\begin{${1:$$(yas/choose-value '(\"align\" \"align*\" \"multline\" \"gather\" \"subequations\"))}}\n\\label{${2:\"waiting for reftex-label call...\"$(unless yas/modified-p (reftex-label nil 'dont-insert))}}\n$0\n\\end{$1}\n" "\\begin{types of equations} ... \\end{types of equations}" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/eqs.yasnippet" nil nil)
                       ("..." "\\\\dots$0" "dots"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/dots" nil nil)
                       ("doo"
                        (progn
                          (progn
                            (call-interactively #'lb-dot)))
                        "dot"
                        (and
                         (texmathp)
                         'auto)
                        nil
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/dot" nil nil)
                       ("dom" "𝒟" "domain"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/domain" nil nil)
                       ("det" "\\\\det" "det"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/det" nil nil)
                       ("def" "\\begin{definition}{$1}{$2}\n$0\n\\end{definition}" "definition" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/definition" nil nil)
                       ("dint" "∫_{${1:-∞}}^{${2:∞}}$0" "definite integral"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/definite integral" nil nil)
                       ("ddot"
                        (progn
                          (call-interactively #'lb-ddot))
                        "ddot"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/ddots" nil nil)
                       ("ddel" "∂" "ddel"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/ddel" nil nil)
                       ("dddy" "\\\\dd[3]{y}" "dddy"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/dddy" nil nil)
                       ("dddx" "\\\\dd[3]{x}" "dddx"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/dddx" nil nil)
                       ("dnd" "\\\\dd[${1:n}]{${2:x}}$0" "dd-to-the-n"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/dd-to-the-n" nil nil)
                       ("dnd" "\\\\dd[${1:n}]{$2}$0" "dd-to-n-infinitessimal"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/dd-infinitessimal" nil nil)
                       ("dddd" "\\\\dd[3]{$1}" "d to the 3"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/d-to-the-3" nil nil)
                       ("ddt" "\\\\frac{\\\\mathrm{d} $1}{\\\\mathrm{d} ${2:t}}$0" "d-by-dt"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/d-by-dt" nil nil)
                       ("csc" "\\\\csc" "csc"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/csc" nil nil)
                       ("cot" "\\\\cot" "cot"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/cot" nil nil)
                       ("cos" "\\\\cos" "cos"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/cos" nil nil)
                       ("coro" "\\\\begin{corollary}{$1}{$2}\n$3\n\\\\end{corollary}" "corollary" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/corollary" nil nil)
                       ("coprod" "\\coprod_{$1}^{$2}$0\n" "\\coprod_{n}^{}" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/coprod.yasnippet" nil nil)
                       ("cont" "↯" "contradiction-symbol" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/contradiction-symbol" nil nil)
                       ("cong" "≅" "cong (isomorphic symbol)"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/cong-(isomorphic-symbol)" nil nil)
                       ("conj" "\\\\conj $0" "complex conjugate"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/complex conjugate" nil nil)
                       ("cols" "\\begin{columns}\n  \\begin{column}{.${1:5}\\textwidth}\n  $0\n  \\end{column}\n\n  \\begin{column}{.${2:5}\\textwidth}\n\n  \\end{column}\n\\end{columns}" "columns" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/columns" nil nil)
                       (",," "& $0" "column-separator"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/column-separator" nil nil)
                       ("code" "\\begin{lstlisting}${1:[language=${2:Matlab}]}\n$0\n\\end{lstlisting}" "code" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/code" nil nil)
                       ("circ" "∘" "circ"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/circ" nil nil)
                       ("check" "✓" "checkmark"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/checkmark" nil nil)
                       ("ceil" "\\\\left\\\\lceil $1 \\\\right\\\\rceil $0" "ceiling function"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/ceiling function" nil nil)
                       ("**" "⋅" "cdot"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/cdot" nil nil)
                       ("case" "\\\\begin{cases}\n  $1\n\\\\end{cases}$0" "cases"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/cases" nil nil)
                       ("cap" "∩" "cap"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/cap" nil nil)
                       ("boxed" "\\\\boxed{$1}$0" "boxed"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/boxed" nil nil)
                       ("booktabs" "\\\\toprule\n$1 \\\\\\\\\n\\\\midrule\n\n\\\\\\\\ \\\\bottomrule" "booktabs-table" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/booktabs-table" nil nil)
                       ("blanko" "\\begin{center}\n\\includegraphics[width=0.5\\linewidth]{figures/Blanko.png}\n\\end{center}\n$0" "blanko" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/blanko" nil nil)
                       ("binom" "\\binom{${1:n}}{${2:k}}" "\\binom{n}{k}" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/binom.yasnippet" nil nil)
                       ("bigop" "${1:$$(yas/choose-value '(\"⨁\" \"⨂\" \"⨀\" \"⋃\" \"⋂\" \"⨄\" \"⨅\" \"⨆\" \"⋁\" \"⋀\"))}_{$2}$0" "bigop" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/bigop.yasnippet" nil nil)
                       ("bigfun" "\\begin{align*}\n	$1: $2 &\\longrightarrow $3 \\\\\\\\\n	$4 &\\longmapsto $1($4) = $0\n\\end{align*}" "bigfun"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/bigfun" nil nil)
                       ("bar"
                        (progn
                          (call-interactively #'lb-overline))
                        "bar"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((argument 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/bar" nil nil)
                       ("arr" "\\begin{array}{$1}\n  $0\n\\end{array}\n" "\\begin{array} ... \\end{array}" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/array.yasnippet" nil nil)
                       ("arctan" "\\\\arctan" "arctan"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/arctan" nil nil)
                       ("arcsin" "\\\\arcsin" "arcsin"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/arcsin" nil nil)
                       ("arcsec" "\\\\arcsec" "arcsec"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/arcsec" nil nil)
                       ("arccsc" "\\\\arccsc" "arccsc"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/arccsc" nil nil)
                       ("arccot" "\\\\arccot" "arccot"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/arccot" nil nil)
                       ("arccos" "\\\\arccos" "arccos"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/arccos" nil nil)
                       ("approx" "≈" "approx"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/approx" nil nil)
                       ("𝛼" "\\\\(𝛼\\\\)" "alpha(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/alpha(outside-math)" nil nil)
                       ("alg" "𝔄" "alg"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/alg" nil nil)
                       ("dag" "^{†}$0" "adjoint -- dagger"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/adjoint--dagger" nil nil)
                       ("abs" "\\\\abs{$1}" "abs(olute-value)"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/abs(olute-value)" nil nil)
                       ("cb" "^{3}$0" "^{3}"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/^3" nil nil)
                       ("sr" "^{2}$0" "^2"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/^2" nil nil)
                       ("BB" "ℬ" "\\mathcal{B}"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/\\mathcal{B}" nil nil)
                       ("td" "^{$1}" "to the power"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/To the power" nil nil)
                       ("titlepage" "  \\begin{titlepage}\n\n    \\newcommand{\\HRule}{\\rule{\\linewidth}{0.5mm}} % Defines a new command for the horizontal lines, change thickness here\n\n    \\center % Center everything on the page\n\n    % ----------------------------------------------------------------------------------------\n    % HEADING SECTIONS\n    % ----------------------------------------------------------------------------------------\n\n    \\textsc{\\LARGE Friedrich-Alexander-Universität Erlangen-Nürnberg}\\\\[1.5cm] % Name of your university/college\n    \\inkfig[8cm]{Universität_Regensburg_logo}\n    % \\includegraphics[height=8cm]{figures/maple-leaf-gitter.png}\n    \\footnote{Bild gemeinfrei}\\\\[1cm] % Include a department/university logo - this will require the graphicx package\n    \\textsc{\\Large $1}\\\\[0.5cm] % Major heading such as course name\n    \\textsc{\\large $2}\\\\[0.5cm] % Minor heading such as course title\n\n    % ----------------------------------------------------------------------------------------\n    % TITLE SECTION\n    % ----------------------------------------------------------------------------------------\n    % \\begin{onehalfspace}\n    \\HRule \\\\[0.4cm]\n    { \\LARGE \\bfseries \\Title}\\\\[0.1cm]\n    % {\\Large \\bfseries ${3:Title of Document}}\n    % \\\\[0.2cm] % Title of your document\n    % {\\bfseries \\Large ${4:Subtitle}\\\\[0.4cm]\n    \\HRule \\\\[1.5cm]\n    % \\end{onehalfspace}\n    % ----------------------------------------------------------------------------------------\n    % AUTHOR SECTION\n    % ----------------------------------------------------------------------------------------\n\n    \\begin{minipage}{0.4\\textwidth}\n      \\begin{flushleft} \\large\n        \\emph{Author:}\\\\\n        Leon \\textsc{Bernáth}\\\\ % Your name\n      \\end{flushleft}\n\n    \\end{minipage}\\\\[2cm]\n\n\n    % ----------------------------------------------------------------------------------------\n    % DATE SECTION\n    % ----------------------------------------------------------------------------------------\n\n    {\\large \\today}\\\\[2cm] % Date, change the \\today to a set date if you want to be precise\n\n    \\vfill % Fill the rest of the page with whitespace\n\n  \\end{titlepage}\n" "Titlepage" nil nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Titlepage" nil nil)
                       ("tikzplot" "\\begin{figure}[$1]\n	\\centering\n	\\begin{tikzpicture}\n		\\begin{axis}[\n			xmin= ${2:-10}, xmax= ${3:10},\n			ymin= ${4:-10}, ymax = ${5:10},\n			axis lines = middle,\n		]\n			\\addplot[domain=$2:$3, samples=${6:100}]{$7};\n		\\end{axis}\n	\\end{tikzpicture}\n	\\caption{$8}\n	\\label{${9:\"waiting for reftex-label call...\"$(unless yas/modified-p (reftex-label nil 'dont-insert))}}\n\\end{figure}\n" "Tikz Plot" nil
                        ("environments")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Tikz Plot" nil nil)
                       ("Theta" "Θ" "Theta"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Theta" nil nil)
                       ("SS" "𝒮" "SS-script-S"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/SS-script-S" nil nil)
                       ("ª" "\\\\(𝛷\\\\)" "Phi(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Phi(outside)" nil nil)
                       ("PP" "𝒫" "PP"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/PP" nil nil)
                       ("Ø" "\\\\(𝛺\\\\)" "Omega(outside)"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Omega(outside)" nil nil)
                       ("Ø" "𝛺" "Omega"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Omega" nil nil)
                       ("mk" "`(if (eq major-mode 'org-mode) \"\\\\(\" \"\\\\(\")`$0`(if (eq major-mode 'org-mode) \" \\\\)\" \"\\\\)\")`" "Inline Math" nil
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Inline Math" nil nil)
                       ("HH" "\\\\(ℋ\\\\)" "HH-(HilbertSpace)-outside"
                        (and
                         (not
                          (texmathp))
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/HH-(HilbertSpace)-outside" nil nil)
                       ("/" "`(condition-case nil (save-excursion (backward-sexp) (kill-sexp) (delete-char 1)) (error (setq numerator 'nil)))`\\\\frac{`(if numerator (yank))`}{$1}$0" "Fraction slash"
                        (texmathp)
                        ("math")
                        ((numerator 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Fraction slash" nil nil)
                       ("//" "`(condition-case nil (save-excursion (backward-sexp) (kill-sexp) (delete-char 1)) (error (setq numerator 'nil)))`\\\\frac{`(if numerator (current-kill 0))`}{$1}$0" "Fraction auto"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        ((numerator 't))
                        "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Fraction auto" nil nil)
                       ("FF" "ℱ" "Fourier"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Fourier" nil nil)
                       ("dm" "\\begin{equation*}\n `(save-excursion (previous-line)(make-string (current-indentation) ?\\s))`$1\n\\end{equation*}\n$0" "Display Math"
                        (not
                         (texmathp))
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Display Math" nil nil)
                       ("DD" "\\\\dd{$1}" "DD (infinitissimal)"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/DD" nil nil)
                       ("()" "\\left($1 \\right) $0" "Brackets"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Brackets" nil nil)
                       ("Box" "\\\\Box $0" "Box  or D'Alembert"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/Box(-operator)" nil nil)
                       ("?=" "≟" "?="
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/?=" nil nil)
                       ("=:" "≕" "=:"
                        (and
                         (texmathp)
                         'auto)
                        ("math")
                        nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/=:" nil nil)
                       (":=" "≔ $0" ":="
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/:=" nil nil)
                       ("!=" "\\overset{!}{=}" "!=(overset-equals-with-excamation-mark)"
                        (and
                         (texmathp)
                         'auto)
                        nil nil "/home/leonb/.emacs.d/etc/yasnippet/snippets/latex-mode/!=(overset-equals-with-excamation-mark)" nil nil)))


;;; Do not edit! File generated at Sun Jun  4 12:20:19 2023
