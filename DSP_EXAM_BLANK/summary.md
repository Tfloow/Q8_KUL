---
title: "DSP Exam Questions"
author: "Thomas Debelle & Anonymous student"
geometry: "left=1cm,right=1cm,top=2cm,bottom=2cm"
papersize: a4
date: \today
toc: true
toc-depth: 3
titlepage: true
titlepage-logo: KULlogo.png
subtitle: "[An Open-Source Summary](https://github.com/Tfloow/Q8_KUL)"
---

\newpage

\part{First Document}

# **January 30 2024** 

## **Question 1**	  
1. Chapter-2 p.40 ("Polyphase decomposition: Example..."): Explain how the presented  
equations are exploited in general oversampled filter banks (=Chapters 12-13). 

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2. Chapter-3 p.19 ("3. Least squares estimation..."). Explain the meaning of the parameters  
K and L, and how these have to be set. What procedure does Matlab use to solve such a  
least squares estimation problem?  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

3. Chapter-4 p.10 ("This is a \`Quadratic Optimization'..."): Provide similar formulas for Type-2  
linear phase FIR filter design (p.8), and explain all the symbols used in these formulas.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

4. Chapter-5 p.16 ("From (\*) (p.12), it follows that..."): Generalize the given formulas for the  
case with 3 power complementary filters (as on p.20).  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

5. Chapter-6 p.33: Provide a justification for the 'lumping' of noise sources (as illustrated in  
subsequent pages) that is explicitly based on the given formulas (with 'DC-gain' and 'noise-gain'). 

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 


## **Question 2**  
1. Chapter-7 p.24 ("MMSE cost function can be expanded as..."): How does the Wiener filter  
formula ( wWF=(Xuu)-1Xdu ) and/or its components (Xuu and Xdu) change in the case of a  
'linear combiner' problem (as on p.20)? What is the computational complexity (to solve the  
resulting set of equations) in this case (as on p.27)?  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2. Chapter-8: Explain in your own words how the characteristics of the filter input signal (uk)  
influence the behavior of the LMS algorithm? What is then the 'ideal' filter input signal in  
this respect?  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

3. Chapter-9 p.35 ("4-by-4 example..."): If the adaptive filter input signal and the desired  
output signal have different 'dynamics' (for instance if the characteristics of one are very  
stationary, while the characteristics of the other are very non-stationary), would it be  
possible/useful to apply two different exponential weighting factors (a first one in the part  
corresponding to the input signal and a second one in the part corresponding to the  
desired output signal of the signal flow graph)?  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

4. Chapter-10 p.19 ("Theorem..."): The graph also shows an equality for the accumulated  
product of the cosines of the rotation angles. Provide an explanation for this equality.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

5. In Chapter-11 p.24 ("relevant sub-problem is..."): Explain why the framed triangular matrix  
and corresponding right-hand side vector in the first equation correspond to the formulas  
that are added in the second equation.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

## **Question 3**  
1. Chapter-12 p.36 ("A solution is as follows..."): Prove that the conditions Fo(z)=H1(-z) and  
F1(z)=-Ho(-z) indeed lead to alias-free operation. How is the frequency response of Fo(z)  
and F1(z) then related to the frequency response of Ho(z) and H1(z)?  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2. Chapter-13 p.12 ("ii) Necessary & sufficient condition..."): Explain in your own words the  
statement "hence $pr(z)=\text{pure delay}=z-\delta$, and all other $pn(z)=0$". Explain how this then leads  
to the next formula.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

3. Chapter-14 p.13 ("Conclusion: economy in..."): Explain in your own words the statement  
"N filters for the price of 1".  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

4. Chapter-14 p.27 ("Example-1: Define B(z4)..."):  
a) Specify B(z) for the case where N=5 and D=2.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

b) Derive the conditions for perfect reconstruction and specify when the resulting set of  
equations can be solved.  
cfr. slide 31 for an example

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

#   **10 August 2020**

## Question 1

1. Explain how WLS for FIR filter design reduces the degrees of freedom when imposing a linear phase requirement.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

