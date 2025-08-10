# 10 August 2020

## Question 1

1.  **Explain how WLS for FIR filter design reduces the degrees of freedom when imposing a linear phase requirement.**

    For a Finite Impulse Response (FIR) filter, imposing a linear phase requirement significantly reduces the number of independent coefficients, thereby lowering the degrees of freedom in the design process. A linear phase FIR filter is typically achieved by designing the filter with a **symmetric or anti-symmetric impulse response**.

    For example, for a causal linear-phase FIR filter of length $L+1$ (where $L$ is the filter order) with a symmetric impulse response and $L$ being even, the impulse response coefficients $h[k]$ satisfy $h[k] = h[L-k]$ for $k=0, \dots, L$. This means that if you determine $h, h, \dots, h[L/2]$, the remaining coefficients $h[L/2+1], \dots, h[L]$ are automatically determined by the symmetry property.

    The frequency response of such a filter can be written as a real-valued function $G(\omega)$ multiplied by a linear phase term $e^{-j\omega L/2}$:
    $$H(e^{j\omega}) = e^{-j\omega L/2} \cdot \sum_{k=0}^{L/2} d_k \cos(\omega k) \quad \text{}$$
    Here, $d_k$ are combinations of the $h[k]$ coefficients, where $d_0 = h[L/2]$ and $d_k = 2h[L/2-k]$ for $k>0$. Instead of optimizing $L+1$ independent coefficients $h[k]$, the Weighted Least Squares (WLS) design, for example using Type-1 linear-phase filters, only needs to optimize $L/2+1$ coefficients $d_k$. This is a **reduction in degrees of freedom** from $L+1$ to $L/2+1$.

2.  **Can QRD be used in WLS FIR filter design? How? Chapter 9, QRD for LS estimation?**

    Yes, the **QR Decomposition (QRD) can be used in Weighted Least Squares (WLS) FIR filter design**. The WLS design problem for FIR filters can be formulated as a quadratic optimization problem. If a discrete set of sample frequencies is used for the optimization, this problem can be transformed into a **linear least squares (LS) problem for an overdetermined set of equations**.

    Chapter 9 explains that the LS problem, typically written as $\min_w ||d - Uw||_2^2$, can be solved using QRD. The QRD of the matrix $U$ (the input matrix in the LS problem) is $U = QR$, where $Q$ is an orthogonal matrix ($Q^T Q = I$) and $R$ is an upper triangular matrix.

    By substituting $U=QR$ into the LS problem and multiplying by $Q^T$, the minimization problem becomes:
    $$\min_w ||d - Uw||_2^2 = \min_w ||Q^T(d - Uw)||_2^2 = \min_w ||Q^T d - Q^T U w||_2^2 \quad \text{}$$
    Let $Q^T d = \begin{bmatrix} z \\ \star \end{bmatrix}$ and $Q^T U = \begin{bmatrix} R \\ 0 \end{bmatrix}$. The problem simplifies to:
    $$\min_w \left\| \begin{bmatrix} z \\ \star \end{bmatrix} - \begin{bmatrix} R \\ 0 \end{bmatrix} w \right\|_2^2 = \min_w ||z - Rw||_2^2 + ||\star||_2^2 \quad \text{}$$
    The minimization is achieved by setting $z - Rw = 0$, which yields the system of equations $Rw = z$. Since $R$ is an upper triangular matrix, this system can be efficiently solved for $w$ (the filter coefficients) using **back substitution**.

    Therefore, the discretized WLS FIR filter design problem can be cast as an LS problem, and then QRD, followed by back substitution, can be applied to find the optimal filter coefficients.

3.  **When WLS FIR filter design is used for filters with an arbitrary required phase response, how does the design procedure change? Give relevant formulas.**

    When WLS FIR filter design is used for filters with an **arbitrary required phase response**, the fundamental assumption of a linear phase, which leads to a symmetric or anti-symmetric impulse response, **cannot be made**. This changes the design procedure significantly:

    *   **Impulse Response:** The impulse response coefficients $h[k]$ (or $b_k$ in the source) would be general, potentially complex-valued, and would not be constrained by symmetry. All $L+1$ coefficients $h, \dots, h[L]$ become independent design variables, increasing the degrees of freedom.
    *   **Frequency Response:** The filter's frequency response $H(e^{j\omega})$ would be a general complex-valued function, as it would not necessarily factor into a real-valued amplitude response and a linear phase term. The transfer function for an FIR filter is $H(z) = \sum_{k=0}^L b_k z^{-k}$. Its frequency response is:
        $$H(e^{j\omega}) = \sum_{k=0}^L b_k e^{-j\omega k} \quad \text{}$$
        This expression directly involves the complex exponentials and the coefficients $b_k$.
    *   **Desired Response:** The desired frequency response $H_d(\omega)$ would also be an arbitrary complex-valued function, specifying both desired magnitude and phase at each frequency.
    *   **Optimization Criterion:** The WLS optimization criterion would directly minimize the weighted squared difference between the complex-valued filter's frequency response and the desired complex frequency response. The formulation would be:
        $$\min_{b_0, \dots, b_L} \int_{-\pi}^{+\pi} W(\omega) |H(e^{j\omega}) - H_d(\omega)|^2 d\omega \quad \text{}$$
        where $W(\omega) \ge 0$ is the weighting function.
    This typically leads to a more complex optimization problem compared to the linear phase case, as the variables are generally complex, and the objective function involves the squared magnitude of a complex difference.

