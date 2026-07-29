#! /bin/csh


echo
echo "Store output away in directory from command line."
echo "mac, aug11."
echo

if ($1 == "") then 
 echo "No directory given..."
 echo "usage: ./round.csh <dir>, which <dir> is the name of the directory to be created"
 echo
 exit
endif

set dir = $1

if (-d $dir) then
 echo "ummm, $dir seems to exist already.... abort"
 exit
endif
if (! -d restart2010) then
 echo "ummm, I don't see restart2010, are you sure you're ready to store output away?" 
 echo
 exit
endif

set echo

mkdir $dir
mkdir $dir/INITIAL
mkdir $dir/OUTPUT

mv restart???? $dir
mv INITIAL/* $dir/INITIAL
mv OUTPUT/* $dir/OUTPUT
mv log.txt* $dir
cp $dir/restart2010/* INITIAL
cp -p $dir/INITIAL/reset.csh INITIAL
cp -p $dir/INITIAL/adic_anom.nc INITIAL
echo "Copy over a new coupler.res"
cp $dir/INITIAL/coupler.res INITIAL
cd INITIAL
./reset.csh
cd ..
rm abort
mv obgc*.[oe]* logs


echo "Done!"
exit
