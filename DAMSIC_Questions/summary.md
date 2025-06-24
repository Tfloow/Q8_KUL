---
title: "DAMSIC Questions"
author: Thomas Debelle
geometry: margin=2cm
papersize: a4
date: \today
toc: true
toc-depth: 3
titlepage: true
titlepage-logo: KULlogo.png
template: eisvogel
subtitle: "[An Open-Source Summary](https://github.com/Tfloow/Q8_KUL)"
copyright: "© 2025 Thomas Debelle. This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
copyright-link: "https://creativecommons.org/licenses/by-nc-sa/4.0/"
output: pdf_document
---

# Recap of questions per chapter

## S&H

| Q     | page | Q     | page |
| :---- | ---: | :---- | :--- |
| **1** |   19 | **2** | 31   |
| **3** |   44 |       |      |

## DAC

| Q     |  page | Q     | page |
| :---- | ----: | :---- | :--- |
| **4** | 16-17 | **5** | 28   |
| **6** |    36 |       |      |

## ADC

| Q      |  page | Q      | page |
| :----- | ----: | :----- | :--- |
| **7**  |  9-11 | **8**  | 38   |
| **9**  | 40-41 | **10** | 56   |
| **11** |    63 | **12** | 71   |
| **13** |    89 |        |      |

## $\Sigma - \Delta$

| Q      |     page | Q      | page  |
| :----- | -------: | :----- | :---- |
| **14** | 35,42,45 | **15** | 53    |
| **16** |    11,37 | **17** | 46-48 |
| **18** |    64-65 | **19** | 11,37 |
| **20** |       XX |        |       |

## Voltage ref

| Q      | page | Q      | page |
| :----- | ---: | :----- | :--- |
| **21** |   XX | **22** | 29   |

## Oscillator

| Q      | page | Q      | page |
| :----- | ---: | :----- | :--- |
| **23** |   XX | **24** | 44   |
| **25** |   XX | **26** | XX   |
| **27** |   28 | **28** | 45   |

## Tuned Amplifiers

| Q      | page | Q      | page |
| :----- | ---: | :----- | :--- |
| **29** |   XX | **30** | 27   |
| **31** |   38 | **32** | XX   |

## DCDC

| Q      | page | Q      | page |
| :----- | ---: | :----- | :--- |
| **33** | 1:23 | **34** | 1:29 |
| **35** | 1:48 | **36** | 2:14 |
| **37** | 2:34 |        |      |

## Wireline

| Q      | page | Q      | page |
| :----- | ---: | :----- | :--- |
| **38** |   XX | **39** | 16   |
| **40** |   XX | **41** | XX   |
| **42** |   27 |        |      |

## Optical

| Q      |  page | Q      | page |
| :----- | ----: | :----- | :--- |
| **43** | 30-39 | **44** | XX   |
| **45** |    XX |        |      |

Used notebook LM on top of already answered questions:

# H05E3A - Exam Questions

Here is a comprehensive response to your query, drawing on the provided sources:

1. Describe the pedestal step and a possible solution for the problem.
    * **Pedestal Step and Solution:**
    The **pedestal step** is a non-ideality observed in Sample and Hold (S&H) circuits, appearing as an **abrupt change in the output voltage ($V_{out}$)** during the transition from the sampling phase to the hold phase. This effect is visually represented as a sudden upward or downward jump in the $V_{out}$ waveform at the moment the input signal is sampled. It is primarily caused by **charge injection from the channel** and by **parasitic capacitance between the gate and output** from the switch as it turns off, specifically due to the switch's drain-capacitance and unintended coupling.

    * A possible solution for pedestal step compensation involves using **half-sized dummy switches**. These dummy switches are designed to absorb the charge from the main switch, thereby reducing the unwanted pedestal step. For this method to work effectively, the charge must split approximately 50% between the main and dummy switches. However, the success of this compensation technique is critically dependent on the **careful timing of clock edges**. If there are unequal impedances on the left and right sides of the main switch, or if clock edges are too fast, it can lead to an unequal charge split, which will diminish the effectiveness of the compensation. Therefore, ensuring that the **impedances are as equal as possible** is crucial for optimal compensation.