Due to the linear phase requirement we know the H(w) is symmetric. The d-coefficients are related to the IR and thanks to the symmetry, there are roughly half as many d-coefficients as H's (see also slide 6). When we take a look at the optimization criterion, we see it's an overdetermined system. Is Symmetry a requirement for linear phase?  
Either symmetry or antisymmetric, but both can be used to reduce the degrees of freedom   

2. Can QRD be used in WLS FIR filter design? How? Chapter 9, QRD for LS estimation?                                                                                 	
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 


The solution to the discretised optimisation problem (ch4, slide 12\) is xopt=A^-1 \* p (xopt \= Q^-1 \* p on the slide, here replaced with A to avoid confusion), where xopt contains the coefficients of the IR such that the distance to the desired IR is minimised. The set of equations to this problem can be numerically solved more efficiently with QRD on matrix A: A=Q\*R, where Q is orthogonal so Q^T\*Q=I and Q^-1=Q^T and R is upper triangle so R^-1 is easy to compute. The relevant problem can be written as min\_x ||A\*x-p||^2. Since multiplying with Q^T is an orthogonal transformation (which preserves norm) min\_x ||Q^T \*( A\*x-p)||^2 is an equivalent problem (same as ch9, slide 12). So Q^T\*A\*xopt=Q^T\*.Q\*R\*xopt=R\*xopt=phat \-\> xopt=R^-1\*phat (Q^T\*p=phat), which is very easy to compute What is the point? Q\*x\_opt \= p is a determined system. There is no error because the error is left in mu. 


3. When WLS FIR filter design is used for filters with an arbitrary required phase response, how does the design procedure change? Give relevant formulas.  
   Is this a question related to question 2 or the first one?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   Fir filters can also have arbitrary phase responses, if they are not symmetric, thus it is not necessary to change it into an IIR filter. When designing the filter, we can no longer use the symmetric property, thus all coefficients have to be determined by the LS calculations, rather than only half of them. The phase response will have to be included in the objective function, as on slide 4-9. The procedure does not change by a lot, except that the transfer functions within the squared operation will now be complex.

   

   If the impulse response is not symmetric, the phase response will not be linear. Causality only means that h\[k\<0\] \= 0.      

   Alternatively, use windowed design  

## Question 2

1. For overdetermined Ax=b, LS is x\_LS=(A^T\*A)^(-1) A^T\*b, manipulate this to justify back substitution in QRD RLS.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   The given formula is the original equation of the LS solution. To achieve better numerical results another representation is used to calculate the solution.   
   Algebraic substitution: A \= Q\_tilde\*R \=\> AR^(-1) \= Q\_tilde  
   (A^T\*A)^(-1) A^T\*b  
   \= (A^T\*A)^(-1) (Q\_tilde\*R)^T\*b \= (A^T\*A)^(-1) R^T\*Q\_tilde^T\*b  
   Bring the R^T \= (R^T)^(-1)^(-1) \= (R^(-1))^T^(-1)  in the inverse   
   \= (R^(-1))^T\*A^T\*A)^(-1) \*Q\_tilde^T\*b  
   Merge the two transposes together  
   \= ((A\*R^(-1))^T\*A)^(-1)\*Q\_tilde^T\*b  
   Knowing AR^(-1) \= Q\_tilde  
   \= (Q\_tilde^T\*A)^(-1)\*Q\_tilde^T\*b  
   This is the same form as with the triangular backsubstitution on slide 12. 

2. How is Chapter-9, slide 32 used in derivation of QRD LSL? See january 24 2020: Q2.1  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

3. Chapter-9, slide 33, the set of input signals \[ u\[k\] u\[k-1\] u\[k-2\] u\[k-3\] u\[k-4\] \]  
   is extended to \[ u\[k\] u\[k-1\] u\[k-2\] u\[k-3\] u\[k-4\] v\[k\] \] with v\[k\] independent of u\[k\], is QRD LSL still possible? Sketch a block scheme, omit details.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   I think this is possible. Why the 'independent'? How can it be added? As the epsilons are a prediction based on the input signals  
   What do you think? In chapter 10, slide 22 he says that "The square root RLS algorithm form before is a special case of the square root Kalman filter algorithm (for Vk=0), so I guess if Vk isn't equal to zero like in this question, you'd end up with the square-root-Kalman filter? Does anyone think that's indeed what he's referring to, I'm really not sure...

   I think is is more a case like on the screenshots added under "24 januari 2020", Q2.3

