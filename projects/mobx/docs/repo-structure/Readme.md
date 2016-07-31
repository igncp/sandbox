# Repo Structure

## General

Tree
```
├── bower.json
├── .build
│   └── mobx.ts
├── CHANGELOG.md
├── docs
│   ├── flow.png
│   └── mobx.png
├── .editorconfig
├── install.sh
├── lib
│   ├── mobx.d.ts
│   ├── mobx.js
│   ├── mobx.min.js
│   ├── mobx.min.js.map
│   ├── mobx.umd.js
│   ├── mobx.umd.min.js
│   └── mobx.umd.min.js.map
├── LICENSE
├── package.json
├── README.md
├── scripts
│   ├── publish.js
│   └── single-file-build.sh
├── src
│   ├── api
│   │   ├── autorun.ts
│   │   ├── computeddecorator.ts
│   │   ├── createtransformer.ts
│   │   ├── expr.ts
│   │   ├── extendobservable.ts
│   │   ├── extras.ts
│   │   ├── intercept.ts
│   │   ├── isobservable.ts
│   │   ├── observabledecorator.ts
│   │   ├── observable.ts
│   │   ├── observe.ts
│   │   ├── tojs.ts
│   │   └── whyrun.ts
│   ├── core
│   │   ├── action.ts
│   │   ├── atom.ts
│   │   ├── computedvalue.ts
│   │   ├── derivation.ts
│   │   ├── globalstate.ts
│   │   ├── observable.ts
│   │   ├── reaction.ts
│   │   ├── spy.ts
│   │   └── transaction.ts
│   ├── mobx.ts
│   ├── types
│   │   ├── intercept-utils.ts
│   │   ├── listen-utils.ts
│   │   ├── modifiers.ts
│   │   ├── observablearray.ts
│   │   ├── observablemap.ts
│   │   ├── observableobject.ts
│   │   ├── observablevalue.ts
│   │   └── type-utils.ts
│   └── utils
│       ├── decorators.ts
│       ├── iterable.ts
│       ├── simpleeventemitter.ts
│       └── utils.ts
├── test
│   ├── action.js
│   ├── api.js
│   ├── array.js
│   ├── autorunAsync.js
│   ├── babel
│   │   ├── .babelrc
│   │   └── babel-tests.js
│   ├── cycles.js
│   ├── errorhandling.js
│   ├── extras.js
│   ├── intercept.js
│   ├── makereactive.js
│   ├── map.js
│   ├── observables.js
│   ├── observe.js
│   ├── perf
│   │   ├── index.js
│   │   ├── perf.js
│   │   └── transform-perf.js
│   ├── reaction.js
│   ├── require.d.ts
│   ├── spy.js
│   ├── strict-mode.js
│   ├── tape.d.ts
│   ├── transform.js
│   ├── typescript-tests.ts
│   ├── untracked.js
│   ├── utils
│   │   └── transform.js
│   └── whyrun.js
├── .travis.yml
├── tsconfig.json
└── tslint.json
```

Files
```
35 src
27 test

7 lib
2 scripts
2 docs
1 .build
```

Lines
```
8722 test
5373 lib
3658 src
3528 .build

431 docs
74 scripts
```

Extensions
```
 40 ts
 28 js

  4 json
  2 sh
  2 png
  2 md
  2 map
  1 yml
  1 LICENSE
  1 gitignore
  1 editorconfig
  1 babelrc
```

## Src

Top dirs
```
src/
├── api
├── core
├── types
└── utils
```

### Core

Lines
```
196 computedvalue.ts
165 reaction.ts
143 action.ts
136 derivation.ts
109 globalstate.ts

 74 atom.ts
 55 observable.ts
 53 spy.ts
 39 transaction.ts
```
## Test

Lines
```
1605 observables.js
1005 transform.js

 921 typescript-tests.ts
 690 babel/babel-tests.js
 515 makereactive.js
 456 map.js
 377 perf/perf.js
 350 extras.js
 348 array.js
 327 errorhandling.js
 321 perf/transform-perf.js
 310 action.js
 200 tape.d.ts
 197 intercept.js
 190 cycles.js
 166 reaction.js
 135 strict-mode.js
 130 spy.js
 104 autorunAsync.js

  93 whyrun.js
  82 utils/transform.js
  76 api.js
  68 observe.js
  35 untracked.js
  12 require.d.ts

   8 babel/.babelrc
   1 perf/index.js
```