2.  Discuss the need for bootstrapped switches in switched-capacitor circuits. 
    * The main issue is the fact that $R_{on} \propto 1/V_{gs}$. So by changing the input voltage we change the RC time constant and so it creates **DISTORTION** which is highly unwanted in TH circuits. Solution --> Keep it constant using **bootstrapping** aka keep a constant $V_{gs}$.
    * So we need to keep $V_{gs}$ high to avoid any saturation. The higher the Vgs the smaller the R_on resistance. We first need to do a hold phase on the cap to charge it up to Vdd then in the track phase that input voltage is added on top of the cap.
    * Challenges: make sure the body diodes do not open which will result in current to substrate, charge lost and latch-up !
    * **Need for Bootstrapped Switches in Switched-Capacitor Circuits:**
    Bootstrapped switches are important components in switched-capacitor (SC) circuits, particularly when **high accuracy** is required. In the context of Delta-Sigma converters, for example, they are specifically utilized **at high accuracies** to mitigate the effects of **clock feedthrough**. 

3.  Discuss offset and noise in the flip-around T/H circuit.
    * With a regular T&H circuit, the signal transfer function should be 1. This means that the sampling capacitor should be equal to the feedback capacitor. This results in a feedback factor of 1/2, so a closed loop gain of two. 
    * An alternative is the flip-around T&H, which uses no feedback capacitor. During both phases, the opamp is in unity gain feedback. The offset and low frequency noise are cancelled out, because they affect both the V_C_hold and the output voltage. The high frequency noise is amplified by a factor of two.
    * The offset voltage cancels out because the opamp creates its own virtual ground in both phases. Noise transfer function from opamp input node to output. The sampled thermal noise on C_hold is still present.
    * ![Equations for Flip around](image.png){ width=75% }


4.  Discuss the effect of the impedance variation in a resistor ladder in resistive DACs
    * **Effect of Impedance Variation in Resistor Ladder DACs:**
    In resistive Digital-to-Analog Converters (DACs) employing a resistor ladder, the output impedance exhibits a significant variation with the input code. This variation is characterized as a **parabolic function**. The equivalent resistance ($R_{eq}(m)$) can be calculated using the formula $R_{eq}(m) = \frac{m(2^N - m)}{2^{N+1}} R_{tot}$, where $m$ is the digital input code and $2^N$ is the total number of resistors. The maximum equivalent resistance, equal to $0.25 \cdot R_{tot}$, occurs at the midpoint of the digital range.

    * This **parabolic variation of impedance** has several detrimental effects on the DAC's performance:
      *   It leads to **signal-dependent current delivery**, meaning the current supplied to the load changes non-linearly with the input signal. In other terms **DISTORTION**
      *   For a fixed capacitive load, the **time constant becomes signal-dependent**, which affects the settling behavior of the DAC output.
      *   Collectively, these signal-dependent characteristics introduce **distortion at high frequencies**, degrading the overall linearity and dynamic performance of the DAC.

5.  Discuss the common-centroid layout in the framework of current-steering DACs.
    * Current steering DAC can be unary or binary. Unary are preferred for MSB to avoid big current switch off and on and binary for LSB.
    * Current steering DACs (unary) are very sensitive to mismatches. Instead of using matrix decoding, where all sources are placed sequentially (according to bit order) in a grid, issue:
      * Doping, oxide thickness not constant
      * PSS drop
      * Clock timing
      * Temperature
    *  they can be placed according to a common-centroid layout. This layout is symmetrical in both dimensions. **Any linear gradient in the production process is cancelled** out by the fact that two opposing sources are used (vertical, horizontal and slant). The addressing of the sources is less straightforward than with matrix decoding. 
    * To go even further, every current cell can be subdivided and distributed across the array with some $Q^2$ schemes which improve reliability against second order effect.

6.  Describe the problem of stray capacitances in the design of capacitive DACs.
    * **Problem of Stray Capacitances in Capacitive DACs:**
    Stray capacitors are capacitance from the switches right next to the (binary scaled) capacitors. The stray capacitor at the left poses no problem (not added to output). The charge of the right one is added to the feedback capacitor, which means that the total charge transferred is no longer correct. The problem can be solved by using four switches per capacitor instead of two.
    * In the charge phase, the first stray cap is charged but not the right one. The trick in the transfer phase is that the charged left cap will have both inputs connected to the same Vref- so it will discharge onto this. Thanks to the virtual ground of the opamp, the right cap will not be charged making the error 0.
    * Right stray is never charged (thanks to virtual ground of the AMP) and left one will charge and discharge on itself

