# **Structure and Interpretation of Computer Programs**  
  
## Intro  
  
### Authors  
  
* Harold Abelson  
    Link: [en.wikipedia.org/wiki/Hal_Abelson][1]  
  
* Gerald Jay Sussman  
    Link: [en.wikipedia.org/wiki/Gerald_Jay_Sussman][2]  
  
* Julie Sussman  
  
### Alan J. Perlis’ words  
  
“Above all, I hope we don’t become missionaries. Don’t feel as if you’re Bible salesmen. The world has too many of those already. What you know about computing other people will learn. **Don’t feel as if the key to successful computing is only in your hands. What’s in your hands, I think and hope, is intelligence: the ability to see the machine as more than when you were first led up to it, that you can make it more.**”  
  
### Foreward  
  
* What matters in learning programming?  
      
    To appreciate programming as an intellectual activity in its own right you must turn to computer programming; you must read and write computer programs -- many of them. It doesn’t matter much what the programs are about or what applications they serve. What does matter is how well they perform and how smoothly they fit with other programs in the creation of still greater programs.  
  
* What are the three foci of phenomena in this book?  
      
    Our traffic with the subject matter of this book involves us with three foci of phenomena: the human mind, collections of computer programs, and the computer.  
  
* What is the relationship between the human mind and computer programs?  
      
    Every computer program is a model, hatched in the mind, of a real or mental process. These processes, arising from human experience and thought, are huge in number, intricate in detail, and at any time only partially understood. They are modeled to our permanent satisfaction rarely by our computer programs. Thus even though our programs are carefully handcrafted discrete collections of symbols, mosaics of interlocking functions, they continually evolve: we change them as our perception of the model deepens, enlarges, generalizes until the model ultimately attains a metastable place within still another model with which we struggle. The source of the exhilaration associated with computer programming is the continual unfolding within the mind and on the computer of mechanisms expressed as programs and the explosion of perception they generate.   
      
    *If art interprets our dreams, the computer executes them in the guise of programs!*  
  
### Preface to the First Edition  
  
* What is computer science/revolution?  
      
    Underlying our approach to this subject is our conviction that “computer science” is not a science and that its significance has little to do with computers. *The computer revolution is a revolution in the way we think and in the way we express what we think*.   
      
    The essence of this change is the emergence of what might best be called **procedural epistemology** -- the study of the structure of knowledge from an imperative point of view, as opposed to the more declarative point of view taken by classical mathematical subjects. *Mathematics provides a framework for dealing precisely with notions of “what is.” Computation provides a framework for dealing precisely with notions of “how to”*.  
  
## Chapter 1  
  
### Building Abstractions with Procedures  
  
* What is computational process?  
      
    **Computational processes** are abstract beings that inhabit computers.   
      
    As they evolve, processes manipulate other abstract things called _data_. The evolution of a process is directed by a pattern of rules called a _program_. People create programs to direct processes.  
  
* Programming in Lisp  
    * When and how Lisp was invented?  
          
        **Lisp** was invented in the late 1950s as a formalism for reasoning about the use of certain kinds of logical expressions, called _recursion equations_, as a model for computation.   
          
        The language was conceived by _John McCarthy_ and is based on his paper “Recursive Functions of Symbolic Expressions and Their Computation by Machine” (McCarthy 1960).  
  
    * What is a Lisp interpreter?  
          
        A Lisp _interpreter_ is a machine that carries out processes described in the Lisp language.   
          
        The first Lisp interpreter was implemented by McCarthy with the help of colleagues and students in the Artificial Intelligence Group of the MIT Research Laboratory of Electronics and in the MIT Computation Center.  
  
    * What was Lisp designed for?  
          
        Lisp, whose name is an acronym for _LISt Processing_, was designed to provide symbol-manipulating capabilities for attacking programming problems such as the symbolic differentiation and integration of algebraic expressions.   
          
        It included for this purpose new data objects known as atoms and lists, which most strikingly set it apart from all other languages of the period.  
  
