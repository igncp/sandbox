# Types

## Exports by file
### observablemap.ts
```ts
class ObservableMap<V> implements IInterceptable<IMapWillChange<V>>, IListenable
function isObservableMap(thing): boolean
function map<V>(initialValues?: IMapEntries<V> | IKeyValueMap<V>, valueModifier?: Function): ObservableMap<V>
interface IKeyValueMap<V>
interface IMapChange<T>
interface IMapWillChange<T>
type IMapEntries<V> = IMapEntry<V>[];
type IMapEntry<V> = [string, V];
```

### observablevalue.ts
```ts
class ObservableValue<T> extends Atom implements IObservableValue<T>, IInterceptable<IValueWillChange<T>>, IListenable
const UNCHANGED: IUNCHANGED = {};
interface IObservableValue<T>
interface IValueWillChange<T>
type IUNCHANGED = {};
```

### intercept-utils.ts
```ts
function hasInterceptors(interceptable: IInterceptable<any>)
function interceptChange<T>(interceptable: IInterceptable<T>, change: T): T
function registerInterceptor<T>(interceptable: IInterceptable<T>, handler: IInterceptor<T>): Lambda
interface IInterceptable<T>
type IInterceptor<T> = (change: T) => T;
```

### observableobject.ts
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

### listen-utils.ts
```ts
function hasListeners(listenable: IListenable)
function notifyListeners<T>(listenable: IListenable, change: T | T[])
function registerListener<T>(listenable: IListenable, handler: Function): Lambda
interface IListenable
```

### modifiers.ts
```ts
class AsFlat
class AsReference
class AsStructure
enum ValueMode
function asFlat<T>(value: T): T
function asMap(data?, modifierFunc?): ObservableMap<any>
function asMap<T>(): ObservableMap<T>;
function asMap<T>(data: IKeyValueMap<T>, modifierFunc?: Function): ObservableMap<T>;
function asMap<T>(entries: IMapEntries<T>, modifierFunc?: Function): ObservableMap<T>;
function asReference<T>(value: T): T
function asStructure<T>(value: T): T
function assertUnwrapped(value, message)
function getValueModeFromModifierFunc(func?: Function): ValueMode
function getValueModeFromValue(value: any, defaultMode: ValueMode): [ValueMode, any]
function makeChildObservable(value, parentMode: ValueMode, name?: string)
```

### observablearray.ts
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

### type-utils.ts
```ts
function getAdministration(thing: any, property?: string)
function getAtom(thing: any, property?: string): IDepTreeNode
function getDebugName(thing: any, property?: string): string
```
