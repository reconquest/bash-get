tests:ensure :create-vendor-stub vendor-a.bash

tests:ensure :bash-get ./../src/vendor-a.bash

tests:require vendor/src/vendor-a.bash/vendor-a.bash

tests:assert-stdout 'vendor-a.bash'
