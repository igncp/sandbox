# Files Structure

## root
### root dirs
Tree

```
.
├── doc: images of terminals
├── ShellCheck
│   ├── Checks
│   └── Formatter
└── test

```
Files
```
16 ShellCheck
3 doc
1 test
```
Lines
```
8114 ShellCheck
101 doc
22 test
```
### root files
Files
```
.ghci
.gitignore
LICENSE
quickrun: runs shellcheck without compiling it
quicktest
README.md
Setup.hs
shellcheck.1.md: Manual page
ShellCheck.cabal: Cabal file specifying version, dependencies, modules, etc.
shellcheck.hs: entry point
stack.yaml
```
Lines
```
  674 LICENSE

  314 README.md
  309 shellcheck.hs

  194 shellcheck.1.md

  96 ShellCheck.cabal

  36 Setup.hs
   35 stack.yaml
   21 quicktest
   15 .gitignore
    5 quickrun
    1 .ghci
```
Extensions (all)
```
19 hs
 3 png
 2 md
 1 yaml
 1 quicktest
 1 quickrun
 1 LICENSE
 1 ghci
 1 cabal
```

## /ShellCheck
### /ShellCheck files
Tree
```
ShellCheck
├── Analytics.hs
├── Analyzer.hs
├── AnalyzerLib.hs
├── AST.hs
├── ASTLib.hs
├── Checker.hs
├── Checks
│   └── Commands.hs: Some checks related to commands (e.g. `echo` or `find`)
├── Data.hs: Constants values like shellcheckVersion, keywords, etc
├── Formatter
│   ├── CheckStyle.hs
│   ├── Format.hs
│   ├── GCC.hs
│   ├── JSON.hs
│   └── TTY.hs
├── Interface.hs
├── Parser.hs
└── Regex.hs
```
Lines
```
  2794 Analytics.hs
  2669 Parser.hs

   632 AnalyzerLib.hs
   560 Checks/Commands.hs
   372 AST.hs
   253 ASTLib.hs

   162 Checker.hs
   116 Interface.hs
    94 Data.hs
    91 Formatter/TTY.hs
    82 Formatter/CheckStyle.hs
    80 Regex.hs

    61 Formatter/Format.hs
    58 Formatter/JSON.hs
    54 Formatter/GCC.hs

    36 Analyzer.hs
```
