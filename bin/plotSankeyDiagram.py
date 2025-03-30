#!/usr/bin/env python

"""
script: plotSankeyDiagram.py
description: plot sankey diagram from GTDB-Tk taxonomic classification

author: Felipe Vaz Peres
file: https://github.com/felipevzps/seabed-symphony/blob/main/workflow/bin/plotSankeyDiagram.py
version: 1.0
license: MIT

usage:
python plotSankeyDiagram.py --i gtdbtk.bac120.summary.tsv
"""

import argparse
import os
import pandas as pd
import plotly.graph_objects as go
import plotly.colors

parser = argparse.ArgumentParser(prog='plotSankeyDiagram.py', description='plot sankey diagram from GTDB taxonomic classification', add_help=True)
parser.add_argument('--i', '-input', dest='infile', metavar='gtdbtk.bac120.summary.tsv', help="GTDB classification file", required=True)
 
args = parser.parse_args()
infile = args.infile
outfile = os.path.splitext(infile)[0] + '.png'

df = pd.read_csv(infile, sep='\t', usecols=['classification'])

# extract categories from each level of the classification
def extract_categories(classification):
    categories = classification.split(';')
    #levels = [category.split('__')[1] for category in categories]
    #return levels
    levels = []
    for category in categories:
        if '__' in category:
            level = category.split('__')[1]
            if level not in levels: # verify if level is in the list
                levels.append(level)
    return levels

df['levels'] = df['classification'].apply(extract_categories)

# create a list of all connections between adjacent levels, excluding empty fields and connections with same source and target
connections = []
for levels in df['levels']:
    for i in range(len(levels) - 1):
        if levels[i] and levels[i + 1] and levels[i] != levels[i + 1]:
            connections.append((levels[i], levels[i + 1]))

# extract and sort unique categories
labels = sorted(set(df['levels'].sum()))

# initialize counts for each category
category_counts = {label: 0 for label in labels}

# count occurrences of each category
for levels in df['levels']:
    for level in levels:
        if level in category_counts:
            category_counts[level] += 1

# get source and target indices
source = [labels.index(connection[0]) for connection in connections]
target = [labels.index(connection[1]) for connection in connections]

# calculate values based on category counts
value = [category_counts[connection[0]] for connection in connections]

# generate colors based on the source indices
color_palette = plotly.colors.qualitative.Plotly
colors = [color_palette[i % len(color_palette)] for i in source]

fig = go.Figure(data=[go.Sankey(
    node=dict(
        label=[f"{label} ({category_counts[label]})" for label in labels],
    ),
    link=dict(
        source=source,
        target=target,
        value=value,
        color=colors,  # Apply colors
    )
)])

# add opacity to the link
opacity = 0.2
new_colors = []
for color in colors:
    # convert hexadecimal color to RGB
    rgba_color = plotly.colors.hex_to_rgb(color)
    # add opacity
    rgba_color_with_opacity = f"rgba({rgba_color[0]}, {rgba_color[1]}, {rgba_color[2]}, {opacity})"
    new_colors.append(rgba_color_with_opacity)

fig.data[0].update(link=dict(color=new_colors))

fig.write_image(outfile, width=1920, height=1080)
