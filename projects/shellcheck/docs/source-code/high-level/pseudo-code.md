# Pseudo Code

The aim of this document is to remove the implementation details and leave a summary of the code structure and important functions

## shellcheck
```hs
defaultOptions = Options ...

usageHeader = ...
options = ...

formats :: FormatterOptions -> Map.Map String (IO Formatter)
formats options = ...

main = do
    get and parse the arguments from command and from environment variables
    process the files using options (flags)
    exit with the final status code

process flags files = do
    transform flags into options and verify the files
    if something is wrong show the help
    get the format function via the final formatter
    read files with the correct system interface
    run the formatter with the format function over the files

runFormatter :: SystemInterface IO -> Formatter -> Options -> [FilePath]
            -> IO Status
runFormatter sys format options files = do
    run the checkScript with the format over the files

```

## ShellCheck/Checks/Commands.hs

```hs
-- This module contains checks that examine specific commands by name.
module Commands (runChecks, ShellCheck.Checks.Commands.runTests)

data CommandName = Exactly String | Basename String
    deriving (Eq, Ord)

data CommandCheck =
    CommandCheck CommandName (Token -> Analysis)

commandChecks :: [CommandCheck]
commandChecks = [ ... List of the checks ... ]

runChecks spec = runList spec commandChecks

-- single check structure:
prop_checkName1 = verify checkName "some shell script content"
prop_checkName2 = verifyNot checkName "another shell script content"
...
checkName = CommandCheck (Basename "check" | Exactly "check") (f . arguments)  where
  f definition ...

runTests ...
```