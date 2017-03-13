((ample-regexps status "installed" recipe
		(:name ample-regexps :description "Compose and reuse Emacs regular expressions with ease" :type github :pkgname "immerrr/ample-regexps.el"))
 (anzu status "installed" recipe
       (:name anzu :after nil :website "https://github.com/syohex/emacs-anzu" :description "A minor mode which displays current match and total matches." :type "github" :branch "master" :pkgname "syohex/emacs-anzu"))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (company-irony status "installed" recipe
		(:name company-irony :depends
		       (cl-lib irony-mode company-mode)
		       :after nil :description "company-mode completion back-end for irony-mode" :type github :pkgname "Sarcasm/company-irony"))
 (company-jedi status "installed" recipe
	       (:name company-jedi :depends
		      (jedi-core company-mode)
		      :after nil :description "Company backend for Python jedi." :website "https://github.com/syohex/emacs-company-jedi" :type github :pkgname "syohex/emacs-company-jedi"))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (company-tern status "installed" recipe
	       (:name company-tern :depends
		      (tern s dash company-mode)
		      :after nil :description "Tern backend for company-mode." :type github :pkgname "proofit404/company-tern" :post-init
		      (eval-after-load 'company
			'(add-to-list 'company-backends 'company-tern))))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (ddskk status "installed" recipe
	(:name ddskk :after nil :features
	       ("skk-setup")
	       :website "http://openlab.ring.gr.jp/skk/ddskk.html" :description "A Japanese input method on Emacs." :type github :pkgname "skk-dev/ddskk" :autoloads nil :info "doc/skk.info" :build
	       `((,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile")
		 (,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile-info")
		 ("mv" "skk-setup.el.in" "skk-setup.el"))))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (emacs-async status "installed" recipe
	      (:name emacs-async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async"))
 (emmet-mode status "installed" recipe
	     (:name emmet-mode :after nil :website "https://github.com/smihica/emmet-mode" :description "Produce HTML from CSS-like selectors." :type "github" :branch "master" :pkgname "smihica/emmet-mode"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (flycheck status "installed" recipe
	   (:name flycheck :after nil :depends
		  (seq let-alist pkg-info dash)
		  :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension"))
 (git-gutter status "installed" recipe
	     (:name git-gutter :after nil :description "Emacs port of GitGutter Sublime Text 2 Plugin" :website "https://github.com/syohex/emacs-git-gutter" :type github :pkgname "syohex/emacs-git-gutter"))
 (glsl-mode status "installed" recipe
	    (:name glsl-mode :after nil :features
		   (glsl-mode)
		   :type github :description "major mode for Open GLSL shader files" :pkgname "jimhourihan/glsl-mode"))
 (google-translate status "installed" recipe
		   (:name google-translate :after nil :description "Emacs interface to Google Translate" :type github :pkgname "atykhonov/google-translate"))
 (helm status "installed" recipe
       (:name helm :after nil :features
	      ("helm-config")
	      :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
	      (("make"))
	      :build/darwin
	      `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
	      :build/windows-nt
	      (let
		  ((generated-autoload-file
		    (expand-file-name "helm-autoloads.el"))
		   \
		   (backup-inhibited t))
	      (update-directory-autoloads default-directory)
	      nil)
       :post-init
       (helm-mode)))
(helm-c-yasnippet status "installed" recipe
(:name helm-c-yasnippet :after nil :features
(helm-c-yasnippet)
:depends
(yasnippet helm)
:type github :pkgname "emacs-jp/helm-c-yasnippet" :description "Helm source for yasnippet.el."))
(init-loader status "installed" recipe
(:name init-loader :after nil :website "https://github.com/emacs-jp/init-loader" :description "It enables you to categorize your configurations and separate them into multiple files." :type github :pkgname "emacs-jp/init-loader"))
(irony-mode status "installed" recipe
(:name irony-mode :description "A C/C++ minor mode for Emacs powered by libclang" :type github :pkgname "Sarcasm/irony-mode" :depends
(cl-lib)
:compile "\\.el$"))
(jedi-core status "installed" recipe
(:name jedi-core :after nil :depends
(cl-lib python-environment epc)
:type github :pkgname "tkf/emacs-jedi" :description "Python jedi core functionality for Emacs. Required for company-jedi" :minimum-emacs-version "24" :compile "jedi-core.el"))
(js2-mode status "installed" recipe
(:name js2-mode :after nil :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
(autoload 'js2-mode "js2-mode" nil t)))
(json-mode status "installed" recipe
(:name json-mode :after nil :depends
(json-reformat json-snatcher)
:description "Major mode for editing JSON files, extends the builtin js-mode to add better syntax highlighting for JSON." :type github :pkgname "joshwnj/json-mode"))
(json-reformat status "installed" recipe
(:name json-reformat :description "Reformatting tool for JSON." :type github :pkgname "gongo/json-reformat"))
(json-snatcher status "installed" recipe
(:name json-snatcher :description "Find the path to a value in JSON" :type github :pkgname "Sterlingg/json-snatcher"))
(let-alist status "installed" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
(lua-mode status "installed" recipe
(:name lua-mode :after nil :depends
(ample-regexps)
:description "A major-mode for editing Lua scripts" :type github :pkgname "immerrr/lua-mode"))
(magit status "installed" recipe
(:name magit :after nil :depends
(emacs-async with-editor dash)
:website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :info "Documentation" :load-path "lisp/" :compile "lisp/" :build
`(("make" ,(format "EMACSBIN=%s" el-get-emacs)
"docs")
("touch" "lisp/magit-autoloads.el"))
:build/berkeley-unix
`(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
"docs")
("touch" "lisp/magit-autoloads.el"))
:build/windows-nt
(with-temp-file "lisp/magit-autoloads.el" nil)))
(markdown-mode status "installed" recipe
(:name markdown-mode :after nil :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type github :pkgname "jrblevin/markdown-mode" :prepare
(add-to-list 'auto-mode-alist
'("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
(material-theme status "installed" recipe
(:name material-theme :after nil :description "Color Theme for emacs based on material design colors" :type github :pkgname "cpaulik/emacs-material-theme" :prepare
(add-to-list 'custom-theme-load-path default-directory)))
(migemo status "installed" recipe
(:name migemo :after nil :description "Japanese increment search with 'Romanization of Japanese'" :type github :pkgname "emacs-jp/migemo"))
(multiple-cursors status "installed" recipe
(:name multiple-cursors :after nil :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
(open-junk-file status "installed" recipe
(:name open-junk-file :after nil :features
("open-junk-file")
:description "Open a junk (memo) file to try-and-error" :type emacswiki))
(openwith status "installed" recipe
(:type github :pkgname "emacsmirror/openwith" :name openwith :after nil :features
(openwith)
:description "Open files with external programs" :type emacsmirror :post-init
(openwith-mode t)))
(package status "installed" recipe
(:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "https://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :features package :post-init
(progn
(let
((old-package-user-dir
(expand-file-name
(convert-standard-filename
(concat
(file-name-as-directory default-directory)
"elpa")))))
(when
(file-directory-p old-package-user-dir)
(add-to-list 'package-directory-list old-package-user-dir)))
(setq package-archives
(bound-and-true-p package-archives))
(let
((protocol
(if
(and
(fboundp 'gnutls-available-p)
(gnutls-available-p))
"https://"
(lwarn
'(el-get tls)
:warning "Your Emacs doesn't support HTTPS (TLS)%s"
(if
(eq system-type 'windows-nt)
",\n  see https://github.com/dimitri/el-get/wiki/Installation-on-Windows." "."))
"http://"))
(archives
'(("melpa" . "melpa.org/packages/")
("gnu" . "elpa.gnu.org/packages/")
("marmalade" . "marmalade-repo.org/packages/"))))
(dolist
(archive archives)
(add-to-list 'package-archives
(cons
(car archive)
(concat protocol
(cdr archive)))))))))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(popup status "installed" recipe
(:name popup :after nil :depends
(cl-lib)
:website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
(popwin status "installed" recipe
(:name popwin :after nil :description "Popup Window Manager." :website "https://github.com/m2ym/popwin-el" :type github :pkgname "m2ym/popwin-el" :load-path
("." "misc")))
(python-environment status "installed" recipe
(:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
(deferred)))
(quickrun status "installed" recipe
(:name quickrun :after nil :description "Run commands quickly" :website "https://github.com/syohex/emacs-quickrun" :type github :pkgname "syohex/emacs-quickrun"))
(rainbow-delimiters status "installed" recipe
(:name rainbow-delimiters :after nil :website "https://github.com/Fanael/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "Fanael/rainbow-delimiters"))
(rainbow-mode status "required" recipe nil)
(revive status "installed" recipe
(:name revive :description "Revive.el saves current editing status including the window splitting configuration, which can't be recovered by `desktop.el' nor by `saveconf.el', into a file and reconstructs that status correctly." :website "http://www.gentei.org/~yuuji/software/" :type http :url "http://www.gentei.org/~yuuji/software/revive.el" :features "revive"))
(s status "installed" recipe
(:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
(seq status "installed" recipe
(:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
(smartrep status "installed" recipe
(:name smartrep :after nil :description "Support sequential operation which omitted prefix keys." :website "http://sheephead.homelinux.org/2011/12/19/6930/" :type github :pkgname "myuhe/smartrep.el" :prepare
(progn
(autoload 'smartrep-restore-original-position "smartrep" nil t)
(autoload 'smartrep-map-internal "smartrep" nil t))))
(tern status "installed" recipe
(:name tern :description "A JavaScript code analyzer for deep, cross-editor language support." :type github :pkgname "marijnh/tern" :build
'(("npm" "--production" "install"))
:prepare
(add-to-list 'auto-mode-alist
'("\\.tern-\\(project\\|\\config\\)\\'" . json-mode))
:load-path
("emacs")))
(web-mode status "installed" recipe
(:name web-mode :after nil :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
(windows status "installed" recipe
(:name windows :after nil :features
("windows")
:depends
(revive)
:description "Window manager for GNU Emacs." :website "http://www.gentei.org/~yuuji/software/" :type http :url "http://www.gentei.org/~yuuji/software/windows.el"))
(with-editor status "installed" recipe
(:name with-editor :description "Use the Emacsclient as $EDITOR" :type github :pkgname "magit/with-editor"))
(yaml-mode status "installed" recipe
(:name yaml-mode :after nil :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
(yasnippet status "installed" recipe
(:name yasnippet :after nil :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets"))))
(yatex status "installed" recipe
(:name yatex :after nil :website "http://www.yatex.org/" :description "Yet Another TeX mode for Emacs" :type hg :url "http://www.yatex.org/hgrepos/yatex" :build
(("sed" "-i" "s/ from yatex.el//" "yatexmth.el"))
:build/berkeley-unix
(("sed" "-i" "" "s/ from yatex.el//" "yatexmth.el"))
:build/darwin
(("env" "LANG=C" "LC_ALL=C" "sed" "-i" "" "s/ from yatex.el//" "yatexmth.el")))))