* 1.1 The Elements of Programming  
    * What is a powerful programming language?  
          
        A powerful programming language is more than just a means for instructing a computer to perform tasks.   
          
        The language also serves as **a framework within which we organize our ideas about processes**. Thus, when we describe a language, we should pay particular attention to the means that the language provides for combining simple ideas to form more complex ideas.  
  
        * What are the three mechanisms of a powerful language for organizing ideas?  
              
            Every powerful language has three mechanisms for accomplishing this:   
  
            * **primitive expressions**, which represent the simplest entities the language is concerned with,   
            * **means of combination**, by which compound elements are built from simpler ones, and   
            * **means of abstraction**, by which compound elements can be named and manipulated as units.  
        * What are the two kinds of elements we deal with in programming?  
              
            In programming, we deal with two kinds of elements: **procedures** and **data**.   
              
            Informally, data is “stuff” that we want to manipulate, and procedures are descriptions of the rules for manipulating the data.   
              
            Thus, any powerful programming language should be able to describe primitive data and primitive procedures and should have methods for combining and abstracting procedures and data.  
  
    * 1.1.1 Expressions  
        * What are combinations?  
              
            ```lisp  
            (+ 137 349)   
            ;486   
            (- 1000 334)   
            ;666   
            (* 5 99)   
            ;495   
            (/ 10 5)   
            ;2   
            (+ 2.7 10)   
            ;12.7   
            ```  
            Expressions such as these, formed by delimiting a list of expressions within parentheses in order to denote procedure application, are called _**combinations**_.   
              
            The leftmost element in the list is called the _**operator**_, and the other elements are called _**operands**_. The value of a combination is obtained by applying the procedure specified by the operator to the _**arguments**_ that are the values of the operands.  
  
            * What is prefix notation?  
                  
                The convention of placing the operator to the left of the operands is known as _**prefix notation**_.  
                  
                Prefix notation has several advantages:  
                  
                * It can accommodate procedures that may take an arbitrary number of arguments. No ambiguity can arise, because the operator is always the leftmost element and the entire combination is delimited by the parentheses;  
                ```lisp  
                (+ 21 35 12 7)   
                ;75   
                (* 25 4 12)   
                ;1200  
                ```  
  
                * It extends in a straightforward way to allow combinations to be _nested_, There is no limit (in principle) to the depth of such nesting and to the overall complexity of the expressions that the Lisp interpreter can evaluate.   
                ```lisp  
                (+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))  
                ```  
  
        * What is a read-eval-print(repl) loop?  
              
            Even with complex expressions, the interpreter always operates in the same basic cycle: It reads an expression from the terminal, evaluates the expression, and prints the result. This mode of operation is often expressed by saying that the interpreter runs in a _**read-eval-print loop**_.  
  
    * 1.1.2 Naming and the Environment  
        * How are things named in the Scheme dialect of Lisp?  
              
            In the Scheme dialect of Lisp, we name things with **define**. Typing   
            ```lisp  
            (define size 2)   
            ```  
            causes the interpreter to associate the value 2 with the name **size**. Once the name **size** has been associated with the number 2, we can refer to the value 2 by name:   
            ```lisp  
            size   
            ;2   
            (* 5 size)   
            ;10   
            ```  
  
            * What does `define` do in Lisp?  
                  
                Here are further examples of the use of define:   
                ```lisp  
                (define pi 3.14159)  
                (define radius 10)  
                (* pi (* radius radius))  
                ;314.159  
                (define circumference (* 2 pi radius)) circumference  
                ;62.8318   
                ```  
                `Define` is our language’s simplest means of abstraction, for it allows us to use simple names to refer to the results of compound operations, such as the circumference computed above.  
  
        * What is environment?  
              
            It should be clear that the possibility of associating values with symbols and later retrieving them means that the interpreter must maintain some sort of memory that keeps track of the name-object pairs. This memory is called the _**environment**_ (more precisely the _**global environment**_, since we will see later that a computation may involve a number of different environments).  
  
    * 1.1.3 Evaluating Combinations  
        * What are the general rules for evaluating combinations?  
              
            To evaluate a combination, do the following:   
              
            1. Evaluate the subexpressions of the combination.   
            2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).   
              
            The evaluation rule is _recursive_ in nature; that is, it includes, as one of its steps, the need to invoke the rule itself.  
  
        * How can recursion be used to express the process of a deeply nested combination?  
              
            For example, evaluating   
            ```lisp  
            (* (+ 2 (* 4 6))  
               (+ 3 5 7))  
            ```  
            requires that the evaluation rule be applied to four different combinations. We can obtain a picture of this process by representing the combination in the form of a tree, as shown in figure 1.1.  
              
            ![figure 1.1][3]  
                
            Each combination is represented by a node with branches corresponding to the operator and the operands of the combination stemming from it. The terminal nodes (that is, nodes with no branches stemming from them) represent either operators or numbers.   
              
            In general, we shall see that recursion is a very powerful technique for dealing with hierarchical, treelike objects. In fact, the “percolate values upward” form of the evaluation rule is an example of a general kind of process known as _**tree accumulation**_.  
  
        * What are **_special forms_**?  
              
            Notice that the evaluation rule given above does not handle definitions.   
              
            For instance, evaluating `(define x 3)` does not apply `define` to two arguments, one of which is the value of the symbol x and the other of which is 3, since the purpose of the `define` is precisely to associate x with a value. (That is, `(define x 3)` is not a combination.)   
            Such exceptions to the general evaluation rule are called _**special forms**_.  
  
    * 1.1.4 Compound Procedures  
        * What are procedure definitions?  
              
            _**procedure definitions**_, a much more powerful abstraction technique by which a compound operation can be given a name and then referred to as a unit.  
  
        * How to define a compound procedure in Lisp?  
              
            We begin by examining how to express the idea of “squaring”. This is expressed in our language as:  
            ```lisp  
            (define (square x) (* x x))  
            ```  
            We can understand this in the following way:   
              
            >(define (square  x)        (*         x     x))  
              ↑        ↑     ↑          ↑         ↑     ↑  
             To      square something, multiply   it by itself.  
              
            We have here a _**compound procedure**_, which has been given the name square. The procedure represents the operation of multiplying something by itself. **The thing to be multiplied is given a local name, x, which plays the same role that a pronoun plays in natural language**. Evaluating the definition creates this compound procedure and associates it with the name square.  
  
        * What is the general form of a procedure definition?  
              
            The general form of a procedure definition is   
              
            >(define (<name> <formal parameters>) <body>)  
              
            The <_name_> is a symbol to be associated with the procedure definition in the environment. The <_formal parameters_> are the names used within the body of the procedure to refer to the corresponding arguments of the procedure. The <_body_> is an expression that will yield the value of the procedure application when the formal parameters are replaced by the actual arguments to which the procedure is applied. The <_name_> and the <_formal parameters_> are grouped within parentheses, just as they would be in an actual call to the procedure being defined.  
  
        * What can a compound procedure be used for?  
              
            Having defined square, we can now use it:  
               
            ```lisp  
            (square 21)   
            ;441   
            ```  
              
            We can also use `square` as a building block in defining other procedures and easily define a procedure sum-of-squares that, given any two numbers as arguments, produces the sum of their squares:   
              
            ```lisp  
            (define (sum-of-squares x y)  
              (+ (square x) (square y)))  
              
            (sum-of-squares 3 4)  
            ;25  
            ```  
              
            Now we can use `sum-of-squares` as a building block in constructing further procedures:   
              
            ```lisp  
            (define (f a)  
              (sum-of-squares (+ a 1) (* a 2)))  
              
            (f 5)   
            ;136   
            ```  
  
    * 1.1.5 The Substitution Model for Procedure Application  
        * What is **_substitution model_** for procedure application?  
            Link: [/Local/Google Drive/Learning/Book/Structure and Interpretation of Computer Programs/SICP Notes/SICP notes.itmz][4]  
              
            We can assume that the mechanism for applying primitive procedures to arguments is built into the interpreter. For compound procedures, the application process is as follows:   
              
            >To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument.   
              
            To illustrate this process, let’s evaluate the combination   
              
            ```lisp  
            (f 5)  
            ```  
              
            We begin by retrieving the body of f:   
              
            ```lisp  
            (sum-of-squares (+ a 1) (* a 2))  
            ```  
              
            Then we replace the formal parameter a by the argument 5:  
              
            ```lisp  
            (sum-of-squares (+ 5 1) (* 5 2))   
            ```  
              
            Thus the problem reduces to the evaluation of a combination with two operands and an operator sum-of-squares. Evaluating this combination involves three subproblems. We must evaluate the operator to get the procedure to be applied, and we must evaluate the operands to get the arguments. Now (+ 5 1) produces 6 and (* 5 2) produces 10, so we must apply the sum-of-squares procedure to 6 and 10. These values are substituted for the formal parameters x and y in the body of sum-of-squares, reducing the expression to   
              
            ```lisp  
            (+ (square 6) (square 10))  
            ```  
              
            If we use the definition of square, this reduces to   
              
            ```lisp  
            (+ (* 6 6) (* 10 10))  
            ```  
              
            which reduces by multiplication to  
              
            ```lisp  
            (+ 36 100)  
            ```  
              
            and finally to  
              
            ```lisp  
            136   
            ```  
              
            The process we have just described is called the _**substitution model**_ for procedure application.  
  
        * Applicative Order versus normal order  
            * What are **_normal-order evaluation_** and **_applicative-order evaluation_**?  
                  
                According to the description of evaluation given in section 1.1.3, **the interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments**.   
                  
                This is not the only way to perform evaluation. **An alternative evaluation model would not evaluate the operands until their values were needed**. Instead **it would first substitute operand expressions for parameters until it obtained an expression involving only primitive operators, and would then perform the evaluation**. If we used this method, the evaluation of   
                  
                ```lisp  
                (f 5)   
                ```  
                  
                would proceed according to the sequence of expansions   
                  
                ```lisp  
                (sum-of-squares (+ 5 1) (* 5 2))  
                (+ (square (+ 5 1))      (square (* 5 2))  )  
                (+ (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))  
                ```  
                  
                followed by the reductions   
                  
                ```lisp  
                (+         (* 6 6)             (* 10 10))  
                (+           36                   100)  
                ;136  
                ```  
                  
                This alternative “fully expand and then reduce” evaluation method is known as _**normal-order evaluation**_, in contrast to the “evaluate the arguments and then apply” method that the interpreter actually uses, which is called _**applicative-order evaluation**_.  
  
            * When will normal-order and applicative-order evaluation produce the same value?  
                  
                It can be shown that, for procedure applications that can be modeled using substitution (including all the procedures in the first two chapters of this book) and that yield legitimate values, normal-order and applicative-order evaluation produce the same value. (See exercise 1.5 for an instance of an “illegitimate” value where normal-order and applicative-order evaluation do not give the same result.)  
  
            * Why does Lisp use applicative order?  
                  
                Lisp uses applicative-order evaluation, partly because of the additional efficiency obtained from avoiding multiple evaluations of expressions such as those illustrated with (+ 5 1) and (* 5 2) above and, more significantly, because normal-order evaluation becomes much more complicated to deal with when we leave the realm of procedures that can be modeled by substitution.  
  
    * 1.1.6 Conditional Expressions and Predicates  
        * What is case analysis?  
              
            The expressive power of the class of procedures that we can define at this point is very limited, because we have no way to _make tests and to perform different operations depending on the result of a test_. For instance, we cannot define a procedure that computes the absolute value of a number by testing whether the number is positive, negative, or zero and taking different actions in the different cases according to the rule   
              
             ![][5]    
              
            This construct is called a _**case analysis**_.  
  
        * How does conditional expression `cond` work?  
              
            there is a special form in Lisp for notating such a case analysis. It is called `cond` (which stands for “conditional”), and it is used as follows:   
              
            ```lisp  
            (define (abs x)  
              (cond ((> x 0) x)  
                    ((= x 0) 0)  
                    ((< x 0) (- x))))  
            ```  
  
            * What is the general form of a conditional expression?  
                  
                The general form of a conditional expression is   
                  
                >(cond (<_p1_ > <_e1_ >)   
                       (<_p2_ > <_e2_ >)   
                       ...  
                       (<_p_n> <_e_n>))   
                  
                consisting of the symbol `cond` followed by parenthesized pairs of expressions (<_p_> <_e_>) called _**clauses**_. The first expression in each pair is a _**predicate**_ -- _an expression whose value is interpreted as either true or false_.  
  
            * How are `cond` expressions evaluated?  
                  
                Conditional expressions are evaluated as follows.   
                The predicate <_p1_ > is evaluated first. If its value is false,   
                then <_p2_> is evaluated. If <_p2_>’s value is also false,   
                then <_p3_> is evaluated.   
                This process continues until a predicate is found whose value is true, in which case the interpreter returns the value of the corresponding _**consequent expression**_ <_e_> of the clause as the value of the conditional expression.   
                If none of the <_p_>’s is found to be true, the value of the `cond` is `undefined`.  
  
            * How is `else` used in `cond` expressions?  
                  
                Another way to write the absolute-value procedure is  
                  
                ```lisp  
                (define (abs x)  
                  (cond ((< x 0) (- x))  
                        (else x)))  
                ```  
                  
                which could be expressed in English as “If _x_ is less than zero return - _x_; otherwise return _x_.” **`Else` is a special symbol that can be used in place of the <_p_> in the final clause of a `cond`. This causes the `cond` to return as its value the value of the corresponding <_e_> whenever all previous clauses have been bypassed.**   
                _**In fact, any expression that always evaluates to a true value could be used as the <_p_> here**_.  
  
        * How does conditional expression `if` work?  
              
            Here is yet another way to write the absolute-value procedure:   
              
            ```lisp  
            (define (abs x)  
              (if (< x 0)  
                  (- x)   
                  x))  
            ```  
               
            This uses the special form `if`, **a restricted type of conditional that can be used when there are precisely two cases in the case analysis**.  
  
            * What is the general form of an `if` expression?  
                  
                The general form of an if expression is   
                  
                >(if <_predicate_> <_consequent_> <_alternative_>)  
  
            * How are `if` expressions evaluated?  
                  
                To evaluate an if expression, the interpreter starts by evaluating the <_predicate_> part of the expression. If the <_predicate_> evaluates to a true value, the interpreter then evaluates the <_consequent_> and returns its value. Otherwise it evaluates the <_alternative_> and returns its value.  
  
            * What is the difference between `if` and `cond`?  
                  
                A minor difference between `if` and `cond` is that the <_e_> part of each `cond` clause may be **a sequence of expressions**. If the corresponding <_p_> is found to be true, the expressions <_e_> are evaluated in sequence and the value of the final expression in the sequence is returned as the value of the cond. In an if expression, however, **the <_consequent_> and <_alternative_> must be single expressions**.  
  
        * How do predicates work?  
              
            The word _**predicate**_ is used for procedures that return true or false, as well as for expressions that evaluate to true or false.  
  
            * What are the **primitive predicates**?  
                  
                The absolute-value procedure `abs` makes use of the **primitive predicates >, <, and =**. These take two numbers as arguments and test whether the first number is, respectively, greater than, less than, or equal to the second number, returning true or false accordingly.   
                  
                `abs` also uses the “minus” operator `-`, which, **when used with a single operand, as in (- x), indicates negation**.  
  
            * What are the three frequently used **compound predicates**?  
                  
                In addition to primitive predicates such as <, =, and >, there are **logical composition operations**, **which enable us to construct compound predicates.** The three most frequently used are these:   
                  
                (and <_e1_> ... <_e_n>)   
                The interpreter evaluates the expressions <_e_> one at a time, in **left-to-right order**. **If any <_e_> evaluates to false, the value of the `and` expression is false, and the rest of the <_e_>’s are not evaluated**. If all <_e_>’s evaluate to true values, the value of the `and` expression is the value of the last one.   
                e.g. the condition that a number _x_ be in the range 5 < _x_ < 10 may be expressed as   
                ```lisp  
                (and (> x 5) (< x 10))  
                ```  
                  
                (or <_e1_> ... <_e_n>)   
                The interpreter evaluates the expressions <_e_> one at a time, in **left-to-right order**. **If any <_e_> evaluates to a true value, that value is returned as the value of the `or` expression, and the rest of the <_e_>’s are not evaluated**. If all <_e_>’s evaluate to false, the value of the `or` expression is false.   
                  
                (not <_e_>)  
                The value of a not expression is true when the expression <_e_> evaluates to false, and false otherwise.   
                e.g. we can define a predicate to test whether one number is greater than or equal to another as   
                ```lisp  
                (define (>= x y)  
                  (or (> x y) (= x y)))  
                ```   
                or alternatively as   
                ```lisp  
                (define (>= x y)  
                  (not (< x y)))  
                ```  
                  
                **Notice that `and` and `or` are special forms, not procedures, because the subexpressions are not necessarily all evaluated. `Not` is an ordinary procedure.**  
  
    * Exercise 1.1-1.5  
          
        [github.com/mengsince1986/SICP/blob/master/SICP Exercises/exercise 1.1-1.5.scm][6]  
  
    * 1.1.7 Example: Square Roots by Newton’s Method  
        * What is the difference between mathematical functions and computer procedures?  
              
            **Procedures**, as introduced above, are much like ordinary mathematical functions. They specify a value that is determined by one or more parameters. But there is an important difference between mathematical functions and computer procedures. **_Procedures must be effective_**.   
              
            The contrast between function and procedure is a reflection of the general distinction between describing properties of things and describing how to do things, or, as it is sometimes referred to, the distinction between **_declarative knowledge_** and **_imperative knowledge_**. **In mathematics we are usually concerned with declarative (what is) descriptions, whereas in computer science we are usually concerned with imperative (how to) descriptions**.   
              
            Declarative and imperative descriptions are intimately related, as indeed are mathematics and computer science. For instance, **to say that the answer produced by a program is “correct” is to make a declarative statement about the program**. There is a large amount of research aimed at establishing techniques for proving that programs are correct, and much of the technical difficulty of this subject has to do with negotiating the transition between imperative statements (from which programs are constructed) and declarative statements (which can be used to deduce things). **In a related vein, an important current area in programming-language design is the exploration of so-called very high-level languages, in which one actually programs in terms of declarative statements. The idea is to make interpreters sophisticated enough so that, given “what is” knowledge specified by the programmer, they can generate “how to” knowledge automatically.** This cannot be done in general, but there are important areas where progress has been made. We shall revisit this idea in chapter 4.  
  
        * How to calculate square roots with Newton’s method?  
              
            How does one compute square roots? The most common way is to use Newton’s method of successive approximations, which says that **whenever we have a guess _y_ for the value of the square root of a number _x_, we can perform a simple manipulation to get a better guess (one closer to the actual square root) by averaging _y_ with _x_/_y_.** For example, we can compute the square root of 2 as follows. Suppose our initial guess is 1:   
              
            ![][7]  
              
            Continuing this process, we obtain better and better approximations to the square root.   
              
            This square-root algorithm is actually a special case of Newton’s method, which is a general technique for finding roots of equations. The square-root algorithm itself was developed by Heron of Alexandria in the first century A.D..  
  
        * How to make Newton’s method a procedure in Lisp?  
              
            [../SICP Exercises/exercise 1.1-1.5.scm][8]  
              
            [github.com/mengsince1986/SICP/blob/master/SICP Exercises/exercise 1.1-1.5.scm][9]  
  
    * Exercise 1.6-1.8  
          
        [github.com/mengsince1986/SICP/blob/master/SICP Exercises/exercise 1.6-1.8.scm][10]  
  
    * 1.1.8 Procedures as Black-Box Abstractions  
        * How is `sqrt` procedure decomposed into a number of subproblems?  
              
            Observe that the problem of computing square roots breaks up naturally into a number of subproblems: **how to tell whether a guess is good enough, how to improve a guess, and so on**. Each of these tasks is accomplished by a separate procedure. The entire `sqrt` program can be viewed as a cluster of procedures (shown in figure 1.2) that mirrors the decomposition of the problem into subproblems.   
               
            ![][11]  
                
            **Figure 1.2:** Procedural decomposition of the sqrt program.  
  
        * What is procedural abstraction?  
              
            The importance of this decomposition strategy is not simply that one is dividing the program into parts. Rather, it is crucial that each procedure accomplishes an identifiable task that can be used as a module in defining other procedures. For example, when we define the `good-enough?` procedure in terms of square, we are able to regard the square procedure as a “**_black box_**”. We are not at that moment concerned with _how_ the procedure computes its result, only with the fact that it computes the square. The details of how the square is computed can be suppressed, to be considered at a later time. Indeed, as far as the good-enough? procedure is concerned, square is not quite a procedure but rather an abstraction of a procedure, a so-called _**procedural abstraction**_. At this level of abstraction, any procedure that computes the square is equally good.   
              
            So **a procedure definition should be able to suppress detail**. The users of the procedure may not have written the procedure themselves, but may have obtained it from another programmer as **_a black box_**. **A user should not need to know how the procedure is implemented in order to use it.**  
  
        * Local names  
            * Why should the meaning of a procedure be independent of the formal parameter names?  
                  
                One detail of a procedure’s implementation that should not matter to the user of the procedure is the implementer’s choice of names for the procedure’s formal parameters. Thus, the following procedures should not be distinguishable:   
                  
                ```lisp  
                (define (square x) (* x x))  
                (define (square y) (* y y))  
                ```  
                  
                This principle -- **_that the meaning of a procedure should be independent of the parameter names used by its author_** -- seems on the surface to be self-evident, but its consequences are profound. **_The simplest consequence is that the parameter names of a procedure must be local to the body of the procedure._** For example, we used `square` in the definition of `good-enough?` in our `square-root` procedure:   
                  
                ```lisp  
                (define (good-enough? guess x)  
                  (< (abs (- (square guess) x)) 0.001))  
                ```  
                  
                The intention of the author of `good-enough?` is to determine if the square of the first argument is within a given tolerance of the second argument. We see that the author of `good-enough?` used the name `guess` to refer to the first argument and `x` to refer to the second argument. The argument of square is `guess`. If the author of `square` used x (as above) to refer to that argument, we see that the `x` in `good-enough?` must be a different `x` than the one in `square`. Running the procedure square must not affect the value of x that is used by `good-enough?`, because that value of x may be needed by `good-enough?` after `square` is done computing.   
                  
                **_If the parameters were not local to the bodies of their respective procedures, then the parameter `x` in `square` could be confused with the parameter `x` in `good-enough?`, and the behavior of `good-enough?` would depend upon which version of `square` we used. Thus, `square` would not be the black box we desired._**  
  
            * What is a bound/free variable?  
                  
                **A formal parameter of a procedure has a very special role in the procedure definition, in that it doesn’t matter what name the formal parameter has.** Such a name is called a _**bound variable**_, and we say that **the procedure definition _binds_ its formal parameters**. **The meaning of a procedure definition is unchanged if a bound variable is consistently renamed throughout the definition**.   
                  
                **If a variable is not bound**, we say that it is _**free**_.   
                  
                In the definition of `good-enough?` above, guess and x are bound variables but `<`, `-`, `abs`, and `square` are free. The meaning of `ood-enough?` should be independent of the names we choose for `guess` and `x` so long as they are distinct and different from `<`, `-`, `abs`, and `square`. (If we renamed `guess` to `abs` we would have introduced a bug by _capturing_ the variable `abs`. It would have changed from free to bound.) The meaning of `good-enough?` is not independent of the names of its free variables, however. It surely depends upon the fact (external to this definition) that the symbol `abs` names a procedure for computing the absolute value of a number. `Good-enough?` will compute a different function if we substitute `cos` for `abs` in its definition.  
  
            * What is scope  
                  
                The set of expressions for which a binding defines a name is called the _**scope**_ of that name. **In a procedure definition, the bound variables declared as the formal parameters of the procedure have the body of the procedure as their scope**.  
  
        * Internal definitions and block structure  
            * What are internal definition and block structure?  
                  
                We have one kind of name isolation available to us so far: **The formal parameters of a procedure are local to the body of the procedure**. The square-root program illustrates another way in which we would like to control the use of names. The existing program consists of separate procedures:  
                  
                ```lisp  
                (define (sqrt x)  
                  (sqrt-iter 1.0 x))  
                (define (sqrt-iter guess x)  
                  (if (good-enough? guess x)  
                       guess   
                      (sqrt-iter (improve guess x) x)))  
                (define (good-enough? guess x)  
                  (< (abs (- (square guess) x)) 0.001))  
                (define (improve guess x)  
                  (average guess (/ x guess)))  
                ```  
                  
                The problem with this program is that the only procedure that is important to users of `sqrt` is `sqrt`. The other procedures (`sqrt-iter`, `good-enough?`, and `improve`) only clutter up their minds. They may not define any other procedure called `good-enough?` as part of another program to work together with the square-root program, because `sqrt` needs it. The problem is especially severe in the construction of large systems by many separate programmers. For example, in the construction of a large library of numerical procedures, many numerical functions are computed as successive approximations and thus might have procedures named `good-enough?` and `improve` as auxiliary procedures. **We would like to localize the subprocedures, hiding them inside `sqrt` so that `sqrt` could coexist with other successive approximations, each having its own private `good-enough?` procedure.** To make this possible, we allow a procedure to have **_internal definitions_** that are local to that procedure. For example, in the square-root problem we can write   
                  
                ```lisp  
                (define (sqrt x)  
                  (define (good-enough? guess x)  
                    (< (abs (- (square guess) x)) 0.001))  
                  (define (improve guess x)  
                    (average guess (/ x guess)))  
                  (define (sqrt-iter guess x)  
                    (if (good-enough? guess x)  
                        guess  
                        (sqrt-iter (improve guess x) x)))  
                  (sqrt-iter 1.0 x))  
                ```  
                  
                Such nesting of definitions, called _**block structure**_, is basically the right solution to the simplest name-packaging problem.   
                  
                The idea of block structure originated with the programming language **Algol 60**. It appears in most advanced programming languages and is an important tool for helping to organize the construction of large programs.  
  
            * What is lexical scoping?  
                  
                But there is a better idea lurking here. In addition to internalizing the definitions of the auxiliary procedures, we can simplify them. Since x is bound in the definition of `sqrt`, the procedures `good-enough?`, `improve`, and `sqrt-iter`, which are defined internally to `sqrt`, are in the scope of `x`. Thus, it is not necessary to pass `x` explicitly to each of these procedures. Instead, we allow `x` to be a free variable in the internal definitions, as shown below. Then `x` gets its value from the argument with which the enclosing procedure `sqrt` is called. This discipline is called _**lexical scoping**_.  
                  
                ```lisp  
                (define (sqrt x)  
                  (define (good-enough? guess)  
                    (< (abs (- (square guess) x)) 0.001))  
                  (define (improve guess)  
                    (average guess (/ x guess)))  
                  (define (sqrt-iter guess)  
                    (if (good-enough? guess)  
                        guess  
                        (sqrt-iter (improve guess))))  
                  (sqrt-iter 1.0))  
                ```  
                  
                **Lexical scoping dictates that free variables in a procedure are taken to refer to bindings made by enclosing procedure definitions; that is, they are looked up in the environment in which the procedure was defined**.  
  
