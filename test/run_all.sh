
modules=( 
  app_helpers 
  app_lib 
  app_models 
  lib 
  # languages
  # integration 
  # app_controllers 
)

echo
for module in ${modules[@]}
do
    echo
    echo "======$module======"  
    cd $module
    ./run_all.sh
    cd ..
done
echo
echo

./print_coverage_summary.rb | tee test-summary.txt
