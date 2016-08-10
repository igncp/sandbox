# Exports

## Exports by file

### api/autorun.ts
```ts
function autorunAsync(arg1: any, arg2: any, arg3?: any, arg4?: any)
function autorunAsync(func: Lambda, delay?: number, scope?: any)
function autorunAsync(name: string, func: Lambda, delay?: number, scope?: any)
function autorunUntil(predicate: () => boolean, effect: Lambda, scope?: any)
function autorun(arg1: any, arg2: any, arg3?: any)
function autorun(name: string, view: Lambda, scope?: any)
function autorun(view: Lambda, scope?: any)
function reaction<T>(arg1: any, arg2: any, arg3: any, arg4?: any, arg5?: any, arg6?: any)
function reaction<T>(expression: () => T, effect: (arg: T) => void, fireImmediately?: boolean, delay?: number, scope?: any)
function reaction<T>(name: string, expression: () => T, effect: (arg: T) => void, fireImmediately?: boolean, delay?: number, scope?: any)
function when(arg1: any, arg2: any, arg3?: any, arg4?: any)
function when(name: string, predicate: () => boolean, effect: Lambda, scope?: any)
function when(predicate: () => boolean, effect: Lambda, scope?: any)
```

### api/computeddecorator.ts
```ts
function computed(opts: IComputedValueOptions): (target: Object, key: string, baseDescriptor?: PropertyDescriptor) => void
function computed(targetOrExpr: any, keyOrScope?: any, baseDescriptor?: PropertyDescriptor, options?: IComputedValueOptions)
function computed(target: Object, key: string | symbol, baseDescriptor?: PropertyDescriptor): void
function computed<T>(func: () => T, scope?: any): IComputedValue<T>
function throwingComputedValueSetter()
interface IComputedValueOptions
```

### api/createtransformer.ts
```ts
function createTransformer<A, B>(transformer: ITransformer<A, B>, onCleanup?: (resultObject: B, sourceObject?: A) => void): ITransformer<A, B>
type ITransformer<A, B> = (object: A) => B
```

### api/expr.ts
```ts
function expr<T>(expr: () => T, scope?): T
```

### api/extendobservable.ts
```ts
function extendObservableHelper(target, properties, mode: ValueMode, name: string): Object
function extendObservable<A extends Object, B extends Object>(target: A, ...properties: B[]): A & B
```

### api/extras.ts
```ts
function getDependencyTree(thing: any, property?: string): IDependencyTree
function getObserverTree(thing: any, property?: string): IObserverTree
interface IDependencyTree
interface IObserverTree
```

### api/intercept.ts
```ts
function intercept(object: Object, handler: IInterceptor<IObjectWillChange>): Lambda
function intercept(object: Object, property: string, handler: IInterceptor<IValueWillChange<any>>): Lambda
function intercept(thing, propOrHandler?, handler?): Lambda
function intercept<T>(observableArray: IObservableArray<T>, handler: IInterceptor<IArrayWillChange<T> | IArrayWillSplice<T>>): Lambda
function intercept<T>(observableMap: ObservableMap<T>, handler: IInterceptor<IMapWillChange<T>>): Lambda
function intercept<T>(observableMap: ObservableMap<T>, property: string, handler: IInterceptor<IValueWillChange<T>>): Lambda
function intercept<T>(value: IObservableValue<T>, handler: IInterceptor<IValueWillChange<T>>): Lambda
```

### api/isobservable.ts
```ts
function isObservable(value, property?: string): boolean
```

### api/observable.ts
```ts
enum ValueType { Reference, PlainObject, ComplexObject, Array, ViewFunction, ComplexFunction }
function getTypeOfValue(value): ValueType
function observable(target: Object, key: string, baseDescriptor?: PropertyDescriptor): any
function observable(v: any = undefined, keyOrScope?: string | any)
function observable<T extends Object>(value: T): T
function observable<T extends string|number|boolean|Date|RegExp|Function|void>(value: T): IObservableValue<T>
function observable<T, S extends Object>(value: () => T, thisArg?: S): IObservableValue<T>
function observable<T>(value: T[]): IObservableArray<T>
function observable<T>(): IObservableValue<T>
```

