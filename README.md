# Q8 KUL

- [Q8 KUL](#q8-kul)
  - [What is this ?](#what-is-this-)
  - [Compilation](#compilation)
  - [Add a summary](#add-a-summary)

## What is this ?

It is a small collection of summaries I am making for my classes this semester. For classes that do not have a lot of equation, I prefer using markdown compiled in pdf with pandoc. It is faster than simply using $\LaTeX$ on overleaf.

It gets compiled automatically by github and pushed on main after ~5 minutes so be sure to always 

```
git pull
```

or 

```
git pull -f
```

If needed.

## Compilation

You can clone this repo and compile locally with the `make` command. You will need *pandoc* and the base version of *texlive* installed.

```
make
```

Will compile all of the summaries locally.

You can also simply grabbed the already compiled pdf that gets compiled each time someone push to the main branch.

## Add a summary

First clone this repo. Then to create a new summary please run a this command:

```
make create_summary DIR=CLASS_FOLDER TITLE="CLASS TITLE" AUTHOR="AUTHOR OF THE SUMMARY"
```

And replace the placeholder with your given class and name.