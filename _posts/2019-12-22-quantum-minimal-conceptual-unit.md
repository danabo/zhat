---
layout: post
title:  "Quantum State"
date:   2019-12-22
categories: post
---

The two views of quantum state:
1. Quantum states are $L^2$-normalized complex-valued functions over classical configuration space.
2. Quantum states are unit vectors residing in a complex Hilbert space, $\mathcal{H}$.

$$
\newcommand{\bm}{\boldsymbol}
\newcommand{\diff}[1]{\mathop{\mathrm{d}#1}} 
\newcommand{\bra}[1]{\langle#1\rvert}
\newcommand{\ket}[1]{\lvert#1\rangle}
\newcommand{\braket}[2]{\langle#1\vert#2\rangle}
$$


<!--more-->

* Table of contents
{:toc}
{: .toc}

This is a very short primer on quantum mechanics, and the bare minimum that needs to be explained in order to understand what QM is about. My goal is to provide some conceptual punchlines with minimal prereqs. The formalism of QM is filled with technicalities and complications, which I try to point out where possible. Keep in mind I am glossing over a ton of details.

Note, throughout I am setting $\hbar = 1$.


# 1) Quantum States Are Functions

> Quantum states are $L^2$-normalized complex-valued functions over classical configuration space.

For our purposes, classical configuration space is position space. A system with $N$ particles in 3D space has $3N$ dimensional configuration space. For simplicity, I'll mostly talk about one particle in 1D space, i.e. 1D configuration space.

So to restate, a quantum state is a function,

$$
\psi : \mathbb{R}^n \rightarrow \mathbb{C}\,.
$$

for $n$-dimensional configuration space such that $\lvert\psi\rvert = 1$, i.e. $\psi$ is $L^2$-normalized.

{% fixme %} Explain L2 norm  {% endfixme %}
The $L^2$-norm of a complex-valued function is given as,

$$
\lvert\psi\rvert = \sqrt{\int_{\mathbb{R}^n} \psi(x)\bar{\psi}(x)\diff{x
^n}}\,,
$$

where $\bar{f}(x) = \text{Re}[f(x)] - i\,\text{Im}[f(x)]$ is the complex conjugate.

## Punchline: quantum states are probability distributions
You probably already guessed that $\psi$ encodes the probability of finding particles in space. The probability of observing system $\psi$ to be in {% marginnote 'some region of configuration space' 'Remember that $n$ is the total number of spatial coordinates that describes the system. We are calculating the probability for all the coordinates together to be in some range.' %} $D \subseteq \mathbb{R}^n$ is,

$$
\int_D  \psi(x) \bar{\psi}(x)\diff{x^n}\,.
$$

{% fixme %} Explain $\diff{x^n}$ {% endfixme %}

$\psi(x) \bar{\psi}(x) = \lvert\psi(x)\rvert^2$ is the absolute value squared of the complex value $\psi(x)$ (not to be confused with the function-norm $\lvert\psi\rvert$). In other words, $\lvert\psi(x)\rvert^2$ is a probability density. $\psi(x)$ is called a {% marginnote '*probability amplitude*' "\"Probability amplitude\" refers specifically to a complex number whose square is a probability. I don't think the word \"amplitude\" makes this apparent and it is rather ambiguous, but it's handy to have a term to refer to these not-quite-probabilities and that is the convention."%}


# 2) Quantum States Are Vectors

> Quantum states are unit vectors residing in a complex Hilbert space, $\mathcal{H}$.

Straightforwardly, functions can be viewed as vectors in an [abstract vector space](https://mathworld.wolfram.com/AbstractVectorSpace.html), called a [function space](https://en.wikipedia.org/wiki/Vector_space#Function_spaces). Beyond being a neat mathematical duality, quantum mechanics makes heavy use of the vector properties of functions, which we will soon see is important for understanding measurement and superposition.

{% marginnote '[*Hilbert space*](https://en.wikipedia.org/wiki/Hilbert_space)' 'I find this to be a nicer introduction than Wikipedia: [https://www.quantiki.org/wiki/hilbert-spaces](https://www.quantiki.org/wiki/hilbert-spaces).' %} is defined as an [inner product space](https://en.wikipedia.org/wiki/Inner_product_space) that is {% marginnote 'also a [complete metric space](https://en.wikipedia.org/wiki/Complete_metric_space)' "Without seeing the definition, it is temping to infer from context clues in quantum mechanics texts that Hilbert space is simply a complex inner product space or an infinite dimension inner product space. Though Hilbert spaces are usually incarnated as these things, Hilbert spaces can also be real and/or finite. Conversely complex and infinite dimensional inner product spaces don't have to be Hilbert spaces ([same counter-example](https://www.mathcounterexamples.net/non-complete-normed-vector-space/) as the marginnote below). The defining property of Hilbert space is its completeness." %}. An inner product space is a vector space equipped with an inner product, e.g. the dot product. If you've taken linear algebra, this should so far be familiar. Additionally, a Hilbert space $\mathcal{H}$ is complete, in the same sense that the real line is complete: every [Cauchy sequence](https://en.wikipedia.org/wiki/Cauchy_sequence#In_a_metric_space) of vectors in $\mathcal{H}$ converges to a vector in $\mathcal{H}$.

You may be confused about why this needs a special name. After all, why not just say that we have an inner product space or normed function space? Doesn't throwing around this fancy term *Hilbert space* just obscure the fact that it's the same old inner product space that we're used to from linear algebra? While in most situations you can think of Hilbert spaces just like {% marginnote 'finite dimensional inner product spaces' '[Which are always complete](https://math.stackexchange.com/questions/1548157/finite-dimensional-vector-spaces-and-completeness).' %}, the former is complete by definition and the latter {% marginnote 'may not be complete' 'There are non-complete infinite normed vector spaces, [for example](https://www.mathcounterexamples.net/non-complete-normed-vector-space/).' %}.  David Hilbert did the [non-trivial work](https://en.wikipedia.org/wiki/Hilbert_space#History) of proving that the function spaces dealt with in quantum mechanics are complete, and when doing quantum mechanics we want to make explicit that completeness is a working assumption {% marginnote 'so that we can do calculus' 'For the same reasons that we [do calculus in the reals instead of the rationals](https://math.stackexchange.com/a/3610494).' %}, so we say Hilbert space rather than normed vector space.

For our purposes, let $\mathcal{H}$ be a Hilbert space of $L^2$-normalized complex-valued functions. That means that every $\psi \in \mathcal{H}$ is a unit-vector according to the inner product $\lvert\psi\rvert^2 = \langle \psi, \psi \rangle = 1$, defined as

$$
\langle f, g \rangle = \int_{\mathbb{R}^n} f(x)\bar{g}(x)\diff{x^n}\,.
$$


## Measurement Bases

A measurement basis is a basis set $$\{B_1, B_2, \ldots\}$$ equipped with measurement readings $$\{f_{B_1}, f_{B_2}, \ldots\}$$ such that each basis element $B_i$ corresponds to the state your system must be in if a measurement device reads $f_{B_i}$. The measurement basis defines what it means to perform a particular measurement, by specifying what physical state each measurement outcome corresponds to.

Under the vector view, the coefficients of a quantum state in some measurement basis are {%marginnote "probability amplitudes" "Their absolute squares are probabilities or probability densities." %}. The basis vectors are called *definite* states, and their linear combinations are indefinite. So if 

$$
\psi = c_1 B_1 + c_2 B_2 + \ldots\,
$$

for measurement basis $$\{B_1, B_2, \ldots\}$$, when the corresponding property of $\psi$ is measured, the system will instantaneously jump to one of $B_i$ with probability $\lvert c_i\rvert^2$. This instantaneous jump is called [*wave-function collapse*](https://en.wikipedia.org/wiki/Wave_function_collapse). The experimenter will also know which of the basis states the system is in because there is a corresponding measurement readout for each (unless the measurement is degenerate). In the position basis, we recover the probability interpretation of states as functions.


## Position Basis

Given that the elements of $\mathcal{H}$ are functions over $x$, one straightforward way to choose a basis for $\mathcal{H}$ is to think of $\psi \in \mathcal{H}$ as a vector with uncountably many entries, one for each input $x$. This is achieved with a basis of {% marginnote '[Dirac delta functions](https://en.wikipedia.org/wiki/Dirac_delta_function)' '0 everywhere except for the origin. Defined so that its total area is 1. Technically they are not functions, but [distributions](https://en.wikipedia.org/wiki/Dirac_delta_function#As_a_distribution).' %}. Writing $\psi$ in this basis,

$$
\begin{align}
\psi &= \int_{\mathbb{R}^n} \psi(\chi)\cdot\left[ x \mapsto \delta(x-\chi)\right]\diff{\chi^n} \\
     &= x \mapsto \int_{\mathbb{R}^n} \psi(\chi)\delta(x-\chi)\diff{\chi^n} \\
     &= x \mapsto \psi(x)\,.
\end{align}
$$

This integral is an uncountable linear combination, where {% marginnote '$x \mapsto \delta(x-\chi)$' 'Note I am using non-standard notation. "$x \mapsto f(x)$" instantiates a function object in-line, just as "$\\{f(y) \mid \text{condition}[y]\\}$" instantiates a set in-line.' %} is the $\chi$-th basis element and $\psi(\chi)$ is the corresponding coefficient. Note that we are not integrating over the free variable $x$ in $x \mapsto \delta(x-\chi)$, but over $\chi$ which can be viewed as an index into a continuous set of such functions.

This basis of Dirac deltas corresponds to position measurement. Particles and systems of particles have other measurable properties, like momentum and total energy, which have their own bases. More on that below.

## A Proper Basis

There is a problem here. $b_\chi = x \mapsto \delta(x-\chi)$ is not $L^2$-normalizable, because $\lvert b_\chi\rvert^2 = \int_{\mathbb{R}^n} \delta(x-\chi)^2\diff{x^n}$ is undefined. Such a basis that is not actually contained in our vector space is sometimes called an *improper basis*. This can be remedied by augmenting $\mathcal{H}$ to include objects like Dirac deltas. The resulting construction is called a [rigged Hilbert space](https://en.wikipedia.org/wiki/Rigged_Hilbert_space). However, this is not an ideal solution because {% marginnote "now we have quantum states" "We will soon see that we want our Hilbert space to be closed under Fourier transform, so if Dirac deltas are included, then so should sine waves of the form $x \\mapsto e^{ikx}$, which are also not $L^2$-normalizable." %} which cannot be interpreted as probability distributions.

There are plenty of valid orthonormal bases for the Hilbert space of {% marginnote 'unit vectors' 'And also $L^2$-normalized functions.' %}. You may be surprised to learn that such bases are necessarily countable, as opposed to the uncountable basis of Dirac delta functions. One of the most well known is the [measurement basis for the total energy of the harmonic oscillator](https://en.wikipedia.org/wiki/Quantum_harmonic_oscillator#Hamiltonian_and_energy_eigenstates).

$$
\mathcal{B} = \{x \mapsto(-1)^n(2^nn!\sqrt{\pi})^{-\frac{1}{2}}e^{\frac{x^2}{2}}\frac{\diff{^n}}{\diff{x^n}}\left[e^{-x^2}\right]\,\mid\, n \in \mathbb{N}\}\,.
$$

Symbolically these functions look quite complicated, but you can get a sense for the pattern of what these functions look like as $n$ increases:
{% extfigure https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Herm5.svg/900px-Herm5.svg.png 'Plot of first 6 basis functions: 0 (black), 1 (red), 2 (blue), 3 (yellow), 4 (green), and 5 (magenta). Note that these are real-valued functions. Source: <a href="https://en.wikipedia.org/wiki/Hermite_polynomials#Hermite_functions">https://en.wikipedia.org/wiki/Hermite_polynomials#Hermite_functions</a>' %}

It's amazing that can write {% marginnote 'any function in $\mathcal{H}$' 'Any continuous complex-valued $L^2$-normalized function.' %} as a countable linear combination of these strange looking functions in $\mathcal{B}$. This is convenient, because we can now explicitly construct our $L^2$-normalized Hilbert space,

$$
\mathcal{H} = \left\{c_0H_0(x) + c_1H_1(x) + c_2H_2(x) + \ldots \,\middle\vert\, c_0,c_1,c_2,\ldots\in\mathbb{C}\right\}\,,
$$

where $H_n(x) \in \mathcal{B}$ is the $n$-th [Hermite function](https://en.wikipedia.org/wiki/Hermite_polynomials#Definition).

## Punchline: Uncertainty Principle From Change Of Basis

*Superposition* is the name given to the physical phenomenon of a system being in an indefinite state, meaning that when you observe some property the outcome is probabilistic. Mathematically superposition is modeled by linear combinations of definite states. A key facet of quantum mechanics is that a system cannot be {% marginnote "simultaneously definite" "Unless the measurements [commute](https://en.wikipedia.org/wiki/Complete_set_of_commuting_observables)." %} with respect to different simultaneous measurement bases. We get this phenomenon for free out of the framework of linear algebra, by representing properties to be measured as orthonormal bases in Hilbert space.

A classic example is position and momentum. Both these properties of a particle cannot be known at the same time. We saw that the position (improper) basis for one spatial coordinate is

$$
\mathcal{B}_\text{x} = \{x \mapsto \delta(x - \chi) \mid \chi \in \mathbb{R}\}\,.
$$

The momentum basis is the [Fourier conjugate](https://en.wikipedia.org/wiki/Position_and_momentum_space#Relation_between_space_and_reciprocal_space) of the position basis, given as

$$
\mathcal{B}_\text{p} = \{x \mapsto \frac{1}{\sqrt{2\pi}}e^{ipx} \mid p \in \mathbb{R}\}\,.
$$

The real part of these functions are sine waves. An element $[x \mapsto \delta(x - \chi)] \in \mathcal{B}_\text{x}$ of the position basis can be written as a linear combination of momentum basis elements,

$$
\begin{align}
[x \mapsto \delta(x - \chi)] 
  &= \int_\mathbb{R} \frac{1}{\sqrt{2\pi}}e^{-ip\chi} \cdot \vec{b}_p \diff{p} \\
  &= \int_\mathbb{R} \frac{1}{\sqrt{2\pi}}e^{-ip\chi} \cdot \left[x \mapsto \frac{1}{\sqrt{2\pi}}e^{ipx}\right] \diff{p} \\
  &= x \mapsto \int_\mathbb{R} \frac{1}{\sqrt{2\pi}}e^{-ip\chi} \frac{1}{\sqrt{2\pi}}e^{ipx} \diff{p}
\end{align}\,.
$$

In the momentum basis, a position basis element becomes a sine wave, i.e. the coefficient of the $p$-th momentum basis element is $\frac{1}{\sqrt{2\pi}}e^{-ip\chi}$.

The *Heisenberg uncertainty principle*, informally, states that a quantum state which is more localized in space (peakier distribution in the position basis) is necessarily less localized in momentum space (spread out distribution in the momentum basis), and vice versa. This uncertainty principle is not an extra assertion on top of quantum mechanics, but is a {% marginnote "consequence of the Fourier transform" "The same uncertainty principle is a problem when converting audio recordings to sheet music, as the frequency resolution of a [spectrogram](https://en.wikipedia.org/wiki/Spectrogram) is inversely proportional to the time resolution. In other words, you cannot know the exact frequency of a fast changing sound due to the same uncertainty principle. Here time plays the role of space. [Further reading.](https://lts2.epfl.ch/blog/gbr/2015/05/08/uncertainty-principle-in-quantum-physics-and-signal-processing/)" %}. More generally, there is an uncertainty principle between any two measurable properties with {% marginnote "different measurement bases" "Technically this is not true, as some properties can be [observed simultaneously](https://en.wikipedia.org/wiki/Complete_set_of_commuting_observables). How this happens is out of the scope of this post, but essentially, when measurement readouts correspond to multiple basis elements the system will collapse to a superposition of those elements, i.e. it will be projected onto their span. A second measurement of a \"compatible\" property will further collapse the system to a single basis element." %}. 

# Conclusion

The function definition of quantum state is very helpful for visualizing what your system looks like in physical space. The vector definition lets you see quantum measurement, superposition and other quantum phenomenon. The vector definition is unfortunately more abstract and can often obscure the connection to physical space. In my opinion, knowing how to go between both views is optimal for understanding.

I didn't touch on how quantization comes into play, i.e. discrete measurement outcomes. In short, discrete measurement bases result in discrete measurement readouts. For example, total energy will be discrete for particles in potential wells, and continuous for free particles. What determines whether the measurement basis will be continuous or discrete, and how to derive these bases all together, is a complicated matter that gets into [spectral theory of linear operators](https://en.wikipedia.org/wiki/Spectral_theory). Maybe a topic of a future post.

It's important to point out is that [measurement in quantum mechanics](https://en.wikipedia.org/wiki/Measurement_in_quantum_mechanics) is not explained, but [taken as given](https://en.wikipedia.org/wiki/Wave_function_collapse#History_and_context). The non-determinism of measurement outcomes is part of the [axioms of quantum mechanics](https://en.wikipedia.org/wiki/Dirac%E2%80%93von_Neumann_axioms), at least under the Copenhagen interpretation. There are alternative interpretations which deny wave-function collapse, notably [pilot-wave](https://en.wikipedia.org/wiki/Many-worlds_interpretation) and [many-worlds](https://en.wikipedia.org/wiki/Many-worlds_interpretation).

