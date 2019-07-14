;;;; advent of code bonus problem day 1
(defvar sum)
(defvar sums)
(defvar runcount)

(defun find-dup (filename)
  (setq sum 0)
  (setq sums (make-hash-table))
  (setq runcount 0)
  (loop while (not (gethash sum sums)) do
    (let ((in (open filename :if-does-not-exist nil)))
      (when in
        (loop for line = (read-line in nil)
          while line do
            (if (gethash sum sums) 
              (progn
                (format t "found in ~a runs~%" runcount)
                (return-from find-dup sum))
              (setf (gethash sum sums) 1)
            )
            (setq sum (+ (parse-integer line) sum ))
        )
      (close in)))
    (incf runcount)
  )
)

(format t "~a~%"(find-dup "input/01.txt"))
