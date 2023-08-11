# repo-ssync

An interactive synchronization utility for the [Android Repo tool](https://source.android.com/setup/develop/repo) using `fzf`.

## Prerequisites

- Android Repo tool installed and initialized (using `repo init`).
- [fzf](https://github.com/junegunn/fzf) installed.

## Installation

### For fish-shell users:

Using [fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install tohenton/repo-ssync
```

### For non-fish users:

1. Clone this repository or download the `repo-ssync.sh` script.
2. Make sure the script is executable: `chmod +x repo-ssync.sh`
3. Optionally, move the script to a directory in your `PATH` for easier access.

## Usage

### For fish-shell users:

Simply run:

```fish
repo-ssync
```

### For non-fish users:

Run:

```bash
./repo-ssync.sh
```

or just `repo-ssync.sh` if you've placed it in your `PATH`.

In both cases, the utility will display a list of projects from your current Repo manifest. Use `fzf` to interactively select one or multiple projects you want to synchronize. After selection, the tool will run `repo sync` for the selected projects.
