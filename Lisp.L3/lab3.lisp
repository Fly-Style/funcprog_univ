(load "~/Documents/7 sem/Lisp_Haskell/LispTasks/ltk/ltk.lisp")
(in-package :ltk)


(defclass Item ()                           ; Item baseclass
  (
    (name   :accessor item-name  )
    (weight :accessor item-weight)
    (price  :accessor item-price )
  )
)

(defmethod item-constructor ((object Item) name weight price)
  (setf (item-name object) name)
  (setf (item-weight object) weight)
  (setf (item-price object) price)
)

(setf super-empty (make-instance 'Item))
(item-constructor super-empty "Empty" 0 0)

(defclass Knight ()                         ; Knight class
  (
    (helm  :accessor knight-helm)
    (shirt :accessor knight-shirt)
    (armor :accessor knight-armor)
    (leggings :accessor knight-leggings)
    (footwear :accessor knight-footwear)
    (gloves :accessor knight-gloves)
    ; (full-clothed :accessor knight-full)
  )
)

(defmethod equipKnight ((knight Knight) helm shirt armor footwear gloves leggings) ; Knight equipment
    (setf (knight-helm knight)  helm)
    (setf (knight-shirt knight) shirt)
    (setf (knight-armor knight) armor)
    (setf (knight-footwear knight) footwear)
    (setf (knight-gloves knight) gloves)
    (setf (knight-leggings knight) leggings)
    ; (setf (knight-full) T)
)


(defmethod deequipKnight ((knight Knight))  ; Knight deequipment
    (setf (knight-helm knight)  super-empty)
    (setf (knight-shirt knight) super-empty)
    (setf (knight-armor knight) super-empty)
    (setf (knight-footwear knight) super-empty)
    (setf (knight-gloves knight) super-empty)
    (setf (knight-leggings knight) super-empty)
    ; (setf (knight-full) nil)
)

(defmethod fullPrice ((knight Knight))      ; Knight full price calculation
  (+
    (item-price (knight-helm knight))
    (item-price (knight-shirt knight))
    (item-price (knight-armor knight))
    (item-price (knight-footwear knight))
    (item-price (knight-gloves knight))
    (item-price (knight-leggings knight))
  )
)

(defmethod onChangeHelm ((knight Knight) item label text_)
  (setf (knight-helm knight) item)
  (setf (text label) text_)
)
(defmethod onChangeShirt ((knight Knight) item label text_)
  (setf (knight-shirt knight) item)
  (setf (text label) text_)
)
(defmethod onChangeArmor ((knight Knight) item label text_)
  (setf (knight-armor knight) item)
  (setf (text label) text_)
)
(defmethod onChangeFoot ((knight Knight) item label text_)
  (setf (knight-footwear knight) item)
  (setf (text label) text_)
)
(defmethod onChangeGloves ((knight Knight) item label text_)
  (setf (knight-gloves knight) item)
  (setf (text label) text_)
)
(defmethod onChangeLegs ((knight Knight) item label text_)
  (setf (knight-leggings knight) item)
  (setf (text label) text_)
)

(defmethod onSort ((knight Knight))
  (setq weightVector (vector (item-weight (knight-helm knight))
                             (item-weight (knight-shirt knight))
                             (item-weight (knight-armor knight))
                             (item-weight (knight-footwear knight))
                             (item-weight (knight-gloves knight))
                             (item-weight (knight-leggings knight))
                     ))
  (sort weightVector #'>)
  (print weightVector)
  (format t "ok~%")
)

(defmethod getBounded ((knight Knight) from to)
  (if (and (> (item-price (knight-helm knight)) from )
           (< (item-price (knight-helm knight)) to) )
    (format t "The item: ~S~%and his price:~D~%" (item-name (knight-helm knight)) (item-price (knight-helm knight)))
  )
  (if (and (> (item-price (knight-shirt knight)) from )
           (< (item-price (knight-shirt knight)) to) )
    (format t "The item: ~S~% and his price:~D~%" (item-name (knight-shirt knight)) (item-price (knight-shirt knight)))
  )
  (if (and (> (item-price (knight-armor knight)) from )
           (< (item-price (knight-armor knight)) to) )
    (format t "The item: ~S~% and his price:~D~%" (item-name (knight-armor knight)) (item-price (knight-armor knight)))
  )
  (if (and (> (item-price (knight-footwear knight)) from )
           (< (item-price (knight-footwear knight)) to) )
    (format t "The item: ~S~% and his price:~D~%" (item-name (knight-footwear knight)) (item-price (knight-footwear knight)))
  )
  (if (and (> (item-price (knight-gloves knight)) from )
           (< (item-price (knight-gloves knight)) to) )
    (format t "The item: ~S~% and his price:~D~%" (item-name (knight-gloves knight)) (item-price (knight-gloves knight)))
  )
  (if (and (> (item-price (knight-leggings knight)) from )
           (< (item-price (knight-leggings knight)) to) )
    (format t "The item: ~S~% and his price:~D~%" (item-name (knight-leggings knight)) (item-price (knight-leggings knight)))
  )
  )

(defmethod onCalculate ((knight Knight) label text_)
  (setf (text label) (write-to-string (fullPrice knight)))
  (onSort knight)
  (getBounded knight 5 35)
)



(defun gui ()
  (with-ltk ()
    (setf super-knight (make-instance 'Knight))
    (deequipKnight super-knight)

    (setf super-helm (make-instance 'Item) )
    (item-constructor super-helm "Super Helm" 20 10)

    (setf super-shirt (make-instance 'Item) )
    (item-constructor super-shirt "Super Shirt" 10 20)

    (setf super-armor (make-instance 'Item) )
    (item-constructor super-armor "Super Armor" 30 40)

    (setf super-footwear (make-instance 'Item) )
    (item-constructor super-footwear "Super Foot" 10 20)

    (setf super-gloves (make-instance 'Item) )
    (item-constructor super-gloves "Super Gloves" 10 30)

    (setf super-leggings (make-instance 'Item) )
    (item-constructor super-leggings "Super Leggings" 5 30)

    (let* ((frame_ (make-instance 'frame))
            (text-label-helm  (make-instance 'label :master frame_ :text "helm : - "))
            (text-label-shirt (make-instance 'label :master frame_ :text "shirt : - "))
            (text-label-armor (make-instance 'label :master frame_ :text "armor : - "))
            (text-label-foot  (make-instance 'label :master frame_ :text "footwear : - "))
            (text-label-glove (make-instance 'label :master frame_ :text "gloves : - "))
            (text-label-legs  (make-instance 'label :master frame_ :text "leggings : - "))
            (text-label-price (make-instance 'label :master frame_ :text "Price : 0 "))
            (text-label-bound (make-instance 'label :master frame_ :text "Bounds"))

            (btn-helm     (make-instance 'button :master frame_ :text "Helm"
                                         :command (lambda()  (if (eq (knight-helm super-knight) super-empty)
                                                               (onChangeHelm super-knight super-helm text-label-helm "helm : + ")
                                                               (onChangeHelm super-knight super-empty text-label-helm "helm : - ")
                                                             )
                                                        )))
            (btn-shirt    (make-instance 'button :master frame_ :text "Shirt"
                                         :command (lambda() (if (eq (knight-shirt super-knight) super-empty)
                                                              (onChangeShirt super-knight super-shirt text-label-shirt "shirt : + ")
                                                              (onChangeShirt super-knight super-empty text-label-shirt "shirt : - ")
                                                              )
                                                         )))
            (btn-armor    (make-instance 'button :master frame_ :text "Armor"
                                         :command (lambda() (if (eq (knight-armor super-knight) super-empty)
                                                              (onChangeArmor super-knight super-armor text-label-armor "armor : + ")
                                                              (onChangeArmor super-knight super-empty text-label-armor "armor : - ")
                                                            )
                                                         )))
            (btn-footwear (make-instance 'button :master frame_ :text "Foot"
                                         :command (lambda() (if (eq (knight-footwear super-knight) super-empty)
                                                              (onChangeFoot super-knight super-footwear text-label-foot "footwear : + ")
                                                              (onChangeFoot super-knight super-empty text-label-foot "footwear : - ")
                                                              ) )))
            (btn-gloves   (make-instance 'button :master frame_ :text "Gloves"
                                         :command (lambda() (if (eq (knight-gloves super-knight) super-empty)
                                                              (onChangeGloves super-knight super-gloves text-label-glove "gloves : + ")
                                                              (onChangeGloves super-knight super-empty text-label-glove "gloves : - ")
                                                            )
                                                         )))
            (btn-leggings (make-instance 'button :master frame_ :text "Leggings"
                                         :command (lambda() (if (eq (knight-leggings super-knight) super-empty)
                                                              (onChangeLegs super-knight super-leggings text-label-legs "leggings : + ")
                                                              (onChangeLegs super-knight super-empty text-label-legs "leggings : - ")
                                                             ) )))
            (btn-dressall (make-instance 'button :master frame_ :text "Dress All"
                                        :command (lambda()  (setf (text text-label-legs) "leggings : + ")
                                                            (setf (text text-label-helm) "helm : + ")
                                                            (setf (text text-label-shirt) "shirt : + ")
                                                            (setf (text text-label-armor) "armor : + ")
                                                            (setf (text text-label-foot) "footwear : + ")
                                                            (setf (text text-label-glove) "gloves : + ")
                                                            (equipKnight super-knight super-helm super-shirt super-armor super-footwear super-gloves super-leggings)
                                                            (print super-knight)
                                                        )))
            (btn-undress  (make-instance 'button :master frame_ :text "Undress All"
                                         :command (lambda() (setf (text text-label-legs) "leggings : - ")
                                                         (setf (text text-label-helm) "helm : - ")
                                                         (setf (text text-label-shirt) "shirt : - ")
                                                         (setf (text text-label-armor) "armor : - ")
                                                         (setf (text text-label-foot) "footwear : - ")
                                                         (setf (text text-label-glove) "gloves : - ")
                                                         (deequipKnight super-knight)
                                                         )))
            (btn-getprice (make-instance 'button :master frame_ :text "Price"
                                         :command (lambda() (onCalculate super-knight text-label-price "Price:") )))


          )
          (pack frame_ :padx 270 :pady 210)
          (pack text-label-helm :padx 20 :pady :3)
          (pack text-label-shirt :padx 20 :pady :3)
          (pack text-label-armor :padx 20 :pady :3)
          (pack text-label-foot :padx 20 :pady :3)
          (pack text-label-glove :padx 20 :pady :3)
          (pack text-label-legs :padx 20 :pady :3)
          (pack text-label-price :padx 20 :pady :5)
          (pack btn-helm :side :left)
          (pack btn-shirt :side :left)
          (pack btn-armor :side :left)
          (pack btn-footwear :side :left)
          (pack btn-gloves :side :left)
          (pack btn-leggings :side :left)
          (pack btn-undress :side :bottom)
          (pack btn-dressall :side :bottom)
          (pack btn-getprice :side :bottom)
          (configure frame_ :borderwidth 1)
          (configure text-label-helm :borderwidth 1)
          (configure text-label-shirt :borderwidth 1)
          (configure text-label-armor :borderwidth 1)
          (configure text-label-foot :borderwidth 1)
          (configure text-label-glove :borderwidth 1)
          (configure text-label-legs :borderwidth 1)
          (configure text-label-price :borderwidth 1)
      ()
        ;  (configure btn-leggings :background 0.8)


    )
  )
)

(gui)
