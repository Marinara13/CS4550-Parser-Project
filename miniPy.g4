grammar hello;
@parser::header{
import java.util.Stack;
}
@parser::members
{
Stack<String> stack = new Stack<>();
Stack<Integer> finalCheckStack=new Stack<>();
//Modified
public void finalCheckPre(){
    finalCheckStack.push(stack.size());
}

//Modified
public void finalCheck(){
    int originalWhiteSpaceAmountForCurrentIf=finalCheckStack.pop();
    while(stack.size()>originalWhiteSpaceAmountForCurrentIf){
        stack.pop();
    }

}
boolean judgementAfterWhitespaceElseElifNestedSTF(String input){
    stack.pop();
    if(input.length()==stack.get(stack.size()-1).length()){
          System.out.println("matching___else;;elif");
          System.out.println("______");
          return true;
    }
    stack.pop();
    System.out.println("Not matching___else;;elif");
    System.out.println("______");
    return false;
}
boolean judgementAfterElseElifNotNestedSTFFirst(String input){
    String whiteSpaceCur;
    stack.pop();
    if(stack.size()!=0){
            whiteSpaceCur=stack.get(stack.size()-1);
        }
        else{
           whiteSpaceCur="";
        }
    if(input.length() <=whiteSpaceCur.length()){
         System.out.println(input.length());
         System.out.println(whiteSpaceCur.length());
         System.out.println("stack");
         System.out.println(stack);
         System.out.println("whiteSpace too few");
         System.out.println("______");
         return false;
         }
    System.out.println("whiteSpace saved");
    System.out.println("______");
    stack.push(input);
    return true;
}

boolean judgementAfterIfFirst(String input){
    String whiteSpaceCur;
    if(stack.size()!=0){
        whiteSpaceCur=stack.get(stack.size()-1);
    }
    else{
       whiteSpaceCur="";
    }
    if(input.length() <=whiteSpaceCur.length()){
        System.out.println(input.length());
        System.out.println(whiteSpaceCur.length());

        System.out.println("whiteSpace too few");
        System.out.println("______");
        return false;
    }
    System.out.println("whiteSpace saved");
    System.out.println("______");
    stack.push(input);
    return true;
}
boolean judgementAfterIfNotFirst(String input){
     System.out.println("current length saved");
     System.out.println(stack.get(stack.size()-1).length());
     System.out.print("current length ");
     System.out.println(input.length());
     if(input.length()==stack.get(stack.size()-1).length()){
           System.out.println("matching");
           System.out.println("______");
           return true;
     }
     stack.pop();
     System.out.println("Not matching");
     System.out.println("______");
     return false;
}
}
prog: (WhiteSpaceAndTab NEWLINE|NEWLINE)* expr? (NEWLINE (WhiteSpaceAndTab NEWLINE)* expr )* (WhiteSpaceAndTab NEWLINE|NEWLINE)* ;
expr: statement |  ifStructure|whileStructure|forStrcuture|Comment1|Comment2;


statement:
  Var WhiteSpaceAndTab? '='WhiteSpaceAndTab? (Str|Bool|List)? WhiteSpaceAndTab?
| Var WhiteSpaceAndTab? ('='|'+='|'-='|'*='|'/='|'%=') WhiteSpaceAndTab? (Num|Var) WhiteSpaceAndTab?
| Var WhiteSpaceAndTab? '='WhiteSpaceAndTab? (Num|Var) WhiteSpaceAndTab?
  (('+'|'-'|'*'|'/'|'%') WhiteSpaceAndTab? (Num|Var) WhiteSpaceAndTab?)*;

