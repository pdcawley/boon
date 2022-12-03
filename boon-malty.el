;;; boon-malty.el --- An Ergonomic Command Mode  -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:
(require 'boon)


(define-key boon-select-map "q"  'boon-select-outside-quotes)
(define-key boon-select-map "w"  'boon-select-word)
(define-key boon-select-map "g"  'boon-select-paragraph)

(define-key boon-select-map "a"  'boon-select-borders) ;; Around
(define-key boon-select-map "n"  'boon-select-wim) ;; symbol
(define-key boon-select-map "g"  'boon-select-with-spaces)
(define-key boon-select-map "d"  'boon-select-document)

(define-key boon-select-map "C"  'boon-select-comment)
(define-key boon-select-map "x"  'boon-select-outside-pairs) ;; eXpression
(define-key boon-select-map "c"  'boon-select-inside-pairs) ;; Contents

(define-key boon-select-map "z"  'boon-select-content) ;; inZide

(define-key boon-select-map "b"  'boon-select-blanks) ;; blanKs


(define-key boon-moves-map "/" '("noon walk" . boon-switch-mark))
(define-key boon-moves-map "?" 'xref-pop-marker-stack)

(define-key boon-moves-map "v"  '("fYnd" . xref-find-definitions))
(define-key boon-moves-map "V"  'xref-find-references)
(define-key boon-moves-map "u"  'previous-line)
(define-key boon-moves-map "z"  'next-line)
(define-key boon-moves-map "U"  'backward-paragraph)
(define-key boon-moves-map "Z"  'forward-paragraph)
(define-key boon-moves-map "m"  'boon-beginning-of-line)
(define-key boon-moves-map "l"  'boon-end-of-line)
(define-key boon-moves-map "t"  'boon-smarter-backward)
(define-key boon-moves-map "r"  'boon-smarter-forward)
(define-key boon-moves-map "H"  'boon-smarter-upward)
(define-key boon-moves-map "O"  'boon-smarter-downward)
(define-key boon-moves-map "k"  'boon-beginning-of-expression)
(define-key boon-moves-map "-"  'boon-end-of-expression)
(define-key boon-moves-map "h"  'backward-char)
(define-key boon-moves-map "o"  'forward-char)
(define-key boon-moves-map "K"  'beginning-of-buffer)
(define-key boon-moves-map "_"  'end-of-buffer)
(define-key boon-moves-map "d"  '("hop" . avy-goto-word-1))
(define-key boon-moves-map "D"  'avy-goto-char)



;; Special keys

;; LEFT HAND

;; Top row
;; q
(define-key boon-command-map "q" '("quote" . boon-quote-character))

;; w,e
;; where is? elsewhere?
(define-key boon-moves-map "p" '("where was?" . boon-backward-search-map))
(define-key boon-moves-map "y" '("elsewhere?" . boon-forward-search-map))

(define-key boon-moves-map "P"  'boon-qsearch-previous)
(define-key boon-moves-map "Y"  'boon-qsearch-next)

;; r
(define-key boon-command-map "r" '("occuR" . occur))
(define-key boon-command-map "R" 'kmacro-start-macro) ; Record
;; (define-key boon-command-map "c" '("occuR" . occur))
;; (define-key boon-command-map "C" 'kmacro-start-macro) ; Record

;; Misc crap
(define-key boon-command-map "P" 'kmacro-end-or-call-macro) ; Play
(define-key boon-command-map "X" 'boon-highlight-regexp)
;; (define-key boon-command-map "L" 'kmacro-end-or-call-macro) ; Play
;; (define-key boon-command-map ">" 'boon-highlight-regexp)

;; t
(define-key boon-command-map "b" '("transform" . boon-replace-by-character))


;; home row
;; a
(define-key boon-command-map "a" '("around" . boon-enclose))

;; s
(define-key boon-command-map "n" '("substitute" . boon-substitute-region))

;; d
(define-key boon-command-map "i" '("delete" . boon-take-region)) ; "delete"
(define-key boon-command-map "I" 'boon-treasure-region) ; "duplicate"

;; f
(define-key boon-command-map "s" '("fetch" . boon-splice))
(define-key boon-command-map "S" 'yank-pop)

;; g
(define-key boon-command-map "f" '("goto" . boon-goto-map))

;; Bottom row
;; z
(define-key boon-command-map "," '("repeat" . boon-repeat-command))
;; x
(define-key boon-command-map "." 'boon-x-map)
;; c
(define-key boon-command-map "j" 'boon-c-god)
;; v
(define-key boon-command-map (kbd "C-g") 'boon-open-line-and-insert)
(define-key boon-command-map "G" 'boon-open-next-line-and-insert)
(define-key boon-command-map "g" '("v looks like an insert mark" . boon-set-insert-like-state))
;; b
(define-key boon-command-map "?" 'boon-copy-to-register) ; bank
(define-key boon-command-map "/" 'insert-register)

;; RIGHT HAND: movement and marking commands.
;; Most of these are actually in the boon-moves-map; however some don't quite work there; so they end up here.
(define-key boon-command-map (kbd "C-h") 'scroll-down-line)
(define-key boon-command-map (kbd "C-o") 'scroll-up-line)

(define-key indent-rigidly-map "h" 'indent-rigidly-right)
(define-key indent-rigidly-map "o" 'indent-rigidly-left)


(provide 'boon-malty)
;;; boon-malty.el ends here
