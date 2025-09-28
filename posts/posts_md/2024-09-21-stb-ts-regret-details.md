# Regret Analysis of Thomson Sampling

The Bayesian bandit model is the same as the frequentist version introduced in Chapter 4, except that at the beginning of the game, an environment is sampled from the prior. Of course, the chosen environment is not revealed to the learner, but its presence forces us to change our conditions on the rewards because the rewards are dependent on each other through the chosen environment. For simplicity, we treat only the finite, $k$-armed case, but the more general set-up is handled in the same was as in Chapter 4.

A $K$-armed Bayesian bandit environment is a tuple $(\mathcal{E}, \mathcal{G}, Q, P)$, where $(\mathcal{E}, \mathcal{G})$ is a measurable space and $Q$ is a probability measure on $(\mathcal{E}, \mathcal{G})$ called the prior. The last element $\mathbb{P}=\left(\mathbb{P}_{\nu}^{\mu(k)}: \nu \in \mathcal{E}, k \in[K]\right)$ is a probability kernel from $\mathcal{E} \times[K]$ to $(\mathbb{R}, \mathfrak{B}(\mathbb{R}))$, where $\mathbb{P}_{\nu}^{\mu(k)}$ is the reward distribution associated with the $k^{th}$ arm in bandit $\nu$. A Bayesian bandit environment and policy $\pi=\left(\pi_t\right)_{t=1}^T$ interact to produce a collection of random variables, $\nu \in \mathcal{E},\left(W_t\right)_{t=1}^T$ and $\left(Y_t\right)_{t=1}^T$ with $W_t \in[K]$ and $Y_t \in \mathbb{R}$ that satisfy

(a) $\mathbb{P}(\nu \in \cdot)=Q(\cdot)$;

(b) the conditional distribution of $W_t$ given $\nu, W_1, Y_1, \ldots, W_{t-1}, Y_{t-1}$ is ${\pi_t = \left(\cdot \mid W_1, Y_1, \ldots, W_{t-1}, Y_{t-1}\right)}$ a.s.; and

(c) the conditional distribution of the reward $Y_t$ given $\nu, W_1, Y_1, \ldots, W_t$ is $\mathbb{P}_{\nu}^{\mu(W_t)}$ almost surely.

The existence of a probability space carrying random elements satisfying these conditions is guaranteed by the Ionescu-Tulcea theorem. The corresponding probability measure will be denoted by $\mathbb{P}_{Q P \pi}$. Most of the structure of a Bayesian bandit environment is in $\mathbb{P}$, which determines the reward distribution for each arm $k$ in bandits $\nu \in \mathcal{E}$.


---
**Example 34.8.** A $k$-armed Bayesian Bernoulli bandit environment could be defined by letting
$\mathcal{E}=[0,1]^k$ 
$\mathcal{G}=\mathfrak{B}(\mathcal{E})$ 
and $\mathbb{P}_{\nu}^{\mu(k)}=\mathcal{B}\left(\mu(k)\right)$. 

A natural prior in this case would be a product of $\operatorname{Beta}(\alpha, \beta)$ distributions:
$$
Q(A)=\int_A \prod_{i=1}^k q_i\left(x_i\right) d x
$$

where $q_i(x)=x^{\alpha-1}(1-x)^{\beta-1} \Gamma(\alpha+\beta) /(\Gamma(\alpha) \Gamma(\beta))$.

---

Recall that the regret of policy $\pi$ in $k$-armed bandit environment $\nu$ over $n$ rounds is

$$
R_{T}(\pi, \nu)=T \mu^*-\mathbb{E}\left[\sum_{t=1}^{T} X_t\right]
$$

where $\mu^*=\max _{i \in[k]} \mu_i$ and $\mu_i$ is the mean of $P_{\nu i}$. Given a $k$-armed Bayesian bandit environment $(\mathcal{E}, \mathcal{G}, Q, P)$ and a policy $\pi$, the Bayesian regret is