7.  What limits the regeneration in a latch-based comparator, and how can it be improved?
    * Comparators are difficult blocks as we need **High BW, high AMP, High Accuracy, Wide range, Low power** so latch helps with it thanks to a feedback loop but we need a David Goliath latch to still be able to change the value on it. Latch is better than cascade of amp as cascading amp is **SLOWWWWW** + Memory effect.
    * 2 phase latch with first pre-amp and then latch behavior.
    * **Limits to Regeneration in Latch-Based Comparators and Improvements:**
    In a latch-based comparator, the regeneration process, where a small input difference is amplified to a full digital output, is characterized by an exponential growth of the differential voltage $V(t)$ across the latch outputs, given by $V(t) = \alpha V_{LSB} e^{+t/\tau}$. The regeneration speed is fundamentally determined by the **time constant $\tau = C/g_{m,l}$**, where $C$ is the parasitic capacitance at the output nodes and $g_{m,l}$ is the transconductance of the latch's gain stage. Pre amp --> $A_{pre} = \frac{g_{min}}{C} T_{pre}$

    * The regeneration in a latch-based comparator is limited by three regimes based on the input differential voltage ($\Delta V_{in}$):
      *   **High $\Delta V_{in}$**: The regeneration time is limited by the inherent **propagation delay** of the latch circuit. --> Tech constant max speed
      *   **Medium $\Delta V_{in}$**: The comparator operates within the **exponential regime**, where the signal grows exponentially. --> Take a bit of time to get the result $\tau \approx 10 ps$.
      *   **Small $\Delta V_{in}$**: In this critical regime, **noise dominates the input**, leading to potential errors in the decision-making process. This is closely related to the phenomenon of **metastability**, where the comparator fails to produce a stable output within the required time, resulting in an ambiguous output. Metastability can lead to conversion errors in Analog-to-Digital Converters (ADCs).

    * To improve regeneration performance and mitigate metastability errors:
      *   One can **reduce the effective number of bits (N)** in the converter, or conversely, **increase the sampling period ($T_s$)**, which effectively reduces the operating speed. --> longer Pre-amp stage to avoid the small $\Delta V_{in}$.
      *   Another approach is to **reduce the time constant $\tau$**. This can be achieved by decreasing the parasitic capacitance $C$ or increasing the transconductance $g_{m,l}$ of the latch (so higher power consumption, wider NMOS, weak inversion).
      *   While metastability is a critical issue for general comparators, in Delta-Sigma ($\Delta\Sigma$) converters, it is considered **"not an issue"** for the comparator itself because any comparator error will be shaped and subsequently filtered. However, it is essential to ensure that the digital bit fed to the decimation filter is the same as the one fed to the DAC, which typically requires placing a **synchronization latch**.

8.  How can averaging improve the performance of a flash ADC?
    * A flash Analog-to-Digital Converter (ADC) utilizes $2^N-1$ comparators to convert an analog input into an N-bit digital word. A major non-ideality in flash ADCs is **comparator offset**, which results in non-ideal thresholds and contributes to differential non-linearity (DNL) errors.

    * While direct "averaging" of multiple comparator outputs for improved resolution or linearity is not explicitly described, the following related techniques are mentioned that contribute to better performance:
      *   **Auto-zeroing schemes**: These techniques are employed to **cancel comparator offset** and suppress both offset and low-frequency noise within individual comparators. This can be seen as a form of "temporal averaging" or correction within each comparator.
      *   **Comparator with Offset Cancellation**: An approach for open-loop comparator offset cancellation involves selecting a subset (e.g., "four-out-of-eight minimally sized input pairs") from multiple input pairs. While not explicitly stated as averaging their outputs, this selection process aims to achieve a more ideal performance by potentially averaging out random offsets across a pool of devices.
      *   **Majority voting**: In the context of Successive Approximation Register (SAR) ADCs, it's mentioned that **majority voting** can be used to mitigate **comparator noise**. While stated for SAR ADCs, the principle of using multiple decisions to reduce noise and errors could conceptually be applied to other ADC architectures like flash ADCs if multiple comparator outputs are available and processed.

    * Offset of the comparators in a flash ADC can cause linearity problems and lead to DNL/INL. The effect of offset can be reduced by coupling the comparators so that multiple input pairs are used for every decision. This is done with resistive coupling, so that neighboring decisions influence each other. This helps because the signals at the outputs op the comparators add up linearly, but the offsets will add up with root mean square. The overall signal-to-offset ratio will thus increase. The comparator will ‘appear much larger’.
    * More area needed, more power consumption.

