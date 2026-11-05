# Big Data Project: TPCx-AI on Hadoop

Course project (Yonsei, Big Data). Objective: generate the TPCx-AI data,
store it in our file system (HDFS), and query it on demand. We mainly run
**use case 1** (and another one if relevant).

> `README.md` in this folder is the original TPCx-AI kit README. This file
> (`PROJECT_README.md`) is ours.

## What is (and is not) in this repository

This repo contains only **our work and the small text files of the kit**
(scripts, configs, Python/Scala sources). It does **not** contain:

| Not committed                                      | Why                                              | Where to get it                  |
|----------------------------------------------------|--------------------------------------------------|----------------------------------|
| Kit binaries (`*.jar`, `*.h5`, `*.bin`, `lib/`, dictionary models) | ~800 MB; GitHub rejects files > 100 MB | Official TPCx-AI download (below) |
| Generated data (`*.csv`, `*.parquet`, `output/`, ...) | Reproducible, large                             | Generate it (below)              |
| HDFS state, logs, Spark scratch                    | Local to each machine                            | Created when you run things      |

See `.gitignore` for the full list.

## 1. Download the TPCx-AI benchmark (required before anything else)

Everyone must download the kit themselves. The repo alone will not work.

1. Download **TPCx-AI v2.0.0** from the TPC website (<https://www.tpc.org/tpcx-ai/>),
   accepting the EULA (see `EULA.txt` in the kit).
2. Extract it. You get a folder named `tpcx-ai-v2.0.0`.

## 2. Set up the git repo inside the kit folder

The git repo lives **inside** `tpcx-ai-v2.0.0/`, so the repo root is the kit root.

**First time (clone into the extracted kit):** the folder is not empty, so a plain
`git clone` fails. Do this from inside the extracted `tpcx-ai-v2.0.0/` instead:

```bash
cd tpcx-ai-v2.0.0
git init -b main
git remote add origin <REPO_URL>
git fetch origin
git checkout -f main        # takes our versions of tracked files; ignored binaries stay untouched
```

`checkout -f` overwrites tracked files in the kit with the versions in the repo
(our edited scripts/configs). Untracked and ignored files, which include the big
binaries you just downloaded, are left alone.

Never `git add -f` a file matched by `.gitignore`. Before pushing, check that
`du -sh .git` is small (a few MB).

## 3. Prerequisites

- Java 17, Python 3.6+ (3.9 tested), `conda`, `sbt` on the `PATH` (see kit `README.md`)
- Hadoop (HDFS) running locally or on the cluster
- Run `./setup-python.sh` (single node) or `./setup-spark.sh` (Spark) once

## 4. Generate the data

Settings live in `setenv.sh` (committed). The scale factor is the dataset size
in GB:

```bash
export TPCxAI_SCALE_FACTOR=1
```

Generate and run use case 1 (parts of the benchmark only; the result is not a
valid official TPC run, which is fine for us):

```bash
./bin/tpcxai.sh -h                                  # list options
./bin/tpcxai.sh -c driver/config/default.yaml -uc 1 -sf 1 -v
```

Generated files appear under `output/` (git-ignored).

## 5. Store in HDFS and query

> Fill this in as we build it: HDFS directory layout, load commands, and the
> queries we run for use case 1.

## Team workflow

- Commit only source, scripts, configs and docs. If `git status` shows a large
  file, stop and add it to `.gitignore`.
- Everyone should use the same `TPCxAI_SCALE_FACTOR` and seed so results match.
- Document any change to kit scripts in the commit message.
