---
layout: post
title: "Probability Theory: More Syntax, More Problems"
date:   2020-07-06
categories: post
---
<!--more-->

$$
\newcommand{\bin}{\mathbb{B}}
\newcommand{\nat}{\mathbb{N}}
\newcommand{\real}{\mathbb{R}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\d}{\mathrm{d}}
\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
\newcommand{\bigmid}{\;\middle|\;}
$$

* Table of contents
{:toc}
{: .toc}

In my last post I introduced some fancy random variable notation and went over a few ways that notation gets abused (i.e. idiomatic uses that are syntactically incorrect). In this follow up, I want to introduce some more common notation and discuss further how syntax is often abused, and how to avoid it.

When I say "abuse of notation" I mean that a syntactic rule is being broken, but the intended meaning is still understood by most. I do not focus on abuses of notation just to be pedantic. In my own experience, invalid syntax opens up the door to ambiguity. The beauty of mathematics (and programming) is that ambiguity is absent. Ideas are transmitted losslessly. Unlike natural language which is messy because sentences can often be understood in different ways, mathematics (and code) has a unique parse (if syntax is valid). Though that does not gaurentee the author's intent will be conveyed, at least the proof, theorem, expression, code, etc. is well defined.

# Measuring probability

There are three different kinds of functions that appear in probability theory. They can often be conflated which leads to confused syntax. They are:
1. Probability measure,
2. Probability mass function,
3. Probability density function.

A **probability measure** is a function from sets to real numbers.
Probability mass/density functions map individual samples to real numbers.

Typically probability distributions are specified by a probability mass/density function rather than a measure.

Let $P : E \to [0,1]$ be a probability measure.
If $\Omega$ is discrete, then we define a probability mass function $F(\omega) = P(\{\omega\})$.
If $\Omega$ is continuous (and a metric space), then we define a probability density function $f(\omega) = \frac{\d}{\d \omega} P((0, \omega])$.

In the discrete case, it is easy to confuse $F$ with $P$ because they agree on singleton events. Often, no measure is specified at all and $P$ denotes the probability mass function. In that case, $P(\omega)$ would be valid. But then $P(X=x)$ is not valid.

In the continuous case, it is easy confuse $P$ with a related quantity, the cumulative density function...  However typically the probability density function is notated with a lowercase $p$, and used as if it was a measure, e.g. $p(X=x)$, or $p(x), p(x, y), p(y,x)$ etc. where arguments are given by name rather than position, and omitted arguments imply marginal distribution.


# Conditional probability

Let $e_1, e_2 \in E$ be events. Define the **conditional probability** of $e_1$ given $e_2$ as

$$
P(e_1 \mid e_2) := P(e_1 \cap e_2) / P(e_2)\,.
$$

This should be interpreted as the probability of $e_1$ given I know that $e_2$ is the case.

