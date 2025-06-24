---
title: "TITLE NAME"
author: AUTHOR
geometry: "left=1cm,right=1cm,top=2cm,bottom=2cm"
papersize: a4
date: \today
toc: true
toc-depth: 3
titlepage: true
titlepage-logo: KULlogo.png
template: eisvogel
subtitle: "[An Open-Source Summary](https://github.com/Tfloow/Q8_KUL)"
copyright: "© 2025 AUTHOR. This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
copyright-link: "https://creativecommons.org/licenses/by-nc-sa/4.0/"
output: pdf_document
---

# Welcome

Please use { width=50% } in line with your image so Latex doesn't go crazy.

![Logo of KULeuven](KULlogo.png){ width=50% }

Listings are enabled to make some clean and pretty code snippets.

```c
int a = 0;
for(int i = 0; i < 10; i++){
    // Simple snippet of code
    printf("i = %d", i);
}
```

As usual, math mode is present.

$$
i\hbar \frac{d}{dt}|\Psi (t)\rangle =\hat {H}|\Psi (t)\rangle
$$

And there is many more things you can do just with a simple Markdown file!