$$
\mathrm{BR}_T(\pi, Q)=\int_{\mathcal{E}} R_T(\pi, \nu) d Q(\nu)
$$


The dependence on $\mathcal{E}, \mathcal{G}$ and $P$ is omitted on the grounds that these are always self-evident from the context. The Bayesian optimal regret is $\operatorname{BR}_n^*(Q)=$ $\inf _\pi \mathrm{BR}_n(\pi, Q)$, and the optimal (regret-minimizing) policy is

$$
\pi^*=\operatorname{argmin}_\pi \mathrm{BR}_n(\pi, Q)
$$


Note that the regret-minimising policy is the same as the reward-maximising policy $\pi^*=\operatorname{argmax}_\pi \mathbb{E}_{P_{Q P \pi}}\left[\sum_{t=1}^n X_t\right]$, which is known as the Bayesian optimal policy under prior $Q$. In all generality, there is no guarantee that the (Bayes) optimal policy exists, but the non-negativity of the Bayesian regret ensures that for any $\varepsilon>0$, there exists a policy $\pi$ with $\operatorname{BR}_n(\pi, Q) \leq \operatorname{BR}_n^*(Q)+\varepsilon$.

### Thompson Sampling

Recalling the notation, let $K>1$ and $(\mathcal{E}, \mathfrak{B}(\mathcal{E}), Q, P)$ be a $K$-armed Bayesian bandit environment. The learner chooses actions $\left(W_t\right)_{t=1}^T$ and receives rewards $\left(Y_t\right)_{t=1}^T$, and the posterior after $t$ observations is a probability kernel $Q(\cdot \mid \cdot)$ from $([K] \times \mathbb{R})^t$ to $(\mathcal{E}, \mathfrak{B}(\mathcal{E}))$. Denote the mean of the $k^{th}$ arm in bandit $\nu \in \mathcal{E}$ by $\mu^{\nu}(k)=\int_{\mathbb{R}} y d P_{\nu(k)}(y)$. In round $t$, Thompson sampling samples a bandit environment $\nu_{t}$ from the posterior of $Q$ given $W_1, Y_1, \ldots, W_{t-1}, Y_{t-1}$ and then chooses the arm with the largest mean. A more precise definition is that Thompson sampling is the policy $\pi=\left(\pi_t\right)_{t=1}^{\infty}$ with
$$
\pi_t\left(w \mid w_1, y_1, \ldots, w_{t-1}, y_{t-1}\right)=Q\left(B_w \mid w_1, y_1, \ldots, w_{t-1}, y_{t-1}\right)
$$
where $B_w=\left\{\nu \in \mathcal{E}: w=\operatorname{argmax}_w \mu_w(\nu)\right\} \in \mathfrak{B}(\mathcal{E})$, with ties in the argmax are resolved in an arbitrary, but systematic fashion.


#### Thompson Sampling Algorithm
Input Bayesian bandit environment $(\mathcal{E}, \mathfrak{B}(\mathcal{E}), Q, P)$

for $t=1,2, \ldots, T$ do
	Sample $\nu_t \sim Q\left(\cdot \mid W_1, Y_1, \ldots, W_{t-1}, Y_{t-1}\right)$
	Choose $W_t=\operatorname{argmax}_{k \in[K]} \mu^{\nu_t}(k)$
	Observe $Y_t$
end for


**Theorem** (Thompson Sampling Bayesian Regret). 
Let $(\mathcal{E}, \mathfrak{B}(\mathcal{E}), Q, P)$ be a $K$-armed Bayesian bandit environment such that  $\forall \nu \in \mathcal{E}$ and $\forall k \in[K]$, the distribution $\mathbb{P}_{\nu}^{\mu(k)}$ is 1-sub-Gaussian (after centering) with mean in $[0,1]$. Then the policy $\pi$ of Thompson sampling satisfies

$$
\begin{align}
    \mathcal{BR}_{T}(\pi, Q) \leq C \sqrt{K T \log (T)},
