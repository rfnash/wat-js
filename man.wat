;; -*- mode: scheme -*-

(define-module man (document section para render)

  (define *current-parent* (dnew null))
  
  (define-prototype Document
    (id
     title
     children))
  
  (define-prototype Section
    (id
     parent
     title
     children))
  
  (define-prototype Para
    (text
     parent))
  
  (defun (make-document (id String) (title String) -> Document)
    (new Document id title (array)))
  
  (define-macro (document id title)
    (list define id (list make-document (symbol-name id) title)))
  
  (defun (make-section (id String) (parent Document) (title String) -> Section)
    (let ((sec (new Section id parent title (array))))
      (#push (.children parent) sec)
      sec))

  (define-macro (section (parent id) title . children)
    (list begin
      (list define id (list make-section (symbol-name id) parent title))
        (list* dlet *current-parent* id
               children)))
  
  (defun (para (text String) -> Para)
    (let* ((parent (dref *current-parent*))
           (para (new Para text (the Section parent))))
      (#push (.children parent) para)
      para))

  (define-generic (render item -> contents))
  
  (define-method (render (doc Document) -> String)
    (apply cat (list* (cat "<h1>" (.title doc) "</h1>\n")
                      (map-list render (array-to-list (.children doc))))))
  
  (define-method (render (sec Section) -> String)
    (apply cat (list* (cat "<h2>" (.title sec) "</h2>\n")
                      (map-list render (array-to-list (.children sec))))))
  
  (define-method (render (para Para) -> String)
    (cat "<p>" (.text para) "</p>\n"))
  
  )