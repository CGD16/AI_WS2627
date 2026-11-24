### Introduction
- **CSP (Def. 7.1.2):** A triple $\langle V, D, C \rangle$ consisting of:
    1. a finite set of **variables** $V$,
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
		- > 2 (higher-order): c+b>a
        
- **Satisfiability (Def. 7.1.4):** A CSP is called **satisfiable** iff there is a total variable assignment that satisfies _all_ constraints.







### Constraint Propagation/Inference

### Forward Checking

### Arc Consistency

### Enforcing Arc Consistency

### Decomposition: Two Simple Cases

### Cutset Condition

### Conclusion & Summary






### Key Definitions

- 