> [!warning]
> **📦 Archived Moved to: [ESATSummary](https://github.com/Tfloow/ESATSummary)**


# Q8 KUL

- [Q8 KUL](#q8-kul)
  - [What is this ?](#what-is-this-)
  - [Compilation](#compilation)
    - [Pro tip](#pro-tip)
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

You can clone this repo and compile locally with the `make` command. You will need **[docker](https://docs.docker.com/engine/install/)** installed. This allows that everyone is compiling on the same platform with little requirements (first compilation may take some times to pull the image).

```
make
```

Will compile all of the summaries locally.

You can also simply grabbed the already compiled pdf that gets compiled each time someone push to the main branch. 

Each pdf's are located at:

```
https://raw.githubusercontent.com/Tfloow/Q8_KUL/main/FOLDER_NAME.pdf
```

Like this https://raw.githubusercontent.com/Tfloow/Q8_KUL/main/template.pdf .

### Pro tip

If you tend to forget pulling before commiting, you can create a new branch like "working" and add all of your summaries, the bot won't compile summaries that aren't on main. And once you are ready to fully compile everything you can merge in main (I just advise you to run locally `make` first to make sure everything is in order).

## Add a summary

First clone this repo. Then to create a new summary please run a this command:

```
make create_summary DIR=CLASS_FOLDER TITLE="CLASS TITLE" AUTHOR="AUTHOR OF THE SUMMARY"
```

And replace the placeholder with your given class and name.
