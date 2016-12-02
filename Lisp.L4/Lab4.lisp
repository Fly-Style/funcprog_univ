(defclass word()
  (
  	(word-content :accessor word-content)
    (vowels-part  :accessor vowels-part)
  )
)

(defun price-setter ((w word) vowelspart)
  (setf (vowels-part w) vowelspart)
)

(defmethod print_word((w word) &key)
	(print (slot-value w 'content))
)

(defun printer (bag-of-words)
	(loop for word in bag-of-words
		do
		(format t "~D <==> ~:S  ~%" (word-content word) (vowels-part word))
	)
)

(defun split-to-words (string)
  (setf word-bag '())
  (loop for i = 0 then (1+ j)
    as j = (position #\Space string :start i)
    do
    	 (setf wrd (make-instance 'word))
    	 (setf _place (subseq string i j))
		 (setf (word-content wrd) _place)
	    (push wrd word-bag)
    while j)
  word-bag
)

(defun sorter-by-vowels (bag-of-words)
	(sort bag-of-words #'> :key (lambda (p) (vowels-part p) ))
)

(defun cooker (bag-of-words)
   (loop for word in bag-of-words
   do
   	(vowels-vowels-applier word)
   )
   (sorter-by-vowels bag-of-words)
   (printer bag-of-words)
)

(defun vowels-vowels-applier (str)
 	(let ( (vow 0) (!vow 0))
  		(map nil #'(lambda (c) (if (member c '(#\A #\E #\Y #\O #\I #\U #\a #\e #\y #\i #\o #\u)) (incf vow) (incf !vow)) ) (word-content str))
	  	(setq len (+ vow !vow))
	  	(setq particular (/ vow len))
   	(setf (vowels-part str) particular)
   )
)

(setq fname "./lab4.txt")
(let ((in (open fname)))
(when in
  (loop for line = (read-line in nil)
       while line do
         (setf bag-of-words (split-to-words (read-line in)))
         (cooker bag-of-words)
         (print "================")
  )
  (close in))
)