\end{align}
$$
where $C>0$ is a universal constant.

***Proof***
Fix a $\nu$ and let $\mu(k)=\mu^{\nu}(k)$ and let 

$$
W^{*}=\operatorname{argmax}_{k \in[K]} \mu(k)
$$ 
be the optimal arm, which depends on $\nu$. Now since $\nu$ is random so $W^{*}$ is also a random quantity. When there are ties, we use the same tie-breaking rule as in the algorithm in the definition of $k^*$. For each $t \in [T]$ and $k \in [K]$, let

$$
U_t(k)=\operatorname{clip}_{[0,1]}\left(\widehat{\mu}_{t-1}(k)+\sqrt{\frac{2 \log (1 / \delta)}{1 \vee n_{t-1}(k)}}\right)
$$
Note that this was $\mathrm{UCB}_{t-1,\delta}(k)$. And also recall the event $E$ where the Hoeffding's bound holds for all arms in all time points. The Bayesian analogue of the event $E$ is be the clipped upper confidence bound (since we are assuming reward is between 0 and 1), where $\widehat{\mu}_{t-1}(k)$ is the empirical estimate of the reward of arm $k$ after $t-1$ rounds and we assume $\widehat{\mu}_{t-1}(k)=0$ if $n_{t-1}(k)=0$. Let, 

$$
E = \left\{ \forall t \in [T], \forall k \in [K], \left|\widehat{\mu}_{t-1}(k) - \mu(k) \right| < \sqrt{\frac{2 \log(1/\delta)}{1 \vee  n_{t-1}(k)}} \right\}
$$

Now it is possible to show that $\mathbb{P}\left(E^c\right) \leq 2 T K \delta$ using the union bound.  Let $\mathcal{F}_t=$ $\sigma\left(W_1, Y_1, \ldots, W_t, Y_t\right)$ be the $\sigma$-algebra generated by the interaction sequence by the end of round $t$. Note that $U_t(k)$ is $\mathcal{F}_{t-1}$-measurable. The Bayesian regret is

$$
\mathcal{BR}_{T}=\mathbb{E}\left[\sum_{t=1}^T\left(\mu(W^*)-\mu(W_t)\right)\right]=\mathbb{E}\left[\sum_{t=1}^T \mathbb{E}\left[\mu(W^*)-\mu(W_t) \mid \mathcal{F}_{t-1}\right]\right]
$$


The key insight (we argue why this holds in Lemma 2) is to notice that the definition of Thompson sampling implies the conditional distributions of $W^*$ and $W_t$ given $\mathcal{F}_{t-1}$ are the same:

$$
\mathbb{P}\left(W^*=\cdot \mid \mathcal{F}_{t-1}\right)=\mathbb{P}\left(W_t=\cdot \mid \mathcal{F}_{t-1}\right) \quad \text { a.s. }
$$


Using the previous display,

$$
\begin{aligned}
\mathbb{E}\left[\mu(W^*)-\mu(W_t) \mid \mathcal{F}_{t-1}\right] & =\mathbb{E}\left[\mu(W^*)-U_t(W_t)+U_t(W_t)-\mu(W_t) \mid \mathcal{F}_{t-1}\right] \\
& =\mathbb{E}\left[\mu(W^*)-U_t\left(W^*\right)+U_t(W_t)-\mu(W_t) \mid \mathcal{F}_{t-1}\right] \\
& =\mathbb{E}\left[\mu(W^*)-U_t\left(W^*\right) \mid \mathcal{F}_{t-1}\right]+\mathbb{E}\left[U_t(W_t)-\mu(W_t) \mid \mathcal{F}_{t-1}\right]
\end{aligned}
$$


Using law of iterated expectation,

$$
\mathcal{BR}_T=\mathbb{E}\left[\sum_{t=1}^T\left(\mu(W^*)-U_t\left(W^*\right)\right)+\sum_{t=1}^T\left(U_t(W_t)-\mu(W_t)\right)\right]
$$