* 1.2 Procedures and the Processes They Generate  
    * What is a procedure?  
          
        A **_procedure_** is a pattern for the _local evolution_ of a computational process. It specifies how each stage of the process is built upon the previous stage. We would like to be able to make statements about the overall, or _global_, behavior of a process whose local evolution has been specified by a procedure.  
  
    * 1.2.1 Linear Recursion and Iteration  
        * How to compute factorials with a linear recursive process?  
              
            We begin by considering the factorial function, defined by   
              
            >n! = n * (n−1) * (n−2) ... 3 * 2 * 1  
              
            There are many ways to compute factorials. One way is to make use of the observation that _n_! is equal to _n_ times (_n_ - 1)! for any positive integer _n_:   
              
            >n! = n * [(n−1) * (n−2) ... 3 * 2 * 1] = n * (n−1)!  
              
            Thus, we can compute _n_! by computing (_n_ - 1)! and multiplying the result by _n_. If we add the stipulation that 1! is equal to 1, this observation translates directly into a procedure:   
              
            ```lisp  
            (define (factorial n)  
              (if (= n 1)  
                  1  
                  (* n (factorial (- n 1)))))  
            ```  
              
            We can use the substitution model of section 1.1.5 to watch this procedure in action computing 6!, as shown in figure 1.3.   
              
             ![][12]  
                
            **Figure 1.3:** A linear recursive process for computing 6!.  
  
        * How to compute factorials with a linear iterative process?  
              
            We could describe a rule for computing _n_! by specifying that we first multiply 1 by 2, then multiply the result by 3, then by 4, and so on until we reach _n_. More formally, we maintain a running **product**, together with a **counter** that counts from 1 up to _n_. We can describe the computation by saying that the counter and the product simultaneously change from one step to the next according to the rule   
              
            > product <-- counter * product  
            counter <-- counter + 1  
              
            and stipulating that _n_! is the value of the product when the counter exceeds _n_.  
              
            Once again, we can recast our description as a procedure for computing factorials:   
              
            ```lisp  
            (define (factorial n)  
              (fact-iter 1 1 n))  
            (define (fact-iter product counter max-count)  
              (if (> counter max-count)  
                  product  
                  (fact-iter (* counter product)  
                             (+ counter 1)  
                             max-count)))  
            ```  
              
            In a real program we would probably use the block structure introduced in the last section to hide the definition of `fact-iter`:   
              
            ```lisp  
            (define (factorial n)  
              (define (iter product counter)  
                (if (> counter n)  
                    product  
                    (iter (* counter product)  
                          (+ counter 1))))  
            (iter 1 1))   
            ```  
              
            As before, we can use the substitution model to visualize the process of computing 6!, as shown in figure 1.4.   
              
             ![][13]  
              
            **Figure 1.4:** A linear iterative process for computing 6!.  
  
        * What is the difference between linear recursive process and linear iterative process?  
            * What is (linear) **recursive process**?  
                  
                Consider the first process. The substitution model reveals **a shape of expansion followed by contraction**, indicated by the arrow in figure 1.3. The expansion occurs as the process builds up a chain of _**deferred operations**_ (in this case, a chain of multiplications). The contraction occurs as the operations are actually performed. **This type of process, characterized by a chain of deferred operations, is called a _recursive process_**.   
                  
                Carrying out this process requires that the interpreter keep track of the operations to be performed later on. **In the computation of _n_!, the length of the chain of deferred multiplications, and hence the amount of information needed to keep track of it, grows linearly with _n_ (is proportional to _n_), just like the number of steps. Such a process is called a _linear recursive process_**.  
  
            * What is (linear) **iterative process**?  
                  
                By contrast, **the second process does not grow and shrink. At each step, all we need to keep track of, for any _n_, are the current values of the variables product, counter, and max-count. We call this an _iterative process_**.   
                  
                In general, **an iterative process is one whose state can be summarized by a fixed number of _state variables_, together with a fixed rule that describes how the state variables should be updated as the process moves from state to state and an (optional) end test that specifies conditions under which the process should terminate**.   
                  
                **In computing _n_!, the number of steps required grows linearly with _n_. Such a process is called a _linear iterative process_**.  
  
            * How is information maintained in recursive and iterative processes respectively?  
                  
                In the **iterative case**, the program variables provide a complete description of the state of the process at any point. If we stopped the computation between steps, all we would need to do to resume the computation is to supply the interpreter with the values of the three program variables.   
                  
                Not so with the **recursive process**. In this case there is some additional “hidden” information, maintained by the interpreter and not contained in the program variables, which indicates “where the process is” in negotiating the chain of **deferred operations**. The longer the chain, the more information must be maintained.   
                  
                When we discuss the implementation of procedures on register machines in chapter 5, we will see that any **iterative process** can be realized “in hardware” as a machine that has **a fixed set of registers** and no **auxiliary memor**y. In contrast, realizing a r**ecursive process** requires a machine that uses an auxiliary data structure known as a _**stack**_.  
  
        * What is the difference between **recursive process** and **recursive procedure**?  
              
            In contrasting iteration and recursion, we must be careful not to confuse the notion of a **recursive _process_** with the notion of a **recursive _procedure_**.   
              
            **When we describe a procedure as recursive, we are referring to the syntactic fact that the procedure definition refers (either directly or indirectly) to the procedure itself**. **But when we describe a process as following a pattern that is, say, linearly recursive, we are speaking about how the process evolves, not about the syntax of how a procedure is written**.   
              
            It may seem disturbing that we refer to a recursive procedure such as `fact-iter` as generating an iterative process. However, the process really is iterative: Its state is captured completely by its three state variables, and an interpreter need keep track of only three variables in order to execute the process.   
              
            One reason that the distinction between process and procedure may be confusing is that most implementations of **common languages** (including Ada, Pascal, and C) are designed in such a way that the interpretation of any recursive procedure consumes an amount of memory that grows with the number of procedure calls, even when the process described is, in principle, iterative. As a consequence, these languages can describe iterative processes only by resorting to special-purpose “**looping constructs**” such as `do`,`repeat`,`until`,`for`, and `while`.   
              
            The implementation of **Scheme** we shall consider in chapter 5 does not share this defect. It will execute an iterative process in constant space, even if the iterative process is described by a recursive procedure. An implementation with this property is called _**tail-recursive**_. **With a tail-recursive implementation, iteration can be expressed using the ordinary procedure call mechanism, so that special iteration constructs are useful only as syntactic sugar**.   
              
            **_Tail recursion_** has long been known as a compiler optimization trick. A coherent semantic basis for tail recursion was provided by Carl Hewitt (1977), who explained it in terms of the “message-passing” model of computation that we shall discuss in chapter 3. Inspired by this, Gerald Jay Sussman and Guy Lewis Steele Jr. (see Steele 1975) constructed a tail-recursive interpreter for Scheme. Steele later showed how tail recursion is a consequence of the natural way to compile procedure calls (Steele 1977). **The IEEE standard for Scheme requires that Scheme implementations be tail-recursive**.  
  
    * Exercise 1.9-1.10  
          
        [github.com/mengsince1986/SICP/blob/master/SICP Exercises/exercise 1.9-1.10.scm][14]  
  
    * 1.2.2 Tree Recursion  
        * How to compute Fibonacci numbers with **tree recursion**?  
              
            Another common pattern of computation is called _**tree recursion**_. As an example, consider computing the sequence of Fibonacci numbers, in which each number is the sum of the preceding two:   
            >0, 1, 1, 2, 3, 5, 8, 13, 21, ...  
              
            In general, the Fibonacci numbers can be defined by the rule   
              
             ![][15]    
              
              
            We can immediately translate this definition into a recursive procedure for computing Fibonacci numbers:   
              
            ```lisp  
            (define (fib n)  
              (cond ((= n 0) 0)  
                    ((= n 1) 1)  
                    (else (+ (fib (- n 1))  
                             (fib (- n 2))))))  
            ```  
              
             ![][16]    
              
            **Figure 1.5:** The tree-recursive process generated in computing (fib 5).   
              
              
            Consider the pattern of this computation. To compute (fib 5), we compute (fib 4) and (fib 3). To compute (fib 4), we compute (fib 3) and (fib 2). In general, the evolved process looks like a tree, as shown in figure 1.5. Notice that **the branches split into two at each level (except at the bottom); this reflects the fact that the fib procedure calls itself twice each time it is invoked**.  
  
        * Why is the Fibonacci procedure with tree recursion is inefficient?  
              
            This procedure is instructive as a prototypical tree recursion, but it is a terrible way to compute Fibonacci numbers because it does so much redundant computation. Notice in figure 1.5 that the entire computation of (fib 3) — almost half the work — is duplicated. In fact, it is not hard to show that **the number of times the procedure will compute (fib 1) or (fib 0) (the number of leaves in the above tree, in general) is precisely Fib(n + 1)**. To get an idea of how bad this is, one can show that the value of Fib(n) grows exponentially with n. More precisely (see exercise 1.13), Fib(n) is the closest integer to   
              
            ![][17]  
              
              
            where  
              
            ![][18]  
              
              
            is the golden ratio, which satisfies the equation  
              
            ![][19]  
              
              
            Thus, the process uses a number of steps that grows exponentially with the input. On the other hand, the space required grows only linearly with the input, because we need keep track only of which nodes are above us in the tree at any point in the computation. In general, the number of steps required by a tree-recursive process will be proportional to the number of nodes in the tree, while the space required will be proportional to the maximum depth of the tree.  
  
        * How to formulate an **iterative process** for computing the Fibonacci numbers?  
              
            We can also formulate an iterative process for computing the Fibonacci numbers. The idea is to use a pair of integers _a_ and _b_, initialized to _Fib_(1) = 1 and _Fib_(0) = 0, and to repeatedly apply the simultaneous transformations   
              
            >a <-- a + b  
            b <-- a  
              
            **_It is not hard to show that, after applying this transformation _n_ times, _a_ and _b_ will be equal, respectively, to _Fib_(_n_ + 1) and _Fib_(_n_)_**. Thus, we can compute Fibonacci numbers iteratively using the procedure   
              
            ```lisp  
            (define (fib n)  
              (fib-iter 1 0 n))  
            (define (fib-iter a b count)  
              (if (= count 0)  
                  b  
                  (fib-iter (+ a b) a (- count 1))))  
            ```  
              
            This second method for computing _Fib_(_n_) is **a linear iteration**. **The difference in number of steps required by the two methods -- one linear in _n_, one growing as fast as _Fib_(_n_) itself -- is enormous, even for small inputs**.  
  
        * Are inefficient tree-recursive processes useless?  
              
            One should not conclude from this that tree-recursive processes are useless. **When we consider processes that operate on hierarchically structured data rather than numbers, we will find that tree recursion is a natural and powerful tool.** But even in numerical operations, tree-recursive processes can be useful in helping us to understand and design programs. For instance, although the first `fib` procedure is much less efficient than the second one, it is more straightforward, being little more than a translation into Lisp of the definition of the Fibonacci sequence. To formulate the iterative algorithm required noticing that the computation could be recast as an iteration with three state variables.   
              
            An example of this was hinted at in section 1.1.3: **The interpreter itself evaluates expressions using a tree-recursive process**.  
  
    * Example: Counting change  
          
        How many different ways can we make change of $ 1.00, given half-dollars, quarters, dimes, nickels, and pennies? More generally, can we write a procedure to compute the number of ways to change any given amount of money?   
          
        This problem has a simple solution as a recursive procedure. Suppose we think of the types of coins available as arranged in some order. Then the following relation holds:   
          
        The number of ways to change amount _a_ using _n_ kinds of coins equals  
          
        * the number of ways to change amount _a_ using all but the first kind of coin, plus   
        * the number of ways to change amount _a_ - _d_ using all _n_ kinds of coins, where _d_ is the denomination of the first kind of coin.  
          
        **To see why this is true, observe that the ways to make change can be divided into two groups: those that do not use any of the first kind of coin, and those that do. Therefore, the total number of ways to make change for some amount is equal to the number of ways to make change for the amount without using any of the first kind of coin, plus the number of ways to make change assuming that we do use the first kind of coin. But the latter number is equal to the number of ways to make change for the amount that remains after using a coin of the first kind.** ( [stackoverflow.com/questions/27803152/sicp-example-counting-change-cannot-understand][20] )  
          
          
        Thus, we can recursively reduce the problem of changing a given amount to the problem of changing smaller amounts using fewer kinds of coins. Consider this reduction rule carefully, and convince yourself that we can use it to describe an algorithm if we specify the following degenerate cases:   
          
        * If _a_ is exactly 0, we should count that as 1 way to make change.  
        * If _a_ is less than 0, we should count that as 0 ways to make change. If _n_ is 0, we should count that as 0 ways to make change.   
          
        We can easily translate this description into a recursive procedure:   
          
        ```lisp  
        (define (count-change amount)  
          (cc amount 5))  
        (define (cc amount kinds-of-coins)  
          (cond ((= amount 0) 1)  
                ((or (< amount 0) (= kinds-of-coins 0)) 0)  
                (else (+ (cc amount  
                             (- kinds-of-coins 1))  
                         (cc (- amount  
                                (first-denomination kinds-of-coins))  
                             kinds-of-coins)))))  
        (define (first-denomination kinds-of-coins)  
          (cond ((= kinds-of-coins 1) 1)  
                ((= kinds-of-coins 2) 5)  
                ((= kinds-of-coins 3) 10)  
                ((= kinds-of-coins 4) 25)  
                ((= kinds-of-coins 5) 50)))  
        ```  
          
        (The `first-denomination` procedure takes as input the number of kinds of coins available and returns the denomination of the first kind. Here we are thinking of the coins as arranged in order from largest to smallest, but any order would do as well.) We can now answer our original question about changing a dollar:   
          
        ```lisp  
        (count-change 100)  
        ;_292_   
        ```  
          
        `Count-change` generates a tree-recursive process with redundancies similar to those in our first implementation of fib. (It will take quite a while for that 292 to be computed.) On the other hand, it is not obvious how to design a better algorithm for computing the result, and we leave this problem as a challenge. The observation that a tree-recursive process may be highly inefficient but often easy to specify and understand has led people to propose that one could get the best of both worlds by designing a ‘‘smart compiler’’ that could transform tree-recursive procedures into more efficient procedures that compute the same result.  
  
    * Exercise 1.11-1.13  
          
        Solutions: [github.com/mengsince1986/SICP/blob/master/SICP Exercises/exercise 1.11-1.13.scm][22]  
          
        Reference: [stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11][21]  
  
