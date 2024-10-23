import json
import re
import matplotlib.pyplot as plt
import random

with open('playground/15_bigscape/thirdRun/barcode03/html_content/networks/2024-05-11_12-11-20_hybrids_auto_c0.30/run_data.js', 'r') as file:
    content = file.read()

# read json until "families_similarity"
match = re.search(r'var run_data\s*=\s*(\{.*?\})\s*;', content, re.DOTALL)
if match:
    json_content = match.group(1)
else:
    raise ValueError("JSON not found in file.")

# load json
run_data = json.loads(json_content)

# Chart: BGC per Genome
bgc_per_accession = [0] * len(run_data["input"]["accession"])
for bgc in run_data["input"]["bgc"]:
    bgc_per_accession[bgc["acc"]] += 1

labels_genomes = [acc["label"] for acc in run_data["input"]["accession"]]
sizes_genomes = bgc_per_accession

plt.figure(figsize=(10, 10))

# show percentages 
#plt.pie(sizes_genomes, labels=labels_genomes, autopct='%1.1f%%', startangle=140)

# use labels
#colors_genomes = plt.cm.hsv(np.linspace(0, 1, len(labels_genomes))) # cool rainbow

# choose random colors
def random_color():
    return [random.random() for _ in range(3)]

colors_genomes = [random_color() for _ in range(len(labels_genomes))]

#plt.pie(sizes_genomes, labels=labels_genomes, startangle=140)
plt.pie(sizes_genomes, startangle=140, colors=colors_genomes)
plt.legend(labels_genomes, loc="center left", bbox_to_anchor=(1, 0.5))

plt.title("BGC per Genome")
plt.axis('equal')  # keep circle
plt.tight_layout()  # automatically adjust layout
plt.savefig("bgc_per_genome.svg", format="svg", bbox_inches="tight")
plt.show()
plt.close()

# format slices numbers
def func(pct, allvals):
    absolute = int(round(pct / 100. * sum(allvals)))  # get absolute bcgs per class
    return f'{absolute} ({pct:.1f}%)'  # format e.g. 11 (10%)

# Chart: BGC per Class
bgc_per_class = [0] * len(run_data["input"]["classes"])
for bgc in run_data["input"]["bgc"]:
    bgc_per_class[bgc["class"]] += 1

labels_classes = [cls["label"] for cls in run_data["input"]["classes"]]
sizes_classes = bgc_per_class

plt.figure(figsize=(12, 12))
explode_classes = [0.01] * len(sizes_classes)  # slices space

# custom colors: 
#colors_classes = plt.cm.Set3(range(len(labels_classes)))
#plt.pie(sizes_classes, labels=labels_classes, autopct='%1.1f%%', startangle=140, 
#        colors=colors_classes, explode=explode_classes, shadow=False)

plt.pie(sizes_classes, labels=labels_classes, autopct=lambda pct: func(pct, sizes_classes), startangle=140, 
        explode=explode_classes, shadow=False)

#plt.title("BGC per Class", fontsize=16, fontweight='bold')
plt.axis('equal')  # keep circle
#plt.savefig("bgc_per_class.svg", format="svg")
plt.show()
plt.close()