On the event $E^c$ the terms inside the expectation are bounded by $2 n$, while on the event $E$, the first sum is negative and the second is bounded by
$$
\begin{aligned}
\mathbf{1}\{E\} \sum_{t=1}^T\left(U_t(W_t)-\mu(W_t)\right) &=\mathbf{1}\{E\} \sum_{t=1}^T \sum_{k=1}^K \mathbf{1}\left\{W_t=k\right\}\left(U_t(k)-\mu(k)\right) \\
&  \leq \sum_{k=1}^K \sum_{t=1}^T \mathbf{1}\left\{W_t=k\right\} \sqrt{\frac{8 \log (1 / \delta)}{1 \vee T_i(t-1)}} \\
&\leq \sum_{k=1}^K \int_0^{T_i(n)} \sqrt{\frac{8 \log (1 / \delta)}{s}} d s \\
& =\sum_{i=1}^k \sqrt{32 T_i(n) \log (1 / \delta)} \leq \sqrt{32 n k \log (1 / \delta)}
\end{aligned}
$$


The proof is completed by choosing $\delta=n^{-2}$ and the fact that $\mathbb{P}\left(E^c\right) \leq 2 n k \delta$.

***Lemma*** : Show that $\mathbb{P}\left(W^*=\cdot \mid \mathcal{F}_{t-1}\right)=\mathbb{P}\left(W_t=\cdot \mid \mathcal{F}_{t-1}\right) \quad \text { a.s. }$



Recall we have

$$
  W^* = \operatorname{argmax}_{k \in [K]} \mu_{\nu}(k)
$$
where $\mu_{\nu}(k)$ is the mean reward of arm $k$ under the environment $n$. Now in Thompson Sampling, at each time we sample a vector of parameters 

