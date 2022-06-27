# Grammar

`STATE`:
```
state main() {FIELDS}
CONDITIONAL_EDGES |
() {FIELDS}
CONDITIONAL_EDGES
```

`CONDITIONAL_EDGES`:
```
=COND=> STATE
CONDITIONAL_EDGES |
-> TERM
CONDITIONAL_EDGES
```

`COND`:
```
TERM |
TERM = TERM |
TERM > TERM |
TERM >= TERM |
TERM < TERM |
TERM <= TERM |
TERM != TERM |
COND = COND |
COND | COND |
COND & COND |
COND ^ COND
```

`PRIMITIVE`:
```
NAME | [number]
```

`FIELDS`:
```
FIELD | FIELD, FIELDS
```

`FIELD`:
```
int NAME: TERM
```

`TERM`:
```
PRIMITIVE
```

# Proposed Grammar

`NODE`:
```
TYPE NAME (ARGS) {FIELDS}
EDGES |
NAME
EDGES
```

`EDGES`:
```
=> NODE
EDGES
```

`STATE`:
```
state NAME (ARGS) {FIELDS}
CONDITIONAL_EDGES |
(ARGS) {FIELDS}
CONDITIONAL_EDGES |
NAME
CONDITIONAL_EDGES
```

`CONDITIONAL_EDGES`:
```
=COND=> STATE
CONDITIONAL_EDGES |
-> TERM
```

`COND`:
```
TERM |
TERM = TERM |
TERM > TERM |
TERM >= TERM |
TERM < TERM |
TERM <= TERM |
COND | COND |
COND & COND |
COND ^ COND
```

`DEFINITION`:
```
class NAME (ARG_DEFINITIONS) {FIELDS}
EDGES
```

`ARGS`:
```
NAME: TERM | NAME: TERM, ARGS
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
TYPE NAME: TERM
```

`TERM`:
```
PRIMITIVE |
TERM + TERM |
TERM - TERM |
TERM / TERM |
TERM * TERM
```

`PRIMITIVE`:
```
NAME | NAME.NAME | [number] | true | false
```

# Building

```
./scripts/build.sh
```