### api/observabledecorator.ts
```ts
function observableDecorator(target: Object, key: string, baseDescriptor: PropertyDescriptor)
```

### api/observe.ts
```ts
function observe(object: Object, listener: (change: IObjectChange) => void, fireImmediately?: boolean): Lambda
function observe(object: Object, property: string, listener: (newValue: any, oldValue: any) => void, fireImmediately?: boolean): Lambda
function observe(thing, propOrCb?, cbOrFire?, fireImmediately?): Lambda
function observe<T>(observableArray: IObservableArray<T>, listener: (change: IArrayChange<T> | IArraySplice<T>) => void, fireImmediately?: boolean): Lambda
function observe<T>(observableMap: ObservableMap<T>, listener: (change: IMapChange<T>) => void, fireImmediately?: boolean): Lambda
function observe<T>(observableMap: ObservableMap<T>, property: string, listener: (newValue: T, oldValue: T) => void, fireImmediately?: boolean): Lambda
function observe<T>(value: IObservableValue<T> | IComputedValue<T>, listener: (newValue: T, oldValue: T) => void, fireImmediately?: boolean): Lambda
```

### api/tojs.ts
```ts
function toJSON(source, detectCycles: boolean = true, __alreadySeen: [any, any][] = null)
function toJS(source, detectCycles: boolean = true, __alreadySeen: [any, any][] = null)
```

### api/whyrun.ts
```ts
function whyRun(thing?: any, prop?: string)
```

### core/action.ts
```ts
function actionImplementation(actionName: string, fn: Function): Function
function action(arg1, arg2?, arg3?, arg4?): any
function action(customName: string): (target: Object, key: string, baseDescriptor?: PropertyDescriptor) => void
function action(target: Object, propertyKey: string, descriptor?: PropertyDescriptor): void
function action<T extends Function>(fn: T): T
function action<T extends Function>(name: string, fn: T): T
function allowStateChangesEnd(prev: boolean)
function allowStateChangesStart(allowStateChanges: boolean)
function allowStateChanges<T>(allowStateChanges: boolean, func: () => T): T
function isAction(thing: any)
function runInAction<T>(arg1, arg2?, arg3?)
function runInAction<T>(block: () => T, scope?: any)
function runInAction<T>(name: string, block: () => T, scope?: any)
function useStrict(strict: boolean)
```

### core/atom.ts
```ts
class Atom implements IAtom
function propagateAtomReady(atom: IAtom)
interface IAtom extends IObservable
```

### core/computedvalue.ts
```ts
class ComputedValue<T> implements IObservable, IComputedValue<T>, IDerivation
const runReasonTexts =
enum RunReason { PEEK, INVALIDATED, REQUIRED, NOT_RUNNING }
interface IComputedValue<T>
```

### core/derivation.ts
```ts
function checkIfStateModificationsAreAllowed()
function isComputingDerivation()
function notifyDependencyReady(derivation: IDerivation, dependencyDidChange: boolean)
function notifyDependencyStale(derivation: IDerivation)
function trackDerivedFunction<T>(derivation: IDerivation, f: () => T)
function untrackedEnd(prev: boolean)
function untrackedStart()
function untracked<T>(action: () => T): T
interface IDerivation extends IDepTreeNode, IObservable
```

### core/globalstate.ts
```ts
class MobXGlobals
const globalState: MobXGlobals = (() =>
function registerGlobals()
function resetGlobalState()
```

### core/observable.ts
```ts
function addObserver(observable: IObservable, node: IDerivation)
function propagateReadiness(observable: IObservable|IDerivation, valueDidActuallyChange: boolean)
function propagateStaleness(observable: IObservable|IDerivation)
function removeObserver(observable: IObservable, node: IDerivation)
function reportObserved(observable: IObservable)
interface IDepTreeNode
interface IObservable extends IDepTreeNode
```

