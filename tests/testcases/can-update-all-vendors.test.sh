tests:ensure :create-vendor-stub vendor-a.bash
tests:ensure :create-vendor-stub vendor-b.bash

tests:ensure :bash-get ./../src/vendor-a.bash

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-a.bash'

tests:ensure :bash-get ./../src/vendor-b.bash

tests:ensure tests:require vendor/src/vendor-b.bash/vendor-b.bash
tests:assert-stdout 'vendor-b.bash'

tests:put src/vendor-a.bash/vendor-a.bash <<< "echo 123"

tests:cd-tmp-dir src/vendor-a.bash
tests:ensure git add .
tests:ensure git commit -m 'change echo to 123'

tests:put src/vendor-b.bash/vendor-b.bash <<< "echo 456"

tests:cd-tmp-dir src/vendor-b.bash
tests:ensure git add .
tests:ensure git commit -m 'change echo to 456'

tests:cd-tmp-dir project

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-a.bash'

tests:ensure tests:require vendor/src/vendor-b.bash/vendor-b.bash
tests:assert-stdout 'vendor-b.bash'

tests:ensure :bash-get

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout '123'

tests:ensure tests:require vendor/src/vendor-b.bash/vendor-b.bash
tests:assert-stdout '456'
