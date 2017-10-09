;; (define-module (gnu packages battery)
;;   #:use-module (guix)
;;   #:use-module (guix build-system gnu)
;;   #:use-module (guix licenses))

(define-module (gnu packages battery)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses))

(define-public battery
  (package
   (name "battery")
   (version "1.1.1")
   (source (origin
	    (method url-fetch)
	    (uri (string-append
		  "https://github.com/plattfot/battery/archive/v"
		  version ".tar.gz"))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "0vinz4dzhzp8aa1fbcam4w0gj6kpc10z4d3r933minpf6n5bfv4y"))))
   (build-system gnu-build-system)
   (arguments 
    '(#:phases 
      (modify-phases %standard-phases (delete 'configure))
      #:make-flags 
      (let ((out (assoc-ref %outputs "out")))
	(list (string-append "PREFIX=" out "/bin")))
      #:tests? #f))
   (synopsis "Battery is a small program written in C++, that is
using Font Awesome to show info about the battery. It is designed to
be used with i3blocks and based on the battery monitor for i3status.")
   (description "Battery monitor for i3blocks ")
   (home-page "https://github.com/plattfot/battery")
   (license gpl3+)))
