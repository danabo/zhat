---
layout: post
title: "Primer to Probability Theory"
date:   2020-06-12
categories: post
---

$$
\newcommand{\bin}{\mathbb{B}}  \newcommand{\abs}[1]{\left\lvert#1\right\rvert}
$$

Probability is a measure defined over a set of events, and probabilistic statements are all about constructing such sets to measure. A measure is a generalization of size which corresponds to length, area, and volume (rather than bijective mappings).

<!--more-->

* Table of contents
{:toc}
{: .toc}

Main references:
* <https://en.wikipedia.org/wiki/Probability_axioms#Axioms>
* <https://en.wikipedia.org/wiki/Measure_space>
* <https://en.wikipedia.org/wiki/Random_variable#Measure-theoretic_definition>
* <http://statweb.stanford.edu/~souravc/stat310a-lecture-notes.pdf>



Kolmogorov's definition of probability may seem complex and technical, but it is actually very elegant in that it just simply makes use of an already existing mathematical object, the [measure space](https://en.wikipedia.org/wiki/Measure_space). Luckily, we don't need to understand more than the absolute basics of [measures and measure theory](https://en.wikipedia.org/wiki/Measure_(mathematics)) to understand Kolmogorov's definition and to do most things we want with probability.

I have yet to come across a primer that explains the measure-theoretic definition of probability without taking a long and unneeded detour into measure theory. I structured this article to be read twice. The first pass is without measure theory, and the second pass is with measure theory. Measure-theory content is in <font color="blue">blue</font>. Simply ignore <font color="blue">blue text</font> the first time around (unless you are already acquainted with measure theory, but then you can just look at [Wikipedia's definition of probability](https://en.wikipedia.org/wiki/Probability_axioms#Axioms) and understand what's going on).


I believe that having a crisp and exact understanding makes everything easier in the long run, and allows for creativity, ingenuity, and heterodox thought. One needs to bite the bullet and do the work up front to understand the formal definitions.


# Definitions

* **Sample** $\omega$ (i.e. primitive event) is a possible state of the world. Samples are disjoint, meaning only one sample can be the case at a time. Samples can be any kind of mathematical object.
* **Sample set** $\Omega$ is a set of all possible samples.
* **Event** $e \subseteq \Omega$ is a set of samples. Samples $\omega \in e$ are {% marginnote "considered identical" "They may be distinguishable, but the difference does not matter." %} w.r.t. $e$.
* **Event space** $E \subseteq 2^\Omega$ is the set of subsets of $\Omega$ for which we are allowed to assign probability. We require that $\emptyset, \Omega \in E$ <font color="blue">and $E$ is required to be a $\sigma$-algebra that provides the measurable subsets of $\Omega$.</font>
* **Probability** $P : E \to [0, 1]$ is a function that maps allowed subsets of $\Omega$ to the real unit interval. <font color="blue">$P$ is a measure</font>

Requirements on $P$ <font color="blue">(If $P$ is a measure then it automatically satisfies these)</font>:
* **Non-negativity**: $$P(e) \geq 0,\ \forall e \in E$$
* **Null empty set**: $$P(\emptyset) = 0$$
* **Countable additivity**: For any countable $$A \subseteq E$$ where $$\bigcap A = \emptyset$$, $$P(\bigcup A) = \sum P(A)$$, where $$P(A) = \{P(e) \mid e \in A\}$$


The triple $(\Omega, E, P)$ defines a probability space <font color="blue">which is also a measure space.</font> These three objects are all we need to do probability calculations.

## Kolmogorov axioms of probability

The standard Kolmogorov axioms are:
1. $P(e) \in [0, 1], \forall e \in E$, where $[0, 1] \subset \mathbb{R}$
2. $P(\Omega) = 1$, i.e. probability of anything happening is 1.
3. <font color="blue"><a href="https://en.wikipedia.org/wiki/Sigma_additivity">$\sigma$-additivity</a> on $E$.</font>

Because I've already specified (1) and (3) in the definitions above, (2) is the only axiom we need, <font color="blue">in addition to specifying that $(\Omega, E, P)$ is a measure space.</font> That's it!

## Examples

**Finite**: Dice rolls

$$\Omega = \{⚀,⚁,⚂,⚃,⚄,⚅\}$$,
$$E=2^\Omega$$,
$$P(\{⚀\})= P(\{⚁\}) = \ldots = P(\{⚅\}) =1/6$$.

Note that $$P(⚀)$$ is not defined. $P$ measures the "size" of sets. $$\{⚀\}$$ is the set containing one sample. We can also compute the probability of larger sets, e.g.
$$P(\{⚀,⚅\}) = 1/3$$,
$$P(\{⚁,⚃,⚅\}) = 1/2$$,
$$P(\{⚀,⚁,⚂,⚃,⚄,⚅\}) = 1$$.

**Countable**: Binary sequences

$$\bin = \{0, 1\}$$
Let $x \in \bin^n$ be a binary sequence of length $n$, and $$\abs{x} := n$$ returns the length of $x$.

$$\Omega = \mathbb{B}^\infty$$,
$$E=\{\{\omega \in \Omega \mid x = \omega_{1:\abs{x}}\} \mid x \in \mathbb{B}^n, n \in \mathbb{N}\} \cup \{\emptyset\}$$ where $$\omega_{1:\abs{x}}$$ is the prefix subsequence of $\omega$ of length $\abs{x}$.
Let $$\Gamma_x = \{\omega \in \Omega \mid x = \omega_{1:\abs{x}}\}$$.
$$P(\Gamma_x) = 2^{-\abs{x}}$$ is the uniform measure.

Each $$\Gamma_x \in E$$ corresponds to the finite binary sequence $$x$$.
$$P$$ can be thought of as a distribution over finite binary sequences where $$P(\Gamma_x) = P(\Gamma_{x0}) + P(\Gamma_{x1})$$, where $$x0, x1$$ are the concatenations of $$x$$ with 0 or 1.

**Uncountable**: The reals

$$\Omega=\mathbb{R}$$,
$$E \subset 2^\mathbb{R}$$ is the set of all sets of reals formed by countable union, intersection, and complement of the open intervals.

Let $$f : \mathbb{R} \to \mathbb{R}$$ be a pdf, such as the [standard normal pdf](https://en.wikipedia.org/wiki/Normal_distribution).
$$P(e) = \int_e f(x) \mathrm{d}x,\ \forall e \in E$$ is the integral over the real numbers in set $$e$$.

## Events vs samples

**Question:** Why provide event space $E$? Isn't this redundant with $\Omega$?
1. Providing $E$ makes it much easier to define $P$. Let's look at the dice example again: $$\Omega = \{⚀,⚁,⚂,⚃,⚄,⚅\}$$. You are probably objecting that simply assigning a probability to each die outcome is sufficient to define $P$. While this is true, the input type of $P$ would be wrong. If we define $P$ on samples $\omega \in \Omega$, then how do we ask for the probability of rolling an even face? That is the probability of the set $$\{⚁,⚃,⚅\}$$. If we instead define $$P(\{⚀\}), P(\{⚁\}), \ldots, P(\{⚅\})$$ only, and then specify that $P$ is additive over union of sets, that is sufficient. Ultimately this may seem like technicalities that don't really matter, which brings me to...
2. <font color="blue">Some uncountable sets are not measurable. [Here](https://en.wikipedia.org/wiki/Non-measurable_set#Consistent_definitions_of_measure_and_probability) is a nice summary of the necessary trade-offs any notion of size needs to make. $E$ tells us which subsets of $\Omega$ are measurable. In practice you will not encounter non-measurable sets, so this may also seem like an unnecessary technicality.</font>
3. The real reason for including $E$ is so that we can reuse the machinery of measure theory, and reduce the entire definition of probability to 1 (or 3) simple axioms. Information redundancy in mathematical constructions is actually quite common. For example, a group is defined as $(G, +)$ where $G$ is a set of objects and $+ : G \times G \to G$ is some binary operator defined over $G$. The definition of $+$ already includes $G$, so technically providing $G$ is not necessary. A group is defined as a tuple $(G, +)$ to distinguish it from the set $G$ and the operator $+$. Another example is a topological space defined as the tuple $(X, \tau)$ where $X$ is a set of objects and $\tau$ is a set of subsets of $X$ ($\tau$ is simply called a topology) and $\tau$ necessarily contains $X$. Technically $X = \bigcup \tau$ so we don't need to provide $\tau$, but again we want to distinguish a topological space from $X$ and topology $\tau$. <font color="blue">Finally, measure theory is the source of the very redundancy we are addressing, inherited by probability theory. A probability space is also a measure space defined as the triple $(\Omega, E, P)$, distinct from $\Omega$, the set of subsets of $\Omega$ that can be measured, and the measure $P$.</font>


# Constructing events (sets of samples)

Remember that samples are primitive outcomes. Samples are considered to be disjoint, meaning that only one can happen at a time. An event is a set of samples, which should be interpreted as the disjunction between them, i.e. one of the samples in the event happened, and you don't know which. A primitive event is then an event containing a single sample, i.e. $e = \{\omega\}$ where $\omega \in \Omega$. Under normal cases, we can always measure the probability $P(\{\omega\})$. What follows entirely regards constructing more complicated events.

First, stating the obvious, we are always free to explicitly provide an event (i.e. set of samples) to measure the probability of. For example,
$$
e = \{\omega \in \Omega : \mathrm{condition}(\omega) = 1\}\,.
$$
So long as $e \in E$, then $P(e)$ is defined.

Random variables are devices for constructing events to measure (the probability of). That is their purpose. Contrary to their name, there is nothing random about them. There are two specific needs motivaing them:
1. We want to be able to construct events of events, such as $\{\omega \in \Omega : \mathrm{condition}(\varepsilon) = 1, \omega \in \varepsilon, \varepsilon \in \mathrm{SetOfEvents}\}$. In other words, we want to be able to hide unimportant information contained in samples $\omega$.
2. We want to be able to specify the *condition* above without worrying about whether the resulting set is in $E$.

## Need 1

This is a countable $\Omega$, measure-theory-free version of random variables.

A random variable is a function $X : \Omega \to F$, where $F$ is any set containing any kind of objects you wish. That's it. It's a deterministic function. There is nothing random about it.

Let's consider two coin tosses. Define sample space
$$
\Omega = \{\mathrm{``HH"}, \mathrm{HT}, \mathrm{TH}, \mathrm{TT}\}\,.
$$

"HH", "HT", etc., are strings! They don't have any inherent meaning yet, but I've made them very suggestive of what they should mean.

I want to be able to talk about the first and second coin separately, so I'll define $X_1 : o_1o_2 \mapsto o_1$ and $X_2 : o_1o_2 \mapsto o_2$.

Now instead of writing for the event where coin 1 is heads,
$$
P(\{\mathrm{HH}, \mathrm{HT}\})\,,
$$
we can write instead,
$$
P(\{\omega \in \Omega : X_1(\omega) = \mathrm{H}\})\,.
$$
There is a convenient shorthand notation for constructing this set:
$$
P(X_1 = H)\,.
$$

Realize that I named the elements in $\Omega$ in a way that was convenient for picking out one coin or the other. I could have written
$$
\Omega = \{\omega_1, \omega_2, \omega_3, \omega_4\}\,,
$$
in which case the convenience of using a random variable becomes more obvious.

In the general case, we might want to represent any number of interacting observables and components in a system. How about modeling the weather or the stock market? Your primitive sample space might be astronomical, but you can identify all sorts of observables like the price of AAPL at time $t$ or the temperature of Florida on Tuesday, which would be convinent to deal with seprately. At the same time, you don't want to lose the rich information about how one particular observable interacts with all the others. We would like to be able to marginalize out partial information contained in primitive samples.

Furthermore, we want to be able to compute things. The classic examples are the sum of dice, or the mean and variance of a dataset. In these cases, the random variable does the computation, i.e. maps from a sample to its value.


## Need 2

Now we come to the measure-theoretic definition of random variable. Let's say $\Omega$ is uncountable, and we've provided $E$ as the set of measurable subsets of $\Omega$.

A random variable is a **measurable** function $X : \Omega \to F$, where $F$ is a [measureable space](https://en.wikipedia.org/wiki/Measurable_space) with $\sigma$-algebra $\mathcal{F}$ (measurable subsets of $F$). Again $F$ contains any objects you wish, but now we add the measurability constraint. Why? because we want to ensure that any set of the form,
$$
\{\omega \in \Omega : X(\omega) \in A\}\,,
$$
is measurable, assuming $A \subseteq F$ is measurable, i.e. $A \in \mathcal{F}$.

"$X$ is measurable" means that for every $A \in \mathcal{F}$, $X^{-1}(A) \in E$. In words, $X$ maps measurable sets to measurable sets. Specifically $X^{-1}(A)$ is the preimage,
$$
X^{-1}(A) = \{\omega \in \Omega : X(\omega) \in A\}\,.
$$
Look familiar?

Now we are free to use our fancy probability notation without worry about whether what we are doing is measurable.

$$
P(X \in A) = P(\{\omega \in \Omega : X(\omega) \in A\})
$$
$$
P(X = f) = P(\{\omega \in \Omega : X(\omega) = f\})\,,
$$
if we've defined an equality relation over $F$.
$$
P(X > f) = P(\{\omega \in \Omega : X(\omega) > f\})\,,
$$
if we've defined an ordering over $F$.

# Almost surely

https://en.wikipedia.org/wiki/Almost_surely

This is only something that comes up when you have measure 0 sets, i.e. uncountable sample space. However, almost surely is an important concept for probability in general, even if your sample space is countable or finite. That is because collecting infinite data from your data generating process gives you uncountable sample spaces. Toss a coin an infinite number of times, and your sample space becomes all infinite binary sequences, of which there are uncountably many (easy to make a bijection to the unit interval), and measure 0 sets. This is why the law of large numbers is an almost surely statement, independent of whatever distribution you are dealing with.

* Measure 0 and measure 1 sets
* reason to distinguish between samples and events: in uncountable sample spaces, samples cannot be observed. singleton events are measure 0, and occur almost never (a.n.). you can observe intervals, not individual reals.
* measure 1 events occur almost surely, despite possibly leaving out a measure 0 subset of samples, i.e. holes don't matter

Do measure-0 sets occur? Any single real number has 0 probability of occurring. Isn't that a paradox?
* There is not a consensus on whether measure-0 events can be said to happen. I take the view that they do not. Countable sets of real numbers have measure 0, including singletons. In practice, we never sample a true real number from a distribution. Rather we sample a number with error bars, i.e. an interval. All intervals have non-zero measure. When you throw a dart at a dart board, you don't hit an infinitely small point, but some area with non-zero probability.

# Implications

So far, everything has been quite abstract. We've talked about measuring the size of sets of samples. But we haven't meantioned what is means for an event to have a probability. So much of math is developed to match patterns in the real world. What does this math have to say about the real world?

Probability doesn't actually have anything to say about what it means for an outcome to be likely or unlikely, or expected or unexpected in the coloquial sense, at least not in a non-circular way. Kolmogorov's axioms merely ensure that probability behaves correctly when you do the math. Random variables merely make building events easier and provide some notational sugar.

All statements of probability which get used on real data are about the limit of infinite samples, i.e. probability only talks about limiting behavior for infinite sequences, rather than the behavior of finite processes. Implicit in the logic of what we've constructed above is the notion of frequency of occurance. When you consider an infinite sequence of random variables, then you can start talking about properties that happen almost surely. e.g. strong law of large numbers, [almost sure CLT](http://www.diva-portal.org/smash/get/diva2:304483/FULLTEXT01.pdf).

Of course probability theory didn't come out of nowhere. We are taught probability using games of chance, such as coin tosses and dice throws. The Kolmogorov axioms formalize and unify notions of probability that were developed in past centuries mainly for gambling. It wasn't until the late 19th and 20th century that probability was repurposed as a tool for reasoning about arbitrary data, where little is known about the data genenerating process. For example, predicting the weather, crop yields, population trends, the stock market. Any sort of real-world decision making outside of constructed and controlled games involves uncertainty not just in state, but of what the rules are. We don't know how everything affects everything else, and how our decisions impact everything. We have jumped to modeling something incredibly vast and irreducably complex.

But even in games of chance, how did we convert a statement of probability into a bet? How did we give meaning to likely and unlikely, expected and unexpected?

# Decision theory