9.  Discuss the folding technique, its advantages, and challenges.
    * In a folding circuit, multiple input pairs are cross coupled to ‘fold’ the linear input voltage of a regular comparator. This reduces the range, so less comparators are needed to convert the output of the folding circuit to bits. The conversion is divided into a coarse part (the folding itself, pre-processing) and a fine part (flash conversion of the folding output). This reduces the amount of input pairs: $2^3 + 2^5$ instead of $2^8$. One input pair of the folding circuit will be active (other ones saturated) and which pair will determine the MSB’s.
    * The desired transfer curve of the folding circuit contains non-linearities in the peaks (**distortion at crossover points**). It is not possible to realize this in practice, so when the input voltage is in this range, it will be distorted. A solution to this is by using double the amount of input pairs in two folding circuits. Then we either **interpolate** those two folding circuits or take the one that is working in its **linear** region.
    * There is some delay, and we need some good amplifier to realize the fine conversion.
    * ![Folding circuits](image-1.png){ width=75% }


10. **Advantages and Disadvantages of a 1.5-bit Pipeline Converter Compared to a 1-bit Pipeline Converter:**

    Pipeline converters break down the analog-to-digital conversion into multiple stages, each processing a certain number of bits. The comparison between 1-bit and 1.5-bit stages primarily revolves around trade-offs in speed, complexity, and accuracy.

    **1-bit Pipeline Converter:**
    * Straight forward, check if value is above or below $V_{ref}/2$, multiply by 2, next stage, repeat. If an error before, will ripple through the chain.
    *   **Advantages:**
        *   **Maximum speed**: With its subrange limited to a single bit, it typically uses an amplifier with a 2x gain, which can achieve high conversion speeds.
        *   **Intrinsic linearity**: The 1-bit DAC in its feedback loop is inherently linear, contributing to the overall intrinsic N-bit precision of the converter. A 1-bit DAC is always perfectly linear, and time-domain converters leverage this for excellent linearity.
        *   **Simplicity**: Requires only a single comparator for its analog-to-digital conversion within each stage.
        *   The basic building block is a Multiplying Digital-to-Analog Converter (MDAC).
    *   **Disadvantages:**
        *   **Delay**: The full digital value is available after N+3 clock periods, as each stage processes one bit sequentially. This delay, while exchanged for speed, can be problematic in feedback loops.
        *   Potentially more stages required for a given resolution compared to multi-bit stages, which could increase overall complexity and power (though per-stage power is low).
        *   **Good and accurate settling in all the stages**

    **1.5-bit Pipeline Converter (a type of Multi-Bit MDAC Pipeline Converter):**
    * Will have $\pm V_{ref}/4$ if 2 positive decision, subtract $V_{ref}$, 2 negative add $V_{ref}$ else do nothing.
    * ![Offset doesn't impact precision since added reliability](image-2.png){ width=75% }
    * ![Redundancy](image-3.png){ width=75% }
    *   **Advantages:**
        *   **More aggressive stage-scaling**: By processing more than one bit per stage (e.g., 1.5 bits, 2.5-4 bits), these converters allow for a reduction in the total number of stages required for a given resolution. This can lead to more compact designs.
        *   **Error Correction Margin**: Having more levels per stage (e.g., six segments for 2.5 bits) provides a margin to correct errors that might occur in the comparators.
        *   **Higher Overall Performance**: Can achieve higher effective number of bits (ENOB) at comparable or higher sample rates compared to purely 1-bit per stage designs, as seen in examples where 2.5-bit stages are used at the front-end followed by 1.5-bit stages.
    *   **Disadvantages/Challenges:**
        *   **Slower amplifier settling**: Due to the higher gain required in multi-bit stages (e.g., 4x or 8x gain), the amplifiers need more time to settle accurately.
        *   **More complex DACs**: The first stage requires a multi-level DAC (e.g., a five-level DAC for a 2.5-bit stage) that must maintain the **full accuracy of the entire converter**. This multi-bit DAC is a critical component and its non-linearity due to mismatch can be a significant problem.
        *   **Increased Complexity for DAC Linearity**: Mismatch in multi-bit DACs can generate non-linearity errors. Techniques like **Data Weighted Averaging (DWA)** are used to make these errors noise-like so they can be filtered by oversampling, resulting in much lower harmonic distortion. This adds complexity to the digital processing.
        *   Offset is not removed and we hope that the redundancy will help. Or high-freq noise amplified
11. Opamp Sharing Technique in Pipeline Converters

    The opamp sharing technique in pipeline converters allows a single operational amplifier (opamp) to be used in two subsequent stages of the converter. This approach is implemented by adapting the Multiply-Digital-to-Analog Converter (MDAC) structure to share the opamp between channels.

    The main advantage of this technique is a **significant reduction in power consumption, often by a factor of 2x**. However, this comes with certain trade-offs:
    *   **Offset voltage is not compensated**. No auto-zeroing technique
    *   It can introduce a **memory effect between subsequent samples**.
    *   It is only feasible if the opamp is not required to create a virtual ground during its operation.

12. Differences Between Top-Plate and Bottom-Plate Sampling

    In the context of charge-redistribution converters, sampling involves connecting the input signal to a capacitor bank. The sources describe two primary methods:

    **Top-Plate Sampling:**
    *   **No attenuation of the sampled voltage** occurs.
    *   However, it causes an **attenuation of the reference voltage**.
    *   The Most Significant Bit (MSB) can be determined directly after sampling.
    
    Problematic for high accuracy as not same attenuation between ref and input but faster.

    **Bottom-Plate Sampling:**
    *   This method results in **the same attenuation for both the input and reference voltages**.
    *   A key advantage is that the **input voltage range can be made equal to the reference voltage range**.
    *   A common-mode voltage (VCM) is employed to maintain the comparator input at the desired level.
    
    Trickier setup with the common mode, will be slower but really good for high accuracy ADC. We have a precharge phase.

13. Comparison of Dual-Slope Converter with a Straightforward Slope Converter

    Both dual-slope converters and straightforward slope (or linear approximation/counting) converters belong to the category of linear search converters. They differ significantly in their operation and characteristics:

    **Straightforward Slope (Linear Approximation/Counting) Converter:**
    *   **Operation Principle:** The converter uses a counter to linearly increase the output of a Digital-to-Analog Converter (DAC). A comparator continuously compares this increasing DAC output (V_DAC) with the sampled input signal (V_signal). Once V_DAC exceeds V_signal, the comparator toggles, and the current counter value is stored as the digital output; the counter is then reset.
    *   **Conversion Time:** The output is ready after **$2^N$ clock cycles**, where N is the number of bits. This is considerably slower compared to flash (1 clock cycle) or pipeline (N clock cycles) converters.
    *   **Input Handling:** An input Sample & Hold (S/H) circuit is required to keep the input signal constant during the conversion period.
    *   **Offset:** The comparator offset can be added to the digital output code. Usually we first convert known ref signal then measure actual signal and subtract both of them.
    *   **Applications:** Often used in applications like image sensor readouts, where one ADC per column shares a DAC and counter. Small transistors in comparators in such applications can lead to offset and 1/f noise, necessitating correlated double sampling to measure a known reference and the signal, then digitally subtract the values. Can be used as a tracking converter with minimum changes.

    **Dual-Slope Converter:**
    *   **Operation Principle:** This converter operates in two distinct phases:
        1.  **Integration Phase:** The input signal is integrated for a fixed sample period.
        2.  **Discharge Phase:** The integrated capacitor is then discharged by a fixed reference current. The time taken for discharge is proportional to the integrated input signal, and this time is measured to determine the digital output.
    *   **Conversion Time:** The conversion time is typically **$(2 \cdot 2^N)/f_s$**, making it suitable for slowly varying input signals.
    *   **Offset Cancellation:** A significant advantage is that **offsets are cancelled** due to the two-phase operation, as the same integrator and comparator are used for both the input signal and the reference current. This is an example of a "zero-crossing method" where linearity is primarily required around the zero level.
    *   **Linearity:** Linearity is only required around the zero level for the comparison, as the unknown signal is determined by comparing it to an equivalent signal from the DAC.