## Question 2

1.  **For overdetermined Ax=b, LS is x\_LS=(A^T\*A)^(-1) A^T\*b, manipulate this to justify back substitution in QRD RLS.**

    Given an overdetermined system of linear equations $Ax=b$, the Least Squares (LS) solution is $x_{LS} = (A^T A)^{-1} A^T b$.
    To justify back substitution in the context of QRD Recursive Least Squares (RLS), we introduce the QR Decomposition of matrix $A$.
    The QR decomposition of $A$ is given by $A = QR$, where $Q$ is an orthogonal matrix ($Q^T Q = I$) and $R$ is an upper triangular matrix.

    Substitute $A = QR$ into the LS solution:
    $$x_{LS} = ((QR)^T QR)^{-1} (QR)^T b$$
    $$x_{LS} = (R^T Q^T Q R)^{-1} R^T Q^T b$$
    Since $Q^T Q = I$ (due to $Q$ being orthogonal), this simplifies to:
    $$x_{LS} = (R^T R)^{-1} R^T Q^T b \quad \text{}$$
    This expression gives the LS solution. To justify back substitution, we consider the original LS minimization problem:
    $$\min_x ||Ax - b||_2^2 \quad \text{}$$
    We can multiply the argument of the norm by the orthogonal matrix $Q^T$ without changing the norm (since orthogonal transformations preserve Euclidean norm):
    $$\min_x ||Q^T(Ax - b)||_2^2 = \min_x ||Q^T A x - Q^T b||_2^2 \quad \text{}$$
    Now, substitute $A = QR$:
    $$\min_x ||Q^T (QR) x - Q^T b||_2^2 = \min_x ||(Q^T Q) R x - Q^T b||_2^2 = \min_x ||R x - Q^T b||_2^2 \quad \text{}$$
    Let $Q^T b = \begin{bmatrix} z \\ \star \end{bmatrix}$ where $z$ is the portion corresponding to the rows of $R$, and $\star$ is the remaining part (typically zero for the case $A$ is $k \times (L+1)$ and $R$ is $(L+1) \times (L+1)$ where $k > L+1$). The transformed problem becomes:
    $$\min_x \left\| R x - \begin{bmatrix} z \\ \star \end{bmatrix} \right\|_2^2 \quad \text{}$$
    This can be rewritten as:
    $$\min_x \left( ||Rx - z||_2^2 + ||\star||_2^2 \right) \quad \text{}$$
    To minimize this expression, we need to make $||Rx - z||_2^2$ as small as possible. This is achieved by setting $Rx - z = 0$, or $Rx = z$.
    Since $R$ is an **upper triangular matrix**, the system $Rx = z$ is trivial to solve using **back substitution** (starting from the last equation and working backwards). This process is central to QRD RLS algorithms for computing the filter coefficients $w_{LS}[k] = R^{-1}[k]z[k]$.

