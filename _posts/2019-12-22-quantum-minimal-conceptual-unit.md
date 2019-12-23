---
layout: post
title:  "Quantum State"
date:   2019-12-22
categories: ["Brain Dump"]
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

The $L^2$-norm of a complex-valued function is given as,

$$
\lvert\psi\rvert = \sqrt{\int_{\mathbb{R}^n} \psi(x)\bar{\psi}(x)\diff{x
^n}}\,,
$$

where $\bar{f}(x) = \text{Re}[f(x)] - i\,\text{Im}[f(x)]$ is the complex conjugate.

## Punchline: quantum states are probability distributions
You probably already guessed that $\psi$ encodes the probability of finding particles in space. The probabiliy of observing system $\psi$ to be in {% marginnote 'some region of configuration space' 'Remember that $n$ is the total number of spatial coordinates that describes the system. We are calculating the probability for all the coordinates together to be in some range.' %} $D \subseteq \mathbb{R}^n$ is,

$$
\int_D  \psi(x) \bar{\psi}(x)\diff{x^n}\,.
$$

$\psi(x) \bar{\psi}(x) = \lvert\psi(x)\rvert^2$ is the absolute value squared of the complex value $\psi(x)$ (not to be confused with the function-norm $\lvert\psi\rvert$). In other words, $\lvert\psi(x)\rvert^2$ is a probability density. $\psi(x)$ is called a {% marginnote '*probability amplitude*' "\"Probability amplitude\" refers specifically to a complex number whose square is a probability. I don't think the word \"amplitude\" makes this apparent and it is rather ambiguous, but it's handy to have a term to refer to these not-quite-probabilities and that is the convention."%}


# 2) Quantum States Are Vectors

> Quantum states are unit vectors residing in a complex Hilbert space, $\mathcal{H}$.

{% marginnote "*Hilbert space*" "The definition of Hilbert space is surprisingly ambiguous or too technical in most sources. For a while I was confused about what was special about Hilbert spaces in contrast with typical vector spaces. The axioms of linear algebra [allow for complex-valued scalars](https://math.stackexchange.com/a/28876). The other notable feature of Hilbert space is that it allows for infinite dimensions, but that doesn't make it unique. There are many ways to construct infinite dimensional vector spaces, e.g. [this answer](https://math.stackexchange.com/a/466741). The distinguishing feature of Hilbert space is that it is [*complete*](https://en.wikipedia.org/wiki/Complete_metric_space), meaning that all [Cauchy sequences](https://en.wikipedia.org/wiki/Cauchy_sequence) of vectors in Hilbert space converge to vectors in Hilbert space. This ensures we can do calculus. It is true that all finite dimensional inner product spaces are Hilbert spaces, and they are simultaneously many other types of spaces, e.g. Banach spaces. Finite dimensional vector spaces do show up in quantum mechanics, and they are still called Hilbert spaces for consistency. Further reading: [A](https://www.quantiki.org/wiki/hilbert-spaces), [B](https://en.wikipedia.org/wiki/Hilbert_space#History)." %} is a generalization of Euclidean vector space to real or complex-valued vector spaces, with finite or infinite dimensions. The generalization of the Euclidean inner-product for functions is,

$$
\langle f, g \rangle = \int_{\mathbb{R}^n} f(x)\bar{g}(x)\diff{x^n}\,.
$$

Let $\mathcal{H}$ be a Hilbert space of $L^2$-normalized complex-valued functions. Then any $\psi \in \mathcal{H}$ is a unit-vector, since $\lvert\psi\rvert^2 = \langle \psi, \psi \rangle = 1$.

## Measurement Bases

Given that the elements of $\mathcal{H}$ are functions over $x$, one straightforward way to choose a basis for $\mathcal{H}$ is to think of $\psi \in \mathcal{H}$ as a vector with uncountably many entries, one for each input $x$. This is achieved with a basis of {% marginnote '[Dirac delta functions](https://en.wikipedia.org/wiki/Dirac_delta_function)' '0 everywhere except for the origin. Defined so that its total area is 1. Technically they are not functions, but [distributions](https://en.wikipedia.org/wiki/Dirac_delta_function#As_a_distribution).' %}. Writing $\psi$ in this basis,

<!--$$
\psi(x) = \int_{\mathbb{R}^n} \psi(\chi)\delta(x-\chi)\diff{\chi^n}\,,
$$-->

