#!/usr/bin/env python

"""
script: workflowDAG.py
description: generates and saves a workflow DAG (Directed Acyclic Graph) for seabed-symphony.

author: Felipe Vaz Peres
file: https://github.com/felipevzps/seabed-symphony/blob/main/workflow/bin/workflowDAG.py
version: 1.0
license: MIT

usage:
    python workflowDAG.py --label True --format png
"""

import argparse
import networkx as nx
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser(prog='workflowDAG', description='plot seabed-symphony workflow DAG', add_help=True)
parser.add_argument('--l', '-label', dest='label', choices=['True', 'False'], help='choose if DAG will be plotted with labels or not', required=True)
parser.add_argument('--f', '-format', dest='format', choices=['png', 'svg'], help='DAG format', required=True)

args = parser.parse_args()
label = args.label.lower() == "true"
output_format = args.format

outfile = f"workflow_{'With' if label else 'Without'}Label.{output_format}"

steps = [
    "1_rawReadsQC",
    "2_trimmedReads",
    "3_adapterRemoval",
    "4_trimmedReadsQC",
    "5_metagenomeAssembly",
    "6_bandage",
    "7_assignTaxonomy",
    "8_prokaryoteContigs",
    "9_genomeBinning",
    "10_nonRedundantBins",
    "11_CheckM",
    "12_GTDB-Tk",
    "13_bakta",
    "14_BGCs",
    "15_BiG-SCAPE"
]

dependencies = {
    "1_rawReadsQC": ["2_trimmedReads"],
    "2_trimmedReads": ["3_adapterRemoval"],
    "3_adapterRemoval": ["4_trimmedReadsQC", "5_metagenomeAssembly"],
    "5_metagenomeAssembly": ["6_bandage", "7_assignTaxonomy"],
    "7_assignTaxonomy": ["8_prokaryoteContigs"],
    "8_prokaryoteContigs": ["9_genomeBinning"],
    "9_genomeBinning": ["10_nonRedundantBins"],
    "10_nonRedundantBins": ["11_CheckM", "12_GTDB-Tk", "13_bakta"],
    "13_bakta": ["14_BGCs"],
    "14_BGCs": ["15_BiG-SCAPE"]
}

G = nx.DiGraph()

for step in steps:
    G.add_node(step)

for step, dependencies_list in dependencies.items():
    for dependency in dependencies_list:
        G.add_edge(step, dependency)

node_colors = []

for step in steps:
    if step in ["1_rawReadsQC", "2_trimmedReads", "3_adapterRemoval", "4_trimmedReadsQC"]:
        node_colors.append("orange")
    elif step in ["5_metagenomeAssembly", "7_assignTaxonomy", "8_prokaryoteContigs"]:
        node_colors.append("green")
    elif step in ["6_bandage", "11_CheckM", "15_BiG-SCAPE"]:
        node_colors.append("grey")
    elif step in ["9_genomeBinning", "10_nonRedundantBins"]:
        node_colors.append("violet")
    else:
        node_colors.append("skyblue")

plt.figure(figsize=(12, 8))
pos = nx.circular_layout(G)
nx.draw(G, pos, with_labels=label, node_size=2000, node_color=node_colors, font_size=10, font_weight="bold", arrowsize=20, edgecolors="black", linewidths=1)
plt.title("DAG")
plt.savefig(outfile, format=output_format, dpi=300)
plt.show()