$$ \tilde{\mu}_{t} = (\tilde{\mu}_t(1), \tilde{\mu}_t(2), \ldots, \tilde{\mu}_t(k)) $$ from the posterior distribution given the observed data up to time $t-$. The arm selected at time \($ is:

$$ 
W_t = \arg\max_{k \in [K]} \tilde{\mu}_t(k) 
$$

Given the history up to time $t-$, represented by the filtration $\mathcal{F}_{t-1}$, the posterior distribution over the mean rewards $\mu_{\nu}(k)$ is updated. Under the posterior, the arm $W^*$ is the one that would maximize the expected reward:

$$
\mathbb{P}(W^* = k \mid \mathcal{F}_{t-1}) = \mathbb{P}\left(\mu_{\nu}(k) = \max_{j \in [K]} \mu_{\nu}(j) \mid \mathcal{F}_{t-1}\right)
$$

However, since the exact values of $\mu_{\nu}(k$ are not known, we condition on the posterior distribution over these values.


Now in Thompson sampling, since $ W_t$ is selected as the arm with the highest sampled mean $ \tilde{\mu}_i(t)$ from the posterior distribution:

$$
\mathbb{P}(W_t = k \mid \mathcal{F}_{t-1}) = \mathbb{P}\left(\tilde{\mu}_{t}(k) = \max_{j \in [K]} \tilde{\mu}_{t}(j)\right)
$$

This means that the probability of choosing arm  is based on the same posterior distribution as the one used to determine the optimal arm $W^*$.


Because both $W^*$ and $W_t$ are based on the same posterior distribution over the mean rewards, and since the arm with the highest mean reward (which defines $W^*$) is determined using the same distribution as the one used to sample $\widehat{\mu}(t)$ (which determines $W_t$), it follows that:
$$
\mathbb{P}(A^* = i \mid \mathcal{F}_{t-1}) = \mathbb{P}(A_t = i \mid \mathcal{F}_{t-1})
$$
This implies that the conditional distributions of $A^*$ and $A_t$ given the history $\mathcal{F}_{t-1}$ are identical.

--------------


The key insight is that the Thompson Sampling policy ensures that the arm chosen at each step is based on the same posterior distribution that would define the optimal arm if the true means were known. Therefore, the conditional distributions of $W^*$ and $W_t$ are identical given the history of observations, which is formalized as:

$$
\mathbb{P}(W^* = \cdot \mid \mathcal{F}_{t-1}) = \mathbb{P}(W_t = \cdot \mid \mathcal{F}_{t-1})
\quad \text{almost surely.}
$$




This is a fundamental property of Thompson Sampling that drives its ability to achieve low regret in the multi-armed bandit setting.



## Silvkins Details

The Bayesian bandit problem adds the Bayesian assumption to stochastic bandits. Here is the Bayesian bandit problem in a nutshell, at the beginning of the game the problem instance $\nu$ is drawn from some known distribution called prior, denoted with $\mathbb{P}^{\theta}$. 


The time horizon $T$ and the number of arms $K$ are fixed. Then an instance of stochastic bandits is specified by the mean reward vector $\mu^{\nu}(k) \in[0,1]$ for all $k \in [K]$, and the reward distributions $\mathbb{P}_{\nu} = \left(\mathbb{P}_{\nu}^{\mu(k)}: k \in[K]\right)$. The distribution $\mathbb{P}^{\theta} = \{\mathbb{P}^{\theta(k)}: k \in [K] \}$ is called the prior distributions, or the Bayesian priors. What happens is $Y_t(k) \sim \mathbb{P}_{\nu}^{\mu(k)}$ where $\mu(k) \sim \mathbb{P}^{\theta(k)}$ 


The goal is to optimize Bayesian regret: expected regret for a particular problem instance $\nu$, as defined before, in expectation over the problem instances:

$$
\mathcal{BR}_T:=\underset{\nu \sim \mathbb{P}^{\theta}}{\mathbb{E}}[\mathbb{E}[\mathcal{R}_{T} \mid \nu]]=\underset{\nu \sim \mathbb{P}^{\theta}}{\mathbb{E}}\left[\mu^{\nu*} \cdot T-\sum_{t \in[T]} \mu^{\nu}\left(W_t\right)\right]
$$

where $\mu^{\nu*} = \max_{k \in [K]} \mu^{\nu}(k)$. Bayesian bandits follow a well-known approach from Bayesian statistics: posit that the unknown quantity is sampled from a known distribution, and optimize in expectation over this distribution. Note that in the stochastic bandit the "worst-case" regret bound (an upper bound on $\mathbb{E}[R(T)]$ which holds for all problem instances) implies the same upper bound on Bayesian bandit regret.

Simplifications. We make several assumptions to simplify presentation. First, the realized rewards come from a single-parameter family of distributions. There is a family of real-valued distributions $\mathcal{P} = \{\mathbb{P}_\nu, \nu \in [0, 1]\}$ , fixed and known to the algorithm, such that each distribution $\mathbb{P}_\nu^{\mu(k)}$, has expectation $\mu(k)$. Typical examples are Bernoulli rewards and unit-variance Gaussians. The reward of each arm $k$ is drawn from distribution $\mathbb{P}^{\mu(k)}_{\nu}$, where $\mu(k) \in[0,1]$ is the mean reward. We will keep the single-parameter family fixed and implicit in our notation. Then for each $k \in [K]$, the problem instance is completely specified by the mean reward $\mu(k) \in [0,1]$, and the prior $\mathbb{P}^{\theta(k)}$ is simply a distribution over $[0,1]$ that $\mu(k)$ is drawn from.

Second, unless specified otherwise, the realized rewards $Y_t$ can only take finitely many different values (e.g., Bernoulli), and the prior $\mathbb{P}^{\theta(k)}$ has a finite support (I think this is not correct???), denoted $\mathcal{F}$ (support of prior). Then we can focus on concepts and arguments essential to Thompson Sampling, rather than worry about the intricacies of integrals and probability densities. However, the definitions and lemmas stated below carry over to arbitrary priors and arbitrary reward distributions.

Third, the best arm $k^{*}$ is unique for each mean reward $\mu^{\nu}(k)$ in the support of $\mathbb{P}^{\theta(k)}$, where $\nu(k) \sim \mathbb{P}^{\theta(k)}$ (so $k^{*}$ does not depend on $\nu$), i.e., $k^{*} = \arg\max\mu^{\nu}(k)$, $\forall \nu$. This is just for simplicity: this assumption can be easily removed at the cost of slightly more cumbersome notation.


Fix round $t$. Algorithm's data from the first $t$ rounds is a sequence of action-reward pairs, called *$t$-history*:

$$
H_t=\left(\left(W_1, Y_1\right), \ldots,\left(W_t, Y_t\right)\right) \in(\mathcal{W} \times \mathbb{R})^t
$$


It is a random variable which depends on the mean reward vector $\mu = (\mu(k))_{k \in [K]}$, the algorithm which picks $W_t$, and the rewards. A fixed sequence

$$
H=\left(\left(w_1^{\prime}, y_1^{\prime}\right), \ldots,\left(w_t^{\prime}, y_t^{\prime}\right)\right) \in(\mathcal{W} \times \mathbb{R})^t
$$

is called a feasible t-history if it satisfies $\operatorname{Pr}\left[H_t = H\right]>0$ for some bandit algorithm; call such algorithm {$H$-consistent}. One such algorithm, called the $H$-induced algorithm, deterministically chooses arm $w_s^{\prime}$ in each round $s \in[t]$. Let $\mathcal{H}_t$ be the set of all feasible $t$-histories; it is finite for our assumption, because each reward can only take finitely many values. In particular, $\mathcal{H}_t=(\mathcal{W} \times\{0,1\})^t$ for Bernoulli rewards and a prior $\mathbb{P}$ such that $\operatorname{Pr}[\mu(a) \in(0,1)]=1$ for all arms $a$.

In what follows, fix a feasible $t$-history $H$. We are interested in the conditional probability

$$
\mathbb{P}_H(\mathcal{M}):=\operatorname{Pr}\left[\mu \in \mathcal{M} \mid H_t=H\right], \quad \forall \mathcal{M} \subset[0,1]^K
$$
***Theorem***
    Bayesian Regret of Thompson Sampling is $\mathcal{BR}(T)=O(\sqrt{K T \log (T)})$.


Let's do some recap of the definitions; for each arm $k$ and round $t$,

$$
\begin{aligned}
r_t(k) & =\sqrt{2 \cdot \log (T) / n_t(k)} & & \text { (confidence radius) } \\
\mathrm{UCB}_t(k) & =\widehat{\mu}_t(k)+r_t(k) & & \text { (upper confidence bound) } \\
\mathrm{LCB}_t(k) & =\widehat{\mu}_t(k)-r_t(k) & & \text { (lower confidence bound) }
\end{aligned}
$$


Here, $n_t(k)$ is the number of times arm $k$ has been played till time $t$, and $\widehat{\mu}_t(k)$ is the average reward from the arm $k$. As we've seen before, $\mu(k) \in\left[\operatorname{LCB}_t(k), \mathrm{UCB}_t(k)\right]$ with high probability. Following lemma is one of the key ingredients of the proof. Also note the Theorem holds for a more general notion of the confidence bounds, whereby they can be arbitrary functions of the arm $k$ and the $t$-history $\mathcal{H}_t$, respectively.

Let $U\left(k, H_t\right)$ and $L\left(k, H_t\right)$ be such functions, e.g., they could be upper bound and lower bound. Let $x^{-}=0$ if $x \geq 0$, and $x^{-}=|x|$ otherwise. Then following two properties we want for these functions to have, for some $\gamma>0$ to be specified later 
$$
\begin{align}
\mathbb{E}\left[\left[U\left(k, H_t\right)-\mu(k)\right]^{-}\right] \leq \gamma \cdot \frac{1}{K} \cdot \frac{1}{T} & \text { for all arms } k \text { and rounds } t \\
\mathbb{E}\left[\left[\mu(k)-L\left(k, H_t\right)\right]^{-}\right] \leq \gamma \cdot \frac{1}{K} \cdot \frac{1}{T} & \text { for all arms } k \text { and rounds } t 
\end{align}
$$


The first property says that upper confidence bound $U$ does not exceed the mean reward by too much in expectation (what Silvkins wrote), but I think 
the first property says that the true mean should not be higher than upper confidence bound $U$ in expectation and the second property makes a similar statement about $L$. As usual, $K$ denotes the number of arms. The confidence radius can be defined as $r\left(k, H_t\right)=\frac{U\left(k, H_t\right)-L\left(a, H_{\mathrm{t}}\right)}{2}$.


First we prove:

***Lemma*** Assume we have lower and upper bound functions that satisfy first property and second property for some parameter $\gamma>0$. Then Bayesian Regret of Thompson Sampling can be bounded as follows:
$$
\mathcal{BR}(T) \leq 2 \gamma+2 \sum_{t=1}^T \mathbb{E}\left[r\left(W_t, H_t\right)\right]
$$


***Proof***
Fix round $t$. Interpreted as random variables, the chosen arm $W_t$ and the best arm $W^*$ are identically distributed given $t$-history $H_t$ : for each feasible $t$-history $H$,
$$
\operatorname{Pr}\left[W_t=k \mid H_t=H\right]=\operatorname{Pr}\left[W^*=k \mid H_t=H\right] \text { for each arm } k
$$


It follows that

$$
\mathbb{E}\left[U\left(W^*, H\right) \mid H_t=H\right]=\mathbb{E}\left[U\left(W_t, H\right) \mid H_t=H\right]
$$


Then Bayesian Regret suffered in round $t$ is

$$
\begin{aligned}
\mathcal{BR}_t & :=\mathbb{E}\left[\mu\left(W^*\right)-\mu\left(W_t\right)\right] \\
& =\underset{H \sim H_t}{\mathbb{E}}\left[\mathbb{E}\left[\mu\left(W^*\right)-\mu\left(W_t\right) \mid H_t=H\right]\right] \\
& =\underset{H \sim H_t}{\mathbb{E}}\left[\mathbb{E}\left[U\left(W_t, H\right)-\mu\left(W_t\right)+\mu\left(W^*\right)-U\left(W^*, H\right) \mid H_t=H\right]\right] \\
& =\underbrace{\mathbb{E}\left[U\left(W_t, H_t\right)-\mu\left(W_t\right)\right]}_{\text {Summand 1 }}+\underbrace{\mathbb{E}\left[\mu\left(W^*\right)-U\left(W^*, H_t\right)\right]}_{\text {Summand 2 }}
\end{aligned}
$$

We will use properties already mentioned to bound both summands. Note that we cannot immediately use these properties because they assume a fixed arm $k$, whereas both $W_t$ and $W^*$ are random variables.

$$
\begin{align*}
\mathbb{E}\left[\mu\left(W^*\right)-U\left(W^*, \mathcal{H}_t\right)\right] 
&\leq \mathbb{E}\left[\left(\mu\left(W^*\right)-U\left(W^*, \mathcal{H}_t\right)\right)^{+}\right] \\
& \leq \mathbb{E}\left[\sum_{\text {arms } a}\left[\mu(k)-U\left(k, \mathcal{H}_t\right)\right]^{+}\right] \\
& =\sum_{\text {arms } a} \mathbb{E}\left[\left(U\left(k, \mathcal{H}_t\right)-\mu(k)\right)^{-}\right] \\
& \leq K \cdot \frac{\gamma}{K T}=\frac{\gamma}{T} \\
\end{align*}
$$
$$
\begin{align*}
\mathbb{E}\left[U\left(W_t, H_t\right)-\mu\left(W_t\right)\right] 
&=\mathbb{E}\left[2 r\left(W_t, H_t\right)+L\left(W_t, H_t\right)-\mu\left(W_t\right)\right] \\
& =\mathbb{E}\left[2 r\left(W_t, H_t\right)\right]+\mathbb{E}\left[L\left(W_t, H_t\right)-\mu\left(W_t\right)\right. \\
\end{align*}
$$

$$
\begin{align*}
\mathbb{E}\left[L\left(W_t, H_t\right)-\mu\left(W_t\right)\right] 
& \leq \mathbb{E}\left[\left(L\left(W_t, H_t\right)-\mu\left(W_t\right)\right)^{+}\right] \\
& \leq \mathbb{E}\left[\sum_{\operatorname{arms} a}\left(L\left(k, H_t\right)-\mu(k)\right)^{+}\right] \\
& =\sum_{\text {arms } a} \mathbb{E}\left[\left(\mu(k)-L\left(k, H_t\right)\right)^{-}\right] \\
& \leq K \cdot \frac{\gamma}{K T}=\frac{\gamma}{T}
\end{align*}
$$
Thus, $\mathrm{BR}_t(T) \leq 2 \frac{\gamma}{T}+2 \mathbb{E}\left[r\left(W_t, H_t\right)\right]$. The theorem follows by summing up over all rounds $t$.


***Remarks***

- Thompson Sampling does not need to know what $U$ and $L$ are!
- The Lemma does not rely on any specific structure of the prior. Moreover, it can be used to upper-bound Bayesian regret of Thompson Sampling for a particular class of priors whenever one has "nice" confidence bounds $U$ and $L$ for this class.

}

***(Proof of the main Theorem)***

Let us use the confidence bounds and the confidence radius  Note that they satisfy properties written before with $\gamma=2$. By the Lemma

$$
\begin{align*}
  \mathcal{BR}(T) &\leq 2 \gamma+2 \sum_{t=1}^T \mathbb{E}\left[r\left(W_t, H_t\right)\right]  \\
  &= 2 \gamma + 2 \sum_{t=1}^T \mathbb{E}\left[\sqrt{2 \cdot \log (T) / n_t(W_t)}\right] \\
  &\leq O(\sqrt{\log T}) \sum_{t=1}^T \mathbb{E}\left[\frac{1}{\sqrt{n_t\left(W_t\right)}}\right] 
\end{align*}
$$



Moreover,

$$
\begin{align}
\sum_{t=1}^T \sqrt{\frac{1}{n_{t}\left(W_t\right)}} & =\sum_{k \in \mathcal{W}} \; \sum_{t: W_t = k} \frac{1}{\sqrt{n_{t}(k)}} \\
& =\sum_{k \in \mathcal{W}} \underbrace{\sum_{j=1}^{n_{T+1}(k)} \frac{1}{\sqrt{j}}}_{\text{bound this by integration}}=\sum_{k \in \mathcal{W}} O\left(\sqrt{n_{T}(k)}\right)
\end{align}
$$
Also we can apply Jensens inequaity

$$
\begin{align}
    \frac{1}{K}\sum_{k \in \mathcal{W}} \sqrt{n_{T}(k)} \leq \sqrt{\frac{1}{K} \sum_{k \in \mathcal{W}} n_{T}(k)} \\
    \sum_{k \in \mathcal{W}} \sqrt{n_{T}(k)}  \leq \sqrt{K \sum_{k \in \mathcal{W}} n_{T}(k)}
\end{align}
$$



It follows that

$$
\mathcal{BR}_T \leq   O(\sqrt{\log T}) \sum_{k \in \mathcal{W}} \sqrt{n_{T}(k)} \leq O(\sqrt{\log T}) \sqrt{K \sum_{k \in \mathcal{W}} n_{T}(k)} = O(\sqrt{K T \log T})
$$

where the intermediate step is by the arithmetic vs. quadratic mean inequality.




