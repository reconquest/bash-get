tests:ensure :create-vendor-stub vendor-a.bash

tests:ensure :bash-get ./../src/vendor-a.bash

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-a.bash'

tests:put src/vendor-a.bash/vendor-a.bash <<< "echo 123"

tests:cd-tmp-dir src/vendor-a.bash
tests:ensure git add .
tests:ensure git commit -m 'change echo to 123'

tests:cd-tmp-dir project

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-a.bash'

tests:ensure :bash-get -u src/vendor-a

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout '123'