2.  **How is Chapter-9, slide 32 used in derivation of QRD LSL? See january 24 2020: Q2.1**

    Chapter-9, slide 32, introduces the **Givens rotation** as a basic tool for QR decomposition and updating. A Givens rotation is an orthogonal transformation that can selectively zero out an element in a vector. Specifically, for a vector $\mathbf{x}$, applying a Givens rotation $G_{i,j,\theta}$ modifies elements $x_i$ and $x_j$ to $x_i' = \cos\theta \cdot x_i + \sin\theta \cdot x_j$ and $x_j' = -\sin\theta \cdot x_i + \cos\theta \cdot x_j$, while leaving other elements unchanged. The rotation angle $\theta$ can be chosen such that $x_j'$ becomes zero.

    In the context of QRD Recursive Least Squares (RLS) algorithms, particularly the **QRD Least Squares Lattice (QRD-LSL) algorithm** (Chapter 10, p.7), these Givens rotations are the fundamental building blocks. The QRD-LSL algorithm is a "fast" RLS algorithm that achieves $O(L)$ computational complexity per update, unlike the standard $O(L^2)$ RLS.

    The derivation of QRD-LSL relies on recursively applying sequences of Givens rotations in a structured way to propagate the triangular factor $R$ and the vector $z$ (from $Q^T d$) in time. Each "layer" in the lattice structure of QRD-LSL corresponds to a stage in the recursive updating, typically involving multiple Givens rotations. Chapter 10, slide 21, confirms this by stating that the QRD-LSL algorithm, which results from such derivations, involves "Six rotations per layer." These rotations are precisely the Givens rotations described on Chapter 9, slide 32. Therefore, Chapter 9, slide 32 provides the **mathematical operation** (Givens rotation) that is graphically represented as a "rotation cell" in the signal flow graph for QRD updating (Chapter 9, slide 35) and forms the core computational element within each layer of the QRD-LSL structure.

3.  **Chapter-9, slide 33, the set of input signals \[ u\[k\] u\[k-1\] u\[k-2\] u\[k-3\] u\[k-4\] \] is extended to \[ u\[k\] u\[k-1\] u\[k-2\] u\[k-3\] u\[k-4\] v\[k\] \] with v\[k\] independent of u\[k\], is QRD LSL still possible? Sketch a block scheme, omit details.**

    Yes, if the input signals are extended to $\begin{bmatrix} u[k] & u[k-1] & u[k-2] & u[k-3] & u[k-4] & v[k] \end{bmatrix}$, with $v[k]$ independent of $u[k]$, the **QRD-LSL algorithm is still possible**. This scenario describes a **multi-channel adaptive filter**, where the input vector includes samples from more than one distinct source.

    Chapter 10, slides 26 to 29, specifically discusses the "Multi-channel QRD-LSL Algorithm." It states that the derivation of the single-channel QRD-LSL can be "straightforwardly generalized" to obtain the multi-channel version. This means that the core principles and recursive structure, based on Givens rotations, still apply, but the elements being processed would become vectors or matrices, and the internal operations within each lattice layer would become more complex, operating on multiple input streams simultaneously.

    **Sketch of a conceptual block scheme (omitting detailed internal structure):**

    ```
    Input Channel 1 (e.g., u[k]) --------|
                                          |
    Input Channel 2 (e.g., v[k]) --------|
                                          |
                                          |
                                    [Multi-channel]
                                    Lattice Stage 1
                                          |
                                          |
                                          |
                                    [Multi-channel]
                                    Lattice Stage 2
                                          |
                                          |
                                          |
                                         ...
                                          |
                                          |
                                          |
                                   [Multi-channel]
                                   Lattice Stage L
                                          |
                                          |
                                          |
                                       [Output]
    ```
    In this conceptual scheme, each "Multi-channel Lattice Stage" would take multiple input signals (e.g., $u[k]$ and $v[k]$ and their delayed versions, as well as intermediate "forward" and "backward" prediction errors) and produce corresponding output signals, much like the 2-channel example shown in Chapter 10, slide 29. The lattice structure maintains its cascaded, modular nature, but the individual processing blocks (e.g., rotation cells) are adapted for vector/matrix operations.

## Question 3

1.  **For maximally decimated filter banks, provide an intuitive explanation for perfect reconstruction despite aliasing in each channel.**

    In a **maximally decimated filter bank**, the decimation factor $D$ is equal to the number of channels $N$ ($D=N$). A critical consequence of decimation is that it **introduces aliasing** in the individual subband signals. This means that the frequency content of the original signal gets folded back onto itself within each subband after downsampling.

    However, **perfect reconstruction (PR)** can still be achieved. This seemingly counter-intuitive result is possible because the **synthesis filter bank is specifically designed to cancel out these aliasing effects**. The distortion introduced by aliasing in the analysis stage is precisely compensated by the synthesis stage.

    Intuitively, imagine that the information lost or distorted by aliasing in one channel (subband) is present in another channel in a complementary way. The synthesis filters act as a "decoder" that intelligently combines these aliased subband signals. While each individual subband signal might be heavily aliased, the collective set of subband signals contains all the necessary information, and the synthesis filters know exactly how to linearly combine these aliased components such that the aliasing terms cancel out, leaving only the original signal (or a delayed version of it). The `DFT/IDFT filter bank` example is a simple case where this is shown to work even with non-ideal filters that produce significant aliasing. The overall system's transfer function becomes a pure delay, $Y(z) = z^{-\delta}U(z)$, despite the presence of aliasing terms in intermediate stages.

