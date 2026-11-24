### Natural Language Processing 
Introduction to NLP
- NLP: deals with the interactions between computer and human languages that involve
	- natural language understanding
		- computers which receives human language input 
	- natural language generation
		- aims at generating natural language or speech from meaning representations

Natural Language and its Meaning
![[Pasted image 20261123133610.png]]
- Abstraction
	- “Car ” and “automobile” have the same meaning
- Ambiguity (word with multiple meanings)
	- A “bank” can be a financial institution or a geographical feature.
- Composition
	- "Every student sleeps" ->∀x.student(x) ⇒ sleep(x)


Language Models
- Definitions
	- statistical language model is a probability distribution over sequences of characters or words
	- text corpus
		- is a large and structured collection of natural language documents
	- corpus linguistics / corpora
		- are used to do statistical analysis and checking occurrences or validating linguistics
- N-gram Character Models (tbd HMM)
	- like Markov process $P(c_{1:N})$ for the probability of a character sequence $c_1, \dots, c_n$ of length $N$
	- $n$ gram model is a Markov process of order $n-1$
	- Example on trigram model
		- $P(c_i | c_{1:i-1}) = P(c_i | c_{i-2}, c_{i-1})$ ...
		- ... with chain rule we obtain 
		  $P(\mathbf{c}_{1:N}) = \prod_{i=1}^{N} P(\mathbf{c}_i \mid \mathbf{c}_{1:i-1}) = \prod_{i=1}^{N} P(\mathbf{c}_i \mid \mathbf{c}_{i-2}, \mathbf{c}_{i-1})$
	- Building a trigram language model for each candidate language $\ell$ by counting trigrams in a $\ell$-corpus
		- $\begin{aligned} \ell^* &= \underset{\ell}{\mathrm{argmax}}\ (P(\ell \mid \mathbf{c}_{1:N})) \\ &= \underset{\ell}{\mathrm{argmax}}\ (P(\ell) \cdot P(\mathbf{c}_{1:N} \mid \ell)) \\ &= \underset{\ell}{\mathrm{argmax}}\ \Big(P(\ell) \cdot \Big(\prod_{i=1}^{N} P(\mathbf{c}_i \mid \mathbf{c}_{i-2:i-1}, \ell)\Big)\Big) \end{aligned}$
	- applications: language identification, genre classification
	- N-gram over Word sequences ???? tbd eine Aufgabe erstellen lassen Folie 1078
	- Out of Vocab Words ??? Aufgabe erstellen
		- words are unknown words that appear in the test corpus bit not training corpus 
		- so we use $<UNK>$ for Unknown and treat it as a regular word; trick can be refined if we have a word classifier such as $<EMAIL>$ or $<NUM>$ 
		- Test: Example 30.4.19
	- Perplexity 
		- Perplexity measures how well a language model can predict a given sequence of words or characters (In other words: How surprised is the model by the next unit (word/character)?)
		- $\mathrm{Perplexity}(\mathbf{c}_{1:N}) := P(\mathbf{c}_{1:N})^{-1/N}$
		- Low perplexity: The model can predict the sequence well.
		- High perplexity: The model has difficulty predicting the sequence
	
