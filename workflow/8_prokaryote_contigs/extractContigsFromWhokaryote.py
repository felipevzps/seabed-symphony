#!/usr/bin/env python

import argparse
import os
from Bio import SeqIO

parser = argparse.ArgumentParser(prog='extractContigsFromWhokaryote.py', description='extract prokaryote/eukaryote contigs from multi-fasta assembly (classified by whokaryote+tiara)', add_help=True)
parser.add_argument('-i', dest='assembly_file', metavar='assembly.fasta', help="assembly", required=True)
group = parser.add_mutually_exclusive_group(required=True)
group.add_argument('-p', dest='prokaryote_headers', metavar='prokaryote_contig_headers.txt', help="file containing prokaryote contigs")
group.add_argument('-e', dest='eukaryote_headers', metavar='eukaryote_contig_headers.txt', help="file containing eukaryote contigs")
parser.add_argument('-o', dest='output_dir', metavar='output directory', help="output directory", required=True)

args = parser.parse_args()
assembly_file = args.assembly_file
prokaryote_headers = args.prokaryote_headers
eukaryote_headers = args.eukaryote_headers
output_dir = args.output_dir

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

output_prefix = os.path.splitext(os.path.basename(assembly_file))[0]

if prokaryote_headers:
    output_file = os.path.join(output_dir, output_prefix + "_prokaryote.fasta")
    list_file = prokaryote_headers
elif eukaryote_headers:
    output_file = os.path.join(output_dir, output_prefix + "_eukaryote.fasta")
    list_file = eukaryote_headers

contigs_to_extract = set()

with open(list_file, "r") as list_f:
    for line in list_f:
        contig = line.strip()
        contigs_to_extract.add(contig)

with open(assembly_file, "r") as fin, open(output_file, "w") as fout:
    for record in SeqIO.parse(fin, "fasta"):
        if record.id in contigs_to_extract:
            SeqIO.write(record, fout, "fasta")
