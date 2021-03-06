;;;======================================================
;;;   Self Learning Decision Tree Program
;;;
;;;     This program tries to determine the animal you are
;;;     thinking of by asking questions.
;;;
;;;     Jess Version 4.2 Example
;;;
;;;     To execute, merely load the file.
;;;======================================================


(deftemplate node 
   (slot name)
   (slot type)
   (slot question)
   (slot yes-node)
   (slot no-node)
   (slot answer)
   (slot additional))

(defrule initialize-1
   (not (node (name root)))
   =>
   (load-facts "animal.dat")
   (assert (current-node root)))

(defrule initialize-2
  (declare (salience 100))
  ?fact <- (next-gensym-idx ?idx)
  =>
  (retract ?fact)
  (setgen ?idx))


(defrule ask-decision-node-question
   ?node <- (current-node ?name)
   (node (name ?name)
         (type decision)
         (question ?question))
   (not (answer ?))
   =>
   (printout t ?question " (yes, dnk or no) ")
   (assert (answer (read))))

(defrule bad-answer
   ?answer <- (answer ~yes&~no&~dnk)
   =>
   (retract ?answer))

(defrule proceed-to-yes-branch
   ?node <- (current-node ?name)
   (node (name ?name)
         (type decision)
         (yes-node ?yes-branch))
   ?answer <- (answer yes)
   =>
   (retract ?node ?answer)
   (assert (current-node ?yes-branch)))
   
(defrule proceed-to-get-dnk-branch
   ?node <- (current-node ?name)
   (node (name ?name)
         (type decision)
         (additional nil))
   ?answer <- (answer dnk)
   =>
   (retract ?answer)
   (assert (ask-additional-question)))
   
(defrule proceed-to-dnk-branch
   ?node <- (current-node ?name)
   (node (name ?name)
         (type decision)
         (additional ?dnk-branch))
   ?answer <- (answer dnk)
   =>
   (retract ?node ?answer)
   (assert (current-node ?dnk-branch)))  
   
   
   
(defrule ask-additional-question-rule
    (ask-additional-question)
    =>
    (printout t "Create new additional question? (yes, no)")
    (assert (addQuestAnswer (read))))
    
(defrule bad-addQuestAnswer
   ?answer <- (addQuestAnswer ~yes&~no)
   =>
   (retract ?answer))
   
(defrule addQuestAnswerYes
	(addQuestAnswer yes)
	=>
	(printout t "Additional Question:")
	(assert (addQuestText (readline)))
	(printout t "Yes-Animal:")
	(assert (addQuestAnimalYes (read)))
	(printout t "No-Animal:")
	(assert (addQuestAnimalNo (read)))
	(assert (replace-dnk))
)
	
(defrule replace-dnk-node
	?replace <- (replace-dnk)
	?quest <- (addQuestText ?quest-text)
	?yes <- (addQuestAnimalYes ?yes-text)
	?no <- (addQuestAnimalNo ?no-text)
	?current <- (current-node ?name)
	?data <- (node (name ?name))
	=>
	(retract ?replace)
	(retract ?current)
	(bind ?newnode1 (gensym*))
	(bind ?newnode2 (gensym*))
	(bind ?newparent (gensym*))
	(modify ?data (additional ?newparent))
	(assert (node (name ?newparent) (question ?quest-text) (type decision)
	(yes-node ?newnode1) (no-node ?newnode2)))
        (assert (node (name ?newnode1)
                 (type answer) 
                 (answer ?yes-text)))
        (assert (node (name ?newnode2)
                 (type answer)
                 (answer ?no-text)))
	(assert (ask-try-again))
)


(defrule addQuestAnswerNo
	?node <- (current-node ?name)
	?quest <- (addQuestAnswer ?answ)
	(addQuestAnswer no)
	=>
	(retract ?quest)
	(retract ?node)
	(printout t "Bye" ))
    

(defrule proceed-to-no-branch
   ?node <- (current-node ?name)
   (node (name ?name)
         (type decision)
         (no-node ?no-branch))
   ?answer <- (answer no)
   =>
   (retract ?node ?answer)
   (assert (current-node ?no-branch))) 

(defrule ask-if-answer-node-is-correct
   ?node <- (current-node ?name)
   (node (name ?name) (type answer) (answer ?value))
   (not (answer ?))
   =>
   (printout t "I guess it is a " ?value crlf)
   (printout t "Am I correct? (yes or no) ")
   (assert (answer (read))))

(defrule answer-node-guess-is-correct
   ?node <- (current-node ?name)
   (node (name ?name) (type answer))
   ?answer <- (answer yes)
   =>
   (assert (ask-try-again))
   (retract ?node ?answer))

(defrule answer-node-guess-is-incorrect
   ?node <- (current-node ?name)
   (node (name ?name) (type answer))
   ?answer <- (answer no)
   =>
   (assert (replace-answer-node ?name))
   (retract ?answer ?node))

(defrule ask-try-again
   (ask-try-again)
   (not (answer ?))
   =>
   (printout t "Try again? (yes or no) ")
   (assert (answer (read))))

(defrule one-more-time
   ?phase <- (ask-try-again)
   ?answer <- (answer yes)
   =>
   (retract ?phase ?answer)
   (assert (current-node root)))

(defrule no-more
   ?phase <- (ask-try-again)
   ?answer <- (answer no)
   =>
   (retract ?phase ?answer)
   (bind ?g (gensym*))
   (assert (next-gensym-idx (sub-string 4 (str-length ?g) ?g)))
;;;(save-facts "examples/animal.dat" node next-gensym-idx))
   (save-facts "./animal.dat" MAIN::node MAIN::next-gensym-idx))

(defrule replace-answer-node
   ?phase <- (replace-answer-node ?name)
   ?data <- (node (name ?name) 
                  (type answer) 
                  (answer ?value))
   =>
   (retract ?phase)
   ; Determine what the guess should have been
   (printout t "What is the animal? ")
   (bind ?new-animal (read))
   ; Get the question for the guess
   (printout t "What question when answered yes ")
   (printout t "will distinguish " crlf "   a ")
   (printout t ?new-animal " from a " ?value "? ")
   (bind ?question (readline))
   (printout t "Now I can guess " ?new-animal crlf)
   ; Create the new learned nodes
   (bind ?newnode1 (gensym*))
   (bind ?newnode2 (gensym*))
   (modify ?data (type decision)
                 (question ?question)
                 (yes-node ?newnode1)
                 (no-node ?newnode2))
   (assert (node (name ?newnode1)
                 (type answer) 
                 (answer ?new-animal)))
   (assert (node (name ?newnode2)
                 (type answer)
                 (answer ?value)))
   ; Determine if the player wants to try again
   (assert (ask-try-again)))


(reset)
(run)