Part of Speech Tagging (tbd HMM)
- $n$-gram models struggle with unseen or rare sequences (e.g., unfamiliar words or combinations), whereas native speakers generalize using syntactic patterns -> Word order matter!
- Definition of POS tagging (POST)
	- assigns tags (POST) corresponding to parts of speech (categories of words with similar syntactic properties) to words in a corpus based on both definition and context
	- Penn Treebank examples
		- Common tags include `IN` (preposition, e.g., "From"), `DT` (determiner, e.g., "the"), `NN` (noun), `PRP` (pronoun), `VBD` (past tense verb), `JJ` (adjective), `NNS` (plural noun), `TO`, `VB` (base verb), and `MD` (modal verb, e.g., "would")
	- POS Tagging with HMMs & Viterbi
		- HMM Formulation
			- POS tags act as hidden state variables $\mathbf{C}_{1:n}$ and observed words act as evidence variables $\mathbf{W}_{1:n}$ in a generative Hidden Markov Model (HMM)
		- Generative Process
			- An HMM starts from an initial/prior tag distribution (often `IN`, which can be problematic) and at each step chooses a next state (tag) and emits a word
		- Transition & Sensor Models
			- Transition model 
				- $P(\mathbf{C}_t \mid \mathbf{C}_{t-1})$ gives the probability of one POS tag following another (estimated from corpus counts with smoothing
			- Sensor model 
				- $P(\mathbf{W}_t \mid \mathbf{C}_t)$ gives the probability of emitting a word given a POS tag, also estimated from corpus counts with smoothing
		- Limitations of HMMs
			- Rely on the Markov assumption (limited context beyond the current state) and lack higher-level understanding of sentence meaning.
			- Only use transition and sensor models, so they cannot directly capture morphological/orthographic clues (like "-ous" endings suggesting adjectives) without additional modeling (such as neural network approaches mentioned later)
Text Classification
- Given a set of categories to which certain documents belong (text classification / categorization)
- Spam Detection (tbd with n-gram; maybe HMM???)
	- Example
		- one for P(Message|spam) by training on the spam folder
		- one for P(Message|ham) by training on the inbox
		- classify a new message m with an application of Bayes Rule
			- $$\underset{c \in \{\mathrm{spam}, \mathrm{ham}\}}{\mathrm{argmax}}\ (P(c \mid m)) = \underset{c \in \{\mathrm{spam}, \mathrm{ham}\}}{\mathrm{argmax}}\ (P(m \mid c)P(c))$$ where $P(c)$ is estimated just by counting the total number of spam and ham messages
- Calculating Accuracy
	- $\mathrm{Precision} = \frac{TP}{TP + FP}$
	- $\mathrm{Recall} = \frac{TP}{TP + FN}$
	- $F_1 = \frac{2 \cdot \mathrm{Precision} \cdot \mathrm{Recall}}{\mathrm{Precision} + \mathrm{Recall}} = \frac{2TP}{2TP + FP + FN}$
	- $F_{\beta}$ by weighing the precision $\beta$ times as important as recall

Information Retrieval (IR)
- is the process of finding and recovering relevant information from large collections of data or documents in response to a user's query
- Vector Space Models & Bag of Words (BOW)
	- Idea: In IR, documents and queries are represented as bags of words over a fixed vocabulary $V$, and documents "similar" to a query $Q$ are returned
	- Raw term frequency
		- For a vocabulary $V$, word $w \in V$, and document $d$, raw term frequency is the count of occurrences of $w$ in $d$
	- Bag of words (BOW) 
		- A BOW is a multiset of words from $V = \{t_1, \dots, t_n\}$, represented as a word frequency vector in $\mathbb{N}^{\vert{}V\vert{}}$ (vector of raw word frequencies)
	- Out-of-vocabulary handling
		- Words outside $V$ are ignored in the BOW representation
- Similarity & Cosine Similarity
	- A query and a document are similar if and only if the angle $\theta$ between their word frequency vectors is small
	- Euclidean dot product formula: 
		- $A \cdot B = \Vert{}A\Vert{}_2 \, \Vert{}B\Vert{}_2 \cos\theta$, where $\theta$ is the angle between vectors $A$ and $B$
	- Cosine similarity: 
		- $\cos\theta = \frac{A \cdot B}{\Vert{}A\Vert{}_2 \, \Vert{}B\Vert{}_2}$
- TF-IDF (Term Frequency / Inverse Document Frequency)
	- Idea: Plain word frequency vectors treat all words equally, even though common/less specific words (like `"the"` in `"the brown cow"`) are less informative than specific words (like `"brown"` or `"cow"`)
	- Normalized term frequency ($\mathrm{tf}$): 
		- For document $d$ and term $t \in V$, $\mathrm{tf}(t, d)$ is the raw term frequency of $t$ in $d$ divided by $\vert{}d\vert{}$ (document length)
	- Inverse document frequency ($\mathrm{idf}$)
		- For a document collection $D = \{d_1, \dots, d_N\}$ of size $N$ and term $t$:
			- $\mathrm{idf}(t, D) := \log_{10}\!\left(\frac{N}{\vert{}\{d \in D \mid t \in d\}\vert{}}\right)$ with $log_{10}(1) = 0$
	- TF-IDF weight
		- $\mathrm{tfidf}(t, d, D) := \mathrm{tf}(t, d) \cdot \mathrm{idf}(t, D)$
	- TF-IDF vector & IR usage
		- For vocabulary $V = \{t_1, \dots, t_{\vert{}V\vert{}}\}$, the vector $\overline{\mathrm{tfidf}}(d, D) \in \mathbb{N}^{\vert{}V\vert{}}$ has entries $\overline{\mathrm{tfidf}}(d, D)_i := \mathrm{tfidf}(t_i, d, D)$ and is used with cosine similarity for IR, though it is only one standard method and more is needed in practice.
	
- Page Rank
	- Let A be a web page that is hyperlinked from web pages $S_1, \dots , S_n$, then the page rank PR of A is defined as
	- $PR(A)$ is the probability of reaching A by random browsing
	- $\mathrm{PR}(A) = 1 - d + d \left( \frac{\mathrm{PR}(S_1)}{C(S_1)} + \cdots + \frac{\mathrm{PR}(S_n)}{C(S_n)} \right)$

Information Extraction
- process of acquiring information by skimming a text and looking for occurrences of a particular class of object and its relationships (extracting instances of addresses from web pages, with attributes for street, city, state, zip code)
- Example 30.8.11. FASTUS ?????
	- Bridgestone Sports Co. said Friday it has set up a joint venture in Taiwan with a local concern and a Japanese trading house to produce golf clubs to be shipped to Japan
	- extract the relations:
	- $e \in \mathrm{JointVentures} \land \mathrm{Product}(e, \text{"golf clubs"}) \land \mathrm{Date}(e, \text{"Friday"}) \land \mathrm{Member}(e, \text{"Bridgestone Sports Co"}) \land \mathrm{Member}(e, \text{"a local concern"}) \land \mathrm{Member}(e, \text{"a Japanese trading house"})$

### Deep Learning for NLP
Word embeddings (WE)
- Definitions
	- WE mapping from words into a real vectorspace $\mathbb{R}^{n}$
	- One Hot Encode
		- is called one hot, if all components are 0 except for one 1
	- Word frequency vectors are induced by adding up one hot word embeddings $$\mathrm{tfidf}(t, d, D) := \mathrm{tf}(t, d) \cdot \log_{10}\left(\frac{|D|}{|\{d \in D \mid t \in d\}|}\right)$$
	- Word2Vec
		- Map words to dense vectors in $\mathbb{R}^N$ by training a neural network on a "dummy task", discarding the output layer, and using the output of the previous (hidden) layer of size $N$ as the word embedding
		- First Attempt (Dimensionality Reduction)
			- Train a 3-layer autoencoder-like network with layer sizes $(V, N, V)$ (where $V$ is the vocabulary size and $N$ is the embedding size).
			- Feed a one-hot encoded word as input and train the network to predict the exact same one-hot vector using a softmax activation function at the output layer
			- The first two layers (weight matrix $W_{V \times N}$) compute the word embeddings
		- **Softmax Function:** Normalizes a vector of raw scores $\langle z_1, \dots, z_k \rangle$ into a probability distribution
			- $$\sigma(z)_i := \frac{e^{z_i}}{\sum_{j=1}^{k} e^{z_j}}$$
		- Continuous Bag of Words (CBOW) Algorithm 
			- **Distributional Semantics:** Based on the principle _"a word is characterized by the company it keeps"_- meaning we predict a word from its surrounding context.  
		- Training Data Generation:
		    - Choose a context window size $n$ and extract all sequences of $2n + 1$ consecutive words from the corpus (e.g., _"the brown cow jumps over the moon"_ for $n=3$).
		    - The center word (_"jumps"_) is the **target word**, and the remaining $C := 2n$ surrounding words are the **context words**.
		- Network Architecture & Training:
		    - Pass all $C$ one-hot encoded context words through the shared input-to-hidden layer ($W_{V \times N}$), yielding $C$ vectors of dimension $N$.
		    - Combine these vectors via an **average pooling layer** (sum pooling also works) and feed the result into the output layer ($W'_{N \times V}$) with a **softmax** activation function.
		    - Train the network to predict the target word; the embedding dimension $N$ is a freely chosen hyperparameter.
		- Properties of Word Embeddings (e.g., CBOW)
			- **Semantic Similarity:** Comparing embedding vectors (e.g., via **cosine similarity**) identifies words with similar meanings.
			- **Vector Arithmetic (Analogies):** Semantic and syntactic relationships emerge naturally as linear vector offsets:
			    - $\text{king} - \text{man} + \text{woman} \approx \text{queen}$ (gender / male-female)
			    - $\text{germany} - \text{country} + \text{capital} \approx \text{berlin}$ (country-capital)
			    - Also captures syntactic shifts like verb tenses (e.g., $\text{walking} \to \text{walked}$, $\text{swimming} \to \text{swam}$)

	- Joint Learning of POS Tags & Word Embeddings
		- **Task-specific embeddings:** Training word embeddings jointly with a main task (such as POS tagging) on a chosen corpus highlights features relevant to that specific task.
		- Context & word order matter: Words can have ambiguous POS tags (e.g., _"cut"_ as present/past tense verb, infinitive, past participle, adjective, or noun), and nearby context like _"yesterday"_ can indicate a past tense verb.
		- CBOW vs. POS tagging: Unlike CBOW—which treats context words identically regardless of order—POS tagging depends on exact word positions
	- Preprocessing & Setup
		- **Prediction window:** Pick an odd window width $w$ (e.g., $w = 5$ uses $2$ words before and $2$ words after the target word).
		- **Training examples:** Split sentences into prediction windows for each word, paired with the corresponding POS tags.
		- **Vocabulary & embedding matrix:** Build a vocabulary $V$ of sufficiently common tokens of size $v := \vert{}V\vert{}$ (in any sort order), choose embedding dimension $d$, and initialize a $v \times d$ embedding matrix $E$ (randomly or from pretrained vectors) where row $i$ holds the embedding of the $i$-th word in $V$
	- Network Architecture & Computation
		- **Input & embedding lookup:** A window of $w$ words is looked up in $w$ copies of $E$ and concatenated into an input vector $x$ of length $wd$.
		- **Position sensitivity:** Although each word gets the same lookup encoding regardless of position in $w$, different parts of the first hidden layer handle different positions.
		- **Forward pass (as given in the setup):**
		    - First hidden layer: $z_1 = l(W_1 x)$ with weight matrix $W_1$ and activation/layer function $l$.
		    - Second hidden layer: $z_2 = l(W_2 z_1)$ with weight matrix $W_2$.
		    - Output layer: $y = \sigma(W_{\text{out}} z_2)$, producing a probability distribution over possible POS tags for the center word via softmax $\sigma$ and output weights $W_{\text{out}}$.
		- **Training & positional encoding note:** All parameters ($E$, $W_1$, $W_2$, and $W_{\text{out}}$) are trained jointly via gradient descent. While more advanced positional encodings exist (such as sinusoidal), concatenation with fixed small windows works well here.

- TBD Comparison between BOW, CBOW, Word Embedding




Recurrent neural networks for NLP




Sequence-to-sequence models



Transformer Architecture



Pretraining and transfer learning


Large Language Models

