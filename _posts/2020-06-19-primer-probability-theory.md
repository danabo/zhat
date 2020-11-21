---
layout: post
title: "Primer to Probability Theory and Its Philosophy"
date:   2020-06-19
categories: post
---

Probability is a measure defined on events, which are sets of primitive outcomes. Probability theory mostly comes down to constructing events and measuring them. A measure is a generalization of size which corresponds to length, area, and volume (rather than the bijective mapping definition of cardinality).

<!--more-->

* Table of contents
{:toc}
{: .toc}

$$
\newcommand{\bin}{\mathbb{B}}
\newcommand{\nat}{\mathbb{N}}
\newcommand{\real}{\mathbb{R}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\d}{\mathrm{d}}
\newcommand{\len}[1]{\ell\left(#1\right)}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\bigmid}{\;\middle\vert\;}
$$

Sections:
1. [Definitions](#definitions) - explain the definition of probability.
2. [Constructing event](#constructing-events) - explain random variable notation.
3. [Almost surely](#almost-surely) - a philosophical excursion into the interpretation of probability.
4. [Primer to measure theory](#primer-to-measure-theory) - a brief introduction to measure theory.

Main references:
* <https://en.wikipedia.org/wiki/Probability_axioms#Axioms>
* <https://en.wikipedia.org/wiki/Measure_space>
* <https://en.wikipedia.org/wiki/Random_variable#Measure-theoretic_definition>
* <http://statweb.stanford.edu/~souravc/stat310a-lecture-notes.pdf>
* <https://terrytao.files.wordpress.com/2011/01/measure-book1.pdf>

The first half of this article is ostensibly devoted to explaining the definition of probability, but that is not my priority. I'm most interested in providing a useful conceptual map, asking and discussing interesting questions, and developing intuition. I provide many links to technical details and further readings. My opening exposition on definitions is brief. If it does not all make sense, please look at other resources. Hopefully this article at least makes those other sources easier to use.

This post is also a pedagogical experiment. I structured this article to be read twice. The first pass is without measure theory, and the second pass is with measure theory. Measure-theory content is hidden by default, e.g. {% adv %}like this{% endadv %}. Simply ignore {% adv %}purple text{% endadv %} the {%marginnote "first time" "Unless you are already acquainted with measure theory, but then you can just look at [Wikipedia's definition of probability](https://en.wikipedia.org/wiki/Probability_axioms#Axioms) to understand the gist of probability theory." %} you read this post. Then in the [measure theory section](#primer-to-measure-theory) at the end of this post you will see a button to show all the hidden text (and you can just click on {% adv %}purple text{% endadv %} anywhere in the post to show it).

Why? Because I see plenty of introductions to probability that leave out measure theory entirely. The problem with them is that a lot of the common probability notation, e.g. random variables, only really makes sense when you understand measures. On the other hand, if you crack open a rigorous text on probability theory (e.g. [Casella & Berger](https://www.goodreads.com/book/show/383472.Statistical_Inference) or [Shao](https://www.springer.com/gp/book/9780387953823)), it may not be obvious why all this extra complexity with events, sigma-algebras and measure spaces is necessary.

When learning about probability and measure theory myself, I wish I had a resource that both provides precise definitions and intuitions for why these definitions are the way they are, and without wading through a lot of extraneous details. I don't know if I've succeeded in that here, but this is my attempt.

# Definitions

## Beginner

The full definition of probability is below, but to avoid overwhelm, you may first look at this *attempt* at defining probability. Many people intuitively think of probability this way. Notably, I've left out the event space. 

**Sample set** $\Omega$ is a set of all possible {% marginnote "samples" "Sample is synonymous with [outcome](https://en.wikipedia.org/wiki/Outcome_(probability))." %} $\omega\in\Omega$. A sample is a possible state of the world, e.g. the outcomes for all coins that will be tossed or all dice that will be thrown, or the ordering of cards in a deck.

**Probability function** {% marginnote '$P : 2^\Omega \to [0, 1]$' '$2^\Omega$ is the [power set](https://en.wikipedia.org/wiki/Power_set) of $\Omega$. The notation $2^{(\cdot)}$ is just a shorthand, though set exponentiation could be [defined in general](https://math.stackexchange.com/a/901742), e.g. $A^B$ is the set of all functions $f : B \to A$, and $n^A$, where $n$ is a natural number, generates the set of all $n$-ary indicator functions $$f : A \to \{0, 1, 2, \ldots, n-1\}$$. Then $2^A$ gives us all indicator functions $$A \to \{0,1\}$$ select the elements of every subset of $A$.' %} gives the probability of a {% marginnote "set of samples" "subset of $\Omega$" %}. A set of samples $\{\omega_1, \omega_2, \ldots\}$ is called an **event**, which is a set of possible states the world could be in, read as "$\omega_1$ is the case or $\omega_2$ is the case, etc. ..."

$P$ satisfies:

* **Non-negativity**: $$P(e) \geq 0,\ \forall e \in 2^\Omega$$.
* **Null empty set**: $$P(\emptyset) = 0$$.
* **Unit sample set**: $$P(\Omega) = 1$$.
* **Additivity**: For all disjoint events $$e_1, e_2 \in 2^\Omega,\ P(e_1 \cup e_2) = P(e_1) + P(e_2)$$

The probability of a single sample (outcome) $\omega\in\Omega$ is $$P(\{\omega\})$$.

## Full Definition

The beginner definition above does not define an event space. This is actually a problem when working with uncountable sample spaces, because not all subsets of an uncountable space can be measured. If that statement confuses you, don't worry about it and read through this post. Then read my [primer to measure theory](#primer-to-measure-theory) at the end which outlines why not every set can be measured. Though this may seem like a minor technicality, specifying what sets can be measured allows probability theory to be {% marginnote "a lot more general than it otherwise could be," "This is Kolmogorov's achievement. Definitions of probability like my beginner definition had been around for hundreds of years prior." %} specifically when dealing with real numbers.

Here is a compact but complete definition of probability:
* **Sample set** $\Omega$ is a set of all possible {% marginnote "samples" "Sample is synonymous with [outcome](https://en.wikipedia.org/wiki/Outcome_(probability))." %}.
  - **Sample** $\omega \in \Omega$ (i.e. primitive outcome) is a possible state of the world. Samples are disjoint, meaning only one sample can be the case at a time. Samples can be any kind of mathematical object.
* **Event space** $E \subseteq 2^\Omega$ is the set of subsets of $\Omega$ for which we are {% marginnote "allowed to assign probability." "The sets omitted from $E$ are not measurable, but again if you are not familiar with measure theory don't worry about why some sets cannot be measured until the end of this post." %} We require that $\emptyset, \Omega \in E$ {%adv%}and $E$ is required to be a [$\sigma$-algebra](#sigma-algebra) that contains the measurable subsets of $\Omega$. The tuple $(\Omega, E)$ is a [measurable space](https://en.wikipedia.org/wiki/Measurable_space).{%endadv%}  {%fixme%} Give sigma-algebra properties listed in measure theory section? {%endfixme%}
  - **Event** $e \in E$ is a {%adv%}measurable{%endadv%} set of samples. Samples $\omega \in e$ are {% marginnote "considered identical" "Different samples in $\Omega$ are indeed distinct objects, but their difference does not matter in the context of event $e$." %} w.r.t. $e$.
* **Probability measure** {% marginnote "$P : E \to [0, 1]$" "In general a measure $Q : E \to \real_{\geq 0}$, but I'm including the restriction of the co-domain to the unit interval $[0, 1]$ in the definition of $$P$$, because we are only talking about probability measures here, and there's no reason to be more general." %} is a function that maps allowed subsets of $\Omega$ to the real unit interval. $P$ is a **measure**, which means it satisfies certain properties that make it behave analogous to length, area, volume, etc. in Euclidean space. Essentially, a measure is a generalization of size that satisfies the following properties:
  * {% adv %}**Measurable domain**: $E$ is a $\sigma$-algebra of measurable sets.{% endadv %}
  * **Non-negativity**: $$P(e) \geq 0,\ \forall e \in E$$.
  * **Null empty set**: $$P(\emptyset) = 0$$.
  * **Unit sample set**: $$P(\Omega) = 1$$.
  * **Countable additivity**: For any countable set of events {% marginnote "$$A \subseteq E$$" "Remember that $E$ is the event space, and $A$ is a set of events." %} where $$\bigcap A = \emptyset$$, $$P(\bigcup A) = \sum_{e\in A} P(e)$$.


The triple $(\Omega, E, P)$ defines a [probability space](https://en.wikipedia.org/wiki/Probability_space) {%adv%}which is also a [measure space](https://en.wikipedia.org/wiki/Measure_space).{%endadv%} These three objects are all we need to do probability calculations.

## Kolmogorov axioms of probability

You may have heard of the [Kolmogorov axioms of probability](https://en.wikipedia.org/wiki/Probability_axioms#Axioms). Kolmogorov formalized probability as a special case of measure theory. Essentially a probability measure is a normalized measure, i.e. assigns 1 to the entire sample space $\Omega$. Above, I've merged the axioms of measure theory with Kolmogorov's axioms. For reference, here are Kolmogorov's axioms given separately:
1. $P(e) \in [0, 1], \forall e \in E$, where $[0, 1] \subset \real$.
2. $P(\Omega) = 1$, i.e. probability of anything happening is 1.
3. {% adv %}[$\sigma$-additivity](https://en.wikipedia.org/wiki/Sigma_additivity) on $E$.{% endadv %}

{%adv%}Given the axioms of measure theory, we can define probability succinctly by simply stating that $(\Omega, E, P)$ is a measure space where $P(\Omega) = 1$ (see [Terence Tao's Introduction to Measure Theory](https://terrytao.files.wordpress.com/2011/01/measure-book1.pdf)).{%endadv%}

## Examples

**Finite**: Dice rolls

$$\Omega = \{⚀,⚁,⚂,⚃,⚄,⚅\}$$,
$$E=2^\Omega$$,
$$P(\{⚀\})= P(\{⚁\}) = \ldots = P(\{⚅\}) =1/6$$.

Note that $$P(⚀)$$ is not defined. $P$ measures the "size" of sets. $$\{⚀\}$$ is the set containing one sample. We can also compute the probability of larger sets, e.g.
$$P(\{⚀,⚅\}) = 1/3$$,
$$P(\{⚁,⚃,⚅\}) = 1/2$$,
$$P(\{⚀,⚁,⚂,⚃,⚄,⚅\}) = 1$$.

**Countable** (event set): Variable length binary sequences

$$\bin = \{0, 1\}$$ is the binary alphabet.
Let $x \in \bin^n$ be a binary sequence of any length $n$, and $$\len{x} := n$$ returns the length of $x$.

The sample set is all infinite binary sequences, $$\Omega = \mathbb{B}^\infty$$.
This let's us make an event for each finite length $x$.
Let $$\Gamma_x = \left\{\omega \in \Omega \bigmid x = \omega_{1:\len{x}}\right\}$$, where $$\omega_{1:\len{x}}$$ is the length $\len{x}$ prefix of $\omega$.
The event set is $$E=\left\{\Gamma_x \bigmid x \in \mathbb{B}^n, n \in \mathbb{N}\cup\{0\}\right\}$$ 

Then $$P(\Gamma_x)$$ is the probability of $x$, and $$P(\Gamma_{x_1} \cup \Gamma_{x_2} \cup \ldots)$$ is the probability of the set $$\{x_1, x_2, \ldots\}$$.
Note that the probability of a finite sequence is always a marginal probability, in the sense that $$P(\Gamma_x) = P(\Gamma_{x`0}) + P(\Gamma_{x`1})$$ where $$x`0$$ and $$x`1$$ are the concatenations of $$x$$ with 0 or 1.

An example of such a measure is the uniform measure, $$P(\Gamma_x) = 2^{-\len{x}}$$.

**Uncountable**: The reals

$$\Omega=\real$$,
$$E \subset 2^\real$$ contains sets of reals formed by countable union, intersection, and complement of the open intervals. {%adv%}This particular choice of $E$ is called the [Borel algebra](https://en.wikipedia.org/wiki/Borel_set), and is a standard $\sigma$-algebra for $\real$. The reason we don't use $E = 2^\real$ as our event space is that some subsets of $\real$ are not measurable.{%endadv%}

We only need to define $P$ on single intervals, and because of additivity of probability we can derive $P$ on every set in $E$. {%adv%}A measure $P$ defined on intervals is called a [Borel measure](https://en.wikipedia.org/wiki/Borel_measure#On_the_real_line).{%endadv%} Let

$$
P((a,b]) = \int_a^b \frac{1}{\sqrt{2 \pi }} e^{-\frac{x^2}{2}} \d x\,.
$$

Note that it does not matter if we define $P$ on open intervals, closed intervals, or half-open intervals, because the value of the integral is identical between these cases. {%adv%}Specifically, we are performing a Lebesgue integral, which is invariant to removing a measure 0 subset from the integral domain. See the [equality almost-everywhere](https://en.wikipedia.org/wiki/Lebesgue_integration#Basic_theorems_of_the_Lebesgue_integral) property.{%endadv%}

In this particular example, $\frac{\d}{\d x} P((0, x])$ is the [standard normal](https://en.wikipedia.org/wiki/Normal_distribution) (i.e. Gaussian) [probability density function (PDF)](https://en.wikipedia.org/wiki/Probability_density_function). It is common, when working with probability on the reals, to provide a PDF which can be integrated over to derive the {%marginnote "probability measure" "The output of the probability measure is called *probability mass*, to distinguish it from the output of the PDF, which is called *probability density*." %}. In other words, a PDF $f(x)$ is a function that when integrated produces a probability measure: $P((a, b]) = \int_a^b f(x) \d x$. 

## PMFs and PDFs and measures, oh my!

In standard probability textbooks and courses (largely for non-theoreticians), you are told about probability mass functions (PMFs) and probability density functions (PDFs), and their cumulative counterparts: cumulative mass functions (CMFs) and cumulative density functions (CDFs). So you may be wondering where these fit into the definition of probability above. I've been talking about probability measures, and only mentioned PDF in the real line example above.

For finite and countable sample sets, PMFs, CMFs and measures are equivalent, meaning you can derive one from the others. We can convert between PMF $m : \Omega \to [0,1]$ and measure $P: E \to [0,1]$ with the following relations:

$$
\begin{aligned}
m(\omega) &= P(\{\omega\}) \\
P(e) &= \sum_{\omega\in e} m(\omega)\,.
\end{aligned}
$$

For differentiable continuous sample sets {%adv%}where $E$ is the [Borel algebra](https://en.wikipedia.org/wiki/Borel_set){%endadv%} (e.g. the reals), PDFs, CDFs and measures are equivalent, meaning you can derive one from the others. We can convert between PDF $f : \Omega \to \real$ and measure $P : E \to [0,1]$ with the following relations:

$$
\begin{aligned}
f(x) &= \frac{\d}{\d x} P((c, x]) \\
P((a, b]) &= \int_a^b f(x) \d x\,,
\end{aligned}
$$

for some constant $c\in\Omega$.

The measure-theoretic definition of probability unifies the discrete and continuous cases, and can handle exotic cases, e.g. non-differentiable uncountable sample sets. {%fixme%}Example of a probability measure not fitting into the above two types?{%endfixme%}

## Events vs samples

**Question:** Why provide event space $E$? Isn't this redundant with $\Omega$?

You may be thinking that given just $\Omega$, we can define $P : 2^\Omega \to [0,1]$ which satisfies the properties of a measure listed earlier, and it is sufficient to define $$P(\{\omega\})$$ for each $\omega \in \Omega$. That is true for countable $\Omega$ (e.g. the dice example above). The technical reason for basing probability theory on measure theory is that for uncountable $\Omega$, some subsets are not measurable. $E$ tells us which subsets of $\Omega$ are measurable, and are safe to compute the probability of. Perhaps the real reason is to simplify the definition of probability down to one constraint, $P(\Omega) = 1$. The apparent redundancy of $\Omega$ and $E$ is then inherited from measure theory. This kind of information redundancy {%marginnote "in mathematical constructions is quite common" "For example, a group is defined as $(G, +)$ where $G$ is a set of objects and $+ : G \times G \to G$ is some binary operator defined over $G$. The definition of $+$ already includes $G$, so technically providing $G$ is not necessary. A group is defined as a tuple $(G, +)$ to distinguish it from the set $G$ and the operator $+$. Another example is a topological space defined as the tuple $(X, \tau)$ where $X$ is a set of objects and $\tau$ is a set of subsets of $X$ which contains $X$. Since $X = \bigcup \tau$ so we don't need to provide $\tau$, but again we want to distinguish the topological space from $X$ and $\tau$ (where $\tau$ is just called the topology)." %}, and is merely a particular notational style. Redundancy is not a high cost to pay for notational clarity.

**Question:** Why do I care about events containing multiple samples? Only one sample ever happens at a time.
1. We want to be able to calculate the probability of "one or the other thing" happening. Let $$\omega_1, \omega_2 \in \Omega$$. $$\{\omega_1\}, \{\omega_2\} \in E$$ are the events corresponding to exactly one thing happening.  $$\{\omega_1, \omega_2\} \in E$$ is the event corresponding to either $$\omega_1$$ or $$\omega_2$$ happening.
2. We want to be able to calculate the probability of something not happening. Not-$$\omega_1$$ is the event $$\{\omega \in \Omega \mid \omega \neq \omega_1\}$$.

**Question:** But what about the probability of "one **AND** the other thing" happening?

Samples in $$\Omega$$ each represent exactly one unique state of the world. To say the world is in state $\omega_i$ AND $\omega_j$ simultaneously is a contradiction, since each states on its own is complete, in the sense that they specify everything. However, it may be the case that world-state can be decomposed into two independent parts. Then your sample set is the cartesian product of sets for each independent sub-state, i.e. $$\Omega = \Lambda_1 \times \Lambda_2$$ and $$\omega = (\lambda_1, \lambda_2) \in \Lambda_1 \times \Lambda_2$$. Thus each sample $$\omega$$ already represents the "and" of two states if you want it to.

# Constructing events

A primitive event is a {% marginnote "singleton set" "The set containing one sample, i.e. $$e =\{\omega\}$$ where $$\omega \in \Omega$$" %}. Events are {% marginnote "what get observed, not samples" "See the [dart-throwing discussion](#throwing-darts) below for a good reason why this should be the case." %}. If an event contains many samples, you don't know which of them is the case, but only one can be the case since they are disjoint.

Probability theory has specialized notation that revolves around turning the "define my event and measure its probability" process into one concise notational step. Random variables (RV)s are central to this notation. But before introducing random variables, let's look at how we would construct events and measure their probability without RVs:

* **Construct event:** $$e = \{\omega \in \Omega \mid \mathrm{condition}(\omega)\}$$, where $$\mathrm{condition}(\omega)$$ is some boolean valued proposition on $\omega$.
* **Measure probability:** $P(e)$. So long as $$e \in E$$, then $$P(e)$$ is defined.

Combined we have,

$$P(\{\omega \in \Omega \mid \mathrm{condition}(\omega)\})\,.$$

For example, if $\Omega = \nat$ and we wanted to compute the probability of getting an even number, then $$e = \{n \in \nat \mid \mathrm{Remainder}(n/2) = 0\}$$ and $$P(\{n \in \nat \mid \mathrm{Remainder}(n/2) = 0\})$$ is the probability.

## Random variables

Random variables are devices for constructing events. That is their purpose. Contrary to their name, there is {% marginnote "nothing random about them." "A random variable is a deterministic function. The word *__random__* is due to it being a function of samples which are randomly chosen." %}

A random variable is a {%adv%}measurable{%endadv%} function $$X : \Omega \to F$$, {%adv%}where $(F, \mathcal{F})$ is a [measurable space](https://en.wikipedia.org/wiki/Measurable_space) with $\sigma$-algebra $\mathcal{F}$ (specifies measurable subsets of $F$),{%endadv%} and the elements of $F$ can be any type of object.

There are three main motivations for the random variable formalism...

### Motivation 1: Information hiding

I briefly mentioned [above](#events-vs-samples) that samples (world state) can be treated as containing sub-samples (sub-state), e.g. $\omega = (\lambda_1, \lambda_2) \in \Lambda_1 \times \Lambda_2 = \Omega$. Random variables are convenient for dealing with just one sub-sample in isolation, and they allow you to avoid committing to a particular way to divide up $\omega$, e.g. $\omega = (\lambda_1, \lambda_2) = (\kappa_1, \kappa_2, \kappa_3)$ might be two different and incompatible but semantically meaningful ways to divide sample $\omega$ into sub-samples.

A random variable $X : \Omega \to F$ *hides information* contained in $\omega \in \Omega$ by appropriate choice of $F$. E.g. let $\Omega = \Lambda_1 \times \Lambda_2$ and let $$X_1 : \Omega \to \Lambda_1 : (\lambda_1, \lambda_2) \mapsto \lambda_1$$ and $$X_2 : \Omega \to \Lambda_2 : (\lambda_1, \lambda_2) \mapsto \lambda_2$$ be two random variables. $X_1(\Omega) = \Lambda_1$ and $X_2(\Omega)=\Lambda_2$ are smaller sample spaces than $\Omega$, each which hide sub-samples.

When multiple random variables are invoked in the same context, they are assumed to be {% marginnote "over the same sample space $\Omega$." "For RVs $X_1, X_2, \ldots$ it is assumed there is a joint probability distribution $$P_{X_1, X_2, \ldots}$$. See the definition of joint distribution [below](#probability-distribution-of-a-random-variable)." %}

#### Examples

**Toss two coins**

$$\Omega = \Lambda_1 \times \Lambda_2$$.  $$(\lambda_1, \lambda_2) \in \Omega$$.  $$\Lambda_1 = \Lambda_2 = \{H, T\}$$. 
Define $$X_1 : (\lambda_1, \lambda_2) \mapsto \lambda_1$$ and $$X_2 : (\lambda_1, \lambda_2) \mapsto \lambda_2$$.
$$X_1$$ isolates the state of the first coin. $$X_2$$ isolates the state of the second coin.
$P(X_1=H) = P(\\{\omega \in \Omega \mid X_1(\omega) = H\\}) = P(\\{(H,H), (H,T)\\})$

**Toss two dice**

$$\Omega = \Lambda_1 \times \Lambda_2$$.  $$(\lambda_1, \lambda_2) \in \Omega$$.   $$\Lambda_1 = \Lambda_2 = \{1,2,3,4,5,6\}$$. 
Define $$S : (\lambda_1, \lambda_2) \mapsto \lambda_1 + \lambda_2$$.
$$S$$ returns the sum of the two die outcomes. 
The codomain of $$S$$ is $$\{2, 3, \ldots, 11, 12\}$$
$$P(S=4) = P(\{\omega \in \Omega \mid S(\omega) = 4\}) = P(\{(1,3), (2,2), (3, 1)\})$$

**In the general case...**

we might want to represent any number of interacting observables and components in a system. How about modeling the weather or the stock market? Your primitive sample space might be astronomical, but you can identify all sorts of observables like the prices of AAPL and GOOG at time $$t$$ or the temperatures of Florida and Vermont on Tuesday, which would be convenient to deal with separately. At the same time, you don't want to lose the rich information about how one particular observable interacts with all the others. We would like to be able to ignore partial information contained in primitive samples (i.e. [marginalize](#probability-distribution-of-a-random-variable)).

### Motivation 2: Syntactic sugar

We've seen how events can be constructed with set builder notation, i.e. $$e = \{\omega \in \Omega \mid \mathrm{condition}(\omega)\}$$, and we've seen how a random variable $X : \Omega \to F$ can be used to build events, e.g. $$e = \{\omega \in \Omega \mid X(\omega) = f\}$$ where $f \in F$ is some object.

There is a shorthand notation for writing $$P(\{\omega \in \Omega \mid X(\omega) = f\})$$, which is

$$P(X=f)\,.$$

The general case of this notation is

$$
\begin{align}
& P(\mathrm{condition}(X_1, X_2, \ldots)) \\
& \quad = P(\{\omega \in \Omega : \mathrm{condition}(X_1(\omega), X_2(\omega), \ldots)\})\,,
\end{align}$$

where $X_1 : \Omega \to F_1,\ \ X_2 : \Omega \to F_2, \ \  \ldots$ are random variables, and $$\mathrm{condition}(f_1, f_2, \ldots)$$ is some boolean function of inputs $$f_1 \in F_1, f_2 \in F_2, \ldots$$ {%adv%}with measurable spaces $(F_1, \mathcal{F}_1), (F_2, \mathcal{F}_2), \ldots${%endadv%}

**Examples:**
* $$P(X = Y) = P(\{\omega \in \Omega \mid X(\omega) = Y(\omega)\})$$, where $$Y : \Omega \to F$$ is a random variable.
* $$P(X=f, Y=g) = P(\{\omega \in \Omega \mid X(\omega)=f, Y(\omega)=g\})$$ where $$Y:\Omega \to G$$ and $$g \in G$$.
* $$P(X \in A) = P(\{\omega \in \Omega \mid X(\omega) \in A\})$$, for $$A \subseteq F$$ {%adv%}(and $A \in \mathcal{F}$ is measurable).{%endadv%}
* $P(X > f) = P(\\{\omega \in \Omega \mid X(\omega) > f\\})$.
* $P(X > Y) = P(\\{\omega \in \Omega \mid X(\omega) > Y(\omega)\\})$.
* Arbitrary algebraic expressions of random variables, e.g. $$P(c_0 + c_1 X + c_2 X^2 + c_3 X^3 + \ldots = k) = P(\{\omega \in \Omega \mid c_0 + c_1 X(\omega) + c_2 X(\omega)^2 + c_3 X(\omega)^3 + \ldots = k\})$$ or $$P(\exp(X) = \log(Y)) = P(\{\omega \in \Omega \mid \exp(X(\omega)) = \log(Y(\omega))\})$$.

A standard notational convention is that calling a function on a random variable generates a new random variable, i.e. $$h(X) = h∘X$$, so that $$P(h(X) = c)$$ can be parsed either as $$P(Y = c)$$ where random variable $$Y = h∘X$$, or as $$P(\mathrm{condition}(X))$$ where $$\mathrm{condition}(x)$$ is the expression $$h(x) = c$$.

#### Probability distribution of a random variable

Any random variable $X : \Omega \to F$ {%adv%}to measurable space $(F, \mathcal{F})${%endadv%} induces a unique probability measure with $F$ as the sample set, rather than $\Omega$. We call it the **marginal distribution** w.r.t. $X$, defined as $$P_X: F \to [0, 1]$$:

$$P_X(A) := P(X \in A) = P(\{\omega \in \Omega \mid X(\omega) \in  A\})\,,$$

for {%adv%}measurable{%endadv%} $A \subseteq F$. Thus $(F, \mathcal{F}, P_X)$ is the probability space for the marginal distribution of $X$. Note that $$P(X=f) = P_X(\{f\})$$, $$P(X < f) = P_X(\{f' \in F \mid f' < f\})$$, etc.

We often have more than one random variable of interest. With $X$ defined above and $Y : \Omega \to G$ {%adv%}to measurable space $(G, \mathcal{G})${%endadv%}, we have the marginal distributions $P_X$ and $P_Y$, and also the **joint distribution** w.r.t. $X$ and $Y$, defined as $P_{X,Y} : F \times G \to [0, 1]$:

$$P_{X,Y}(A, B) := P(X \in A \wedge Y \in B) = P(\{\omega \in \Omega \mid X(\omega) \in A \wedge Y(\omega) \in B\})$$

for {%adv%}measurable{%endadv%} $A \subseteq F, B \subseteq G$. Thus {%marginnote "$(F \times G, \mathcal{F} \otimes \mathcal{G}, P_{X,Y})$" "$\mathcal{F} \otimes \mathcal{G} := \\\{A \times B \mid A \in \mathcal{F}, B \in \mathcal{G}\\\}$." %} is the probability space for the joint distribution of $X$ and $Y$.

In general, for RVs $X_1 : \Omega \to F_1,\ \ X_2 : \Omega \to F_2,\ \ \ldots$, we have the joint distribution $P_{X_1,X_2,\ldots} : F_1 \times F_2 \times \ldots \to [0, 1]$:

$$P_{X_1,X_2,\ldots}(A_1, A_2, \ldots) := P(X_1 \in A_1 \wedge X_2 \in A_2 \wedge \ldots)\,.$$

A joint distribution may also be a marginal distribution. For example, if I have RVs $X_1, \ldots, X_{10}$ and I consider the probability measure $P_{X_3,X_5,X_7}$.

RVs in a joint distribution need not be created from cartesian products of sample sets, i.e. the output of one RV may partially determine the output of another. Taking the two dice example, my space is $$\Omega = \{1, \ldots, 6\} \times \{1, \ldots, 6\}$$. The random variable for the outcome of die 1 is $D_1((n, m)) \mapsto n$, and the random variable for the sum of dice is $S((n, m)) \mapsto n + m$. Choosing $\omega \in \Omega$ to determine $D_1$ may also determine $S$, and vice versa. If I want $S(\omega) = 2$ then $\omega = (1, 1)$ and $D_1(\omega) = 1$ is fully determined. Likewise if we choose $\omega$ so that $D_1(\omega) = 6$ then the possible values of $S(\omega)$ are restricted to $7, 8, 9, 10, 11, 12$. Nevertheless, $P_{D_1, S}$ is a perfectly fine joint distribution. 

Keeping track of all these probability functions can be confusing, e.g. marginals $P_X$ and $P_Y$ and joint $P_{X,Y}$ are in a sense derived from a single probability function $P$, where $P(X=x)$ and $P(Y=y)$ are equivalent to $$P_X(\{x\})$$ and $$P_Y(\{y\})$$. However, it is possible to have two different underlying probability measures that reuse the same random variables, e.g. $Q : \Omega \to [0, 1]$ with expressions like $Q(X=x)$ and $Q(Y=y)$ being possible, and marginals $Q_X$ and $Q_Y$ and joint $Q_{X,Y}$. Keep in mind that calculations with $P$-related and $Q$-related probability functions do not necessarily have anything to do with each other.

#### Notational confusion

The language of probability may seem simple enough, but notationally it can be quite cumbersome. When it comes to applications in statistics, machine learning and physics just to name a few, there can be a large quantity of random variables and complicated probability distributions. Authors of academic texts tend to take shortcuts for ease of readability, but they pay the price of ambiguity, which especially hurts readers who are not already familiar with the domain. This is not the fault of authors, but a symptom of clunky notation. I will outline a few common shortcuts and notational difficulties. I hope to write a separate post delving deeper into examples where ambiguity occurs in the wild and how to avoid it.

Generally in texts there is often ambiguity between PMFs, PDFs and measures, and between samples, events, and random variables.

For example, you may see any of $P(X), p(X), P(x)$ or $p(x)$, where it is not make clear whether $P$ or $p$ is a measure or a PMF/PDF, and whether $X$ or $x$ is a sample, event, or random variable. There is no universal convention on uppercase vs lowercase. Uppercase $X$ can mean a vector or matrix in a lot of contexts, as well as bold $\boldsymbol{X}$. Same situation for marginals, e.g. $p_X(x)$ is common.

When there are many random variables to juggle, you may see different ways to denote marginal distributions, e.g. $P(X,Y)$ and $P_{X,Y}$. This becomes important when you want to do algebra with probability, e.g.
1. $P(W) = P(X, Y, Z)/Q(Y,Z)$
2. $P_W = P_{X, Y,Z}/Q_{Y,Z}$
3. $P(W=w) = P(X=f(w), Y=g(w), Z=h(w))/Q(Y=g(w),Z=h(w))$

The problem with the first case is that it depends on position for variable identity, but the reader expects identity by name, i.e. $P(X, Y, Z)$ is intended to be the same as $P(Y, Z, X)$. The second case fixes this problem because it cleanly separates the meaning of each argument from its value, e.g. $P_{X,Y,Z}(Z,X,Y)$ reads "plug in $Z$ for $X$, $X$ for $Y$, and $Y$ for $Z$." The last case is equivalent to the second, and much like [keyword argument syntax in Python](https://www.w3schools.com/python/gloss_python_function_keyword_arguments.asp), but with the benefit of being notationally primitive rather than relying on the *function factory* convention $f_{X_1,X_2,X_3,\ldots}(x_1, x_2, x_3, \ldots) = f(X_1=x_1, X_2=x_2, X_3=x_3,\ldots)$.


It is worth noting that probability notation can be used correctly without too much trouble. Theoretical statistics and mathematics texts tend to have good examples of correct usage.

### Motivation 3: Construct events that are guaranteed measurable

Using random variable $X : \Omega \to F$ inside set-builder notation will guarantee that the result is an event, i.e. an element of $E$. For example, $$\{\omega \in \Omega \mid X(\omega) \in A\} \in E$$ as long as $X^{-1}(A) \in E$. We specified in the definition of random variable that it be a *measurable* function, which is a fancy way of saying that we restrict ourselves to such $A \subseteq F$ where $X^{-1}(A) \in E$ holds.

{%adv%}
The definition of random variable specifies that the function $X : \Omega \to F$ is *measurable*. That means for measurable spaces $(\Omega, E)$ and $(F, \mathcal{F})$, it is the case that {% marginnote "$$X^{-1}(A) \in E,\ \forall A \in \mathcal{F}$$." "Where $$X^{-1}(A) = \{\omega \in \Omega \mid X(\omega) \in A\}$$ is the pre-image of $$X$$ on $$A$$." %} In other words, $X$ {%marginnote "never maps a non-measurable subset" "However, $X$ could map a measurable subset of $\Omega$ to a non-measurable subset of $F$." %} of $\Omega$ to a measurable subset of $F$. Thus every set of the form $$\{\omega \in \Omega \mid X(\omega) \in A\} = X^{-1}(A)$$ for measurable $$A \in \mathcal{F}$$ is guaranteed to be measurable.{%endadv%}

{%adv%}**Question:** Are arbitrary expressions of random variables, i.e. $\mathrm{condition}(X_1, X_2, \ldots)$, guaranteed measurable?{%endadv%}

# Almost surely

We know that $P(\emptyset) = 0$. It is possible (and common) to have non-empty events which have probability zero. Since we are calling $P$ a *measure* of probability (analogous to the size of a set), then we say that a set $e$ where $P(e) = 0$ has measure 0. Such an event is said to occur **almost never**.

We also know that $P(\Omega) = 1$. In the situations where non-empty sets have measure 0, there must be non-$\Omega$ sets with measure 1, because of the additivity of probability measure. Such sets are said to have measure 1, and such events are said to occur [**almost surely**](https://en.wikipedia.org/wiki/Almost_surely).

There is nothing strange about non-empty sets of measure 0. Probability measure is not measuring the number of samples in an event (that would be set cardinality). If $P(e) = 0$, then for any sub-event $e' \subset e$ we have $P(e') = 0$ by additivity of probability measure. So if $\omega \in e$, then $$P(\{\omega\}) = 0$$. We could say informally that sample $\omega$ {%marginnote "has" "While recognizing that formally samples don't have probability, and it is the event $$\{\omega\}$$ which has probability 0." %} 0 probability.

**Question:** What does $$P(\{\omega\}) = 0$$ imply about $\omega$? Does it mean that $\omega$ can never be the case, i.e. can never be a state of the world?

This is a question about the interpretation of probability, i.e. how probability theory interfaces with reality, and there is no universally agreed upon answer. The mathematical construction of probability theory is agnostic on the matter.

I think there are two follow up questions that naturally fall out of the original:
1. For what reason would we define a probability measure $P$ such that $$P(\{\omega\}) = 0$$  for some $\omega \in \Omega$?
2. If we are told $P$ describes some physical process and $$P(\{\omega\}) = 0$$, what will we observe?

Naive answers to both are that we may assign measure 0 to events which can never be observed to occur, and if we believe an event has measure 0 then we will never observe it occurring. There are some who will say that nothing is impossible, merely improbable, and all events should be assigned non-zero probability. Clearly "no confirmation ⟹ impossible" is the {% marginnote "[black swan fallacy](https://en.wikipedia.org/wiki/Black_swan_theory)," "Black swans were presumed to not exist by Europeans before the 16th century because only white swans had been observed. \"However, in 1697, Dutch explorers led by Willem de Vlamingh became the first Europeans to see black swans, in Western Australia.\" The fallacy is that lack of confirmation of something being true does not rule out the possibility that it is true. This fallacy amounts to mistaking 'I have not found $x$ s.t. $\mathrm{proposition}(x)$' with '$\not\exists x$ s.t. $\mathrm{proposition}(x)$'." %}. You cannot know something is impossible by lack of observation, so you should not assign 0 probability because of lack of data. However, something may be logically impossible, or you may know something is impossible via other means.

Question \#1 is a special case of the [inverse probability problem](https://en.wikipedia.org/wiki/Inverse_probability), which is the problem of determining the probability measure (distribution) that best describes some physical process (e.g. a game, physical experiment, stock market). Is there a 1-to-1 mapping between physical processes and probability distributions? In other words, is the distribution that best describes a physical process objective and unique, i.e. {%marginnote "independently verifiable." "In the same way that scientific experiments can be reproduced and verified by independent parties. If the reason for selecting measure $P_1$ over measure $P_2$ to describe a physical process is not dogmatic, then that choice should be independently arrived at from first principles by multiple parties." %}

There is at this time no good answer to the inverse probability problem. Kolmogorov developed his definition of probability to match the mathematical intuitions on probability of his predecessors going back to the {% marginnote "17th century." "Famously the [problem of points](https://en.wikipedia.org/wiki/Problem_of_points) is an example of early probability calculation." %} But what gave rise to this persistent intuition that the whole world should be described with probability, and that probability values should represent randomness and unpredictability? That I do not have an answer to, but I found Ian Hacking's [The Emergence of Probability](https://en.wikipedia.org/wiki/The_Emergence_of_Probability) to give a good account of the historical emergence of probability theory.

Not only is probability theory agnostic on the meaning of 0 probability, it doesn't actually have anything to say about what it means for an outcome to be likely or unlikely, or expected or unexpected in the colloquial sense, at least not in a non-circular way. If we observe a 100 coin tosses all come up heads, I might say it was a fair coin and the tosser just got lucky/unlucky, and you might say the coin tosses were rigged and the probability of this outcome was clearly close to 1. Whose to say which probabilistic description of the physical setup is correct, unless there is some theory to tell us what probability distributions describe what physical systems, and thus what experiment we could do to see {% marginnote 'who is correct' 'We do hold a lot of intuitions about this correspondence between the physical realm and probability. For example, symmetries should correspond to equiprobable outcomes. Most people will agree that if the coin were asymmetric in some way that could be a cause for it to come up one way more often. But how much more often? This is where things get fuzzy. In general, how do you determine the precise probability of heads from a model of coin tossing?' %}. This is out of scope of probability theory. Kolmogorov's axioms merely ensure that probability is self-consistent within the realm of mathematics.

Kolmogorov himself tried to fix this shortcoming which led to the development of [algorithmic information theory](http://www.scholarpedia.org/article/Algorithmic_information_theory). In [On tables of random numbers](https://www.sciencedirect.com/science/article/pii/S0304397598000759?via%3Dihub) he writes:
> ... for a long time I had the following views:
    (1) The frequency concept based on the notion of limiting frequency as the number of trials increases to infinity, does not contribute anything to substantiate the applicability of the results of probability theory to real practical problems where we have always to deal with a finite number of trials.
    (2) The frequency concept applied to a large but finite number of trials does not admit a rigorous formal exposition within the framework of pure mathematics. 

## Throwing darts

[Above](#examples) I gave the reals as an example of a sample set. It is not hard to show that [every countable subset of the reals must have measure 0](https://proofwiki.org/wiki/Countable_Sets_Have_Measure_Zero). This gives rise to the classic conundrum that any particular number sampled from the real line (under, say, a Gaussian pdf) will have 0 probability of occurring. Or {%marginnote "more poetically" "This is just the same thought experiment but in $\real^2$." %}, throw a dart at a dart board, and wherever it lands there is 0 probability of it doing so. 

My response is two-fold. In the case of the dart board, since we are invoking a physical process, I argue that there are only finitely many distinguishable places the dart can land, limited by the precision of our measurement apparatus (e.g. a camera). I assert that we can only ever have finite precision on measurements (see my [discussion on mutual information](http://zhat.io/articles/primer-shannon-information#proof-that-mi-is-fininte-for-continuous-distributions)). For this reason, event sets for physical processes are functionally finite, even if the sample set is infinite.

Probability theory gives us an elegant way to model a physical process with continuous state while simulating measurements of finite precision. This brings me to the real line example. Assuming we have a probability density function with [support everywhere](https://en.wikipedia.org/wiki/Support_(mathematics)), for both the dart board and real line, the measure of intervals that are not just points will be non-zero, because such intervals are uncountable sets. So choosing event intervals which correspond to measurement error bounds will produce events with non-zero probability. In short, you are taking the probability of a physical measurement outcome, not a {%marginnote "state of the world!" "We could say states of the world are not directly accessible, but are only indirectly observable through finite measurement precision." %} {%marginnote "Singleton events" "Really any event containing finite or countably many samples in a sense is an infinite precision measurement, and conveys infinite information." %} on $\real$ have essentially infinite precision, and you are in a sense {%marginnote "\"paying for\" more precision" "There is a direct connection between precision and information. More precision means more bits. Infinite precision means infinite information, and 0 probability. This is why the [entropy of most distributions on $\real$ is infinite](http://zhat.io/articles/primer-shannon-information#shannon-information-for-continuous-distributions)." %} in your events with increasingly small probabilities. At the limit, you pay for infinite precision with 0 probability.

## Borel's law of large numbers

A classical interpretation of probability is that it represents the frequency of occurrence of some event in a repeatable process as the number of repetitions goes to infinity. This is sometimes called the **frequentist** interpretation of probability.

*Repeatable*, in the language of probability theory, means **independently and identically distributed** (i.i.d.). That is, for RVs $X_1, X_2, \ldots$ their marginals are equal, $P_{X_1} = P_{X_2} = \ldots$ (i.e. identical), and their joint distribution is the product of marginals, $P_{X_1, X_2, \ldots}(A) = P_{X_1}(A)\cdot P_{X_2}(A) \cdot \ldots$ (i.e. [independent](https://en.wikipedia.org/wiki/Independence_(probability_theory))).

We have two problems:
1. What does it mean for a physical process to be i.i.d.?
2. What does it mean to draw from a probability distribution more than once?

The first is an open question. E.T. Jaynes in his [Logic of Science](https://www.cambridge.org/core/books/probability-theory/9CA08E224FF30123304E6D8935CF1A99) argues that i.i.d. is never a reasonable description of physical systems:
> Such a belief is almost never justified, even for the fairly well-controlled measurements of the physicist or engineer, not only because of unknown systematic error, but because successive measurements lack the logical independence required for these limit theorems to apply.

Consider two coin tosses. What makes them independent outcomes? We have an intuition that they are not causally connected and therefor they don't share information, i.e. you cannot predict the outcome of one coin any better given the outcome of the other. There is a sort of paradox at the heart of probability theory, where an event with probability between 0 and 1 necessarily implies lack of understanding of the process behind that event. If you knew completely how a process gives rise to any particular outcome, then you could just {% marginnote "model that process without probability" "For example, these papers modeling coin tossing:<br/>‣ [DYNAMICAL BIAS IN THE COIN TOSS](https://statweb.stanford.edu/~susan/papers/headswithJ.pdf)<br/>‣ [Probability, geometry, and dynamics in the toss of a thick coin](https://arxiv.org/pdf/1008.4559.pdf)<br/>which move the probabilistic component of the model onto the initial conditions." %}. So then, any model of the two coins that demonstrates why they do not share information would need to reveal their inner workings, thus going inside the physical black box delineated by probability. To understand why they are independent is to make their outcomes determined from a physicist's "god-like perspective", and in a sense non-probabilistic.

Regardless of the physical reality of i.i.d. processes, there is the mathematical question of how to represent i.i.d. repetitions of an experiment. Given $(\Omega, E, P)$ for our experiment and identity RV $X : \omega \mapsto \omega$, we can derive a larger distribution representing $n$ trials by taking the cartesian product of the sample space $n$ times, i.e. our probability space is $(\Omega_n, E_n, P_n)$ where

$$
\begin{align}
\Omega_n &:= \underbrace{\Omega \times \Omega \times \ldots \times \Omega}_{n\ \mathrm{times}} \\
E_n &:= \underbrace{E \otimes E \otimes \ldots E}_{n\ \mathrm{times}} \\
P_n &: (e_1, \ldots, e_n) \mapsto \prod_{i=1}^n P(e_i)\,.
\end{align}
$$

Ignoring the mathematical difficulties involved, let's invoke the sample set over infinite trials, $\Omega_\infty$. Let's also create a random variable for the outcome of each trial $$t \in \nat\setminus\{0\}$$ in the infinite series:

$$
X_t : \Omega_\infty \to \Omega : (\omega_1, \omega_2, \ldots, \omega_t, \ldots) \mapsto \omega_t\,.
$$

The idea of probability representing the outcome frequency of infinite i.i.d. trials is formally captured by {% marginnote "[Borel's law of large numbers (BLLN)](https://en.wikipedia.org/wiki/Law_of_large_numbers#Strong_law)" "This is a special case of the [strong law of large numbers](https://en.wikipedia.org/wiki/Law_of_large_numbers#Strong_law). There are a few variants of the law of large numbers (LLN), e.g. [weak law](https://en.wikipedia.org/wiki/Law_of_large_numbers#Weak_law), but I feel BLLN most straightforwardly expresses the insight I wish to convey." %}. Given any single-trial event $e \in E$, we have:

$$
P_\infty\left(\left\{\omega_\infty \in \Omega_\infty \bigmid \lim_{n \to \infty} \frac{1}{n} \sum\limits_{i=1}^n 𝟙[X_i(\omega_\infty) \in e] = P(e)\right\}\right) = 1\,,
$$
where $𝟙[\mathrm{expr}]$ casts boolean $\mathrm{expr}$ to an integer (1 if true, 0 otherwise). The sum

$$
\sum\limits_{i=1}^n 𝟙[X_i(\omega_\infty) \in e]
$$

computes a count: the number of times event $e$ occurs in the first $n$ trials, where $\omega_\infty$ is the infinite sequence of trial samples. Dividing by $n$ gives the frequency, i.e. fraction of times $e$ appears out of the first $n$ trials.


Borel's law of large numbers (BLLN) can then be written more concisely using our fun RV notation:

$$
P_\infty\left(\lim_{n \to \infty} \frac{1}{n} \sum\limits_{i=1}^n 𝟙[X_i \in e] = P(e)\right) = 1\,,
$$

or using [almost sure convergence notation](https://en.wikipedia.org/wiki/Convergence_of_random_variables#Almost_sure_convergence):

$$
\frac{1}{n} \sum\limits_{i=1}^n 𝟙[X_i \in e] \overset{\mathrm{a.s.}}{\longrightarrow} P(e)\,,
$$

though the latter does not make it clear that $P_\infty$ is our measure.

This equation is very intriguing, as it directly relates samples from $P_\infty$ to measure $P$. In short, BLLN states that there is a measure 1 set of infinite sequences of i.i.d. trials s.t. the limiting number of occurrences of event $e \in E$ as a fraction of the total number of trails is exactly $P(e)$. The implication is that {%marginnote "almost surely" "For a measure 1 subset of samples in $\Omega_\infty$, of which each sample is itself an infinite sequence of single-trial samples." %} we can infer $P$ from {%marginnote "just one sample" "Technically the singleton event containing just that sample." %} of an infinite sequence of trials, thus apparently solving the inverse probability problem (almost surely) for the i.i.d. case. {%fixme%}Give a concrete example using the binary sample set{%endfixme%}

As I mentioned earlier, countable events of real numbers are always measure 0 ([proof](https://proofwiki.org/wiki/Countable_Sets_Have_Measure_Zero)) for probability measures defined on the reals. Sample set $\Omega_\infty$ has the cardinality of $\real$, and there is a {%marginnote "natural bijection to the unit interval" "If the sample space $\Omega$ of each trial is finite, we can think of a sequence $(\omega_1, \omega_2, \ldots)$ as the decimal expansion of a number between 0 and 1 in base $\abs{\Omega}$." %}. Therefore there are potentially an infinity of events in $\Omega_\infty$ (countably many) for which BLLN does not hold. As before we may ask a similar question: can these BLLN-violating events happen?

Let's step back and ask, what is so special about the BLLN anyway? Why should samples satisfy it? In fact, for any particular sample $\omega_\infty$, I can construct a measure 1 set $$\Omega_\infty \setminus \{\omega_\infty\}$$ which does not contain it, simply because the singleton set $$\{\omega_\infty\}$$ has measure 0. Thus it seems that for any sample, there is a "law" which states that it *amost surely* does not occur. In essence, all samples are special, or none are.



Ming Li and Paul Vitányi in their [An Introduction to Kolmogorov Complexity and Its Applications](https://link.springer.com/book/10.1007%2F978-3-030-11298-1) summarize this conundrum quite well:

> We call a sequence ‘random’ if it is ‘typical.’ It is not ‘typical,’ say ‘special,’ if it has a particular distinguishing property. An example of such a property is that an infinite sequence contains only finitely many ones. There are infinitely many such sequences. But the probability that such a sequence occurs as the outcome of fair coin tosses is zero. ‘Typical’ infinite sequences will have the converse property, namely, they contain infinitely many ones.

> In fact, one would like to say that ‘typical’ infinite sequences will have all converse properties of the properties that can be enjoyed by ‘special’ infinite sequences. This is formalized as follows: If a particular property, such as containing infinitely many occurrences of ones (or zeros), the law of large numbers, or the law of the iterated logarithm, has been shown to have probability one, then one calls this a law of randomness. A sequence is ‘typical,’ or ‘random,’ if it satisfies all laws of randomness.

> But now we are in trouble. Since all complements of singleton sets in the sample space have probability one, it follows that the intersection of all sets of probability one is empty. Thus, there are no random infinite sequences!

An elegant solution to this conundrum was discovered by [Per Martin-Löf](http://www.nieuwarchief.nl/serie5/pdf/naw5-2018-19-1-044.pdf), which {%marginnote "restricts $P$ to be [computable](https://en.wikipedia.org/wiki/Computable_function)" "It can be argued that all feasibly usable probability measures are necessarily computable, and so this is not really a restriction at all."%}, but that is unfortunately out of scope for this post (I hope to write a future post on Martin-Löf's solution).

# Primer to measure theory

Congratulations! You've reached end of this post. <button class='advanced-button'>Click here</button> (or on any {%adv%}purple block{%endadv%}) to unlock the {%adv%}purple text{%endadv%} on measure theory above. After reading this section, return to the earlier sections and take in the finer precision and details offered by your new found understanding of measure theory.

Terence Tao, in [An Introduction to Measure Theory](https://terrytao.files.wordpress.com/2011/01/measure-book1.pdf), motivates measure theory, saying:
> One of the most fundamental concepts in Euclidean geometry is that of the measure $m(E)$ of a solid body $E$ in one or more dimensions. In one, two, and three dimensions, we refer to this measure as the length, area, or volume of $E$ respectively.
> ... The physical intuition of defining the measure of a body $E$ to be the sum of the measure of its component “atoms” runs into an immediate problem: a typical solid body would {%marginnote "consist of an infinite (and uncountable) number of points" "He is referring to the mathematical ideal of a body being composed of a set of 0-dimensional points." %}, each of which has a measure of zero; and the product $\infty \cdot 0$ is indeterminate. To make matters worse, two bodies that have exactly the same number of points, need not have the same measure. For instance, in one dimension, the intervals $A := [0, 1]$ and $B := [0, 2]$ are in one-to-one correspondence (using the bijection $x \mapsto 2x$ from $A$ to $B$), but of course $B$ is twice as long as $A$. So one can disassemble $A$ into an uncountable number of points and reassemble them to form a set of twice the length.

Terence also mentions the [Banach-Tarski paradox](https://en.wikipedia.org/wiki/Banach%E2%80%93Tarski_paradox) which shows that even finitely many partitions of a sphere (only 5 are needed!) can be rearranged into two spheres. These kinds of non-measure-preserving sets are always going to be pathological, so the solution is to disallow measurement of these pathological sets. We call those sets *non-measurable*. If you are curious what non-measurable sets are like, Terence talks about them in section 1.2.3. In the case of the Banach-Tarski paradox, these sets look like fuzzy balls with infinitely many holes in them. The [video on Banach–Tarski by vsauce](https://www.youtube.com/watch?v=s86-Z-CbaHA) gives a good visual depiction.

I will not go into how measurable sets can be defined. There are many approaches, the most common of which is due to [Lebesgue](https://en.wikipedia.org/wiki/Lebesgue_measure) (Tao section 1.3). It suffices to say that you cannot have all subsets of $\real$ be measurable without giving up [desirable properties of *measure*](https://en.wikipedia.org/wiki/Non-measurable_set#Consistent_definitions_of_measure_and_probability), e.g. that rearranging and rotating disjoint sets does not change their cumulative measure. In what follows, I'm going to assume that for some set $\Omega$ of any cardinality (finite, countable, uncountable, etc.), we just so happen to be in possession of a reasonable set of measurable sets $E \subseteq 2^\Omega$ and the associated measure $P$. Read Terry's book for details on how to construct such things. I'm merely going to run through the important definitions and terminology pertaining to probability theory, using the naming conventions of probability theory rather than measure theory.

Let $\Omega$ be some set of any cardinality (finite, countable, uncountable, etc.). Assume we are in possession of the set of all measurable subsets $E \subseteq 2^\Omega$, and $P$ is a **measure**. The triple $(\Omega, E, P)$ is called a **measure space**. $(\Omega, E)$ is a **measurable space** (where no measure is specified). Any set $e \in E$ is called **measurable** and $e' \notin E$ is called **non-measurable**. The signature of $P$ is $E \to \real$, and so it maps only measurable sets to real numbers representing the measures (sizes) of those sets.

There are a few requirements for $P$ that make it behave like a measure. Repeated from [above](#definitions), they are:
  * **Non-negativity**: $$P(e) \geq 0,\ \forall e \in E$$.
  * **Null empty set**: $$P(\emptyset) = 0$$.
  * **Countable additivity**: For any countable $$A \subseteq E$$ where $$\bigcap A = \emptyset$$, $$P(\bigcup A) = \sum P(A)$$, where $$P(A) = \{P(e) \mid e \in A\}$$.

{%jumpto "sigma-algebra"%}
Further, $E$ is required to be a {% marginnote "**$\sigma$-algebra**" "Following following Tao, section 1.4.2. For further information see [Wikipedia](https://en.wikipedia.org/wiki/%CE%A3-algebra)." %}, which means it satisfies:{%endjumpto%}
  * **Empty set**: $\emptyset \in E$.
  * **Complement**: If $e \in E$, then the complement $e^c := \Omega \setminus e$ is also in $E$.
  * **Countable unions**: If $e_1, e_2, \ldots \in E$ then $\bigcup_{n=1}^\infty e_n \in E$.

What this all amounts to is that our measure is always non-negative, the empty set is measurable with a measure of 0, compliments and countable unions of measurable sets are measurable, and measure is additive (i.e. sum of measures of disjoint sets equals the measure of the union of those sets).

There's one more kind of object that probability theory makes heavy use of: the measurable function. Recounting the definition I gave [earlier](#motivation-3-construct-events-that-are-guaranteed-measurable), given two measurable spaces $(A, \mathcal{A})$ and $(B, \mathcal{B})$, a **measurable function** $X : A \to B$ satisfies

$$
X^{-1}(b) \in \mathcal{A},\ \forall b \in \mathcal{B}\,,
$$

where $$X^{-1}(b) = \{\alpha \in A \mid X(\alpha) \in B\}$$ is the pre-image of $X$ on $b \subseteq B$. $X$ never maps a non-measurable subset of $A$ to a measurable subset of $B$, but $X$ could map a measurable subset of $A$ to a non-measurable subset of $B$. We only care about the reverse direction, and it becomes apparent why in the [section on random variables](#motivation-3-construct-events-that-are-guaranteed-measurable).


A **probability measure** is a measure s.t. $P(\Omega) = 1$, i.e. the measure of the entire set $\Omega$ is bounded and equals 1.






