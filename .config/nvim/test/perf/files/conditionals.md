---
title: Bash scripting conditionals
category: CLI
---

Conditionals
------------

### Conditions

Note that `[[` is actually a command/program that returns either `0` (true) or `1` (false). Any program that obeys the same logic (like all base utils, such as `grep(1)` or `ping(1)`) can be used as condition, see examples.

| Condition                | Description           |
| ---                      | ---                   |
| `[[ -z STRING ]]`        | Empty string          |
| `[[ -n STRING ]]`        | Not empty string      |
| `[[ STRING == STRING ]]` | Equal                 |
| `[[ STRING != STRING ]]` | Not Equal             |
| ---                      | ---                   |
| `[[ NUM -eq NUM ]]`      | Equal                 |
| `[[ NUM -ne NUM ]]`      | Not equal             |
| `[[ NUM -lt NUM ]]`      | Less than             |
| `[[ NUM -le NUM ]]`      | Less than or equal    |
| `[[ NUM -gt NUM ]]`      | Greater than          |
| `[[ NUM -ge NUM ]]`      | Greater than or equal |
| ---                      | ---                   |
| `[[ STRING =~ STRING ]]` | Regexp                |
| ---                      | ---                   |
| `(( NUM < NUM ))`        | Numeric conditions    |

#### More conditions

| Condition            | Description              |
| -------------------- | ------------------------ |
| `[[ -o noclobber ]]` | If OPTIONNAME is enabled |
| ---                  | ---                      |
| `[[ ! EXPR ]]`       | Not                      |
| `[[ X && Y ]]`       | And                      |
| `[[ X || Y ]]`       | Or                       |

### File conditions

| Condition               | Description             |
| ---                     | ---                     |
| `[[ -e FILE ]]`         | Exists                  |
| `[[ -r FILE ]]`         | Readable                |
| `[[ -h FILE ]]`         | Symlink                 |
| `[[ -d FILE ]]`         | Directory               |
| `[[ -w FILE ]]`         | Writable                |
| `[[ -s FILE ]]`         | Size is > 0 bytes       |
| `[[ -f FILE ]]`         | File                    |
| `[[ -x FILE ]]`         | Executable              |
| ---                     | ---                     |
| `[[ FILE1 -nt FILE2 ]]` | 1 is more recent than 2 |
| `[[ FILE1 -ot FILE2 ]]` | 2 is more recent than 1 |
| `[[ FILE1 -ef FILE2 ]]` | Same files              |

### Example

```sh
# String
if [[ -z "$string" ]]; then
  echo "String is empty"
elif [[ -n "$string" ]]; then
  echo "String is not empty"
else
  echo "This never happens"
fi
```

```sh
# Combinations
if [[ X && Y ]]; then
  ...
fi
```

```sh
# Equal
if [[ "$A" == "$B" ]]
```

```sh
# Regex
if [[ "A" =~ . ]]
```

```sh
if (( $a < $b )); then
   echo "$a is smaller than $b"
fi
```

```sh
if [[ -e "file.txt" ]]; then
  echo "file exists"
fi
```
