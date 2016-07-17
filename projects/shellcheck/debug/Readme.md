# Debug

Run: `stack ghci`

Then, inside of `ghci`:

```
:set args -V
:break 142
main
:list
:help
:step
```

Flows: [link](./flows.md)

## Cases

- `:set args -V`
- `:set args /home/vagrant/fixtures/dummy.sh`

## AutoKey bindings

### Control + Alt + Shift + o

```
:step
<ctrl>+l :list

```

### Control + Alt + Shift + i

```
:list

```

### Control + Alt + Shift + p

```
:show bindings

```