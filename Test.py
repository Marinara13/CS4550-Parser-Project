import sys
from antlr4 import *
from miniPyLexer import miniPyLexer
from miniPyParser import miniPyParser

valid = [
    ["10+20*30", "a=b", "var+=5"],  # valid cases 1
]

invalid = [
    ["+1020", "5=", "=var", "var="],  # invalid cases 1
]

lexer_parser_map = {
    1: ("miniPyLexer", "miniPyParser")
}

passed = 0
failed = 0

def print_boxed_message(valid_cases, invalid_cases):
    # Prepare the message
    message = f"The valid and invalid cases are:\nValid: {valid_cases}\nInvalid: {invalid_cases}"

    # Determine the width of the box
    lines = message.split("\n")
    max_length = max(len(line) for line in lines)
    box_width = max_length + 4  # Adding padding on both sides

    # Print the top border
    print("+" + "-" * (box_width - 2) + "+")

    # Print the message with side borders
    for line in lines:
        print(f"| {line.ljust(max_length)} |")

    # Print the bottom border
    print("+" + "-" * (box_width - 2) + "+\n")

def test_cases(test_list, question_no, should_pass):
    global passed, failed
    q_pass = 0
    q_fail = 0
    lexer_class_name, parser_class_name = lexer_parser_map[question_no]
    LexerClass = eval(lexer_class_name)
    ParserClass = eval(parser_class_name)
    
    for test in test_list:
        stream = InputStream(test)
        lexer = LexerClass(stream)
        tokens = CommonTokenStream(lexer)
        parser = ParserClass(tokens)
        parser.start()
        
        # Check if the number of syntax errors matches the expected outcome
        if parser.getNumberOfSyntaxErrors() > 0:
            if should_pass:
                print(f"Valid fail: {test}")
                failed += 1
                q_fail += 1
            else:
                passed += 1
                q_pass += 1
        else:
            if should_pass:
                passed += 1
                q_pass += 1
            else:
                print(f"Invalid fail: {test}")
                failed += 1
                q_fail += 1
    
    # Results for each class
    if should_pass:
        print("\n" + "="*40)  # Add a separator line
        print(f"Results for Positive Test Cases")
        print(f"    Pass: {q_pass} | Fail: {q_fail} | Total: {len(test_list)}")
        print("="*40+"\n")
    else:
        print("\n" + "="*40)
        print(f"Results for Negative Test Cases")
        print(f"    Pass: {q_pass} | Fail: {q_fail} | Total: {len(test_list)}")
        print("="*40+"\n")

for q, cases in enumerate(valid):
    print("#"*60)
    question_no = q+1
    print(f"Question Number: {question_no}\n")
    valid_cases = cases
    invalid_cases = invalid[q]
    print_boxed_message(valid_cases, invalid_cases)
    # Test valid cases
    test_cases(valid_cases, question_no, should_pass=True)
    # Test invalid cases
    test_cases(invalid_cases, question_no, should_pass=False)
    
    print("#"*60 +"\n\n\n")

# Final result
print('Total Passed cases: ' + str(passed))
print('Total Failed cases: ' + str(failed))