$$
\begin{align}
\psi &= \int_{\mathbb{R}^n} \psi(\chi)\cdot\left[ x \mapsto \delta(x-\chi)\right]\diff{\chi^n} \\
     &= x \mapsto \int_{\mathbb{R}^n} \psi(\chi)\delta(x-\chi)\diff{\chi^n} \\
     &= x \mapsto \psi(x)\,.
\end{align}
$$

This integral is an uncountable linear combination, where {% marginnote '$x \mapsto \delta(x-\chi)$' 'Note I am using non-standard notation. "$x \mapsto f(x)$" instantiates a function object in-line, just as "$\\{f(y) \mid \text{condition}[y]\\}$" instantiates a set in-line.' %} is the $\chi$-th basis element and $\psi(\chi)$ is the corresponding coefficient.

This basis of Dirac deltas corresponds to position measurement. Particles and systems of particles have other measureable properties, like momentum and total energy, which have their own bases. More on that below.

## A Proper Basis

There is a problem here. $b_\chi = x \mapsto \delta(x-\chi)$ is not $L^2$-normalizable, because $\lvert b_\chi\rvert^2 = \int_{\mathbb{R}^n} \delta(x-\chi)^2\diff{x^n}$ is undefined. Such a basis that is not actually contained in our vector space is sometimes called an *improper basis*. This can be remedied by augmenting $\mathcal{H}$ to include objects like Dirac deltas. The resulting construction is called a [rigged Hilbert space](https://en.wikipedia.org/wiki/Rigged_Hilbert_space). However, this is not an ideal solution because {% marginnote "now we have quantum states" "We will soon see that we want our Hilbert space to be closed under Fourier transform, so if Dirac deltas are included, then so should sin waves of the form $x \\mapsto e^{ikx}$, which are also not $L^2$-normalizable." %} which cannot be interpreted as probability distributions.

There are plenty of valid orthonormal bases for the Hilbert space of {% marginnote 'unit vectors' 'And also $L^2$-normalized functions.' %}. You may be surprised to learn that such bases are necessarily countable. One of the most well known is the [measurement basis for the total energy of the harmonic oscillator](https://en.wikipedia.org/wiki/Quantum_harmonic_oscillator#Hamiltonian_and_energy_eigenstates).

$$
\mathcal{B} = \{x \mapsto(-1)^n(2^nn!\sqrt{\pi})^{-\frac{1}{2}}e^{\frac{x^2}{2}}\frac{\diff{^n}}{\diff{x^n}}\left[e^{-x^2}\right]\,\mid\, n \in \mathbb{N}\}\,.
$$

Symbolically these functions look quite complicated, but you can get a sense for the pattern of what these functions look like as $n$ increases:
![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Herm5.svg/900px-Herm5.svg.png)
*Plot of first 6 basis functions: 0 (black), 1 (red), 2 (blue), 3 (yellow), 4 (green), and 5 (magenta). Note that these are real-valued functions. Source: [https://en.wikipedia.org/wiki/Hermite_polynomials#Hermite_functions](https://en.wikipedia.org/wiki/Hermite_polynomials#Hermite_functions).
 {% fixme %}Image caption font{% endfixme %}*

It's amazing that can write any function in $\mathcal{H}$ as a linear combination of the functions in $\mathcal{B}$, i.e. any continuous complex-valued $L^2$-normalized function can be written as a weighted sum of these functions. We can also use $\mathcal{B}$ to explicitly construct our $L^2$-normalized Hilbert space,

$$
\mathcal{H} = \{c_0H_0(x) + c_1H_1(x) + c_2H_2(x) + \ldots \,|\, c_0,c_1,c_2,\ldots\in\mathbb{C}\}\,,
$$

where $H_n(x) \in \mathcal{B}$ is the $n$-th [Hermite function](https://en.wikipedia.org/wiki/Hermite_polynomials#Definition).

## Punchline: Uncertainty Principle From Change Of Basis

Under the vector view, the coefficients of a quantum state in some measurement basis are {%marginnote "probability amplitudes" "Their absolute squares are probabilities or probability densities." %}. The basis vectors are called *definite* states, and their linear combinations are indefinite. So if 

$$
\psi = c_1 B_1 + c_2 B_2 + \ldots\,
$$

for measurement basis $\\{B_1, B_2, \ldots\\}$, when the corresponding property of $\psi$ is measured, the system will instantaneously jump to one of $B_i$ with probability $\lvert c_i\rvert^2$. This instantaneous jump is called [*wave-function collapse*](https://en.wikipedia.org/wiki/Wave_function_collapse). The experimenter will also know which of the basis states the system is in because there is a corresponding measurement readout for each (unless the measurement is degenerate). In the position basis, we recover the probability interpretation of states as functions.

*Superposition* is the name given to the physical phenomenon of a system being in an indefinite state, meaning that when you observe some property the outcome is probabilistic. Mathematically superposition is modeled by linear combinations of definite states. A key facet of quantum mechanics is that multiple measurable properties of a system cannot be {% marginnote "simultaneously definite" "Aside from so-called [commuting observables](https://en.wikipedia.org/wiki/Complete_set_of_commuting_observables)." %}. We get this phenomenon for free out of the framework of linear algebra, by representing properties to be measured as orthonormal bases in Hilbert space.

The famous example is position and momentum. Both these properties of a particle cannot be known at the same time. We saw that the position (improper) basis for one spatial coordinate is

$$
\mathcal{B}_\text{x} = \{x \mapsto \delta(x - \chi) \mid \chi \in \mathbb{R}\}\,.
$$

The momentum basis is the [Fourier conjugate](https://en.wikipedia.org/wiki/Position_and_momentum_space#Relation_between_space_and_reciprocal_space) of the position basis, given as

$$
\mathcal{B}_\text{p} = \{x \mapsto \frac{1}{\sqrt{2\pi}}e^{ipx} \mid p \in \mathbb{R}\}\,.
$$

The real part of these functions are sin waves. An element $[x \mapsto \delta(x - \chi)] \in \mathcal{B}_\text{x}$ of the position basis can be written as a linear combination of momentum basis elements,

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

This definition of quantum state is very helpful for visualizing what your system looks like in physical space. The vector definition is unfortunately more abstract and can often obscure the connection to physical space. The vector defnition has its own benefits. In my opinion, knowing how to go between both definitions is optimal for understanding.

I didn't touch on how quantization comes into play, i.e. discrete measurement outcomes. In short, discrete measurement bases result in discrete measurement readouts. For example, total energy will be discrete for particles in potential wells, and continuous for free particles. What determines whether the measurement basis will be continuous or discrete, and how to derive these bases all together, is a complicated matter that gets into [spectral theory of linear operators](https://en.wikipedia.org/wiki/Spectral_theory). Maybe a topic of a future post.

It's important to point out is that [measurement in quantum mechanics](https://en.wikipedia.org/wiki/Measurement_in_quantum_mechanics) is not explained, but [taken as given](https://en.wikipedia.org/wiki/Wave_function_collapse#History_and_context). The non-determinism of measurement outcomes is part of the [axioms of quantum mechanics](https://en.wikipedia.org/wiki/Dirac%E2%80%93von_Neumann_axioms), at least under the Copenhagen interpretation. There are alternative interprations which deny wave-function collapse, notably [pilot-wave](https://en.wikipedia.org/wiki/Many-worlds_interpretation) and [many-worlds](https://en.wikipedia.org/wiki/Many-worlds_interpretation).

<!--

*discuss energy bases? discuss quantization of momentum and energy?*

*recap the logic of this using qbits. say that there is a physical analog called spin. qbits are inherently vectors, and the connection to physical space is entirely lost, but the logic of quantum measurement is easier to see*

discuss position, momentum, and energy measurements? dont go into observable operators. thats a future post

*dont talk about operators. just that different measurement bases have uncertainty relations. dont talk about degenerate spectra and commuting operators, but just mention that is a thing because people will wonder whether any measurements dont have an uncertainty relation.*

Measurable properties can have linear subspaces as "outcomes", rather than single vectors (i.e. 1D linear subspaces). If two different measurable properties have such subspaces that are mutually orthogonal (one subspace is either orthogonal or contained in every other subspace), the properties can be known at the same time. If a combined set of properties results in outcomes that are all 1D orthogonal subspaces, this forms a complete basis. This is called a [complete set of commuting observables](https://en.wikipedia.org/wiki/Complete_set_of_commuting_observables).

*superposition and quantum non-determinism is not explained. taken as an axiom of quantum mechanics under the standard interpretation*

-->
