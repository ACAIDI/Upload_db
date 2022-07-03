#!/bin/sh

# telecharge les chromosomes humains sur le site Ensembl

FTP=ftp://ftp.ensembl.org/pub/release-92/fasta/mus_musculus/dna

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 MT X Y
do
	CHR=${FTP}/Mus_musculus.GRCm38.dna.chromosome.${i}.fa.gz
	wget ${CHR}
done

# Je decompresse car subread indexe un fasta dezippe.

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 MT X Y
do
	gunzip Mus_musculus.GRCm38.dna.chromosome.${i}.fa.gz
done

# et concatene tout dans un meme fichier 

GRCM38=Mus_musculus.GRCm38.dna.all.fa

rm -f ${GRCM38}

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 MT X Y
do
	cat Mus_musculus.GRCm38.dna.chromosome.${i}.fa >> ${GRCM38}
done

