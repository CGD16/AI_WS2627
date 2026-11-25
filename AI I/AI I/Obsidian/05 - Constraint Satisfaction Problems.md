can be seen Chapter 7 and 8 in RN21!!!
### 7.1 Constraint Satisfaction Problems: Motivation
- **CSP (Def. 7.1.2):** A triple $\langle V, D, C \rangle$ consisting of:
    1. a finite set of **variables** $V$, 
	    - gives val
	    - ???? wie aus der Textaufgabe lese ich heraus, was Variablen und Domänen sind?? 
    2. a $V$-indexed family of **domains** $(D_v)_{v \in V}$, and
    3. **constraints** $C_{\{v_1, \dots, v_k\}} \subseteq D_{v_1} \times \dots \times D_{v_k}$ for subsets of variables.
        
- **Solution of an assignment:** A variable assignment $\varphi$ is a solution for $C$ iff for all involved variable subsets, the tuple of assigned values lies in the corresponding constraint
	- total variable: every variable gets a value 
    
- **Order of Constraints & CSPs (Def. 7.1.3):**
    - The **order** $\operatorname{ord}(C_V)$ of a constraint equals the number of affected variables ($\vert{}V\vert{}$).
    - The order of the entire CSP is the maximum over its constraints.
    - Order of ...
	    - 1 (unary): a>2 
	    - 2 (binary): a=b
		    - a binary CSP is a CSP where each constraint is unary or binary
		- > 2 (higher-order): c+b>a
			- $max(\vert{}V\vert{})$
        
- **Satisfiability (Def. 7.1.4):** A CSP is called **satisfiable** iff there is a total variable assignment that satisfies _all_ constraints.

Two Algorithm for solving
- Naive Backtracking
- Variable and Value Ordering
	- For speed advantages ... by fixing states
### 7.4 Constraint Networks: Formalizing Binary CSPs
Formalizing binary CSPs
- A constraint network is a constraint satisfaction problem of order 2
- Notations and Definitions
	- $C_{uv} = C_{vu}$ 
	- Given a constraint network $\gamma := <V,D,C>$ we call the undirected graph $<V, {(u,v) \in V^{2} | C_{uv} = D_{u} \times D_{v} }>$ the constraint graph of $\gamma$
	- expressing $u = v$ is equivalent to $C_{uv} = {(a,b) | a = b}$
	- express unary constraints $C_{u}$ by restricting the domain of $v: D_{v} \coloneqq C_{v}$ 
	- Assignment, Consitency and Solutions
		- **Variable Assignment:** A partial function mapping a subset of variables (its domain) to values from each variable's respective domain 
		- **Satisfying vs. Violating:** A constraint on two variables is satisfied by an assignment if both variables are assigned and their assigned pair lies in the constraint relation (otherwise violated) 
		- **Consistent Assignment:** Satisfies all relevant constraints over the variables in its domain; the empty assignment is trivially consistent.
		- **Legal Value & Conflicted Variable:** A domain value for a variable is _legal_ if assigning it alone (as a singleton assignment) is consistent; a variable assigned an illegal value is _conflicted_ 
		- **Extension:** Assignment $f$ extends assignment $g$ if $f$ is defined on a strict superset of $g$'s domain and agrees with $g$ on $g$'s domain. 
		- **Solution & Satisfiability:** A consistent _total_ (complete) assignment is a _solution_; a constraint network with at least one solution is _solvable_ or _satisfiable_.
		- **Eliminating Higher-Order Constraints:** Higher-order constraints can be converted into equi-satisfiable binary constraints by introducing auxiliary variables.



### 7.5 CSP as Search (???? tbd könnte eine Search aufgabe werden)
- **States:** Variable assignments.
- **Actions:** Extending a current assignment (e.g., assigning another variable).
- **Goal states:** Consistent (total) assignments, forming the basis for constraint-solving algorithms.



TBD




### 8.2 Constraint Propagation/Inference
Constraint propagation shrinks the set of allowed values (domains) for variables by enforcing constraints iteratively until no more values can be removed

Equivalence 
Tightness
- for stricter constraints --> get tighter networks



adding new constrains -> adding new knowledges
more inference -> less search but comes with a cost 

### 8.3 Forward Checking
Definition
- FC propagates information about illegal values
- FC has no Backward check resulting inconsistencies have emerged  (Slide 281) 

better use arc Consistency



### 8.4 Arc Consistency










### 8.4 Enforcing Arc Consistency
Definition:
A variable u ∈ V is arc consistent relative to another variable v ∈ V if either Cuv̸ ∈ C, or
for every value d ∈ Du there exists a value d′ ∈ Dv such that (d,d′) ∈ Cuv .
2. The constraint network γ is arc consistent if every variable u ∈ V is arc consistent relative
to every other variable v ∈ V .
The concept of arc consistency concerns both levels.
 Intuition: Arc consistency ˆ︁= for every domain value and constraint, at least one value on
the other side of the constraint “works”.



### 8.5 Decomposition: Two Simple Cases

### 8.6 Cutset Condition

### 8.7 Conclusion & Summary

