### 5.1 Problem Solving
Problem Solving: Introduction 
- offline: 
	- agent computes an action sequence based on complete knowledge if the environment (fully observable, detterministic, static, episodic environments)
- online:
	- agent computes one action at a time based on incoming perception (so it's dynamic??)

Search Problems $<S,A,T,I,G>$
- states: S Set
- actions: A Set
- transition model: $T AxS \rightarrow P(s)$
- initial states: I S
- goal states: G P(S)

### 5.2 Problem Types
Problem Types
- single state problem
	- fully observable
		- at least the initial state
	- deterministic
		- unique successor states
	- static
		- states do not change by our own actions
	- discrete
		- a countable number of states

Search Strategies
- important Properties of Strategies
	- completeness
		- does it always find a solution if one exists?
	- time complexity
		- number of nodes generated/expanded
	- time complexity
		- maximum number of nodes in memory
	- optimality
		- does it always find a least cost solution?
- Time and space complexity measured in terms of
	- $b$
		- maximum branching factor of the search tree
	- $d$
		- minimal graph depth of a solution in the search tree
	- $m$
		- maximum graph depth of the search tree (may be $\infty$)
### 5.4 Uniformed Search Strategies
- Breadth first search
	- It explores a tree or graph level by level, checking all nearby neighbors before moving deeper. It uses a queue (first-in, first-out)
	- Completness: Yes, if b is finite
	- Time complexity: $O(b^d)$
	- Space complexity: $O(b^d)$
	- Optimality: Yes
- Uniform cost search
	- It always expands the path with the lowest total cost so far, using a priority queue
	- Completness: Yes
	- Time complexity: $O(b^d)$
	- Space complexity: $O(b^d)$
	- Optimality: Yes
- Depth first search
	- It follows one path as deep as it can go before backtracking to try another branch
	- Completness: Ja, if b is finite
	- Time complexity: $O(b^m)$
	- Space complexity: $O(bm)$
	- Optimality: Nein
- Depth limited search
	- It works just like depth-first search, but stops going deeper once it hits a set depth limit. This prevents it from getting stuck going down infinitely long paths
	- Completness: Yes
	- Time complexity: $O(b^{d+1})$
	- Space complexity: $O(bd)$
	- Optimality: Yes
- Iterative deepening search
	- It runs depth-limited search over and over, increasing the depth limit by one each time until it finds the goal. It combines the low memory of depth-first search with the shortest-path guarantee of breadth-first search for equal step costs
	- Completness: Yes, if b is finite
	- Time complexity: $O(b^{d+1})$
	- Space complexity: $O(bd)$
	- Optimality: Yes
### 5.5 Informed Search Strategies
- Info:
	- A search algorithm is called informed, if it uses some form of external information (heuristic-value h) - that is not computable from the search problem. h(s) is intended as an estimate the distance between state s and the nearest goal state
	- h = 0: no overhead at all, completely uninformative.
	- h = $h^*$ (optimal)
	- Admissible
		- A heuristic (h) is admissible if it never overestimates the actual minimum cost to reach the goal: if $h(s) \leq h^* (s)$ 
		- How to check
			- Calculate the actual minimum cost to the goal for every state
			- Compare each heuristic value with the actual cost
			- If $(h(s) \leq h^*(s))$ holds for all states, the heuristic is admissible
	- Consistent
		- A heuristic (h) is consistent if the heuristic value cannot decrease by more than the cost of the applied action
		- For all states (s), actions (a), and successor states (s' \in T(s,a))
			- (h(s)): Heuristic value of the current state
			- (h(s')): Heuristic value of the successor state
			- (c(s,a)): Cost of the transition from (s) to (s')  
		- How to check
			- Consider every edge in the graph
			- Calculate (h(s)-h(s'))
			- Compare the result with the *edge cost* (c(s,a))
			- If the inequality holds for every edge, the heuristic is consistent.

- Greedy Search
	- Expand the node that appears to be closest to the goal
	- ![[Screenshot From 2026-11-21 22-17-54.png]]
	- Completness: No
	- Time complexity: O(b^m)
	- Space complexity: O(b^m)
	- Optimality: No

- A-star
	-  $A^*$ always expands the node with the lowest $f(n)$. If the heuristic is admissible
	- $f(n) = g(n) + h(n)$
	- $g(n)$: Actual cost from the start node to the current node
	- $h(n)$: Estimated cost from the current node to the goal
	- Completness: Yes
	- Time complexity: $O(b^d)$
	- Space complexity: $O(b^m)$
	- Optimality: Yes