# CS4550-Parser-Project
## Project Details: 
This project is a (mini) Python parser. Our repository is organized in the following manner: 
- miniPy.g4 is our grammar
- we have .svg files so you can view how our grammar parsed each deliverable's sample code
- the sample code is also provided in .py files

## Project Members:
- Lihao Fan
- Tori Fischer
- Maggie Hilty
- Ronan Townes
- Paul Wyman

## Parser Requirements: 
Depending on the method you choose to use the parser, you may need to download ANTLR. The easiest way to do this is to follow the steps outlined in the ANTLR documentation, found [here](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md). Make sure to follow all the steps and add ANTLR to CLASSPATH, aliases also help. You may also need to download Java if you don't already have it. You'll need Java 11 or later. Find the right version to download [here](https://www.java.com/en/download/manual.jsp). 

## How to Use Parser: 
There are two methods to use our parser. The simplest way is to use the online [ANTLR Lab](http://lab.antlr.org/) provided by ANTLR. You don't need to download anything to use this method. To use the ANTLR Lab, make sure the 'Lexer' tab in the top left is empty, since our grammar is combined (it is both a parser and lexer). Then, copy and paste our grammar into the 'Parser' tab. Change the start rule to 'prog' and enter whatever text you'd like to parse in the input box. Finally, click the green 'Run' button, and it will generate a parse tree based on your input (or tell you if there are parse errors).  
The other way to use our parser is more involved. To use this method, you'll need to download ANTLR and Java as outlined above. You'll also need to download our grammar file and place it in a directory. Once everything is set up correctly, and assuming you've created shortcut commands/aliases, you can run these commands in a terminal after navigating to the directory:  
  
        antlr4 miniPy.g4  
        javac miniPy*.java  
      
which will create lexer and parser files. Then, to open an interactive parsing environment, enter the command:  
  
        grun miniPy prog -gui  
      
Afterwards, you can type whatever you'd like to parse. When you're done, hit CTRL+D on Unix or CTRL+Z on Windows to signal that you're done entering. A pop-up window with the parse tree will appear. If you have a file of text you'd like to parse you can pass that to the grun command like so:  

        grun miniPy prog file_name.py -gui  

just make sure that the file file_name.py is located in the same directory. 

## Parser Demo Video:
- [Using ANTLR Lab](https://youtu.be/jtoqZnVuL6Y)
- [Using command line](https://youtu.be/HZtrIo1Xfgc)


## Grammar File Explanation:

#### Lexer Rules

1.  WhiteSpaceAndTab
2.	NEWLINE
3.	List
4.	Bool
5.	Str
6.	Var
7.	Num
8.	Comment1
9.	Comment2



#### Parser Rules

1. - prog (this is our start rule)
2. - expr
3.  - blockStatement_FirstLine
--
 Match the first statement in a "while" "for" or "if" block
	-  blockStatement_NoteFirstLine
--
 Match all statements, except the first one, in a "while" "for" or "if" block
4.  - whileStructure
    - forstructure
    - ifStructure
    - ifStructureNestedSTF
--
Using ifStructureNestedSTF is to make it easier to check the indentation before "else" statement and "elif" statement

5. 
    - forStatement
    - whileStatement
    - ifStatement
--
Match the judgement statement in a "while" "for" or "if" block
    
6.  - judgement
--
 Match several types of condition statements



#### Functions
1. - judgementAfterElseElifNotNestedSTFFirst
--
 Judge whether the indentation is legitimate in the first line, and save the amount of indentation. Used in the first statement in a 'if' structure which is not nested.
In this function, it needs to pops a saved amount of indentation in a stack from the current if block.
   - judgementAfterIfFirst
--
Judge whether the indentation is legitimate in the first line, and save the amount of indentation. Used in the first statement in a "if" structure which is nested, 'while' and 'for' structure. If the statement is in an 'else' or 'elif' statement in a nested if structure, the indentation check before the 'else'or 'elif' statement would pop the last indentation. If the statement is in an 'while','if', 'for' of a nested structure, it doesn't need to pop the indentation object from last block.


2. - judgementAfterIfNotFirst
--
 judge whether the amount of indentation of a statement, which is not the first line and in a "while" "for" or "if" block , is legitimate.
3. - judgementAfterWhitesaceElseElifNestedSTF
--
 judge whether the amount of indentation before 'else' or 'elif' statement is legitimate.

4. - Finalcheck
	  - finalCheckStack
	  - finalCheckPre
	  - finalCheck
--
When getting out of a "while" "for" or "if" block, Remove the amount of indentation for the last block




