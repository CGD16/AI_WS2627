## Chapter 4 - Rational Agents
### Agents and Environment as a Framework for AI
4.1 Agents and Environments
- an agent is anything that ...
	- ... perceives its environment via sensors (a means of sensing the environment)
	- ... acts on it with actuators (a mean of changing the environment)

4.2 Modeling Agents Mathematically and Computationally
- An agent A = <P, A, f>
	- a set P of percepts
	- a set A of actions 
	- an agents function f: P -> A that maps from percept histories to actions

4.3 Good Behaviour
Rationality
- trying to design agents that are successful, where the agent's action maximizes the expected value of the performance measure given the percept sequence to date

Autonomous
- if it does not rely on the rely on the designer's prior knowledge about the environment

PEAS - describung the task environment (Example: Chess / Medical diagnosis)
- P (performance measure) {win, loss, draw} / {accuracy of diagnosis}
- E (environment) {game board} / {patient, staff}
- A (actuators) {moves} / {display questions, diagnoses}
- S (Sensors) {board position} / {keyboard entry of symptoms}

4.4 Environments
- fully observable
	- if action a its sensors give it access to the complete state of the environment at any point; else partially observable
- deterministic
	- if the next state of the environment is completly determined by the current state; else stochastic 
- episodic
	- ???
- dynamic
	- if the environment can change without an action performed by a; else static 
- discrete
	- sets of e's state and a's action performed by a; else static
- single-agent
	- if only a acts on e; else multi-agent 

4.5 Types of Agents
- .... important??
- reflex agents
	- takes only the last percept into account when choosing an action 
	- f(p_1, p_k) = f(p_k) for p_1, ..., p_k \in P 
	- drawback: have no way of keeping track if the state of the environment
- model-based Agents
	- ....??? tbd
- there are reflex, model-based, determinstic, episodic, static discrete, single-agents