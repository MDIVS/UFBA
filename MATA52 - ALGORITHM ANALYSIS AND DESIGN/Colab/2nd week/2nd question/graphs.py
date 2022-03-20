#   Author:
#           MDIVS (github.com/MDIVS)
#   Description:
#           This algorithm plots a graphical interface that
#           displays the recursion tree of question 2 of
#           week 2 of the Colab of MATA52 at UFBA in 2022.1

import networkx as nx # biblioteca responsável por plotar o código 
import matplotlib.pyplot as plt

# Create an empty undirected graph
G = nx.Graph() #nx.DiGraph() for directed graph
graph_labels = {} # This dictionary will store the node names for visualization

recursion_data = {
    'times' : 2,
    'tree_level': 0,
    'nodes': 0
}

def recursion(data, node_id, position):
    if data['times'] == data['tree_level']:
        return # limit the amount of times we create nodes
    
    data['tree_level'] += 1 # LEVELING TREE UP

    for i in range(0,3):
        new_node_id = data['nodes']
        node_name = 'c(n/'+str(4**data['tree_level'])+')'

        progress = data['tree_level']/data['times']
        position_alignment_factor = data['times']-progress*1.7 # this parameter will help to organize nodes by position
        node_position = (position[0]+i*position_alignment_factor-position_alignment_factor,position[1]-1) # node position calculated based in the parent node position and position alignment factor of this tree level

        G.add_node(new_node_id, size=2000, pos=node_position, name = node_name)
        G.add_edge(node_id,new_node_id)
        graph_labels[new_node_id] = node_name
        data['nodes'] += 1
        recursion(data, new_node_id, node_position)

    data['tree_level'] -= 1 # COMMING BACK TREE DOWN

# Add nodes for level 0
no_id : int = recursion_data['nodes']
no = G.add_node(no_id, size=640, pos=(0,0))
graph_labels[no_id] = 'cn'
recursion_data['nodes'] += 1

recursion(recursion_data, no_id, (0,0))

# print("Number of nodes =", G.number_of_nodes())
# print("Number of edges =", G.number_of_edges())

# #Views
# print("G.nodes =", G.nodes)
# print("G.edges =", G.edges)
# print("G.degree =", G.degree)
# print("G.adj =", G.adj)

# Color nodes and visualize network
plt.figure(1, figsize=(10,4))
color_map = []
size_map = []
pos_dict = {}
for i in G.nodes:
    size_map.append(G.nodes[i]['size'])
    color_map.append('green')
    pos_dict[i] = G.nodes[i]['pos']

nx.draw_networkx(
    G, 
    node_color=color_map, 
    node_size=size_map,
    labels=graph_labels,
    pos = pos_dict,
    # pos=nx.spring_layout(G, iterations=1000), 
    arrows=False, with_labels=True
)

plt.show()