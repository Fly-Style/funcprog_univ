(load "~/Documents/7 sem/Lisp_Haskell/LispTasks/ltk/ltk.lisp")
(in-package :ltk)
; (ltktest)
; (ltk::ltk-eyes)

(defun hello-2()
  (with-ltk ()
    (let* ((f (make-instance 'frame))
           (b1 (make-instance 'button
                              :master f
                              :text "Button 1"
                              :command (lambda () (format t "Button1~&"))))
           (b2 (make-instance 'button
                              :master f
                              :text "Button 2"
                              :command (lambda () (format t "Button2~&")))))
      (pack f)
      (pack b1 :side :left)
      (pack b2 :side :left)
      (configure f :borderwidth 3)
      (configure f :relief :sunken)
      )))

(defun gui ()
  (with-ltk ()
    (let* ((frame_ (make-instance 'frame))
           (text-label-helm  (make-instance 'label :master frame_ :text "helm : - "))
           (text-label-shirt (make-instance 'label :master frame_ :text "shirt : - "))
           (text-label-armor (make-instance 'label :master frame_ :text "armor : - "))
           (text-label-foot  (make-instance 'label :master frame_ :text "footwear : - "))
           (text-label-glove (make-instance 'label :master frame_ :text "gloves : - "))
           (text-label-legs (make-instance 'label :master frame_ :text "leggings : - "))

           (btn-helm     (make-instance 'button :master frame_ :text "Helm"
                                        :command (lambda() (setf (text text-label-helm) "helm : + ")) ))

           (btn-shirt    (make-instance 'button :master frame_ :text "Shirt"
                                        :command (lambda() (setf (text text-label-shirt) "shirt : + ") )))

           (btn-armor    (make-instance 'button :master frame_ :text "Armor"
                                        :command (lambda() (setf (text text-label-armor) "armor : + ") )))

           (btn-footwear (make-instance 'button :master frame_ :text "Foot"
                                        :command (lambda() (setf (text text-label-foot) "footwear : + ") )))

           (btn-gloves   (make-instance 'button :master frame_ :text "Gloves"
                                        :command (lambda() (setf (text text-label-glove) "gloves : + ") )))

           (btn-leggings (make-instance 'button :master frame_ :text "leggings"
                                        :command (lambda() (setf (text text-label-legs) "leggings : + ") )))

          )
          (pack frame_ :padx 190 :pady 120)
          (pack text-label-helm :padx 30 :pady :10)
          (pack text-label-shirt :padx 30 :pady :10)
          (pack text-label-armor :padx 30 :pady :10)
          (pack text-label-foot :padx 30 :pady :10)
          (pack text-label-glove :padx 30 :pady :10)
          (pack text-label-legs :padx 30 :pady :10)
          (pack btn-helm :side :left)
          (pack btn-shirt :side :left)
          (pack btn-armor :side :left)
          (pack btn-footwear :side :left)
          (pack btn-gloves :side :left)
          (pack btn-leggings :side :left)
          (configure frame_ :borderwidth 3)
          (configure text-label-helm :borderwidth 3)
          (configure text-label-shirt :borderwidth 3)
          (configure text-label-armor :borderwidth 3)
          (configure text-label-foot :borderwidth 3)
          (configure text-label-glove :borderwidth 3)
          (configure text-label-legs :borderwidth 3)
        ;  (configure btn-leggings :background 0.8)


    )
  )
)

(gui)
