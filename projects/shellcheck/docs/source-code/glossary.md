# Glossary

## Domain words
- GCC: GNU Compiler Collection

## Data Types

### shellcheck
- Flag
- Options
- Status: Used to obtain the exit status code. One of NoProblems, SomeProblems, SupportFailure, SyntaxFailure and RuntimeException. 

### ShellCheck/Parser
- Context
- HereDocContext
- Note
- ParseNote
- SystemState
- UserState

### ShellCheck/AnalyzerLib
- DataSource: It can be one of from (list of tokens), external, declaration, integer
- DataType
- Parameters
- Scope
- StackData
- VariableState

### ShellCheck/Checks/Commands
- CommandCheck: Function that accepts a CommandName and returns a function that transforms Token to Analysis
- CommandName: Can be either a Exactly string or a Basename string

### ShellCheck/Formatter/Format
- Formatter: "formatter that carries along an arbitrary piece of data". header, footer, onResult, onFailure

### ShellCheck/AST
- Annotation: Can be one of DisableComment, SourceOverride and ShellOverride
- AssignmentMode: Can be either append or assign
- CaseType: Can be break, fallthrough or continue
- ConditionType
- Dashed: Can be dashed or undashed
- FunctionKeyword
- FunctionParentheses: A boolean
- Id: An integer
- Quoted: Can be quoted or unquoted
- Token: A large number (~100) of token types which differ in the properties they require. Examples are: (T_Elif Id), (T_DollarBracket Id Token), ...

### ShellCheck/Interface
- AnalysisResult: Contains an array of token comments
- AnalysisSpec: Contains the script (a token), the shell type and the execution mode
- CheckResult: It has a comment (possitioned comment) and the filename
- CheckSpec: Contains the filename, the script, the excluded warnings and a shell type override
- ColorOption: auto, always, never
- Comment
- ExecutionMode: It can be executed or sourced
- FormatterOptions
- ParseResult
- ParseSpec: "Parser input and output". Contains the filename and script strings
- Position
- PositionedComment
- Severity: error, warning, info, style
- Shell: One of Ksh, Sh, Bash, Dash
- SystemInterface: Contains a siReadFile function which either returns an error or the file content string
- TokenComment

## Data.hs constants

- arrayVariables
- commonCommands: shell commands like `cp` of `ls`
- internalVariables: common environment variables like `HOME` or `PATH` 
- sampleWords: dummy words like `alpha` or `tango`
- shellForExecutable: function that returns a Shell value like Sh or Bash
- shellcheckVersion
- variablesWithoutSpaces