## Question 3

1. For maximally decimated filter banks, provide an intuitive explanation for perfect reconstruction despite aliasing in each channel.  

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   In a maximally decimated filter bank is D=N. The input is split into several frequency bands using the analysis filters. These are all separated and decimated which results in a stretched spectrum. When subband processing is done, these channels are compressed using upsampling. The copies are also present and these can be filtered out afterwards using a synthesis filter (interpolation filter, same band as the original). When the separate bands are combined this results in the original signal. PR is possible because of the synthesis bank, which is designed to remove aliasing effects.   
   **Is this what you expect from this question or should we explain the polyphase decomposition and the alias transfer function \+ distortion function?**

   I think just explain chapter 11, slide 23 to 28?

   I think that the explanation is correct and you can complete it with the slides 23 to 28

2. Compare maximally decimated filter banks with oversampled filter banks. What are the advantages/disadvantages of oversampling? 

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   Maximally decimated (D=N):   
   \- Not much design freedom  
   \- R(z) has to be IIR (FIR no ?) (No it is IIR see slide 11 of Ch 12, L\_R would need to be infinite aka IIR, this is also stated on slide 12 at the bottom in case D \= N)  
   Oversampled (D\<N):  
   \+ Easier to design  
   \+ FIR R(z) can always be found

3. Design a DFT modulated filter bank with 4 channels and 3 fold decimation. Give relevant formulas.  
   This is an oversampled DFT-modulated FB. Modifying the example of the slides should suffice. 

   B(z) \= \[E0(z^4)    z^-1\*E4(Z^4)      z^-2 E8\]

               \[z^-3\*E9        E1                  z^-1\*E5\]

               \[z^-2\* E6       z-3\*E10             E3    \]

               \[z^-1\*E3        z^-2 E7         z^-3\*E11\]

       

## Question 4 (about acoustic modem)

1. What is the relevance of channel equalisation in the acoustic modem?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   The signal Xk will be modified by a channel H(z) and if you do the FFT at the receiver you won't have the same signals as at the transmitter due to this channel H(z). To recover the perfect signal (with the noise of course), one has to do the Freq-domain EQualization (FEQ) after having removed the CP and having done the FFT. slide 25 Chapter-3. 

   The channel equalization is easy due to the fact that you use a prefix \-\> makes the matrix H diagonal. 

2. What is the relevance of the prefix in OFDM? What are the requirements for this prefix?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

