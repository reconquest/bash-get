go get inspired bash get tool.

![bash-get-demo](https://cloud.githubusercontent.com/assets/674812/15053474/ad59e10c-1324-11e6-817d-ccf805ec9fef.gif)

Consider looking at https://github.com/reconquest/import.bash too.

# Usage

## Installing new vendor

```bash
bash get github.com/reconquest/opts.bash
```

## Updating vendor

```bash
bash get -u github.com/reconquest/opts.bash
```

## Updating all vendors

```bash
bash get -u  # or
bash get     # non-recursive
```

## Using vendor

### Without import.bash

```bash
source vendors/github.com/reconquest/opts.bash/opts.bash

# use of opts:... methods
```

### With import.bash

```bash
import github.com/reconquest/opts

# use of opts:... methods
```