whileStructure:
 'while' whileStatement NEWLINE
 {finalCheckPre();}
   (WhiteSpaceAndTab NEWLINE)*
       WhiteSpaceAndTab {judgementAfterIfFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
    (NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
       WhiteSpaceAndTab {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine
    )*
  {finalCheck();}
  ;
 forStrcuture:
 'for' forStatement NEWLINE
  {finalCheckPre();}
    (WhiteSpaceAndTab NEWLINE)*
        WhiteSpaceAndTab {judgementAfterIfFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
     (NEWLINE
     (WhiteSpaceAndTab NEWLINE)*
        WhiteSpaceAndTab {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine
     )*
   {finalCheck();}
   ;

ifStructure:
 'if' ifStatement NEWLINE
 {finalCheckPre();}
   (WhiteSpaceAndTab NEWLINE)*
       WhiteSpaceAndTab {judgementAfterIfFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
    (NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
       WhiteSpaceAndTab {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine
    )*
  (NEWLINE
  (WhiteSpaceAndTab NEWLINE)*
  'elif' ifStatement NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
    WhiteSpaceAndTab {judgementAfterElseElifNotNestedSTFFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
    (NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
     WhiteSpaceAndTab  {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine)*
    )*
  (NEWLINE
  (WhiteSpaceAndTab NEWLINE)*
 'else' WhiteSpaceAndTab?':'NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
     WhiteSpaceAndTab {judgementAfterElseElifNotNestedSTFFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
     (NEWLINE
     (WhiteSpaceAndTab NEWLINE)*
     WhiteSpaceAndTab  {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine)*
  )?
  {finalCheck();}
  ;

//modified
forStatement: WhiteSpaceAndTab Var WhiteSpaceAndTab 'in'WhiteSpaceAndTab Var WhiteSpaceAndTab?':'
| WhiteSpaceAndTab Var WhiteSpaceAndTab 'in' WhiteSpaceAndTab 'range' WhiteSpaceAndTab?'('Num','Num'):';

//modified
whileStatement: WhiteSpaceAndTab judgement (WhiteSpaceAndTab( 'and'|'or') WhiteSpaceAndTab judgement)* WhiteSpaceAndTab? ':'
| '('judgement'):'
| WhiteSpaceAndTab Bool':';
//whileStatement: WhiteSpaceAndTab judgement (WhiteSpaceAndTab( 'and'|'or') WhiteSpaceAndTab judgement)* WhiteSpaceAndTab? ':'
//| '('judgement')';

ifStatement: WhiteSpaceAndTab judgement (WhiteSpaceAndTab( 'and'|'or') WhiteSpaceAndTab judgement)* WhiteSpaceAndTab? ':'
|WhiteSpaceAndTab Bool':'WhiteSpaceAndTab?;

ifBlockStatement:(WhiteSpaceAndTab NEWLINE)*WhiteSpaceAndTab ifBlockStatement_FirstLine NEWLINE?((WhiteSpaceAndTab NEWLINE)*WhiteSpaceAndTab  ifBlockStatement_NotfirstLine NEWLINE?)*;

//modified
ifBlockStatement_FirstLine: statement|ifStructureNestedSTF|whileStructure;
ifBlockStatement_NotfirstLine: statement|ifStructureNestedSTF|whileStructure;

ifStructureNestedSTF:
 'if' ifStatement NEWLINE
 {finalCheckPre();}
   (WhiteSpaceAndTab NEWLINE)*
       WhiteSpaceAndTab {judgementAfterIfFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
    (NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
       WhiteSpaceAndTab {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine
    )*
  (NEWLINE
  (WhiteSpaceAndTab NEWLINE)*
  WhiteSpaceAndTab{judgementAfterWhitespaceElseElifNestedSTF(_input.LT(-1).getText())}? 'elif' ifStatement NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
    WhiteSpaceAndTab {judgementAfterIfFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
    (NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
     WhiteSpaceAndTab  {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine)*
    )*
  (NEWLINE
  (WhiteSpaceAndTab NEWLINE)*
 WhiteSpaceAndTab{judgementAfterWhitespaceElseElifNestedSTF(_input.LT(-1).getText())}?'else' WhiteSpaceAndTab?':'NEWLINE
    (WhiteSpaceAndTab NEWLINE)*
     WhiteSpaceAndTab {judgementAfterIfFirst(_input.LT(-1).getText())}? ifBlockStatement_FirstLine
     (NEWLINE
     (WhiteSpaceAndTab NEWLINE)*
     WhiteSpaceAndTab  {judgementAfterIfNotFirst(_input.LT(-1).getText())}? ifBlockStatement_NotfirstLine)*
  )?
  {finalCheck();}
  ;




judgement:
   (Var|Num) WhiteSpaceAndTab? ('<'|'<='|'>'|'>='|'=='|'!=')WhiteSpaceAndTab? (Var|Num)
 | '(' WhiteSpaceAndTab? 'not' WhiteSpaceAndTab Var WhiteSpaceAndTab?')'
 ;

WhiteSpaceAndTab :[ \t]+;
NEWLINE : [\r\n]+;

List: '[' WhiteSpaceAndTab? ( WhiteSpaceAndTab? (Str|Bool|Num|Var)   (WhiteSpaceAndTab? ',' WhiteSpaceAndTab? (Str|Bool|Num|Var) WhiteSpaceAndTab?)* ) ? ']' ;
Bool:'True'|'False';
//Str:'\''[a-zA-Z_0-9 .]*'\'' | '"'[a-zA-Z_0-9 .]* '"';
Str:'\''(~('\''))*'\'' | '"'(~('"'))*'"';
Var:[a-zA-Z_][a-zA-Z_0-9]*;
Num:'-'?[0-9]+ ('.' [0-9]+)?;
CommentSignal:'\'\'\'';
//CommentStr:(~('@'))*;

Comment1:CommentSignal ((~('\''))|((~('\''))'\'')|('\''(~('\''))))*CommentSignal;
Comment2:'#'(~[\r\n])*;

//(loc=没有;;-1(su;es))
//'-'
//(p=tbc)th=ba(m)
//___totest(stf)
