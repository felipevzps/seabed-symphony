import networkx as nx
import matplotlib.pyplot as plt

steps = [
    "1_raw_qc",
    "2_trimmed",
    "3_adapter_removal",
    "4_qc",
    "5_assembly",
    "6_bandage",
    "7_assign_taxonomy",
    "8_prokaryote_contigs",
    "9_genome_binning",
    "10_non-redundant_bins",
    "11_checkm",
    "12_gtdb",
    "13_bakta",
    "14_BGCs",
    "15_bigscape"
]

dependencies = {
    "1_raw_qc": ["2_trimmed"],
    "2_trimmed": ["3_adapter_removal"],
    "3_adapter_removal": ["4_qc", "5_assembly"],
    "5_assembly": ["6_bandage", "7_assign_taxonomy"],
    "7_assign_taxonomy": ["8_prokaryote_contigs"],
    "8_prokaryote_contigs": ["9_genome_binning"],
    "9_genome_binning": ["10_non-redundant_bins"],
    "10_non-redundant_bins": ["11_checkm", "12_gtdb", "13_bakta"],
    "13_bakta": ["14_BGCs"],
    "14_BGCs": ["15_bigscape"]
}

G = nx.DiGraph()

for step in steps:
    G.add_node(step)

for step, dependencies_list in dependencies.items():
    for dependency in dependencies_list:
        G.add_edge(step, dependency)

node_colors = []

for step in steps:
    if step in ["1_raw_qc", "2_trimmed", "3_adapter_removal", "4_qc"]:
        node_colors.append("orange")
    elif step in ["5_assembly", "7_assign_taxonomy", "8_prokaryote_contigs"]:
        node_colors.append("green")
    elif step in ["6_bandage", "11_checkm", "15_bigscape"]:
        node_colors.append("grey")
    elif step in ["9_genome_binning", "10_non-redundant_bins"]:
        node_colors.append("violet")
    else:
        node_colors.append("skyblue")

plt.figure(figsize=(12, 8))
pos = nx.circular_layout(G)
nx.draw(G, pos, with_labels=True, node_size=2000, node_color=node_colors, font_size=10, font_weight="bold", arrowsize=20, edgecolors="black", linewidths=1)
plt.title("DAG")
#plt.savefig("DAGWithoutLabel.png")
plt.savefig("DAGWithLabel.png")
#plt.show()