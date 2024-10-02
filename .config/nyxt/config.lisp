;; vi keybinds
(define-configuration buffer
  ((default-modes
    (pushnew 'nyxt/mode/vi:vi-normal-mode %slot-value%))))


;; (define-configuration input-buffer
;;   ((override-map
;;     (let ((map (make-keymap "override-map")))
;;       (define-key map "S-space" 'execute-command "C-space" 'nothing)))))
;; 


;; (define-configuration input-buffer
;;   ((override-map
;;     (let ((map (make-keymap "override-map")))
;;       (define-key map "H" 'switch-buffer-previous "[" 'nothing)
;;       (define-key map "L" 'switch-buffer-next "]" 'nothing)
;;       (define-key map "C-m" 'history-forwards "M-]" 'nothing)
;;       (define-key map "C-u" 'history-backwards "M-[" 'nothing)
;;       (define-key map "F" 'follow-hint-new-buffer ";f" 'nothing)
;;       ))))


(define-configuration input-buffer
  ((override-map
    (let ((map (make-keymap "override-map")))
      (define-key map " g T" 'switch-buffer-previous)
      (define-key map " g t " 'switch-buffer-next)
      (define-key map " g m " 'history-forwards)
      (define-key map " g u " 'history-backwards)
      (define-key map " g h " 'history-all-query)
      (define-key map "F" 'follow-hint-new-buffer)
      (define-key map "space" 'scrol-page-down)
      (define-key map "next" 'scrol-page-down)
      (define-key map "prior" 'scrol-page-up)
      (define-key map " g y " 'copy-hint-url)
      (define-key map " g d " 'delete-current-buffer)
      (define-key map " g q " 'quit)
      ))))


(defvar *my-search-engines*
  (list
   '("google" "https://google.com/search?q=~a" "https://google.com")
   )
  "List of search engines.")

(define-configuration context-buffer
  "Go through the search engines above and make-search-engine out of them."
  ((search-engines
    (append %slot-default%
            (mapcar
             (lambda (engine) (apply 'make-search-engine engine))
             *my-search-engines*)))))

