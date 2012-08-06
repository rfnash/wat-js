;; -*- mode: scheme -*-

(define env (current-environment))

(define (repl)
  (push-prompt *top-level*
    (display (eval (read) env))
    (repl)))

(display "Welcome to Wat!")
(repl)
