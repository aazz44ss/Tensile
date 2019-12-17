sh sp3/sp3_asm.sh Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1
dest_file_path=./
input_file_path=./sp3/
sed '483,$d' $dest_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1.s > $dest_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1.temp
mv -f $dest_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1.temp $dest_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1.s
cat $input_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1.inc >> $dest_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1.s
sh $dest_file_path/asm.sh $dest_file_path/Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1 -mcpu=gfx908