2.  **Compare maximally decimated filter banks with oversampled filter banks. What are the advantages/disadvantages of oversampling?**

    Here's a comparison between maximally decimated filter banks (MDFB) and oversampled filter banks (OSFB):

    **Maximally Decimated Filter Banks (MDFB):**
    *   **Definition:** The decimation factor $D$ is equal to the number of channels $N$ ($D=N$).
    *   **Sampling Rate:** The total number of samples across all subbands is equal to the number of samples in the original fullband signal. This implies **maximal efficiency** in terms of data rate.
    *   **Aliasing:** Aliasing is inherently introduced in the subband signals due to critical downsampling. While perfect reconstruction is possible, it relies heavily on the synthesis bank precisely canceling this aliasing.
    *   **Design Complexity for PR:** Achieving perfect reconstruction (PR) can be challenging. The PR condition for $D=N$ involves the product of square polyphase matrices $R(z)E(z) = z^{-\delta}I_D$. If analysis filters $E(z)$ are FIR, synthesis filters $R(z)$ often turn out to be IIR (infinite impulse response), which can lead to stability concerns. Designing FIR PR-FBs in this case requires very specific "unimodular" or "paraunitary" matrix transfer functions for $E(z)$, which significantly **limits design flexibility**. For DFT-modulated FBs, this leaves "not much design freedom".

    **Oversampled Filter Banks (OSFB):**
    *   **Definition:** The decimation factor $D$ is less than the number of channels $N$ ($D<N$).
    *   **Sampling Rate:** The total number of samples across all subbands is greater than the number of samples in the original fullband signal. This results in **redundancy**.
    *   **Aliasing:** Oversampling can allow for reduced aliasing in subbands, although aliasing might still be present depending on the design.
    *   **Design Complexity for PR:** The PR condition $R(z)E(z) = z^{-\delta}I_D$ involves a product of a "short-fat" matrix $R(z)$ (D-by-N) and a "tall-thin" matrix $E(z)$ (N-by-D). This structural difference provides **additional design flexibility**. It is generally easier to find FIR synthesis filters $R(z)$ for FIR analysis filters $E(z)$ compared to the maximally decimated case.

    **Advantages of Oversampling:**
    *   **Increased Design Flexibility:** This is the primary advantage, making it easier to meet both filter specifications (e.g., stopband attenuation, passband ripple) and the perfect reconstruction property.
    *   **Robustness:** While not extensively detailed in the sources provided, the redundancy often makes oversampled systems more robust to quantization noise and errors introduced by subband processing (e.g., compression, noise reduction).
    *   **Improved Performance in Applications:** For example, in hearing aids, oversampling with multiple microphones allows for advanced noise reduction techniques like multi-microphone beamforming.

    **Disadvantages of Oversampling:**
    *   **Higher Computational Cost:** Due to the redundancy (processing more samples in total across subbands), OSFBs generally incur higher computational complexity compared to MDFBs.
    *   **Increased Latency:** Processing multiple samples can lead to increased processing delay compared to time-domain sample-by-sample processing.