[1]: https://en.wikipedia.org/wiki/Hal_Abelson  
[2]: https://en.wikipedia.org/wiki/Gerald_Jay_Sussman  
[3]: hhu.png  
[4]: ithoughts://open?path=/Local/Google%20Drive/Learning/Book/Structure%20and%20Interpretation%20of%20Computer%20Programs/SICP%20Notes/SICP%20notes.itmz&topic=845D1360-1B3F-4380-A75B-706214358A9D  
[5]: erb.png  
[6]: https://github.com/mengsince1986/SICP/blob/master/SICP%20Exercises/exercise%201.1-1.5.scm  
[7]: fgi.png  
[8]: system://open?path=../SICP%20Exercises/exercise%201.1-1.5.scm  
[9]: https://github.com/mengsince1986/SICP/blob/master/SICP%20Exercises/exercise%201.1-1.5.scm  
[10]: https://github.com/mengsince1986/SICP/blob/master/SICP%20Exercises/exercise%201.6-1.8.scm  
[11]: ncf.png  
[12]: sxj.png  
[13]: iwk.png  
[14]: https://github.com/mengsince1986/SICP/blob/master/SICP%20Exercises/exercise%201.9-1.10.scm  
[15]: qhe.png  
[16]: wjg.png  
[17]: kda.png  
[18]: cka.png  
[19]: bgb.png  
[20]: https://stackoverflow.com/questions/27803152/sicp-example-counting-change-cannot-understand  
[21]: https://stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11  
[22]: https://github.com/mengsince1986/SICP/blob/master/SICP%20Exercises/exercise%201.11-1.13.scm  
