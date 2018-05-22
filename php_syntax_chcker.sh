# Syntax checker
php app/console twig:lint src/
find src -type f -name "*.php" -exec php -l {} \; | grep -v 'No syntax errors'

# check all installed PHP modules
php -m
php -r 'print_r(get_loaded_extensions()); foreach (get_loaded_extensions() as $ext) echo $ext." ".phpversion($ext)."\n";'

