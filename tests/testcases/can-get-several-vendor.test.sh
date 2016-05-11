tests:ensure :create-vendor-stub vendor-a.bash
tests:ensure :create-vendor-stub vendor-b.bash

tests:ensure :bash-get ./../src/vendor-a.bash ./../src/vendor-b.bash

tests:eval tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-a.bash'

tests:eval tests:require vendor/src/vendor-b.bash/vendor-b.bash
tests:assert-stdout 'vendor-b.bash'
