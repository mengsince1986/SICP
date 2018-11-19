# **Structure and Interpretation of Computer Programs**  
  
## Authors  
  
### Harold Abelson  
  
Link: [en.wikipedia.org/wiki/Hal_Abelson][1]  
  
### Gerald Jay Sussman  
  
Link: [en.wikipedia.org/wiki/Gerald_Jay_Sussman][2]  
  
### Julie Sussman  
  
## Alan J. Perlis’ words  
  
“Above all, I hope we don’t become missionaries. Don’t feel as if you’re Bible salesmen. The world has too many of those already. What you know about computing other people will learn. **Don’t feel as if the key to successful computing is only in your hands. What’s in your hands, I think and hope, is intelligence: the ability to see the machine as more than when you were first led up to it, that you can make it more.**”  
  
## Foreward  
  
### What matters in learning programming?  
  
To appreciate programming as an intellectual activity in its own right you must turn to computer programming; you must read and write computer programs -- many of them. It doesn’t matter much what the programs are about or what applications they serve. What does matter is how well they perform and how smoothly they fit with other programs in the creation of still greater programs.  
  
### What are the three foci of phenomena in this book?  
  
Our traffic with the subject matter of this book involves us with three foci of phenomena: the human mind, collections of computer programs, and the computer.  
  
### What is the relationship between the human mind and computer programs?  
  
Every computer program is a model, hatched in the mind, of a real or mental process. These processes, arising from human experience and thought, are huge in number, intricate in detail, and at any time only partially understood. They are modeled to our permanent satisfaction rarely by our computer programs. Thus even though our programs are carefully handcrafted discrete collections of symbols, mosaics of interlocking functions, they continually evolve: we change them as our perception of the model deepens, enlarges, generalizes until the model ultimately attains a metastable place within still another model with which we struggle. The source of the exhilaration associated with computer programming is the continual unfolding within the mind and on the computer of mechanisms expressed as programs and the explosion of perception they generate.   
  
*If art interprets our dreams, the computer executes them in the guise of programs!*  
  
## Preface to the First Edition  
  
### What is computer science/revolution?  
  
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
  
        * What is a read-eval-print loop?  
              
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
  
[1]: https://en.wikipedia.org/wiki/Hal_Abelson  
[2]: https://en.wikipedia.org/wiki/Gerald_Jay_Sussman  
