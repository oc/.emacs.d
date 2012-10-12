(defmacro project-specifics (name &rest body)
  `(progn
     (add-hook 'find-file-hook
             (lambda ()
               (when (string-match-p ,name (buffer-file-name))
                 ,@body)))
     (add-hook 'dired-after-readin-hook
             (lambda ()
               (when (string-match-p ,name (dired-current-directory))
                 ,@body)))))

;; uc-infrastructure

(defun custom-persp/infrastructure ()
  (interactive)
  (custom-persp "infrastructure"
                (find-file "~/dev/uc-infrastructure")))

(define-key persp-mode-map (kbd "C-x p i") 'custom-persp/infrastructure)

;; Geno

(defun custom-persp/geno ()
  (interactive)
  (custom-persp "geno"
                (find-file "~/dev/geno")))

(define-key persp-mode-map (kbd "C-x p g") 'custom-persp/geno)

(project-specifics "projects/geno"
                   (set (make-local-variable 'slime-js-target-url) "http://localhost:8080/")
                   (ffip-local-patterns "*.js" "*.scss" "*.org" "*.rb" "*.erb"))

;; uppercase

(defun custom-persp/uppercase.no ()
  (interactive)
  (custom-persp "uppercase.no"
                (find-file "~/dev/uppercase.no")))

(define-key persp-mode-map (kbd "C-x p u") 'custom-persp/uppercase.no)

(project-specifics "projects/site-ucno"
                   (set (make-local-variable 'slime-js-browser-command) "open -a \"Google Chrome\"")
                   (set (make-local-variable 'slime-js-target-url) "http://localhost:4567/")
                   (ffip-local-patterns "*.js" "*.scss" "*.org" "*.rb" "*.erb"))

;; Emacs

(defun custom-persp/emacs ()
  (interactive)
  (custom-persp "emacs"
                (find-file "~/.emacs.d/init.el")))

(project-specifics ".emacs.d"
                   (ffip-local-excludes "swank")
                   (ffip-local-patterns "*.el" "*.md" "*.org"))

(define-key persp-mode-map (kbd "C-x p e") 'custom-persp/emacs)

;; Org

(defun custom-persp/org ()
  (interactive)
  (custom-persp "org")
  (find-file "~/Dropbox/OC/org/"))

(define-key persp-mode-map (kbd "C-<f6>") 'custom-persp/org)
