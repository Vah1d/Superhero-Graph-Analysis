The Marvel Universe!
======================

![image](https://github.com/user-attachments/assets/35f1839c-77c2-4348-a502-a0d2fb60889c)

Superheroes and abilities have always existed in the human imagination. Marvel has one of the largest superhero comic book franchises. Famous superheroes, including Spider-Man, Iron Man, Captain America, and Thor, are among its cast, as are well-known superhero teams like the Avengers, X-Men, Fantastic Four, and Guardians of the Galaxy. Additionally, it has famous supervillains, including Doctor Doom, Magneto, Ultron, and Thanos, in its stable. Most of Marvel's fictional characters function in a single reality known as the Marvel Universe, with many of their headquarters located in New York City. These comics are well-known today because of their use in movies. If you do not know who we are talking about, give this link a look and learn more about the characters.

This time, you and your team have decided to dive deep into Marvel's social network. Now, you will deal with graphs to determine relevant characteristics and highlights from the relations among those superheroes.

Let's hands-on this!


1. Data
-----------------------------------------
To get started, you have to download the data, as always, from here. Make sure you downloaded all files because we will work with them all.

In particular, the files contain the following:

nodes.csv - Contains two columns (node, type), indicating the nodes' name and type (comic, hero).
edges.csv - Contains two columns (hero, comic), indicating which comics the heroes appear in.
hero-network.csv - Contains the network of heroes who have appeared together in the comics.
Graphs setup
For this homework, we are going to build two different graphs:

First graph: Will be constructed using the data stored in the 'hero-network.csv' file, in which an edge between two heroes can be found if they have appeared in the same comic together. The number of edges between two heroes represents the number of times they have collaborated in different comics. The graph should be considered weighted and undirected. It is up to you to decide which metric to use to calculate the weights, but we anticipate that the cost will be lower for heroes with more collaborations. Please specify which metric you used to select the weights in the report.

Second graph: The data in 'nodes.csv' and 'edges.csv' will be used to construct the second graph. The type of node (hero/comic) can be found in 'nodes.csv', and an edge between a hero node and a comic node can be found in 'edges.csv' when the hero has appeared in that specific comic. This graph is assumed to be undirected and unweighted.

Data Preprocessing
As always, in the data science area, you can find some inconsistencies in the provided data. Therefore, some modifications should be made to the data to make it consistent across all of the datasets you have. To ensure consistency in the data, keep the following in mind:

Some of the heroes' names in 'hero-network.csv' are not found in 'edges.csv'. This inconsistency exists for the following reasons:

Some heroes' names in 'hero-netowrk.csv' have extra spaces at the end of their names compared to their names in 'edges.csv'.
Some heroes' names in 'hero-netowrk.csv' have an extra '/' at the end of their names compared to their names in 'edges.csv'.
The hero name 'SPIDER-MAN/PETER PARKER' in 'edges.csv' has been changed to 'SPIDER-MAN/PETER PAR' in 'hero-network.csv' due to a string length limit in 'hero-network.csv'.
Some entries in the 'hero-network.csv' have the same hero in both columns. In the graph, these entries form a self-loop. Because a self-loop makes no sense in this network, you can safely remove those from the dataset.

2. Backend Implementation
-----------------------------------
The goal of this part is the implementation of a controller system that has different functionalities. The controller should take as input an identifier "i" and run the associated function_i applied to the graph you create from the downloaded data.

Definition: As the number of nodes and edges grows, we may request to work on a subset of the data to reduce computation time and improve network visualization. In this case, we will ask you only to consider the data for top N heros. We define the top N heroes as follows:

Top N heroes: The top N heroes who have appeared in the most number of comics. The 'edges.csv' file, which represents the comics in which each hero has appeared, can be used to filter these N heroes.
Note: When the value of N is not set by the user, the function should consider the whole data.

Functionality 1 - extract the graph's features
------------------------------
Input:

The graph data
The graph type (ex., number 1 or number 2)
N: denoting the top N heroes that their data should be considered
Output:

The number of nodes in the network (if type 2, report for both node types)
The number of collaborations of each superhero with the others (only if type 1)
The number of heroes that have appeared in each comic (only if type 2)
The network's density
The network's degree distribution
The average degree of the network
The network's Hubs (hubs are nodes having degrees more extensive than the 95th percentile of the degree distribution)
Whether the Network is sparse or dense
Note: For this case, it makes sense to differentiate operations between the two graphs: for example, when computing hubs for the second graph, we likely care only about comics.

Functionality 2 - Find top superheroes!
--------------------------------------------------
Input:

The graph data
A node (hero or comic)
One of the given metrics : Betweeness 1, PageRank, ClosenessCentrality 3, DegreeCentrality
N: denoting the top N heroes that their data should be considered
Output:

The metric's value over the considered graph
The given node's value
Note: Give an explanation regarding the features of the user based on all of the metrics (e.g. if the betweenness metric is high, what does this mean in practice, what if the betweenness is low but has a high PageRank value, etc.).

Functionality 3 - Shortest ordered Route
Input:

The graph data
A sequence of superheroes h = [h_2, ..., h_n-1]
Initial node h_1 and an end node h_n
N: denoting the top N heroes that their data should be considered
Output:

The shortest walk of comics that you need to read to get from hero_1 to hero_n
Considerations: For this functionality, you need to implement an algorithm that returns the shortest walk that goes from node h_j to h_n, which visits in order the nodes in h. The choice of h_j and h_n can be made randomly (or if it improves the performance of the algorithm, you can also define it in any other way)

Important Notes:

This algorithm should be run only on the second graph.
The algorithm needs to handle the case that the graph is not connected. Thus, only some of the nodes in h are reachable from h_1. In such a scenario, it is enough to let the program give in the output the string "There is no such path".
Since we are dealing with walks, you can pass on the same node h_i more than once, but you have to preserve order. E.g., if you start from Spiderman to reach deadpool, and your path requires you to visit iron-man and colossus, you can go back to any comics any time you want, assuming that the order in which you visit the heroes is still the same.
Functionality 4 - Disconnecting Graphs
Input:

The graph data
heroA: a superhero to which will relate sub-graph G_a
heroB: a superhero to which will relate sub-graph G_b
N: denoting the top N heroes that their data should be considered
Output:

The minimum number of links (by considering their weights) required to disconnect the original graph in two disconnected subgraphs: G_a and G_b.
Functionality 5 - Extracting Communities
Input:

The graph data
N: denoting the top N heroes that their data should be considered
Hero_1: denoting the name of one of the heroes
Hero_2: denoting the name of one of the heroes
Output:

The minimum number of edges that should be removed to form communities
A list of communities, each containing a list of heroes that belong to them.
If the Hero_1 and Hero_2 belongs to the same community
Important Notes:
This functionality should only be run on the first graph.
To comprehend this functionality better, we suggest you take a good look at this article

3. Frontend Implementation
---------------------------------------------
In this section, we ask you to build the visualizations for users' query results. We also expect you to showcase plots that can give us the most insight possible and comment accordingly.

Visualization 1 - Visualize some features of the network
We anticipate seeing the Functionality 1 report in Visualization 1. To be more specific, we expect you to have the following report format:

A table containing the following general information about the graph:

Number of nodes in the network
Density of the network
Average degree of the network
Whether the network is sparse or dense
A table that lists the network's hubs

A plot depicting the number of collaborations of each hero in descending order (if the graph is type 1)

A plot depicting the number of heroes who appeared in each comic, sorted in descending order (if the graph is type 2)

A plot depicting the degree distribution of the network

Note: You can do the plot on a limited number of heroes/comic books to have a better visualization for the charts that ask for some insights about all of the comics/heroes (e.g. for the first 50)

Visualization 2 - Visualize centrality measure
We anticipate seeing the Functionality 2 report in Visualization 2. To be more specific, we expect you to have the following report format:

A table containing the information related to the requested centrality measure for:
The average of the requested centrality measure for all of the network's nodes
The requested centrality measure's value for the given node
Visualization 3 - Visualize the shortest-ordered route
We anticipate seeing the Functionality 3 report in Visualization 3. To be more specific, we expect you to have the following report format:

Print the comics in the shortest walk in order
Plot the graph and identify the nodes and edges that appear in the shortest walk (please put an identifier on each edge in the shortest walk to determine the order that we should have the walk)
Visualization 4 - Visualize the disconnected graph
We anticipate seeing the Functionality 4 report in Visualization 4. To be more specific, we expect you to have the following report format:

Print the number of the links that should be disconnected
Plot the original graph
Plot the graph after removing the links and identify the two nodes
Visualization 5 - Visualize the communities
We anticipate seeing the Functionality 5 report in Visualization 5. To be more specific, we expect you to have the following report format:

Print the number of links that should be removed to have the communities
A table depicting the communities and the heroes that belong to each community
Plot the original graph
Plot the graph showing the communities in the network
Plot the final graph and identify the community/communities of Hero_1 and Hero_2
Notes:

For the final output of your function, please set the Hero_1 to 'Captain America' and Hero_2 to 'Ironman' and show the results
If Hero_1 and Hero_2 belong to the same community, identify that community; otherwise, identify those two communities that these heroes belong to.
4. Command Line Question
In this question, you should use any command line tools that you know to answer the following questions using the same datasets that you have been using so far:

What is the most popular pair of heroes (often appearing together in the comics)?
Number of comics per hero.
The average number of heroes in comics.
Note: You may work on this question in any environment (AWS, your PC command line, Jupyter notebook, etc.), but the final script must be placed in CommandLine.sh, which must be executable.

5. Bonus - PageRank on MapReduce
IMPORTANT: This is a bonus step, so it's not mandatory. You can get the maximum score also without doing this. We will take this into account, only if the rest of the homework has been completed.

PageRank and MapReduce go well together, and this synergy was essential for Google's growth and the MapReduce paradigm's proliferation. Therefore, for the bonus section of this homework, we ask that you implement the PageRank algorithm using the MapReduce paradigm.
Hint: Here are two approaches to implementing the PageRank algorithm using the MapReduce paradigm that you can use as a reference for your bonus part.

6. Algorithmic Question

Members of the group: Harrach Yassine, Zeynalpour Sara & Ghanbarizadeh Vahid

In this repository you can find :
- main.ipynb : notebook containing all the code
- the Data folder : contains all the datasets that we used in this homework
- the CommandLineQuestion folder : contains the script for the command line question and all the outputs generated by this script
