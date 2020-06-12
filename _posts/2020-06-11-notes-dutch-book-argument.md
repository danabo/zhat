---
layout: notes
title: "Notes: Dutch Book Argument"
date:   2020-06-11
categories: notes
---

<!--more-->

* Table of contents
{:toc}
{: .toc}

Main source: [Dutch Book Arguments (SEP)](https://plato.stanford.edu/entries/dutch-book/)

Dutch Book Theorem:
> Given a set of betting quotients that fails to satisfy the probability axioms, there is a set of bets with those quotients that guarantees a net loss to one side.

Converse Dutch Book Theorem: 
> For a set of betting quotients that obeys the probability axioms, there is no set of bets (with those quotients) that guarantees a sure loss (win) to one side.


<https://www.stat.berkeley.edu/~census/dutchdef.pdf>:
> Dutch book cannot be made against a Bayesian bookie.




I. If not Bayesian ⟹ sure loss is possible
* [Foresight: Its Logical Laws, Its Subjective Sources](https://link.springer.com/chapter/10.1007%2F978-1-4612-0919-5_10)

II. If Bayesian ⟹ sure loss is not possible
* [On Confirmation and Rational Betting](https://www.jstor.org/stable/2268221?seq=1)
* [Fair Bets and Inductive Probabilities](https://www.jstor.org/stable/2268222)



Counter-arguments:
* [Hidden Assumptions in the Dutch Book Argument](https://link.springer.com/article/10.1023/A:1004996226545)


# Axioms of probability


**The axioms of probability:**
Let $(\Omega, \mathcal{E}, P)$ be a measure space, where $\Omega$ is the sample set (mutually exclusive outcomes), $\mathcal{E}$ is the event set (set of measurable subsets of $\Omega$), and $P$ is the probability measure ($P(E),\ \forall E \in \mathcal{E}$ is well defined).
1. $P(E) \geq 0,\ \forall E \in \mathcal{E}$
2. $P(\Omega) = 1$
3. $P(E_1 \cup E_2) = P(E_1) + P(E_2) \iff E_1 \cap E_2 = \emptyset,\ \forall E_1,E_2 \in \mathcal{E}$

Note that $P(E) \leq 1,\ \forall E \in \mathcal{E}$ follows directly from the axioms.

## Axioms of probability for propositional logic

We can define probability over propositional statements. The sample set $\Omega$ is the set of all truth values of the primitives. If $(A_1, A_2, \ldots)$ is the set of all primitive propositions, then $\Omega = \\{(\mathrm{False}, \mathrm{False}, \ldots), (\mathrm{True}, \mathrm{False}, \ldots), (\mathrm{False}, \mathrm{True}, \ldots), (\mathrm{True}, \mathrm{True}, \ldots), \ldots\\}$ is every possible truth assignment for $(A_1, A_2, \ldots)$. This is assuming that we don't know the truth value of any primitive. The [logical connectives](https://en.wikipedia.org/wiki/Logical_connective), $\wedge, \vee, \neg,$ etc., are all shorthands for constructing events (sets of truth assignments for $(A_1, A_2, \ldots)$). In other words, $P(H)$ is shorthand for the probability that proposition $H$ is true, where $H$ denotes an event $E$ containing exactly every truth assignment for $(A_1, A_2, \ldots)$ which makes $H$ true.

Note that when there are finitely many $A_i$, there will be finitely many possible events. However, there are infinitely many logical propositions over finitely many primitives $A_i$. This is because most logical propositions are equivalent to others. In other words, we are making equivalence class over the set of propositions using the sets of primitive assignments that make them true. The set of equivalence classes over propositions is finite for finitely many primitives.

Now the axioms for probability over propositional logical are just a special case of the general axioms:
Let $\mathcal{H}$ be the set of all logical propositions.
Let $\mathrm{True}$ be the proposition *True*, which is satisfied by all truth assignments of the primitives (i.e. the event containing all samples).
1. $P(H)\geq 0,\ \forall H \in \mathcal{H}$
2. $P(\mathrm{True}) = 1$
3. $P(H_1 \vee H_2) = P(H_1) + P(H_2) \iff \neg (H_1 \wedge H_2),\ \forall H_1, H_2 \in \mathcal{H}$

Axiom 3 states that the probability of $H_1$ or $H_2$ is the sum of their probabilities iff $H_1$ and $H_2$ cannot both be true at the same time. $H_1 \wedge H_2$ constructs the set of primitive assignments where both propositions are true, which is just the intersection of their respective events, $E_1 \cap E_2$. However, $H_1 \wedge H_2 = \mathrm{False}$ where  $\mathrm{False}$ is the empty event is unconventional, so instead we write $\neg (H_1 \wedge H_2)$ which is equivalent to $\overline{E_1 \cap E_2} = \Omega$ (complement). One could also write $P(H_1 \vee H_2) = P(H_1) + P(H_2) \iff P(H_1 \wedge H_2) = 0$.

We could also define probability over 1st order logic. Now $A(x)$ is a proposition on $x$, where $x$ is a non-proposition type (e.g. number). Let's say $x$ is a natural number, then we have infinitely many primitive propositions $A(x)$ for each $x \in \mathbb{N}$.

How does this inform the claims made in <https://meaningness.com/probability-and-logic> ?


# I. If not Bayesian ⟹ sure loss is possible

The Dutch book argument (DBA) uses traditional terminology around betting which I find to be confusing in this context, like *bookie*, *agent*, *making book*, etc., so I will take care to clarify the meaning of all these things.

Consider an asymmetric two-player betting game. Player 1 transacts with player 2 who sets prices.

Player 1:
* Called the *agent*
* Chooses what bets to buy or sell to/from the bookie at the bookie's prices.
* Chooses the stakes.
* Accepts the bookie's prices.

Player 2:
* Called the *bookie*
* Chooses the prices for bets.
* Must buy or sell any bets the agent requests, at whatever stakes the agent requests.

The DBA shows that the agent can take advantage of the bookie (make book against the bookie) iff the bookie's bet prices do not conform the the axioms of probability. Here taking advantage of means transacting (buying/selling) a set of bets with the bookie to guarantee the agent wins money off the bookie in every scenario.

We assume the bookie makes all prices on all possible bets known to the agent from the start, and the bookie cannot change these prices. The bookie wants to choose prices such that the agent cannot make book against him/her.


A bet is defined by a stake $S$, betting quotient $q$, and target event $E$. When the agent buys a bet (bookie sells a bet) at stake $S$ with quotient $q$, the agent's payoff is $S-qS$ if $E$ occurs, and $-qS$ otherwise. $S$ is only payed out to the agent (holder of the stake) when the betting target $H$ is true. $qS$ is paid to the seller regardless of outcome. This is a fee.

The agent can also sell a bet to the bookie, which just negates the entries in the table. The bookie gives the agent a fee, and the agent pays out the stake to the bookie if $H$ is true.


We saw how probability over logical propositions is a special case. I think it is easier to reason about DBA if we instead consider an arbitrary probability distribution over events $E \in \mathcal{E}$. These events are the possible targets of bets. The bookie must choose $q(E)$ for each event. $q(E)$ will end up being a probability measure over $\mathcal{E}$. We will now show that if $q(E)$ violates any of the axioms, the agent can make book against the bookie.


Define a bet as a function $B : \Omega \to \mathbb{R}$ from samples to payoffs. A bet on event $E$ with stake $S$ and quotient $q$ has payoffs (w.r.t. buyer):

$$
B_E(\omega) = \begin{cases}S-q(E)S & \omega \in E \\ -q(E)S & \omega \notin E\end{cases}
$$

This can be represented as a table:

| Result | Payoff   | 
| ------ | -------- | 
| $E$    | $S-q(E)S$     | 
| $\overline{E}$    | $-q(E)S$     |

Assuming the stake $S$ is always the same (this argument is invariant to stake, as long as its positive), then a bet is represented by $B_E$. Since this game is zero-sum, from the seller's perspective, the payoff is $-B_E$. Buying $-B_E$ is equivalent to selling $B_E$. We can also add bets like this

$$
\left(B_{E_1} + B_{E_2}\right)(\omega) = B_{E_1}(\omega) + B_{E_2}(\omega)\,,
$$

to construct a more complicated multi-outcome bet, denoted as $B_{E_1} + B_{E_2}$. 

Now I am ready to outline why bets should conform to the three axioms:

**Axiom 1:** $P(E) \geq 0,\ \forall E \in \mathcal{E}$.
Assume $q(E) < 0$ for some $E$.
Then the agent will buy $B_E$, which has a positive payoff in all cases.

**Axiom 2:** $P(\Omega) = 1$.
Note that by definition event $\Omega$ always happens, and this is known to both the agent and bookie.
Assume $q(\Omega) < 1$.
Then the agent will buy $B_\Omega$ since the payoff is always $S-q(\Omega)S$ which is positive.
Assume $q(\Omega) > 1$.
Then the agent will buy -$B_\Omega$ (sell $B_\Omega$) since the payoff is always $-(S-q(\Omega)S)$ which is positive.


**Axiom 3:** $P(E_1 \cup E_2) = P(E_1) + P(E_2) \iff E_1 \cap E_2 = \emptyset,\ \forall E_1,E_2 \in \mathcal{E}$.
Note that by definition $E_1 \cap E_2 = \emptyset$ implies $E_1$ and $E_2$ cannot happen simultaneously (by definition of the empty event), and this known to both the agent and bookie.
Assume $E_1 \cap E_2 = \emptyset$ for some $E_1, E_2$.
Assume $q(E_1 \cup E_2) > q(E_1) + q(E_2)$.
Then the agent will buy $B_{E_1} + B_{E_2} - B_{E_1 \cup E_2}$ which has payoff table (w.r.t. agent):

| Result | Payoff   | 
| ------ | -------- | 
| $E_1$  | $-(q(E_1) + q(E_2) - q(E_1 \cup E_2))S$     | 
| $E_2$  | $-(q(E_1) + q(E_2) - q(E_1 \cup E_2))S$     |
| $\overline{E_1 \cup E_2}$  | $-(q(E_1) + q(E_2) - q(E_1 \cup E_2))S$     |

The payoff is the same in all cases and $E_1 \cap E_2$ never occurs. $-(q(E_1) + q(E_2) - q(E_1 \cup E_2))S$ is positive.
Assume $q(E_1 \cup E_2) < q(E_1) + q(E_2)$.
Then the agent buys $-B_{E_1} - B_{E_2} + B_{E_1 \cup E_2}$, which is easy to show wins money for the agent in every scenario.

Thus it is wise for the bookie to choose $q : \mathcal{E} \to \mathbb{R}$ s.t. it obeys the three axioms of probability.


The DBA is ingenious because it does not assume any a priori probabilities over outcomes (i.e. objective probability), and it holds for 1-shot events (i.e. does not assume the game is repeatable).

## But how does this lead to Bayes rule?

Bayesian epistemology centers around using Bayes rule to compute a posterior from a prior. Where is the prior and posterior here?

$q(E)$ is not a prior because $E$ is a datum, not a hypothesis. The DBA concludes that $q$ should be a valid probability measure. But how do we do all the fancy stuff that Bayesian inference requires like marginalizing over variables and computing conditional probabilities? To do that, we need at least two random variables, which we could define over our sample space. What would those two RVs be?

In the framing of DBA, the world starts out completely unknown, and at the conclusion of the betting becomes completely known. There is no reason for a prior or posterior distribution. $q(E)$ is a likelihood distribution conditioned on nothing, i.e. probability of data without regard to hypotheses. There is nothing Bayesian about this because we are *literally not using Bayes' rule because we only have one random variable!*

However, the DBA is clearly suggesting that $q(E)$ should encode the bookie's beliefs about the outcomes, and is thus the prior. So then what is the posterior? We can get around this conundrum by supposing the bookie takes bets on the outcomes of some underlying process, i.e. time series, and updates $q(E)$ as time passes and outcomes are observed. Now we are computing a type of posterior: $q(E_t \mid E_{1:t-1})$ where $E_{1:t-1}$ is all previous observations. Hypotheses are technically not needed, but the bookie is free to secretly have a second RV over hypotheses under the hood (maybe the bookie is doing Solomonoff induction).

**Question:** Are we confusing frequentist and Bayesian probability here?
In the Bayesian paradigm, hypotheses are themselves usually probability distributions, i.e. $p(X \mid H=h) = p_h(X)$ where $p_h(X)$ is a hypothesis labeled with $h$. What is the meaning of the probabilities in $p_h(X)$? Are these probabilities objective? If not, what does it mean for a hypothesis to be satisfied by data? We could consider likelihood to be a score, rather than an objective quantity, and a better hypothesis has a better score by definition (rather than thinking of the likelihood of data under the hypothesis as a frequentist prediction that can be tested through repeated experiment).

## But is real-life a series of bets?

The setup of the game described above ends up being isomorphic to probability theory.

**Question:** Why does this isomorphism exist? Is there something intrinsic about betting that makes it conform to the rules of probability, or is this an artifact of the particular betting payout definition we are using?
This payout scheme is apparently economically justified and not arbitrarily chosen, i.e. bets (with predetermined payouts) traded on a market with have purchase prices that converge to the model above (assuming sufficient arbitrage). Note, IRL quotients are discretized and don't sum exactly to 1, and there is a ask-bid spread which essentially ads a transaction cost to everything. Real world example: <https://www.predictit.org/markets/detail/3698>. In economics, decisions under uncertainty are modeled in the same betting form. e.g. insurance (premium is the quotient, payout is the stake).

**Question:** During the course of everyday life, is the universe going to make book against us lest we conform to the rules of probability? Do the sorts of real-life bets we actually encounter and place have the same structure as the idealized betting above?


Who is the bookie and agent? DBA says that you are the bookie over the course of your life, and you want to prevent the universe (or adversarial actors) from taking advantage of you. The problem is that you are often the one making decisions, i.e. deciding the bets to place. This is a different game, where the bookie chooses the quotients and the bets together. Also, real-life is not zero-sum. You will encounter win-win and lose-lose situations where you have to place a bet one way or the other and net win or lose. The universe is not an optimally rational agent either. I don't expect the universe to spontaneously Dutch-book me. I don't even expect people to Dutch-book me, because that would take work. In practice, everyone is not acting optimally.

**Question:** What if outcomes are not binary? i.e. $\omega \in E$ and $\omega \notin E$ are not the only possibilities (i.e. don't assume law of excluded middle, i.e. need to construct a proof for $\omega \in E$ or $\omega \notin E$).
For example, what if it is not always possible to determine whether an event occurred? This is the case in Solomonoff induction, which uses a semi-measure rather than a measure to get around this problem. In practice, with things like elections and trials there is a large vested interest in ensuring an outcome is determined. But over the course of everyday life, there are many ambiguities.

In real life, you are more like the agent. You choose your bets (take actions) with pre-defined payoffs (the downstream results of your actions are not usually in your control). These payoff are not logically determined, but are the result of (often arbitrary) circumstance. It is very easy to Dutch book the universe! That's generally how growth and progress happen.

Presumably in a formal betting scenario the bookie's probabilities are well-tuned, so that the bookie is indifferent to whether someone buys or sells a given bet. In everyday life, the payoffs of your decisions usually do not match your preferred betting quotients, so that there is one or a few best bets. The whole point of betting is that you believe the outcomes don't match the "true" betting quotients. The DBA assumes that someone else might give you a series of bets which are locally in agreement with your quotients but globally a guaranteed loss. The problem is, you may not be compelled to take bets that agree with your expectations, but only take bets where the expected return is positive, i.e. disagreement.


# II. If Bayesian ⟹ sure loss is not possible

TODO

