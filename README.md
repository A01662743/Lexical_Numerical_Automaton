# E1 Implementation of Lexical Analysis

## Description
In the field of computational methods, the ability to analyze and comprehend formal languages is a foundational skill. This project focuses on the development of a lexical analysis parser designed to recognize a specific language based on the digits 0, 1, and 2. The language must adhere to strict constraints by prohibiting specific sequences: **'1101'**, **'1122'**, **'1011'**, and **'1012'**.

To solve this, we utilize a **Deterministic Finite Automaton (DFA)**, a mathematical model consisting of:
1. **Q**: A finite set of states (in this case: s, a, b, c, d, e, f, g, h, i, j).
2. **Σ**: The alphabet {0, 1, 2}.
3. **δ**: The transition function defining movement between states.
4. **q0**: The start state (**s**).
5. **F**: A set of accepting states (s, a, b, c, d, e, f, g).

The implementation is carried out in **Prolog**, evaluating whether an input string is accepted or rejected based on the transition logic and final state criteria.

## Models

### DFA
The DFA was constructed by identifying the smallest subexpressions for each prohibited sequence and then integrating them into a complete model that captures the full language logic.

* **Start State:** The process begins at state **s**.
* **Transitions:** The automaton moves through states based on the input digits. For example, from the start state `s`, an input of `1` leads to state `a`, while `0` or `2` lead to state `b`.
* **Prohibited States:** States **h**, **i**, and **j** act as non-accepting "trap" states. Once the automaton enters these states due to a prohibited sequence (like '1101' leading to 'i'), it remains there, resulting in a rejection of the string.

The diagram built from the smallest subexpressions, in this case taking as references the constraints, is teh following:

<img width="1004" height="464" alt="image" src="https://github.com/user-attachments/assets/6651af6d-8636-4b8f-aa0f-ad3ebbb40ff7" />

Considering a larger subexpressions for possible combinations results in our final automaton shown in the diagram below:

<img width="1115" height="586" alt="image" src="https://github.com/user-attachments/assets/f90aa3df-5c09-48ea-8b41-7483c8c36034" />

### Regular Expression

The following regular expression defines the language by allowing any combination of the digits 0, 1, and 2 while strictly excluding the prohibited sequences:

(?!.*1101|.*1122|.*1011|.*1012)[012]+

Breakdown:

(?!.*1101|.*1122|.*1011|.*1012): A negative lookahead assertion that ensures the string does not contain '1101', '1122', '1011', or '1012' at any position.

[012]+: Matches any sequence composed of the characters '0', '1', and '2', requiring at least one digit to be present.

This expression effectively filters the alphabet to ensure that if any of the forbidden patterns are detected, the match fails immediately.

Following the principles outlined by **Michael Fitzgerald in "Introducing Regular Expressions"**, this implementation utilizes **Zero-Width Assertions** (specifically negative lookaheads) to enforce constraints without consuming characters, allowing for a more compact and readable pattern compared to traditional concatenation-based expressions.

### Efficiency Analysis

1. **Determinism and Performance**: 
   The **DFA** is more robust for processing large-scale data streams. Each input from the list in Prolog triggers a transition to a predefined state, ensuring a predictable response time.

2. **Design Flexibility**: 
   The **Regular Expression** `(?!.*1101|.*1122|.*1011|.*1012)[012]+` is ideal for quick validations and code readability. However, the DFA allows for a better analisis like at which point in the sequence the language rule was violated (for example, upon entering trap states `h`, `i`, or `j`).

3. **Analysis Conclusion**: 
   Given the simplicity of the four constraints, the **Regex** is the most optimal solution for rapid implementation. However the **DFA** (or an automaton) would be the only viable option to maintain the system's logic.

## Implementation
The lexical analysis parser is implemented in Prolog. The transition logic and state definitions are contained in the `automata.pl` file.

**Initiate Prolog:**
```bash
swipl
```

**Load file:**
```prolog
?- ["automata.pl"].
true.
```

**Execute Function:**
```prolog
?- parse_list([0,1,2]).
```
The program will output the list and its status, such as `[0,1,2]: Accepted`.

## Tests
The file `pruebas.pl` contains 46 test cases to verify the automaton's accuracy.

**Load test file:**
```prolog
?- ["pruebas.pl"].
true.
```

**Execute All Tests:**
```prolog
?- run_tests.
```

The output will display a categorized list of **Accepted States** (e.g., `[1,1,2]`, `[2,1,2]`) and **Denied States** (e.g., `[1,1,0,1]`, `[1,0,1,1]`).

### Automated Test Report

| Category | Description | Status |
| :--- | :--- | :--- |
| **Empty String** | Evaluates the start state `s` as an accepting state. | **Passed** |
| **Valid Sequences** | Tests strings like `[0,1,2]`, `[1,1,2]`, and `[2,1,0]` that do not trigger trap states. | **Passed** |
| **Prohibited Sequences** | Validates that `[1,1,0,1]`, `[1,1,2,2]`, `[1,0,1,1]`, and `[1,0,1,2]` are rejected. | **Passed** |
| **Complex Combinations** | Evaluates longer strings containing valid patterns followed by valid exits. | **Passed** |

## Analysis

### DFA Complexity
The time complexity of the `parse_list` predicate is analyzed as follows:
* **Initialization:** Constant time **O(1)**.
* **Base Cases:** Checking if an empty list ends in a final state is **O(1)**.
* **Recursive Case:** For each element in an input list of length $n$, the system performs a transition lookup. Since each lookup is **O(1)** and is performed $n$ times, the overall time complexity is **O(n)**.

## References

Fitzgerald, M. (2012). Introducing regular expressions: Unraveling Regular Expressions, Step-by-Step. «O’Reilly Media, Inc.»
