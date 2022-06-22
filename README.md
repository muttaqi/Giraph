# Proposed Grammar

`NODE`:
```
TYPE NAME (ARGS) {FIELDS}
	EDGES |
NAME
	EDGES
```

`STATE`:
```
state NAME (ARGS) {FIELDS}
	CONDITIONAL_EDGES |
NAME
	EDGES
```

`EDGES`:
```
=> NODE
	EDGES
```

`CONDITIONAL_EDGES`:
```
=COND=> NODE
	CONDITIONAL_EDGES |
-> PRIMITIVE
```

`DEFINITION`:
```
class NAME (ARG_DEFINITIONS) {FIELDS}
	EDGES
```

`ARGS`:
```
NAME: PRIMITIVE | NAME: PRIMITIVE, ARGS
```

`ARG_DEFINITIONS`:
```
TYPE NAME | TYPE NAME, ARG_DEFINITIONS
```

`FIELDS`:
```
FIELD | FIELD, FIELDS
```

`TYPE`:
```
node | NAME
```

`FIELD`:
```
TYPE NAME: PRIMITIVE
```

`PRIMITIVE`:
```
NAME.NAME | [number]
```

# Building

```
./scripts/build.sh
```