Quoting [Wikipedia](https://en.wikipedia.org/wiki/Conditional_probability#Kolmogorov_definition):
> The logic behind this equation is that if the possible outcomes for $e_1$ and $e_2$ are restricted to those in which $e_2$ occurs, this set serves as the new sample space.

We can think of $P(e_1 \mid e_2)$ as a handy way to *factor* $P(e_1 \cap e_2)$ into a product of two probabilities, even when $e_1$ and $e_2$ are not independent. Define $Q_{e_1}, Q_{e_2}$ such that $P(e_1 \cap e_2) = P(e_1)Q_{e_1}(e_2) = Q_{e_2}(e_1)P(e_2)$ is always true, and we get:

$$
P(e_1 \cap e_2) = P(e_1)P(e_2 \mid e_1) = P(e_1 \mid e_2)P(e_2)\,.
$$

A combinatoric argument for this can be made, as summarized in this diagram:
{% extfigure "https://upload.wikimedia.org/wikipedia/commons/9/9c/Probability_tree_diagram.svg" "Credit: https://en.wikipedia.org/wiki/File:Probability_tree_diagram.svg" %}

This conditional probability notation is also extended to random variables so that we can think of outcomes conditioned on other outcomes, rather than sets conditioned on sets. Define the **conditional distribution** of RV $X$ given that RV $Y = y$ as

$$P_{X \mid Y=y}(A) := P(X \in A \wedge Y = y) / P(Y = y)\,.$$

Now we can write things like,

$$P(X = x \mid Y = y) = P_{X \mid Y=y}(\{x\})\,,$$

and in general for RVs $X_1, X_2, \ldots, Y_1, Y_2, \ldots$ we have

$$
\begin{align}
& P(\mathrm{condition}(X_1, X_2, \ldots) \mid \mathrm{condition}(Y_1, Y_2, \ldots)) \\
& \quad := P(\mathrm{condition}(X_1, X_2, \ldots) \wedge \mathrm{condition}(Y_1, Y_2, \ldots)) / P(\mathrm{condition}(Y_1, Y_2, \ldots))\,.
\end{align}$$

RVs provide another way to think about what conditional probability is doing. Thinking of $P_{X,Y}$ as a probability table (or a continuous 2D surface), $P_{X \mid Y=y}$ is merely restricting the $Y$ axis to one value, $y$ (rather than marginalizing as $P_X$ does). The problem is that $$P_{X,Y}(X(\Omega), \{y\}) = P(Y = y)$$ is usually less than 1. We just need to normalizing it. So for any subset $A \subset X(\Omega)$, that means dividing $$P_{X,Y}(A, \{y\})$$ by $P(Y=y)$, and we have our definition.

## Abuses



# Expected value

Averages are {% marginnote "heavily used in statistics" "Though maybe dogmatically. See my [earlier post](http://zhat.io/articles/bias-variance#bias-variance-decomposition-for-any-loss)." %}, and so they are given special notation in probability theory. An average is the sum of values in a finite population divided by the size of the population. Probability theory generalizes the average to probability-weighted average, or just **weighted average**, also called **expected value** or just **expectation**, [defined as](https://en.wikipedia.org/wiki/Expected_value#General_case)

$$
\E \left[f(X)\right] := \int_\Omega f(X(\omega)) \d P(\omega)
$$

This is called a Lebesgue integral (used to integrate Lebesgue measures), which is a definition of integration from measure theory. The Lebesgue integral is out of the scope of this post. All you need to know is that the Lebesgue integral becomes a Riemann integral for typical probability measures on the reals for which a probability density function is well defined, i.e. $\Omega \subseteq \real$ and $P((a, b])$ is defined for all $a, b \in \real$. We saw in the [example for $\real$](#examples) above that the probability density function is defined as $\mathrm{pdf}(z) = \frac{\d}{\d z} P((0, z])$. Typically distributions over the reals are defined in terms of such a p.d.f. In general we have $\Omega \subseteq \real^n$ and $\mathrm{pdf}(z_1, \ldots, z_n)$ is provided. The expectation is then the Riemann integral:

$$
\E_X \left[f(X)\right] = \int_\Omega f(X(z)) \mathrm{pdf}(z_1, \ldots, z_n) \d z_1 \ldots \d z_n
$$

For finite (and countable?) sample spaces, {%marginnote "the Lebesgue integral becomes a summation" "See [Terry Tao Measure Theory Book](https://terrytao.files.wordpress.com/2011/01/measure-book1.pdf), Exercise 1.4.40"%}. How elegant!

$$
\E_X \left[f(X)\right] = \sum_{\omega \in \Omega} f(X(\omega))P(\{\omega\}) = \sum_{x \in X(\Omega)} f(x)P(X = x)
$$

Now that we know that the Lebesgue integral $\int_\Omega \ldots \d P(\omega)$ is a sum of terms multiplied by the measure for discrete sample spaces, and a integral over terms multiplied by the p.d.f. for continuous sample spaces, I will use them in the remaining discussion to maintain generality.

The general case is that we take the expectation of an arbitrary expression of many RVs, $\mathrm{expr}(X_1, \ldots, X_n)$:

$$
\E \left[\mathrm{expr}(X_1, \ldots, X_n)\right] := \int_\Omega \mathrm{expr}(X_1(\omega), \ldots, X_n(\omega)) \d P(\omega)\,.
$$

*Extra information in subscripts*

RVs to capture: \E_{X_1, \ldots, X_n}

$$
\E_{X_1, \ldots, X_n} \left[\mathrm{expr}(X_1, \ldots, X_n, Y_1, \ldots, Y_m)\right] := \int_\Omega \mathrm{expr}(X_1(\omega), \ldots, X_n(\omega), Y_1, \ldots, Y_m) \d P(\omega)\,.
$$

Which probability measure: \E_q
Generating RVs on the fly: \E_{X \sim N(0, 1)}

*Examples of each used in practice*

z~q (pdf): https://stats.stackexchange.com/a/406458
iid rv notation {z​s​​}​1​S​​∼q(z;λ): http://edwardlib.org/tutorials/klqp
E_q: https://xyang35.github.io/2017/04/14/variational-lower-bound/





## Abuses

Abuses of notation:
Not providing subscripts when:
1. Ambiguous which RVs to capture
2. Ambiguous which variables are RVs, or what the definitions of the RVs are.

TODO: find more examples of non-sense expected value notation and formulae

Bias-Variance decomp in ESL, page 37
https://stats.stackexchange.com/a/401485

# Tilde operator

You've probably seen things like $X \sim \mathcal{N}(\mu, \sigma^2)$ or $X \sim \mathcal{U}(a, b)$. I was not able to find a formal definition for the tilde operator. [Wikipedia](https://en.wikipedia.org/wiki/Notation_in_probability_and_statistics) and [wolfram.com](https://mathworld.wolfram.com/Tilde.html) both define it in words as meaning "has the probability distribution of." So the examples above would translate to $X$ has the probability distribution of $\mathcal{N}(\mu, \sigma^2)$, etc. The left hand side (l.h.s.) is presumably meant to be a random variable. But what is on the right hand side (r.h.s.)? As far as I can tell, $\mathcal{N}(\mu, \sigma^2)$ and $\mathcal{U}(a, b)$ are merely notational shorthands for the [Gaussian (normal)](https://en.wikipedia.org/wiki/Normal_distribution) and [uniform](https://en.wikipedia.org/wiki/Uniform_distribution_(continuous)) distributions respectively. The wikipedia pages for most distributions have a helpful **Notation** entry in their quick facts table on the right, which shows the respective shorthand.

It looks to me like $\mathcal{N}(\mu, \sigma^2)$ is an object constructor in the programming sense. But what is the type of the object it constructs? Wolfram has revealed to me that $X \sim Y$ for two random variables is also a possibility. The r.h.s. is then anything with a probability distribution for the l.h.s. to "have the distribution of." Let's say the r.h.s. is an object which has a `measure` attribute that stores a probability measure, and for continuous domains a `pdf` attribute storing the probability density function. Let's presume random variables to implicitly have such attributes attached to them, and the special *notation* of common distributions construct similar such objects. Now we are cooking.

But what about notation like $X \sim p$, where $p$ is often a p.d.f. but it could also be a measure. Or $X \sim p(x \mid y, z)$. It is often the case that there is a probability measure over a large sample space, and you want to invoke random variables for various conditional and marginal distributions.

What about multiple RV creation? e.g.

$$
X_1, X_2, \ldots, X_k \sim \mathcal{N}(\mu, \sigma^2) \\
X_1 \sim \mathcal{N}(0, 1), X_2 \sim \mathcal{U}(-1, 1), \ldots, X_k \sim \mathcal{N}(1, 5)
$$

The former constructs an i.i.d. set of RVs, and the latter constructs a set of independent but not identical RVs.
How do I construct dependent RVs with this notation? Well $X_1 \sim \mathcal{N}(0, 1)$ is fine, but how do I define $X_2$ to have a distribution conditioned on $X_1$? I will speculate that we can put RVs inside the distribution constructor, e.g. $X_2 \sim \mathcal{N}(X_1, 1)$ means $X_2$ has a Gaussian distribution whose mean is $X_1$. In general, given a set of distributions indexed by $X_1$, i.e. $$\{P_{X_1(\omega)} \mid \omega \in \Omega\}$$, we can define $X_2$ by writing $X_2 \sim P_{X_1}$.

---

The result is itself a random variable! Since we did not **capture** the arguments of $Y_1, \ldots, Y_m$, the result is still a function, i.e.

$$
\xi \mapsto \int_\Omega \mathrm{expr}(X_1(\omega), \ldots, X_n(\omega), Y_1(\xi), \ldots, Y_m(\xi)) \d P(\omega)
$$

is an RV from $\xi \in \Omega$ to the codomain of $\mathrm{expr}$. Note that $\mathrm{expr}$ denotes any algebraic or symbolic combination of its arguments, e.g. $\mathrm{expr}(X, Y, Z) = 5X^2 + YZ/\log(1+X)$, and includes integrals. Thus expression above can also be seen as an $\mathrm{expr}$ of RVs, i.e. $\mathrm{expr}(Y_1, \ldots, Y_m) = \E_{X_1, \ldots, X_n} \left[\mathrm{expr}(X_1, \ldots, X_n, Y_1, \ldots, Y_m)\right]$. We could then take the expectation again w.r.t. $Y_1, \ldots, Y_m$, e.g. $\E_{Y_1, \ldots, Y_m}\left[\mathrm{expr}(Y_1, \ldots, Y_m)\right]$ to get a constant. Note that nested expectations are actually common, e.g. <https://en.wikipedia.org/wiki/Law_of_total_expectation>.

I explicitly put subscripts on my expectations to denote which RVs are getting captured. However, it is common and acceptable to drop the subscripts, **so long as you are capturing all RVs in the brackets and it is clear which variables are random variables**, e.g.

$$
\E \left[\mathrm{expr}(X,Y,Z)\right] = \E_{X,Y,Z} \left[\mathrm{expr}(X,Y,Z)\right]\,.
$$

# Abuses of notation: round two

The expected value notation leads to a whole new host of ubiquitous abuses of notation. Briefly, they are:

This notation assumes we have a random variable $X : \Omega \to F$, however in many cases we just want to compute the expectation over our sample set. The right way to do this is to define an identity RV $I : \Omega \to \Omega : \omega \mapsto \omega$, and take the expectation $\E_I[f(I)]$. We've seen in the first [abuses of notation section](#abuses-of-notation) how samples and random variables can be conflated. It is common to notate the sample set as $X$ and samples as $x \in X$, and then write any of $\E[f(X)]$, $\E[f(x)]$, $\E_X[f(X)]$, $\E_{x \sim X}[f(x)]$, all meant to mean $\E_I[f(I)]$.

Something that is unfortunately all too common is dropping subscripts on $\E$ when (1) it is not clear which variables in the brackets are random variables, or (2) not all the RVs in the brackets are being captured.

E[f(x)] instead of E[f(X)]
E_{x\sim X}[] or E_{x\sim P(x)}[]
E_Q[]  gives the measure to use with RVs.


E[X] does not need to be in the co-domain of X.
E[X] often drops information about what RV we are taking the expectation over. Sometimes E[x] or E[f(X,Y)] where it is not specified which RV.
Conditional expectation


---

X ~ N(0, 1) is a shorthand for creating RVs with a particular marginal distribution.
E_{X ~ N(0, 1)} [] allows you to create RVs on the fly

> A tilde (~) denotes "has the probability distribution of"
https://en.wikipedia.org/wiki/Notation_in_probability_and_statistics