### core/reaction.ts
```ts
class Reaction implements IDerivation
function runReactions()
```

### core/spy.ts
```ts
function isSpyEnabled()
function spyReportEnd(change?)
function spyReportStart(event)
function spyReport(event)
function spy(listener: (change: any) => void): Lambda
function trackTransitions(onReport?: (c: any) => void): Lambda
```

### core/transaction.ts
```ts
function transactionEnd<T>(report = true)
function transactionStart<T>(name: string, thisArg = undefined, report = true)
function transaction<T>(action: () => T, thisArg = undefined, report = true): T
```

### mobx.ts
```ts
const extras =
const _ =
{ IAtom, Atom } from "./core/atom"
{ IComputedValue } from "./core/computedvalue"
{ IDerivation, untracked } from "./core/derivation"
{ IInterceptable, IInterceptor } from "./types/intercept-utils"
{ IKeyValueMap, ObservableMap, IMapEntries, IMapEntry, IMapWillChange, IMapChange, isObservableMap, map } from "./types/observablemap"
{ IListenable } from "./types/listen-utils"
{ IObjectWillChange, IObjectChange, isObservableObject } from "./types/observableobject"
{ IObservableArray, IArrayWillChange, IArrayWillSplice, IArrayChange, IArraySplice, isObservableArray, fastArray } from "./types/observablearray"
{ IObservable, IDepTreeNode } from "./core/observable"
{ IObserverTree, IDependencyTree } from "./api/extras"
{ ITransformer, createTransformer } from "./api/createtransformer"
{ Iterator } from "./utils/iterable"
{ Lambda } from "./utils/utils"
{ Reaction } from "./core/reaction"
{ SimpleEventEmitter, ISimpleEventListener } from "./utils/simpleeventemitter"
{ action, useStrict, isAction, runInAction } from "./core/action"
{ asReference, asFlat, asStructure, asMap } from "./types/modifiers"
{ autorun, autorunAsync, autorunUntil, when, reaction } from "./api/autorun"
{ computed, IComputedValueOptions } from "./api/computeddecorator"
{ expr } from "./api/expr"
{ extendObservable } from "./api/extendobservable"
{ intercept } from "./api/intercept"
{ isObservable } from "./api/isobservable"
{ observable } from "./api/observable"
{ observe } from "./api/observe"
{ spy } from "./core/spy"
{ toJSON, toJS } from "./api/tojs"
{ transaction } from "./core/transaction"
{ whyRun } from "./api/whyrun"
{ /* 3.0: IValueDidChange, */ IValueWillChange, IObservableValue } from "./types/observablevalue"
```

### types/intercept-utils.ts
```ts
function hasInterceptors(interceptable: IInterceptable<any>)
function interceptChange<T>(interceptable: IInterceptable<T>, change: T): T
function registerInterceptor<T>(interceptable: IInterceptable<T>, handler: IInterceptor<T>): Lambda
interface IInterceptable<T>
type IInterceptor<T> = (change: T) => T
```

### types/listen-utils.ts
```ts
function hasListeners(listenable: IListenable)
function notifyListeners<T>(listenable: IListenable, change: T | T[])
function registerListener<T>(listenable: IListenable, handler: Function): Lambda
interface IListenable
```

### types/modifiers.ts
```ts
class AsFlat
class AsReference
class AsStructure
enum ValueMode
function asFlat<T>(value: T): T
function asMap(data?, modifierFunc?): ObservableMap<any>
function asMap<T>(data: IKeyValueMap<T>, modifierFunc?: Function): ObservableMap<T>
function asMap<T>(entries: IMapEntries<T>, modifierFunc?: Function): ObservableMap<T>
function asMap<T>(): ObservableMap<T>
function asReference<T>(value: T): T
function asStructure<T>(value: T): T
function assertUnwrapped(value, message)
function getValueModeFromModifierFunc(func?: Function): ValueMode
function getValueModeFromValue(value: any, defaultMode: ValueMode): [ValueMode, any]
function makeChildObservable(value, parentMode: ValueMode, name?: string)
```

