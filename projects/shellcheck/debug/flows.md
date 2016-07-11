# Version Flow

## quickrun -V
```
shellcheck.hs:140 ++ main
shellcheck.hs:141 -- ["-V"]
shellcheck.hs:142 -- []
shellcheck.hs:133 ** getEnvArgs
shellcheck.hs:143 -- ["-V"]
shellcheck.hs:143 -- ["-V"]
shellcheck.hs:94 ** parseArguments
shellcheck.hs:96 -- ([Flag "version" "true"], [])
shellcheck.hs:145 -- ([Flag "version" "true"], [])
shellcheck.hs:158 ** process
shellcheck.hs:213 ** parseOption
shellcheck.hs:144 -- NoProblems
shellcheck.hs:150 ** statusToCode
shellcheck.hs:147 -- ...

++ Type
-- Value
** Entering function
```

## quickrun /home/vagrant/fixtures/dummy.sh

(Just summary and displaying top function names without stack and data types functions)

```
shellcheck.hs:140 main
shellcheck.hs:133 getEnvArgs
shellcheck.hs:94 parseArguments
ShellCheck/Regex.hs:77 splitOn
ShellCheck/Regex.hs:32 mkRegex
shellcheck.hs:158 process
shellcheck.hs:299 verifyFiles
shellcheck.hs:109 getOption
shellcheck.hs:102 formats
ShellCheck/Formatter/TTY.hs:31 format
shellcheck.hs:261 ioInterface
shellcheck.hs:177 runFormatter
shellcheck.hs:290 inputFile
ShellCheck/Checker.hs:47 checkScript
... entering the parser. A lot of repeated functions
...   Specially about: context
ShellCheck/Parser.hs:2660 parseScript
ShellCheck/Parser.hs:2609 parseShell
ShellCheck/Parser.hs:2601 runParser
ShellCheck/Parser.hs:2569 parseWithNotes
ShellCheck/Parser.hs:2485 readScript
ShellCheck/Parser.hs:184 getNextId
ShellCheck/Parser.hs:173 getNextIdAt
ShellCheck/Parser.hs:397 called
ShellCheck/Parser.hs:387 withContext
ShellCheck/Parser.hs:319 pushContext
ShellCheck/Parser.hs:307 getCurrentContexts
ShellCheck/Parser.hs:306 setCurrentContexts
ShellCheck/Parser.hs:309 popContext
ShellCheck/Parser.hs:2442 readShebang
ShellCheck/Parser.hs:873 readAnnotations
ShellCheck/Parser.hs:341 thenSkip
ShellCheck/Parser.hs:401 withAnnotations
ShellCheck/Parser.hs:2202 readCompoundListOrEmpty
ShellCheck/Parser.hs:96 allspacing
ShellCheck/Parser.hs:83 spacing
ShellCheck/Parser.hs:73 linewhitespace
ShellCheck/Parser.hs:334 parseNote
ShellCheck/Parser.hs:338 parseNoteAt
ShellCheck/Parser.hs:251 shouldIgnoreCode
ShellCheck/Parser.hs:877 readComment
ShellCheck/Parser.hs:346 unexpecting
ShellCheck/Parser.hs:830 readAnnotationPrefix
ShellCheck/Parser.hs:56 linefeed
ShellCheck/Parser.hs:121 carriageReturn
ShellCheck/Parser.hs:1779 readTerm
ShellCheck/Parser.hs:1757 readAndOr
ShellCheck/Parser.hs:1745 readPipeline
ShellCheck/Parser.hs:2361 tryParseWordToken
ShellCheck/Parser.hs:2378 anycaseString
...
ShellCheck/Formatter/TTY.hs:52 outputResult
ShellCheck/Formatter/TTY.hs:78 getColorFunc
ShellCheck/Analyzer.hs:31 analyzeScript
ShellCheck/Analyzer.hs:613 filterByAnnotation
ShellCheck/Analytics.hs:91 runAnalytics
ShellCheck/Analytics.hs:96 runList
ShellCheck/Analytics.hs:107 runNodeAnalysis
ShellCheck/AST.hs:369 doAnalysis
ShellCheck/AST.hs:149 analyze
ShellCheck/Analytics.hs:358 checkUuoc
ShellCheck/Parser.hs:2638 reattachHereDocs
ShellCheck/AST.hs:371 doTransform
ShellCheck/Analytics.hs:372 checkPipePitfalls
ShellCheck/Analytics.hs:671 checkForInQuoted
ShellCheck/Analytics.hs:703 checkForInLs
ShellCheck/Analytics.hs:837 checkShorthandIf
ShellCheck/Analytics.hs:851 checkDollarStar
ShellCheck/Analytics.hs:871 checkUnquotedDollarAt
ShellCheck/Analytics.hs:983 checkStderrRedirect
...
```