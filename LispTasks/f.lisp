(defclass word()
  (
  	 (word-content :accessor word-content)
    (vowels-part :accessor vowels-part)
  )
)

(defun price-setter ((w word) vowelspart)
  (setf (vowels-part w) vowelspart)
)

(defmethod print_word((w word) &key)
	(print (slot-value w 'content))
)

(defmethod compare_word((w1 word) (w2 word) &key)
	(equal (slot-value w1 'content) (slot-value w2 'content))
)

(defun printer (bag)
	(loop for word in bag-of-words
		do
		(format t "~D <==> ~:S found." (word-content word) (vowels-part word))
	)
)

(defun find_word(lst1 lst2)
	(if (nil lst1)
		()
		(if (member (car lst1) lst2 :test #'compare_word)
			(find_word (cdr lst1) lst2)
			(car lst1)
		)
	)
)

(defun split-to-words (string)
  (setf word-bag '())
  (loop for i = 0 then (1+ j)
    as j = (position #\Space string :start i)
    do
    	 (print _place)
    	 (setf wrd (make-instance 'word))
    	 (setf _place (subseq string i j))
		 (setf (word-content wrd) _place)
	    (push wrd word-bag)
	    (print _place)
    while j
   )
  word-bag
)

(defun sorter-by-vowels (bag-of-words)
	(print "--HAHA--")
	(sort bag-of-words #'(lambda (p1 p2) (> (vowels-part p1) (vowels-part p2))))
	(printer bag-of-words)
)

(defun cooker (bag-of-words)
   (loop for word in bag-of-words
   do
   	(vowels-vowels-applier (vowels-part word))
   )
   (sorter-by-vowels bag-of-words)
)

(defun vowels-vowels-applier (str)
	(print "-HAHA-")
 	(let ( (vow 0) (!vow 0)) )
  		(map nil #'(lambda (c) (if (member c '(#\A #\E #\O #\I #\a #\e #\i #\o)) (incf vow) (incf !vow)) ) (word-content str))
	  	(setq len (+ vow !vow))
		(format t "~D <==> ~:A ~%" (word-content str) (/ vow len))
   	(setf (vowels-part str) (/ vow len))
   )  
	(print "-HAHAHA-")
)

(split-to-words "i hate this fucking world i dont wanna live on this planet anymore")
;(setf bag-of-words (split-to-words "i hate this fucking world i dont wanna live on this planet anymore"))
;(cooker bag-of-words)