3.  **Design a DFT modulated filter bank with 4 channels and 3 fold decimation. Give relevant formulas.**

    To design a DFT-modulated filter bank with 4 channels and 3-fold decimation, we have the following parameters:
    *   Number of channels: $N=4$
    *   Decimation factor: $D=3$

    Since $D < N$ (3 < 4), this is an **oversampled DFT-modulated filter bank**.

    The design procedure for DFT-modulated filter banks revolves around designing a single "prototype" analysis filter, $H_0(z)$, from which all other analysis filters $H_n(z)$ are derived by frequency shifting:
    *   **Analysis Filters:**
        $$H_n(z) = H_0(z \cdot e^{-j2\pi n/N}), \quad \text{for } n=0, \dots, N-1 \quad \text{}$$
        For $N=4$, this means:
        $H_0(z) = H_0(z)$
        $H_1(z) = H_0(z \cdot e^{-j2\pi /4})$
        $H_2(z) = H_0(z \cdot e^{-j4\pi /4})$
        $H_3(z) = H_0(z \cdot e^{-j6\pi /4})$

    *   **Polyphase Decomposition:**
        For efficient realization, the prototype filter $H_0(z)$ is decomposed into polyphase components. The appropriate number of polyphase components $N'$ is given by $N' = \frac{N \cdot D}{\text{gcd}(N,D)}$.
        In this case, $N=4$ and $D=3$, so $\text{gcd}(4,3)=1$.
        $$N' = \frac{4 \cdot 3}{1} = 12$$
        So, $H_0(z)$ is expressed using its 12-fold polyphase components $E'_{n'}(z^{12})$:
        $$H_0(z) = \sum_{n'=0}^{N'-1} z^{-n'} E'_{n'}(z^{N'}) = \sum_{n'=0}^{11} z^{-n'} E'_{n'}(z^{12}) \quad \text{}$$

    *   **Analysis and Synthesis Polyphase Matrices:**
        The analysis filter bank can be represented by a tall-thin matrix $E(z)$ (N-by-D) and the synthesis filter bank by a short-fat matrix $R(z)$ (D-by-N). These matrices are structured using the polyphase components of $H_0(z)$ and $F_0(z)$ respectively, in conjunction with DFT matrices.
        In general, for oversampled DFT-modulated FBs:
        $$E(z) = F^{-1} \cdot B(z^{D'}) \quad \text{}$$
        $$R(z) = C(z^{D'}) \cdot F \quad \text{}$$
        Where $F$ is the $N \times N$ DFT matrix, and $B(z)$ (N-by-D) and $C(z)$ (D-by-N) are sparse matrices containing the polyphase components. For this specific case ($N=4, D=3$), $B(z)$ would be $4 \times 3$, and $C(z)$ would be $3 \times 4$. The construction of $B(z)$ and $C(z)$ from the $E'_{n'}(z^{12})$ components involves mapping based on the decimation and channel numbers, similar to Example 2 in Chapter 14.

    *   **Perfect Reconstruction (PR) Condition:**
        The PR condition for filter banks (assuming subband processing has 'output=input') is given by the product of the synthesis and analysis polyphase matrices:
        $$R(z)E(z) = z^{-\delta}I_D \quad \text{}$$
        where $\delta$ is an integer delay and $I_D$ is the $D \times D$ identity matrix.
        For DFT-modulated filter banks, this condition simplifies to:
        $$C(z^{D'}) \cdot B(z^{D'}) = z^{-\delta}I_D \quad \text{}$$
        For oversampled filter banks ($D<N$), this condition is generally easier to satisfy while keeping $E(z)$ and $R(z)$ as FIR filters, providing more design freedom. The challenge is to design the prototype $H_0(z)$ (and thus its polyphase components $E'_{n'}(z^{N'})$) such that it meets the filter specifications (e.g., passband ripple, stopband attenuation), and then find corresponding synthesis filter components $R'_{n'}(z^{N'})$ that satisfy the PR condition.

## Question 4 (about acoustic modem)

1.  **What is the relevance of channel equalisation in the acoustic modem?**

    The acoustic modem transmits digital signals over an acoustic channel, which includes a loudspeaker, the physical room, and a microphone. This channel is modelled by a **linear discrete-time transfer function $H(z)$**, representing the acoustic impulse response.

    The relevance of channel equalisation in this context is paramount because real-world acoustic channels introduce significant distortions to the transmitted signal. These distortions include:
    *   **Dead time, early reflections, and reverberation:** The acoustic impulse response contains multiple echoes and decays over time, causing transmitted symbols to "smear" into subsequent symbols.
    *   **Inter-Symbol Interference (ISI):** This smearing effect, known as ISI, makes it difficult for the receiver to distinguish between consecutive transmitted data symbols, leading to errors in decoding the digital information.

    **Channel equalisation is crucial to undo these distorting effects**. In the Orthogonal Frequency Division Multiplexing (OFDM) scheme used by the acoustic modem, equalisation is ingeniously simplified:
    *   The channel's linear convolution in the time domain is transformed into **scalar multiplication in the frequency domain for each subcarrier**. This is achieved by adding a "cyclic prefix" to each transmitted OFDM symbol.
    *   This transformation allows for a very efficient equalisation technique called **"1-tap FEQ" (Frequency-domain Equalisation)**. After performing a Fast Fourier Transform (FFT) at the receiver, the received signal on each subcarrier $Y_{\tilde{k}}(n)$ is simply the product of the transmitted symbol $X_{\tilde{k}}(n)$ and the channel's frequency response $H_n$ at that specific carrier:
        $$Y_{\tilde{k}}(n) = H_n \cdot X_{\tilde{k}}(n) \quad \text{}$$
    *   Equalisation then involves a simple **component-wise division** by $H_n$ for each carrier in the frequency domain to estimate the original transmitted symbol:
        $$\text{estimate}\{X_{\tilde{k}}(n)\} = (H_n)^{-1} \cdot Y_{\tilde{k}}(n) \quad \text{}$$
    Without effective channel equalisation, the severe distortions introduced by the acoustic environment would make reliable digital communication impossible.

2.  **What is the relevance of the prefix in OFDM? What are the requirements for this prefix?**

    The "cyclic prefix" (CP) is a **fundamental component of OFDM** that addresses the crucial issue of channel distortion.
    *   **Relevance:** The primary relevance of the CP is to **transform linear convolution (caused by the channel) into circular convolution**. This is essential for the OFDM principle to work, as it allows the channel's effect to be represented as simple scalar multiplications in the frequency domain for each subcarrier. Without the CP, inter-symbol interference (ISI) from previous symbols and inter-carrier interference (ICI) between subcarriers would corrupt the received signal, complicating or preventing frequency-domain equalisation.
    *   **Mechanism:** At the transmitter, the CP is formed by copying the last $L$ samples of an OFDM symbol (of length $N$) and appending them to the *beginning* of that symbol, resulting in an $(N+L)$-sample segment for transmission. At the receiver, these $L$ samples corresponding to the CP are then discarded before the FFT. This ensures that when the channel performs a linear convolution on the extended symbol, the central $N$ samples of the received signal correspond to a circular convolution of the original $N$-sample symbol with the channel's impulse response.

    **Requirements for this prefix:**
    *   The length of the cyclic prefix, $L$, must be **at least as long as the order (or effective length) of the FIR channel model**. If the channel impulse response extends beyond the CP, residual ISI will occur.
    *   It ensures that the matrix representing the channel's effect on the received segment (after CP removal) is a **circulant matrix**. This is a critical property because circulant matrices are diagonalized by the Discrete Fourier Transform (DFT) matrix, which is precisely why OFDM can use FFT/IFFT for modulation and demodulation and achieve simple frequency-domain equalisation.

3.  **How does one derive a channel model for the acoustic modem? What if one wants to equalise without modelling the channel?**

    **Deriving a Channel Model for the Acoustic Modem:**
    The acoustic modem project involves characterising the composite channel, from the digital transmit signal (Tx) through the loudspeaker, acoustic environment, microphone, and back to the digital receive signal (Rx). This entire transmission channel is modelled as a **discrete-time FIR (Finite Impulse Response) transfer function**, $H(z) = h_0 + h_1 z^{-1} + \dots + h_L z^{-L}$.

    The process to derive this channel model is a **parameter estimation experiment**:
    1.  **Transmit a Known Signal ($x_k$):** A pre-defined "favourite signal" $x_k$ is sent from the transmitter through the acoustic channel.
    2.  **Record the Corresponding Output Signal ($y_k$):** The signal received at the microphone and converted back to digital form is recorded as $y_k$.
    3.  **Least Squares (LS) Estimation:** The relationship between the transmitted signal $x_k$ and the received signal $y_k$ can be expressed as a convolution:
        $$\begin{bmatrix} y_k \\ y_{k+1} \\ \vdots \\ y_{k+K} \end{bmatrix} = \begin{bmatrix} x_k & x_{k-1} & \dots & x_{k-L} \\ x_{k+1} & x_k & \dots & x_{k+1-L} \\ \vdots & \vdots & \ddots & \vdots \\ x_{k+K} & x_{k+K-1} & \dots & x_{k+K-L} \end{bmatrix} \cdot \begin{bmatrix} h_0 \\ h_1 \\ \vdots \\ h_L \end{bmatrix} \quad \text{}$$
        This equation is an overdetermined system $Y = X \cdot H_{coeffs}$. The channel coefficients $h_0, \dots, h_L$ are then estimated by minimizing the squared error between the observed $y_k$ and the predicted output. This is a linear least squares problem solved by finding $\min_{h_0, \dots, h_L} ||\mathbf{Y} - \mathbf{X} \cdot \mathbf{H}_{coeffs}||_2^2$. The solution can be obtained using standard numerical methods (e.g., in Matlab, this is a single line of code).

    **What if one wants to equalise without modelling the channel?**
    The provided sources primarily describe **channel modelling as a prerequisite for equalisation** in the OFDM acoustic modem. The 1-tap FEQ approach explicitly relies on having the channel's frequency response $H_n$ for each subcarrier, which is derived from the estimated channel model $H(z)$.

    However, the concept of **adaptive equalisation** is introduced for later weeks of the acoustic modem project (Week 7-8). This suggests a scenario where an explicit, fixed "model" of the channel may not be needed upfront, but rather the equaliser continuously *learns* and *adapts* its parameters to the channel's characteristics. The source notes that this involves "decision-directed adaptive equalization" (see Part III of the course). While the source does not detail how this is done "without modelling the channel", it refers to "channel estimation and/or equalizer (FEQ) initialization/updating based on transmitted training symbols" for Weeks 5-6.

    This implies that the system does not need a pre-computed model. Instead, it uses:
    *   **Training Sequences:** Known data sequences are transmitted, allowing the receiver to estimate the channel's properties (or the required equalization parameters directly).
    *   **Adaptive Algorithms (e.g., LMS, RLS):** These algorithms (discussed in Chapters 8 and 9) continuously adjust the equaliser's coefficients based on the error between the received signal and the desired (or reconstructed) signal, effectively adapting to the channel without requiring a precise, static model. The goal is to track time-varying channels. While these algorithms inherently estimate channel characteristics (or their inverse), they do not necessarily require a full, explicit model $H(z)$ to be computed and maintained, but rather adapt the equalization parameters directly.

# **13 augustus 2018**

## Question 1

1.  What are noise transfer functions? Explain how such noise transfer functions are used in the analysis of quantization effects in filter implementation.




	Chapter 6: each multiplier and adder introduces noise. The transfer function from e\[k\] to the output is the noise transfer function. It gives more info about the influence of  each noise source  to the output. This means that given a filter realisation and assuming a linear model, we can lump all the noise-sources together in one equivalent source.

As the quantisation introduces noise (after a mult or add), if you study the noise you are studying the influence of that quantisation on the complete system.

1.  Do the properties of the quantization mechanism play a role in such analysis?



	(slide 20\) Different quantizations gives different errors \=\> different noise. This gives different noise mean and variation \-\> important for the analysis

2.  The analysis relies on linearity (explain) whereas quantization is a non-linear operation. Could this be a contradiction?




   The analysis we use is statistical it assumes all noise sources are independent (white)  and the quantisation error is random. Quantization may be non- linear, the error is linear?????  

   Quantization is non-linear and therefore produces some errors which are known as quantization errors. These errors result in what is known as quantization noise. The noise itself is viewed as additive white gaussian noise so it is equal for all frequencies. 

           The filter system which is being studied is assumed to be linear time invariant (LTI), it only uses additions, multiplications, and delays. What is assumed in the noise analysis is that the noise sources from quantization have a linear relation to the output (so are added). Therefore the noise can come from a non linear source, but the analysis relies on the circuit being linear.   
m	In the noise analysis we assume quantisation noise to be additive, but this is not actually the case. You can not just add it after a multiplication since it is dependent on which numbers are added, this makes it very unpredictable (see cycle errors)

## Question 2

1.  In a maximally decimated (MD) filter bank aliasing usually occurs because of the down-sampling operation. Provide an intuitive explanation why perfect reconstruction (PR) is still possible, in spite of the downsampling and aliasing.




   If we choose our synthesis filters in a way that they restore the aliasing distortion, PR is possible \-\> slides 24-28. If we look at all filters in total we still have all the information available despite the aliassing. 

2.  What are DFT modulated filter banks? What are the advantages of such FB's?



   DFT modulated filter banks are uniform filter banks that are based on a polyphase decomposition of a prototype filter H0 and followed by an inverse DFT, hence all the other Hi filters are derived from only one prototype filter. The main advantage is that this kind of filter banks is that are easier to design:  yodo : you only design one\!\!\! The rest of the filters are shifted versions of the prototype filter. Low computational cost also i think...  
   Low computational cost because only N polyphase components ( \= 1 filter)  and DFT versus N^2 polyphase components ( \= N filters).

3.  How can DFT-modulated PR filter banks be designed?



   Maximally decimated:  
4) Design prototype H\_0(z)  
5) Calculate E\_n(z) \= polyphase component  
6) Assuming all E can be inverted \-\> choose R

	\!\!\! not every E stable \-\> choose E unimodular or paraunitary\!\!\!  
	Not a lot of freedom  
	Oversampled \-\> the same but more E and R so more freedom in design.

## Question 3

1.  Explain the main trick that is used in the derivation of the QRD-LSL algorithm.



	LSL \= RLS?? No, LSL \= H9 part 2, fast algorithm for FIR RLS LSL \= Least square lattice, RLS \= Recursive least squares  
As most of the input vector is reused in for the next input vector (h\[k\] \-\> h\[k-1\]; h\[k-1\] \-\> h\[k-2\];.....  
On slide 32 is shown that when a random permutation is applied to the input, the residues remain the same.  
In slide 35 it is shown that the residual for a given problem is also the residual for other, related problems; for example $\epsilon^{k-2}_{k-1:k+1}$ may be viewed as the epsilon-output of a 1-dimensional RLS problem, with left-hand side $\epsilon^{k+1}_{k-1:k}$ and right-hand side $\epsilon^{k-2}_{k-1:k}$. After a delay element this becomes $\epsilon^{k-3}_{k-2:k}$. Since we now have a way to generate this epsilon, the other way is redundant and thus can be removed. This process is then repeated until the SFG on slide 37 is reached.

Can someone explain how we can calculate the filtercoefficeint with this? ( i found a formula but it only uses the R matrix, and with this there is no R...

Filter coeff are not calculated (slide 22\)

1.  Compare the complexity of the QRD-LSL algorithm with the complexity of LMS.



   LMS $\rightarrow$ O(6L)\--\> moet dit niet 2L multiplications zijn? (slide 16\) en kan big O-notatie hier gebruikt worden?  
   QRD-LSL $\rightarrow$ O(24L) $\rightarrow$ en dit moet 24\*L multiplications zijn, niet O(24L)

2.  In an acoustic echo cancellation scenario with one loudspeaker and two microphones (ie. where an echo contribution is to be cancelled in each of the two microphone signals), is it possible to apply a QRD-LSL-algorithm? Sketch an efficient realisation (clearly defining input and output signals).



   The input is equal for both microphone signals, but the desired output is different. By simply adding an extra desired signal we can reuse the same procedure.  
   Do we need to calculate an epsilon for both microphone signals? And can we use the same R matrix for both signals?  
   Yes different epsilons are needed, remember that epsilon is: e  \= d \- w\*x. So if there is another desired signal d, then there is also another epsilon. 

## Question 4: Acoustic modem project

1.  Explain how the OFDM modulation format (including a cyclic prefix) provides an easy equalization of the transmission channel. What are conditions that the transmission channel has to satisfy for this 'cyclic prefix trick' to work properly?



The OFDM frame together with the prefix allows for a circular convolution. In the receiver, the L samples corresponding with the prefix are thrown away which results in a circulant matrix. This circulant matrix can then be factorized using IDFT/DFT( H= F^-1 \* diag(H0,..,Hn-1) \* F). With this, a diagonal matrix is obtained. The resulting output Y is then simply the input X multiplied with some scalar H(all in frequency domain), so the X can be estimated using component wise division. The prefix length needs to be longer than the impulse response of the channel. (slide 31-35\`)

1.  If a channel model is required for the equalization, explain how it can be derived. Is it possible to run the equalization without first deriving a channel model?




	A channel model can be acquired by using trainingframes?? The data in these frames is known at the receiver, so the channel model can be derived with a least squares estimation.  
By measurement, and ise slide 19

# **16 augustus 2017**

## Question 1

1.  What are noise transfer functions? Explain how such noise transfer functions are used in the analysis of quantization effects in filter implementation.



2.  Do the properties of the quantization mechanism play a role in such analysis?



3.  The analysis relies on linearity (explain) whereas quantization is a non-linear operation. Could this be a contradiction?



## Question 2

1.  What are DFT modulated filter banks? What are the advantages of such FB's?



2.  How can maximally decimated DFT filter banks be designed?



3.  How can oversampled DFT filter banks be designed?

## Question 3

1. What is a rank-1 update? How does it define the complexity?



2.  Residuals: explain a priori and a posteriori residuals of SFG



   The a priori residual is the difference between the desired signal and the filtered input, using the filter coefficients of the previous iteration.  
   The a posteriori residual is the difference between the desired signal and the filtered input, using the filter coefficients of the current iteration.

3.  Is it useful to use two exponential weighting factors if the output and input are very different: static input and non static output (for example)? (something like this)



 I don't think so: you're supposed to use the same weighting factor for both the desired (input) and the received (output) signals (ch.8 slide 37\) else the LS solution won't calculate the filter coëfficient correctly

## Question 4 (Acoustic modem project)

1.  Explain how the OFDM modulation format (include cyclic prefix) provides easy equalization of the transmission channel. What conditions are to be met for the cyclic prefix?



2.  Explain how RLS is used for channel equalization in the acoustic modem project. What input for the adaptive filter? What is the desired output signal? What is the order of the filter? (awnser: 1, for every carrier/subband)



Does anyone have an idea?  
I think we used NLMS in week 7 (and not RLS) . And the input of the adaptive filter is the signal received at te microphone (x\[k\]\*h\[k\]+n\[k\]). The desired output is the output of the decision device which takes the output of the adaptive filter as input.   
The order of the filter is 1, you try to find an estimation for every subband carrier channel. 