The OFDM frame together with the prefix allows for a circular convolution. In the receiver, the L samples corresponding with the prefix are thrown away which results in a circulant matrix. This circulant matrix can then be factorized using IDFT/DFT( H= F^-1 \* diag(H0,..,Hn-1) \* F). With this, a diagonal matrix is obtained. The resulting output Y is then simply the input X multiplied with some scalar H(all in frequency domain), so the X can be estimated using component wise division. The prefix length needs to be longer than the impulse response of the channel. (slide 31-35\`)

3. How does one derive a channel model for the acoustic modem? What if one wants to equalise without modelling the channel?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

You can send training frames that are known at both sides. You know X and Y, by using the OFDM modulation with CP, it is very easy to derive a channel model. Y\_k^(n) \= Hn \* X\_k ^(n) (slide 35,ch 3\) which leads to H \= Y\_k \* X\_k^(-1) \-\> Least Square estimation

For the second part of the question, I understand it like this. In order to avoid losing channel resources for training frames, a adaptive filter can be used and you find a channel for each time.


# **13 augustus 2018**

## Question 1

1.  What are noise transfer functions? Explain how such noise transfer functions are used in the analysis of quantization effects in filter implementation.


> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

	Chapter 6: each multiplier and adder introduces noise. The transfer function from e\[k\] to the output is the noise transfer function. It gives more info about the influence of  each noise source  to the output. This means that given a filter realisation and assuming a linear model, we can lump all the noise-sources together in one equivalent source.

As the quantisation introduces noise (after a mult or add), if you study the noise you are studying the influence of that quantisation on the complete system.

1.  Do the properties of the quantization mechanism play a role in such analysis?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

	(slide 20\) Different quantizations gives different errors \=\> different noise. This gives different noise mean and variation \-\> important for the analysis

2.  The analysis relies on linearity (explain) whereas quantization is a non-linear operation. Could this be a contradiction?


> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   The analysis we use is statistical it assumes all noise sources are independent (white)  and the quantisation error is random. Quantization may be non- linear, the error is linear?????  

   Quantization is non-linear and therefore produces some errors which are known as quantization errors. These errors result in what is known as quantization noise. The noise itself is viewed as additive white gaussian noise so it is equal for all frequencies. 

           The filter system which is being studied is assumed to be linear time invariant (LTI), it only uses additions, multiplications, and delays. What is assumed in the noise analysis is that the noise sources from quantization have a linear relation to the output (so are added). Therefore the noise can come from a non linear source, but the analysis relies on the circuit being linear.   
m	In the noise analysis we assume quantisation noise to be additive, but this is not actually the case. You can not just add it after a multiplication since it is dependent on which numbers are added, this makes it very unpredictable (see cycle errors)

## Question 2

1.  In a maximally decimated (MD) filter bank aliasing usually occurs because of the down-sampling operation. Provide an intuitive explanation why perfect reconstruction (PR) is still possible, in spite of the downsampling and aliasing.


> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   If we choose our synthesis filters in a way that they restore the aliasing distortion, PR is possible \-\> slides 24-28. If we look at all filters in total we still have all the information available despite the aliassing. 

2.  What are DFT modulated filter banks? What are the advantages of such FB's?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   DFT modulated filter banks are uniform filter banks that are based on a polyphase decomposition of a prototype filter H0 and followed by an inverse DFT, hence all the other Hi filters are derived from only one prototype filter. The main advantage is that this kind of filter banks is that are easier to design:  yodo : you only design one\!\!\! The rest of the filters are shifted versions of the prototype filter. Low computational cost also i think...  
   Low computational cost because only N polyphase components ( \= 1 filter)  and DFT versus N^2 polyphase components ( \= N filters).

3.  How can DFT-modulated PR filter banks be designed?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   Maximally decimated:  
4) Design prototype H\_0(z)  
5) Calculate E\_n(z) \= polyphase component  
6) Assuming all E can be inverted \-\> choose R

	\!\!\! not every E stable \-\> choose E unimodular or paraunitary\!\!\!  
	Not a lot of freedom  
	Oversampled \-\> the same but more E and R so more freedom in design.

## Question 3

1.  Explain the main trick that is used in the derivation of the QRD-LSL algorithm.

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

	LSL \= RLS?? No, LSL \= H9 part 2, fast algorithm for FIR RLS LSL \= Least square lattice, RLS \= Recursive least squares  
As most of the input vector is reused in for the next input vector (h\[k\] \-\> h\[k-1\]; h\[k-1\] \-\> h\[k-2\];.....  
On slide 32 is shown that when a random permutation is applied to the input, the residues remain the same.  
In slide 35 it is shown that the residual for a given problem is also the residual for other, related problems; for example $\epsilon^{k-2}_{k-1:k+1}$ may be viewed as the epsilon-output of a 1-dimensional RLS problem, with left-hand side $\epsilon^{k+1}_{k-1:k}$ and right-hand side $\epsilon^{k-2}_{k-1:k}$. After a delay element this becomes $\epsilon^{k-3}_{k-2:k}$. Since we now have a way to generate this epsilon, the other way is redundant and thus can be removed. This process is then repeated until the SFG on slide 37 is reached.

Can someone explain how we can calculate the filtercoefficeint with this? ( i found a formula but it only uses the R matrix, and with this there is no R...

Filter coeff are not calculated (slide 22\)

1.  Compare the complexity of the QRD-LSL algorithm with the complexity of LMS.

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   LMS $\rightarrow$ O(6L)\--\> moet dit niet 2L multiplications zijn? (slide 16\) en kan big O-notatie hier gebruikt worden?  
   QRD-LSL $\rightarrow$ O(24L) $\rightarrow$ en dit moet 24\*L multiplications zijn, niet O(24L)

2.  In an acoustic echo cancellation scenario with one loudspeaker and two microphones (ie. where an echo contribution is to be cancelled in each of the two microphone signals), is it possible to apply a QRD-LSL-algorithm? Sketch an efficient realisation (clearly defining input and output signals).

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   The input is equal for both microphone signals, but the desired output is different. By simply adding an extra desired signal we can reuse the same procedure.  
   Do we need to calculate an epsilon for both microphone signals? And can we use the same R matrix for both signals?  
   Yes different epsilons are needed, remember that epsilon is: e  \= d \- w\*x. So if there is another desired signal d, then there is also another epsilon. 

## Question 4: Acoustic modem project

1.  Explain how the OFDM modulation format (including a cyclic prefix) provides an easy equalization of the transmission channel. What are conditions that the transmission channel has to satisfy for this 'cyclic prefix trick' to work properly?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

The OFDM frame together with the prefix allows for a circular convolution. In the receiver, the L samples corresponding with the prefix are thrown away which results in a circulant matrix. This circulant matrix can then be factorized using IDFT/DFT( H= F^-1 \* diag(H0,..,Hn-1) \* F). With this, a diagonal matrix is obtained. The resulting output Y is then simply the input X multiplied with some scalar H(all in frequency domain), so the X can be estimated using component wise division. The prefix length needs to be longer than the impulse response of the channel. (slide 31-35\`)

1.  If a channel model is required for the equalization, explain how it can be derived. Is it possible to run the equalization without first deriving a channel model?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 


	A channel model can be acquired by using trainingframes?? The data in these frames is known at the receiver, so the channel model can be derived with a least squares estimation.  
By measurement, and ise slide 19

# **16 augustus 2017**

## Question 1

1.  What are noise transfer functions? Explain how such noise transfer functions are used in the analysis of quantization effects in filter implementation.

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2.  Do the properties of the quantization mechanism play a role in such analysis?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

3.  The analysis relies on linearity (explain) whereas quantization is a non-linear operation. Could this be a contradiction?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

## Question 2

1.  What are DFT modulated filter banks? What are the advantages of such FB's?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2.  How can maximally decimated DFT filter banks be designed?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

3.  How can oversampled DFT filter banks be designed?

## Question 3

1. What is a rank-1 update? How does it define the complexity?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2.  Residuals: explain a priori and a posteriori residuals of SFG

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

   The a priori residual is the difference between the desired signal and the filtered input, using the filter coefficients of the previous iteration.  
   The a posteriori residual is the difference between the desired signal and the filtered input, using the filter coefficients of the current iteration.

3.  Is it useful to use two exponential weighting factors if the output and input are very different: static input and non static output (for example)? (something like this)

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

 I don't think so: you're supposed to use the same weighting factor for both the desired (input) and the received (output) signals (ch.8 slide 37\) else the LS solution won't calculate the filter coëfficient correctly

## Question 4 (Acoustic modem project)

1.  Explain how the OFDM modulation format (include cyclic prefix) provides easy equalization of the transmission channel. What conditions are to be met for the cyclic prefix?

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

2.  Explain how RLS is used for channel equalization in the acoustic modem project. What input for the adaptive filter? What is the desired output signal? What is the order of the filter? (awnser: 1, for every carrier/subband)

> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
> 
> &nbsp;
>
> &nbsp;
>
> &nbsp;
> 

Does anyone have an idea?  
I think we used NLMS in week 7 (and not RLS) . And the input of the adaptive filter is the signal received at te microphone (x\[k\]\*h\[k\]+n\[k\]). The desired output is the output of the decision device which takes the output of the adaptive filter as input.   
The order of the filter is 1, you try to find an estimation for every subband carrier channel. 



