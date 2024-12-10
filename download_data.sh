#!/bin/bash
#download insectbase2 data
#Use the following link to download the genomic data of insectbase2:http://v2.insect-genome.com/download

#-----------------------------------------------------#

#down NCBI data

insect_species = ("Colletes_gigas" "Drosophila_busckii" "Maniola_hyperantus" "Nymphalis_io" "Ooceraea_biroi" "Trichoplusia_ni" "Zootermopsis_nevadensis" "Zeugodacus_cucurbitae" "Zerene_cesonia" "Wasmannia_auropunctata" "Vollenhovia_emeryi" "Vespula_vulgaris" "Vespula_pensylvanica" "Vespa_mandarinia" "Venturia_canescens" "Vanessa_tameamea" "Vanessa_cardui" "Vanessa_atalanta" "Trachymyrmex_zeteki" "Trachymyrmex_septentrionalis" "Trichogramma_pretiosum" "Tribolium_madens" "Trachymyrmex_cornetzi" "Tribolium_castaneum" "Thrips_palmi" "Teleopsis_dalmanni" "Temnothorax_curvispinosus" "Stomoxys_calcitrans" "Spodoptera_litura" "Solenopsis_invicta" "Sitophilus_oryzae" "Sitodiplosis_mosellana" "Sipha_flava" "Scaptodrosophila_lebanonensis" "Rhagoletis_zephyria" "Rhagoletis_pomonella" "Rhopalosiphum_maidis" "Pseudomyrmex_gracilis" "Polistes_fuscatus" "Polistes_dominula" "Polistes_canadensis" "Pogonomyrmex_barbatus" "Plutella_xylostella" "Plodia_interpunctella" "Pieris_rapae" "Pieris_napi" "Pieris_brassicae" "Photinus_pyralis" "Phlebotomus_papatasi" "Pediculus_humanus" "Papilio_xuthus" "Papilio_polytes" "Papilio_machaon" "Pararge_aegeria" "Osmia_lignaria" "Ostrinia_furnacalis" "Osmia_bicornis" "Orussus_abietinus" "Onthophagus_taurus" "Odontomachus_brunneus" "Nylanderia_fulva" "Nomia_melanderi" "Nicrophorus_vespilloides" "Nilaparvata_lugens" "Neodiprion_pinetum" "Neodiprion_lecontei" "Nasonia_vitripennis" "Myzus_persicae" "Musca_domestica" "Monomorium_pharaonis" "Microplitis_demolitor" "Melanaphis_sacchari" "Megachile_rotundata" "Megalopta_genalis" "Melitaea_cinxia" "Manduca_sexta" "Maniola_jurtina" "Lucilia_sericata" "Lutzomyia_longipalpis" "Lucilia_cuprina" "Linepithema_humile" "Leptopilina_heterotoma" "Leptinotarsa_decemlineata" "Leptopilina_boulardi" "Ischnura_elegans" "Hyposmocoma_kahamanoa" "Homalodisca_vitripennis" "Helicoverpa_zea" "Hermetia_illucens" "Harpegnathos_saltator" "Habropoda_laboriosa" "Halyomorpha_halys" "Harmonia_axyridis" "Glossina_fuscipes" "Galleria_mellonella" "Frieseomelitta_varia" "Frankliniella_occidentalis" "Formica_exsecta" "Fopius_arisanus" "Eufriesea_mexicana" "Dufourea_novaeangliae" "Drosophila_yakuba" "Drosophila_willistoni" "Drosophila_virilis" "Drosophila_teissieri" "Drosophila_takahashii" "Drosophila_suzukii" "Drosophila_subpulchrella" "Drosophila_subobscura" "Drosophila_simulans" "Drosophila_serrata" "Drosophila_sechellia" "Drosophila_santomea" "Drosophila_rhopaloa" "Drosophila_pseudoobscura" "Drosophila_persimilis" "Drosophila_obscura" "Drosophila_novamexicana" "Drosophila_navojoa" "Drosophila_mojavensis" "Drosophila_miranda" "Drosophila_melanogaster" "Drosophila_mauritiana" "Drosophila_kikkawai" "Drosophila_innubila" "Drosophila_hydei" "Drosophila_gunungcola" "Drosophila_guanche" "Drosophila_ficusphila" "Drosophila_eugracilis" "Drosophila_elegans" "Drosophila_bipectinata" "Drosophila_biarmipes" "Drosophila_arizonae" "Drosophila_ananassae" "Drosophila_albomicans" "Diabrotica_virgifera" "Dinoponera_quadriceps" "Diuraphis_noxia" "Diaphorina_citri" "Diachasma_alloeum" "Dendroctonus_ponderosae" "Daktulosphaira_vitifoliae" "Danaus_plexippus" "Cyphomyrmex_costatus" "Culex_quinquefasciatus" "Culex_pipiens" "Ctenocephalides_felis" "Cryptotermes_secundus" "Coccinella_septempunctata" "Contarinia_nasturtii" "Cotesia_glomerata" "Copidosoma_floridanum" "Colias_croceus" "Cimex_lectularius" "Chelonus_insularis" "Ceratosolen_solmsi" "Cephus_cinctus" "Ceratitis_capitata" "Ceratina_calcarata" "Cataglyphis_hispanica" "Camponotus_floridanus" "Bradysia_coprophila" "Bombus_vosnesenskii" "Bombus_vancouverensis" "Bombus_terrestris" "Bombus_pyrosoma" "Bombyx_mandarina" "Bombus_impatiens" "Bombus_bifarius" "Bicyclus_anynana" "Bactrocera_oleae" "Bactrocera_latifrons" "Bactrocera_dorsalis" "Atta_colombica" "Atta_cephalotes" "Aricia_agestis" "Apis_mellifera" "Apis_laboriosa" "Aphis_gossypii" "Aphidius_gifuensis" "Apis_florea" "Apis_dorsata" "Apis_cerana" "Anopheles_nili" "Anopheles_merus" "Anoplophora_glabripennis" "Anopheles_gambiae" "Anopheles_funestus" "Anopheles_darlingi" "Anopheles_coluzzii" "Anopheles_arabiensis" "Anopheles_aquasalis" "Anopheles_albimanus" "Amyelois_transitella" "Agrilus_planipennis" "Aethina_tumida" "Aedes_albopictus" "Aedes_aegypti" "Acyrthosiphon_pisum" "Acromyrmex_echinatior")


conda activate download

cd data1/NFS/home/whx/P450_database/insect_data/NCBI

for i in "${insect_species[@]}"
do
    ascp -v -k 1 -i /data1/NFS/home/scau544/.conda/envs/mamba/envs/whx/etc/asperaweb_id_dsa.openssh  -QTr -l500m  anonftp@ftp.ncbi.nlm.nih.gov:/genomes/refseq/invertebrate/$i/latest_assembly_versions/ ./
    mkdir -p $i
    cp latest_assembly_versions/* "$i/"
    cp "$i/" 
    cp $i/*/*genomic.fna.gz genome/$i.genomic.fna.gz
    cp $i/*/*protein.faa.gz protein/$i.protein.faa.gz
    cp $i/*/*genomic.gff.gz gff/$i.gff.gz
    echo $i is OK
    
done

gzip -d */*.gz
echo ALL DONE!


#-----------------------------------------------------#