### types/observablearray.ts
```ts
class ObservableArray<T> extends StubArray
class StubArray
function createObservableArray<T>(initialValues: T[], mode: ValueMode, name: string): IObservableArray<T>
function fastArray<V>(initialValues?: V[]): IObservableArray<V>
function isObservableArray(thing): boolean
interface IArrayChange<T>
interface IArraySplice<T>
interface IArrayWillChange<T>
interface IArrayWillSplice<T>
interface IObservableArray<T> extends Array<T>
```

### types/observablemap.ts
```ts
class ObservableMap<V> implements IInterceptable<IMapWillChange<V>>, IListenable
function isObservableMap(thing): boolean
function map<V>(initialValues?: IMapEntries<V> | IKeyValueMap<V>, valueModifier?: Function): ObservableMap<V>
interface IKeyValueMap<V>
interface IMapChange<T>
interface IMapWillChange<T>
type IMapEntries<V> = IMapEntry<V>[]
type IMapEntry<V> = [string, V]
```

### types/observableobject.ts
```ts
class ObservableObjectAdministration implements IInterceptable<IObjectWillChange>, IListenable
function asObservableObject(target, name: string, mode: ValueMode = ValueMode.Recursive): ObservableObjectAdministration
function defineObservableProperty(adm: ObservableObjectAdministration, propName: string, newValue, asInstanceProperty: boolean)
function generateComputedPropConfig(propName)
function generateObservablePropConfig(propName)
function isObservableObject(thing): boolean
function setObservableObjectInstanceProperty(adm: ObservableObjectAdministration, propName: string, value)
function setPropertyValue(instance, name: string, newValue)
interface IIsObservableObject
interface IObjectChange
interface IObjectWillChange
```

### types/observablevalue.ts
```ts
class ObservableValue<T> extends Atom implements IObservableValue<T>, IInterceptable<IValueWillChange<T>>, IListenable
const UNCHANGED: IUNCHANGED = {}
interface IObservableValue<T>
interface IValueWillChange<T>
type IUNCHANGED = {}
```

### types/type-utils.ts
```ts
function getAdministration(thing: any, property?: string)
function getAtom(thing: any, property?: string): IDepTreeNode
function getDebugName(thing: any, property?: string): string
```

### utils/decorators.ts
```ts
function createClassPropertyDecorator(
function runLazyInitializers(instance)
```

### utils/iterable.ts
```ts
const IS_ITERATING_MARKER = "__$$iterating"
function arrayAsIterator<T>(array: T[]): T[] & Iterator<T>
function declareIterator<T>(prototType, iteratorFactory: () => Iterator<T>)
interface Iterator<T>
```

### utils/simpleeventemitter.ts
```ts
class SimpleEventEmitter
type ISimpleEventListener = {(...data: any[]): void}
```

### utils/utils.ts
```ts
const EMPTY_ARRAY = []
const noop = () => {}
function addHiddenFinalProp(object: any, propName: string, value: any)
function assertPropertyConfigurable(object: any, prop: string)
function deepEquals(a, b)
function deprecated(msg: string)
function getEnumerableKeys(obj)
function getNextId()
function invariant(check: boolean, message: string, thing?)
function isPlainObject(value)
function isPropertyConfigurable(object: any, prop: string): boolean
function joinStrings(things: string[], limit: number = 100, separator = " - "): string
function makeNonEnumerable(object: any, props: string[])
function objectAssign()
function objectAssign(...objs: Object[]): Object
function once(func: Lambda): Lambda
function quickDiff<T>(current: T[], base: T[]): [T[], T[]]
function unique<T>(list: T[]): T[]
function valueDidChange(compareStructural: boolean, oldValue, newValue): boolean
interface Lambda
```
