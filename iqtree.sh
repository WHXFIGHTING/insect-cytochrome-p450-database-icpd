#The construction of phylogenetic trees for various species in the database, with each species having its own fa file.

iqtree -s all_new_mafft.fa -bb 1000 -bnni -alrt 1000 -bcor 0.99 -st AA -m LG+I+G4+F -nt 80
