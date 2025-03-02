
- [Life Cycle Assessment](#life-cycle-assessment)
  - [Basics of Life Cycle Assessment](#basics-of-life-cycle-assessment)
  - [Goal and Scope definition](#goal-and-scope-definition)
    - [Goal](#goal)
    - [Scope](#scope)
    - [System Boundaries](#system-boundaries)
  - [The basics of life cycle inventory](#the-basics-of-life-cycle-inventory)
    - [Multi-functionality](#multi-functionality)
  - [Marginal vs Average](#marginal-vs-average)
  - [2 modelling approaches](#2-modelling-approaches)
    - [Modelling context](#modelling-context)
    - [The basics of life cycle impact assessment](#the-basics-of-life-cycle-impact-assessment)
    - [Interpretation](#interpretation)
  - [Input-output LCA](#input-output-lca)

# Life Cycle Assessment

## Basics of Life Cycle Assessment

We need to quantize the impact human actions have on the environment. This can be categorized in 3 main categories, namely : 

1. Ressource depletion
2. Ecosystem quality
3. Human health

They are not easy to quantize but we can quantize the production and equivalent production of certain molecules which have been proven to have various effect on those 3 main issues.

## Goal and Scope definition

### Goal 

Before any LCA, it is important to put boundaries and to explain to the reader our goal and intended application. We need to specify the target audience, be honest with our method (show its limitation), comparative studies need to be showcased too and explicitly say the commissioner of the study.

### Scope

We need to set the *functional unit* (primary goal or capacity aimed) and also set clear system boundaries to properly take into account the in and out.

We also need to indicate the principles for handling *multi-functionality*, LCIA impact categories, data quality requirements, critical review needs. We often need high quality data to have the best and most effective LCA.


#### Functional Unit

It is a metric that represents the actual unity of a given product for a given task (eg: $m^2$ covered for a paint bucket, $tons$ for a crane, ...). It needs to set as a comparison  and be equivalent (comparing apple to apple). 

Definition : *The functional unit names and quantifies the qualitative and quantitative aspects of the function(s) along the questions “what”, “how much”, “how well”, “where” and “for how long”. The functional unit must allow comparison between alternatives.*

Sometimes finding the right unit is quite tricky (eg: lamps) there is many units that represents different use cases. We also need to notice that the FU describes a **need** not a solution. Sometimes to be more efficient we need to change the design and zoom out.

It is hard to be totally equivalent and to exactly build a perfect metric for complex products. Often we won't have **complete functional equivalences** (eg: meeting or videoconfering). We need some qualitative descriptions and sensitivity analysis. We need to be careful about possible rebounds effect ! 

By setting a specific FU we are already implicitly declaring the boundaries of our system. The data collection can only start after converting the functional unit towards reference flows. So we have different references flows for each alternative.

#### Reference flow

Definition : *The reference flow is the flow (or flows) to which all other input and output flows (i.e. all elementary flows and non-reference product and waste flows) quantitatively relate.*

The FU is kinda like the goal and the reference flow indicates how much (quantity) we need to do a certain task specified by the FU.

### System Boundaries

We need to set *time, geographic* boundaries but also life cycle stages. Data and results can strongly vary according to location and time. For example, an electric car in India or in Norway won't have the same impact.

It is important to never omit some data and be able to measure the impact and not simply take the weight blindly into account. The boundaries depends on the goal of the study. Example : what is the consumption of a phone do we take into account the consumption of the phone system ?

#### Rebound effect

It is the fact that replacing something by something that is on paper better and will requires less reference flow for the same functional unit or less consumption is not always the best idea. We have some *unexpected effect*. For example replacing some light bulbs, it wasn't only providing light but also heat. So the increase of heating we will require will lead to maybe even more $CO_2$ emissions than first envisioned. The heat that is wasted for a light bulb is actually converted in "good" heat for heating houses.

We often speak about *eco-efficiency* where we try to be cheaper and less impact but if people spare money they may use the extra money to book holidays or carbon intensive things. We need to be cautious with this extra freedom we give when doing eco-efficient alternatives.

* You can use (but be careful with) cut-off criteria
* System boundaries depend on the goal of your study
* Consider (and document) rebound effects
* In comparative studies, processes identical to all alternatives can be excluded
  * Yet be careful not to lose important insights (you might be optimizing irrelevant things)
* Determining system boundaries can occur iteratively

![Data quality](image.png)

## The basics of life cycle inventory

![Principle of inventory](image-1.png)

We need to analyze how much is going in and out, in emission but also waste that can be further valorized sometimes. We also need to make the distinction between the *technosphere* and *ecosphere*. When talking about the ecosphere we are taking into account all the ressources that comes from the nature while the technosphere takes into account the economic flows of products and also waste.

We have the idea of **conservation of mass and energy**.

![Typical analysis of flow](image-2.png)

We have two types of processes

* Foreground : site specific data
* Background : market averages

### Multi-functionality

In most processes, we have some *multi-functionality* since they produces more than one *functional flow*. For example we can produce electricity and heat and use them both. We have various type of multi-functionality :

1. Co-production (multi-output)
2. Combined waste processing (multi-input)
3. Recycling (input-output)

How to distribute the impacts of these processes ? That's the main question we are trying to answer. We have 4 approaches that have their strengths and weaknesses :

1. More refined data over subdividing processes (can be expensive or not available)
   * Not partitioning but more refining of the data
2. Partitioning (allocation)
   * We see the cost of producing the two products separately
   * We need to reformulate our FU as a *basket of products*. Not efficient when the processes are somewhere in the process tree.
   * We are distributing the impact of something over an average load for example. We can't use those techniques for marginal things such as lightweight transport.
   * Economic allocation
     * The economic incentive is a good way to partition. The price per kg can be tied with the consumption of functional flows.
     * Can be hard to quantify with fluctuating prices, inflation, market distortions, not always disclosed prices
     * Don't use it when **physical relationships** exist ! Typically for products containing carbon we first have negative $CO_2$ since we are taking the storage but then releasing it later.
3. System expansion
   * A bit like the partitioning instead we are looking just for the main product, never do for by-products or we will have flawed results. We need to set a determining product the first and main goal.
   * Can have negative numbers.
   * Implies that the other functional flows holds the impact of conventional production method (for new material production)
4. Substitution
   * Always focus on the main driving and wanted production functional flow.
   * Primarily used in *consequential approach* but can be used for waste treatment in *attributional studies*.

![Partitioning](image-3.png)

![Bad partitioning when physical link exists](image-4.png)

#### Allocation at point of substitution (APOS)

When we have waste, they can be valorized and transformed. But then we need to take into account the market that is for this kind of product and find the appropriate treating facilities. So we can see this process as a black box but then we need to transform it so we can see the waste as a product. 

Sometimes it is best to simply do a cutoff if the by-products are marginal in term of emissions and impacts.

Issues with our methods.

|                  |                    problem                     |
| :--------------: | :--------------------------------------------: |
| system expansion | you don’t answer the question you started with |
|   substitution   |          which processes are avoided?          |
|   partitioning   |        what are the allocation factors?        |

"*Allocation problem is artefact of wishing to isolate one function. Artefacts can only be cured in an artificial way; there is no “correct” way,
even not in theory*"

## Marginal vs Average

Marginal is a sort of short term metric where we ask ourselves "how will X change if we stop doing this ?" Usually it will lead to a stress or a short term change on one specific sector.

But this can also lead to long term marginal where we dezoom and take a closer look to change as a whole.

## 2 modelling approaches

|       Specifications        |                    Attributional approach                    |              Consequential     approach              |
| :-------------------------: | :----------------------------------------------------------: | :--------------------------------------------------: |
|         Description         | Like book-keeping, we see the sum of impacts of all products | Scenario analysis, calculated impacts reflect change |
|          Data type          |                         **average**                          |                     **marginal**                     |
| Solve multi-functionality ? |                 Partitioning and allocation                  |           Substitution (avoided products)            |

We need to be careful for the consequential approach as it uses *substitution*. We need to ask ourselves "*What is the determining product ?*", "*What is the avoided technology ?*" (technology we are replacing with our innovation). Some new technology can either add extra capacity to the market (*increasing markets*) or simply force some old technology to shut down (*decreasing markets*). When we are looking short or long term it influences the investment but not the *capacity utilization*.

Constrained markets (regulated markets) are not marginal !

### Modelling context

![Modelling-context](image-5.png)

* Ecoinvent advice for attributional
  * Studies at a societal level, where the entire environmental impact of all human activities is studied, with the aim of identifying areas for improvement
  * Studies on environmental taxation, where the focus is less on the consequences of the tax, but rather on who is to carry the burden
  * Studies that seek to avoid blame or to praise or reward for past good behavior
* Ecoinvent advice for consequential models:
  * Studies that investigate the long-term consequences(including changes in production capacity) of small-scale decisions (that don’t change overall market conditions)

### The basics of life cycle impact assessment

We have multiple steps : 

* **Classification** : where does it contribute to ?
  * What is the contribution to global warming, acidification, ...
* **Characterization** : how much does it contribute ?
  * Put everything into $CO_2$ equivalent. To have a common reference
* **Normalisation** : is this much ?
  * Normalize to the region, see how much contribution it is for europe, world, ...
* **Weighting** : is this important ?
  * Subjective step where we arbitrarily give more importance to specific part.

We need to be careful with *characterization* as it by itself contains a certain weighting and choice. Namely, we only see the impact of a given compound on a 100 year scale. So some molecules can be more harmful on the short term but quickly degrade, this behavior won't be seen in the $CO_2$ equivalent methodology. Moreover, we can always quantize this into a carbon footprint (human toxicity, eco-toxicity, resource depletion). This is what we call the **mid-point**.

The **end-point** is more uncertain as we try to predict and measure the impacts and possible scenarios. We also add the weighting method to translate specific views **Individualist, Hierarchist and Egalitarian**

### Interpretation

We can :

1. Draw conclusions
2. Sensitivity analysis
3. Report
4. Quality control (peer review)

## Input-output LCA

We need to put boundaries but it can be quite tricky to partition it.

![Partitioning](image-6.png)

But it can be hard to measure and quantify the bi-directional relationships that exists between all the sectors. We can build this IO model based on the purchases between the sectors. 

* Sum of Value Added (non-inter-industry purchases) and Final Demand is GDP.
* Transactions include intermediate product purchases and row sum to Total Demand.
* From the IO Transactions table, form the Technical Requirements matrix by dividing each column by total sector input – matrix D. Entries represent direct inter-industry purchases per dollar of output.

With those tables we can create some matrices indicating the consumption between the sectors.

![Example matrices](image-7.png)

![Final Matrix](image-8.png)

| Output from sectors    | Input to sectors | Intermediate output $O$ | Final demand $F$ | Total output $X$ |
| ---------------------- | ---------------- | ----------------------- | ---------------- | ---------------- |
|                        | 1                | 2                       | 3                | n                |       |       |       |
| 1                      | $X_{11}$         | $X_{12}$                | $X_{13}$         | $X_{1n}$         | $O_1$ | $F_1$ | $X_1$ |
| 2                      | $X_{21}$         | $X_{22}$                | $X_{23}$         | $X_{2n}$         | $O_2$ | $F_2$ | $X_2$ |
| 3                      | $X_{31}$         | $X_{32}$                | $X_{33}$         | $X_{3n}$         | $O_3$ | $F_3$ | $X_3$ |
| n                      | $X_{n1}$         | $X_{n2}$                | $X_{n3}$         | $X_{nn}$         | $O_n$ | $F_n$ | $X_n$ |
| Intermediate input $I$ | $I_1$            | $I_2$                   | $I_3$            | $I_n$            |       |       |       |
| Value added $V$        | $V_1$            | $V_2$                   | $V_3$            | $V_n$            |       | GDP   |       |
| Total input $X$        | $X_1$            | $X_2$                   | $X_3$            | $X_n$            |       |       |       |

$$
\sum X_{ij} + F_i = X_i \qquad \text{with } X_i = X_j \text{ and } A_{ij} = X_{ij}/X_j\\
\sum (A_{ij} X_j) + F_i = X_i\\
F = [I-A] X \quad X = [I-A]^{-1} F
$$

We normalize those matrix to have a view like "how to make 1 € ?" and when building those matrices, we can even incorporate the additional demand from a specific sector using $X$. And with those simple notation we can also quantify the environmental impact of various production from different sectors.

![Hazardous](image-9.png)