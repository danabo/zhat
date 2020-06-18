---
layout: notes
title: "Notes: Probability & AI Curriculum"
date:   2020-06-17
categories: notes
---

This is a snapshot of my curriculum for exploring the following questions:
* Is probability theory all you need to develop AI?
   - If not, what is missing?
* Should a theory of AI be expressed in the framework of probability theory at all?
* Do Brains use probability?

<!--more-->

This reflects my current estimate of the landscape, and summarizes where my interests and aspirations have taken me so far. It is not set in stone. I may follow through on it, or I may diverge as I learn more. I primarily follow the current of my curiosity.


{% figure topic-tree.svg "Visualization of topic tree. Nodes are organized hierarchically be level of abstraction, with dotted-lines representing non-hierarchical associations. Colors designate hierarchy-level. Made with <a href=\"https://www.yworks.com/yed-live/\">https://www.yworks.com/yed-live/</a>" %}

# Description of topics

Here are the topics from the graph above, with descriptions to the extent that I understand them, and links to reference material.

* **Objective probability**
  : Is probability an objective property of physical systems in general (not just i.i.d.)? Objective, meaning independently arrived at by multiple parties, like a scientific experiment (just as mass and energy measurements can be independently verified) - i.e. not dependent on a particular brain with particular beliefs. If p(x) = θ, then this is true even if no humans are around at all to believe it. The main problem in making probability objective is figuring out how to uniquely determine the probability of something given observations. What needs to be measured in order to ascertain the objective probability of a system?

  * **Solomonoff induction**
    : A Bayesian inference setup general enough to encompass general intelligence. Posterior converges to the true data posterior at the infinite limit (for any prior with support everywhere), possibly providing an objective notion of probability, at least for infinite sequences.
    ‣ [Universal Artifical Intelligence](http://www.hutter1.net/ai/uaibook.htm)
    ‣ [On the Existence and Convergence Computable Universal Priors](https://arxiv.org/abs/cs/0305052)

    * **Approximations**
      : How can SI be implemented in practice? How would brains implement it?
      ‣ <http://www.hutter1.net/ai/uaibook.htm#approx>
    * **Posterior convergence**
      : The sense in which Solomonoff induction is objective. The predicted posterior converges to the true data posterior with infinite observations, for any prior with support over all hypotheses.
      ‣ [Universal Artifical Intelligence](http://www.hutter1.net/ai/uaibook.htm), Theorem 3.19
    * **Posterior consistency**
      : Solomonoff induction may not be consistent, meaning it cannot distinguish between any two hypotheses with infinite data. Implications for objective probability.
    * **Prior with universally optimal convergence**
      : Solomonoff's universally optimal prior.
      ‣ [Universal Artifical Intelligence](http://www.hutter1.net/ai/uaibook.htm), Theorem 3.70
    * **Convergence on individual sequences**
      : Convergence of Solomonoff induction is not guaranteed on a measure-0 set of sequences. Construction of such a sequence.
      ‣ [Universal Convergence of Semimeasures on Individual Random Sequences](https://arxiv.org/abs/cs/0407057), Theorem 6 and Proposition 12
    * **(Non-)Equivalence of Universal Priors**
      : A surprising equivalence between mixtures of deterministic programs and computable distributions.
      ‣ [(Non-)Equivalence of Universal Priors](https://arxiv.org/abs/1111.3854), Theorem 14

  * **Martin-Lof randomness**
    : What it means for an infinite sequence to be drawn from a probability distribution. Algorithmic definition of randomness (see AIT).
    ‣ [An Introduction to Kolmogorov Complexity and Its Applications](https://www.springer.com/gp/book/9781489984456)

    * **Definition in terms of universal probability**
      ‣ [Universal Artifical Intelligence](http://www.hutter1.net/ai/uaibook.htm)
      ‣ [An Introduction to Kolmogorov Complexity and Its Applications](https://www.springer.com/gp/book/9781489984456)
    * **Can sequences can be Martin-Lof random w.r.t. multiple probability measures?**

* **Bayesian epistemology**
  : Are priors and posteriors all that is needed for a complete theory of knowledge, and are a sufficient framework for building an intelligent system? Bayesian epistemology repurposes probability as a property of the intelligent agent doing the observing, rather than the system being observed (or perhaps it characterizes their interaction), i.e. probability as belief.

  * **Bayesian brain hypothesis**
    : Hypothesis in neuroscience that the Brain is largely an approximate Bayesian inference engine.
    ‣ [The Bayesian Brain: The Role of Uncertainty in Neural Coding and Computation](https://pubmed.ncbi.nlm.nih.gov/15541511/)
    ‣ [Bayesian Brain: Probabilistic Approaches to Neural Coding](https://mitpress.mit.edu/books/bayesian-brain)
    ‣ [Object Perception as Bayesian Inference](https://www.annualreviews.org/doi/full/10.1146/annurev.psych.55.090902.142005)

    * **Friston's free energy principle**
      : A unified theory of biological intelligence from which Bayesian epistemology can be derived.
      ‣ [What does the free energy principle tell us about the brain?](https://arxiv.org/abs/1901.07945)
      ‣ [The free-energy principle: a unified brain theory?](https://www.fil.ion.ucl.ac.uk/~karl/The%20free-energy%20principle%20A%20unified%20brain%20theory.pdf)

    * **How brains approximate Bayesian inference**
      : To make the Bayesian brain hypothesis falsifiable, a characterization of what counts as an approximation to Bayesian inference needs to be given. What approximate Bayesian computations in the brain have been found so far by neuroscientists? *Reference same sources listen under "Bayesian brain hypothesis"*

  * **Causal inference**
    : If Bayesian epistemology is not sufficient, then what is missing? Judea pearl proposes causal inference.
    ‣ [Causality](http://bayes.cs.ucla.edu/BOOK-2K/), chapters 3 and 7
    ‣ [Introduction to Judea Pearl's Do-Calculus](https://arxiv.org/abs/1305.5506)

  * **Bounded Rationality**
    : What would Bayesian epistemology theoretically look like with bounded resources? Is Bayesian epistemology no longer optimal given bounded resources?
    ‣ [Bayes, Bounds, and Rational Analysis](https://stanford.edu/~icard/BBRA.pdf)

  * **Logical justifications**
    : Arguments from first principles that Bayesian epistemology is a necessary condition for rationality, and that a rational agent is necessarily a Bayesian agent (such an agent is likely performing Solomonoff induction, in order for it to be sufficiently general in its prediction ability).

    * **Dutch book argument**
    * **Complete classes**
    * **Cox's theorem**
    * **Von Neumann-Morgenstern utility theorem**

  * **Motivation from decision theory**
    : Some say a theory is good because it is useful. Perhaps the question "what theory of uncertainty should I use?" is best answered by looking at what we want to do with it, namely decision making under uncertainty. Bayesian epistemology can be motivated by of decision theory.
    ‣ [The Foundations of Statistics](https://www.goodreads.com/book/show/1639056.The_Foundations_of_Statistics), chapter 3

  * **Unique priors**
    : How to choose a prior is one point of contention in Bayesian epistemology. There are some proposed methods for selecting a unique prior given what you already know, for example, the max-entropy principle.
    ‣ [Objective Priors: An Introduction for Frequentists](https://arxiv.org/abs/1108.2120)
    ‣ [LECTURES ON PROBABILITY, ENTROPY, AND STATISTICAL PHYSICS](https://arxiv.org/pdf/0808.0012.pdf)

* **Algorithmic information theory (AIT)**
  : An alternative to probability theory devised by Kolmogorov himself (and others) to address its shortcomings. Does AIT allow us to formalize the general learning problem of transferring knowledge out-of-distribution?
  ‣ [An Introduction to Kolmogorov Complexity and Its Applications](https://www.springer.com/gp/book/9781489984456)
  ‣ [Kolmogorov Complexity and Algorithmic Randomness](https://bookstore.ams.org/surv-220)

  * **Types of Kolmogorov complexity**
    : There is a constellation of algorithmic complexity functions that make up the foundation of AIT. *Reference same sources listen under "Algorithmic information theory"*

    * **Resource bounded complexities**
      : Kolmogorov complexity with bounded computation. Possible direction for computable-AIT.
      ‣ [An Introduction to Kolmogorov Complexity and Its Applications](https://www.springer.com/gp/book/9781489984456), chapter 7

  * **Algorithmic transfer learning**
    : How can the information shared by two datasets be defined? What is the objective of transfer learning?
    ‣ [On Universal Transfer Learning](http://users.cecs.anu.edu.au/~hassan/univTLTCS.pdf)
    ‣ [Transfer Learning using Kolmogorov Complexity: Basic Theory and Empirical Evaluations](https://papers.nips.cc/paper/3228-transfer-learning-using-kolmogorov-complexity-basic-theory-and-empirical-evaluations.pdf)
    ‣ [The Information Complexity of Learning Tasks, their Structure and their Distance](https://arxiv.org/abs/1904.03292)

    * **No free lunch theorem**
      : Theorem stating there is no universally best algorithm for all training-test dataset pairs.
      ‣ [Understanding Machine Learning: From Theory to Algorithms](https://www.cse.huji.ac.il/~shais/UnderstandingMachineLearning/), Theorem 5.1



* **AIXI**
  : A theory of optimal intelligence put forth by Marcus Hutter based on Solomonoff induction. 
  ‣ [Universal Artifical Intelligence](http://www.hutter1.net/ai/uaibook.htm)

* **Data compression**
  : Lossless compression from the perspectives of Shannon's information theory and AIT. Can they be unified? Can compression make probability objective? What is the relationship between compression and intelligence?
  ‣ [Elements of Information Theory](https://www.wiley.com/en-us/Elements+of+Information+Theory%2C+2nd+Edition-p-9780471241959)
  ‣ [Data Compression Explained](http://mattmahoney.net/dc/dce.html)

* **Decision theory under ignorance**
  : Decision theory without probability. Pros and cons.
  ‣ [An Introduction to Decision Theory](https://www.cambridge.org/core/books/an-introduction-to-decision-theory/B9EEB3DCE5D0CAFFB6F3F30B1D0A06A6), chapter 3

* **The Fundamental Theorem of Statistical Learning (PAC)**
  : An introduction to PAC-learning theory. PAC is a probability-theory-based account of machine learning which AIT could replace.
  ‣ [Understanding Machine Learning: From Theory to Algorithms](https://www.cse.huji.ac.il/~shais/UnderstandingMachineLearning/), Theorem 6.7

  * **PAC account of transfer learning**
    : PAC analysis of transfer learning. However, assumptions about relatedness of tasks need to be made.
    ‣ [A Model of Inductive Bias Learning](https://arxiv.org/abs/1106.0245)




