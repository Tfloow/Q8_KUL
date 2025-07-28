---
title: "DSP Exam"
author: Thomas Debelle
geometry: "left=1cm,right=1cm,top=2cm,bottom=2cm"
papersize: a4
date: \today
toc: true
toc-depth: 3
titlepage: true
titlepage-logo: KULlogo.png
template: eisvogel
copyright: "© 2025 Thomas Debelle. This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
copyright-link: "https://creativecommons.org/licenses/by-nc-sa/4.0/"
output: pdf_document
---

# January 11 2024

## Question 1 

1. Chapter-2 p36 (“Example: HP anti-aliasing…”): Explain the relevance of the presented operations in the filter bank context (=Chapters 12-13-14). 

> This demonstrates how that we can, after downsampling and upconverting, obtain the same signal back at the condition that we apply a HP Anti-Aliasing filter first. 
>
> This HP AA is important as demonstrated in the formula page 33 where we can have aliasing after downconverting leading to *aliased* signal that cannot be reconstructed back. Right now, this result can be seen as stupid or useless, but the fact we can downsample and upsample and get the same signal is a sign of promising efficiency. Indeed, after downsampling, we can run a filter at a much lower frequency (the goal of downsampling) which is much more efficient (lower clock !). In other terms, we can perform an operation at lower speed which could be equivalent to a more power-hungry high speed operation.
> 
> This equivalence is key for filter banks and is the motivation of their study.

2. Chapter-3 p.29 (“At the Rx, throw away L samples corresponding…”). Rewrite the formula for the case where the order of the FIR channel is larger than the cyclic prefix length. 

> L should be adequately chosen to represent the FIR of the channel. Ideally L should be equal than the actual filter order and then the rest of the OFDM theory can be done.
>
> With L the cyclic prefix length and $\lambda = \text{actual order} - L$ we can find the following: 

$$
\begin{bmatrix}
y_k \\
y_{k+1} \\
y_{k+2} \\
y_{k+3} \\
y_{k+4} \\
\vdots \\
y_{k+N-1}
\end{bmatrix}
=
\begin{bmatrix}
h_L & h_{L-1} & \cdots & h_0 & 0 & \cdots & 0 \\
h_{L+1} & h_L & \cdots & h_1 & h_0 & \cdots & 0 \\
h_{L+2} & h_{L+1} & \cdots & h_2 & h_1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots & \vdots & \ddots & \vdots \\
0 & h_{L+\lambda} & \cdots & h_{L+1} & h_L & \cdots & h_0 \\
\end{bmatrix}
\begin{bmatrix}
x_{k+N-L} \\
x_{k+N-L+1} \\
\vdots \\
x_{k-1} \\
x_k \\
x_{k+1} \\
\vdots \\
x_{k+N-1}
\end{bmatrix}
$$

> In short, the matrix is **no longer** be made circulant which will void the OFDM principle. In practice, higher order h coefficient are near zero and thus they can be seen as 0 compared to $h_0$ and other low order coefficient. So the OFDM technique doesn't just implode if you mispredict, just the math doesn't really hold up and you may find some surprising excessive noise in your filter coefficient estimation.

3. Chapter-4 (“Filter Design”): Explain how the filter phase response is controlled in IIR filter design, and compare this to linear-phase FIR filter design. 

> The phase response of a filter $H(z)$ is simply $\angle H(e^{j\omega})$. Moreover, we now that a z-transform is nothing else than $H(z) = \sum_{k= -\infty}^{\infty} h_k z^{-k} \Longrightarrow H(e^{j\omega}) = \sum_{k= -\infty}^{\infty} h_k e^{-j\omega k}$. Then it is just a matter to cancel out the complex part which can only be done in **non-causal** filter. The only causal filter will be **linear phase** one with an added $e^{-j\omega L_0}$ where $L_0 = L/2$ or $L_0 = L-1/2$ depending on a symmetric or anti-symmetric filter. So the phase response is controlled through 1. Real value symmetric anti-symmetric filters 2. Length of the filter. 1. ensures linear phase response and 2. the *steepness* of the linear phase function.
>
> The phase response of IIR filters is tougher to control. Having a linear phase is impossible in IIR or we will lead into stability issues. To control it we could think of tweaking the optimization problem and make larger weight on the frequency we want to avoid ripple, but this is really not straightforward and is not part of standard quadratic problems.
>
> A simpler way is to simply use filters designed for such response such as Bessel filter.
>
> In short, for FIR, by design we can choose a specific family through its coefficient (reducing flexibility by a factor 2) and then we use a common quadratic optimization problem that is easily solvable. For IIR, we can't have linear phase by design, controlling the phase is hard and we will use some higher order optimization problem, solver do exists but will never be perfect, rely on well studied filters such as Bessel to simplify IIR filter deisgn with well controlled phase reponse.

4. Chapter-5 p.30 (“Derivation similar to p.22...”): Explain why the highlighted element in the first formula has to be a zero (unlike in p.21 and p.22). 

>

5. Chapter-6: Draw a “parallel realization” of H(z)=(1+az-1)-1 + (1+bz-1)-1. Insert all relevant quantization noise sources and compute the corresponding noise transfer functions. Can some of these noise sources be lumped into an equivalent noise source? Why (not)? 

>


## Question 2

1. Chapter-7 p.24 ("MMSE cost function can be expanded as..."): How does the Wiener filter formula (wWF=(Xuu)-1Xdu ) and/or its components (Xuu and Xdu) change in the case of a multi-channel FIR problem (as on p.19)? 

>

2. Chapter-8: Explain how the LMS algorithm can be viewed as an RLS algorithm with a specific substitution for the input signal correlation matrix. Based on this link with RLS, provide an intuitive explanation for the statement that the convergence of the LMS depends on the correlation matrix eigenvalue spread. 

>

3. Chapter-9 p.38 (“Residual extraction…”): Consider the case where uk is an all-zero vector and dk is non-zero (and R[k] is full-rank). What would be the corresponding rotation angles and epsilon, and hence the a posteriori and a priori residual. 

>

4. Chapter-10 p.20 (“The main trick...”): Redraw the signal flow graph when the "main trick" is used to remove the column with R15, R25, ... Define the relevant epsilon-signals in the signal flow graph (with subscripts & superscripts). 

>

5. In Chapter-11 p.25 (“Recursive Square-Root…”): Could residual extraction (cfr. Chapter 9) be added to this algorithm (would it also require only the “lower-right/lower part” as stated on p.23)? What exactly would be the meaning of the extracted residuals? 

>


## Question 3

1. Chapter-12 p.12 (“Noise reduction…”): If D=4 (instead of D=3) and if the Gi’s are not all equal to 1, what would be a condition for alias-free operation (a general formula is sufficient here) and what would be the resulting (linear) “distortion function”? 

>

2. Chapter-13 p.11 (“This can be verified...”). Provide an equivalent verification where in the first step R(z)E(z) is swapped with the upsampling (instead of the downsampling). 

>

3. Chapter-13 p.31 (“Given E(z)...”). Consider the case with N=4, D=1 and LE=3. Construct a (simple) example with transfer functions Hi(z) and Fi(z) that provide perfect reconstruction. 

>

4. Chapter-14 p.27 (“Example-1: Define B(z4)…”):

a) Specify B(z) for the case where N=7 and D=4. 

>

b) Provide the corresponding proof (similar to the proof on p.27) (with explanation in words for non-trivial steps) that a 7-channel DFT-modulated filter bank is indeed obtained with this B(z). 

>

