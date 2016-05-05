tests:ensure :create-vendor-stub vendor-b.bash

tests:ensure :create-vendor-stub vendor-a.bash

tests:cd-tmp-dir src/vendor-a.bash
tests:put src/vendor-a.bash/vendor-a.bash <<< \
    "source vendor/src/vendor-a.bash/vendor/src/vendor-b.bash/vendor-b.bash"

tests:ensure git add .
tests:ensure git commit -m 'change logic'

tests:ensure :bash-get ./../../src/vendor-b.bash
tests:ensure git add .
tests:ensure git commit -m 'add vendor-b'

tests:cd-tmp-dir project

tests:ensure :bash-get ./../src/vendor-a.bash

tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-b.bash'

tests:cd-tmp-dir src/vendor-b.bash
tests:put src/vendor-b.bash/vendor-b.bash <<< \
    "echo 123"

tests:ensure git add .
tests:ensure git commit -m 'change echo to 123'

tests:cd-tmp-dir project

tests:ensure :bash-get
tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout 'vendor-b.bash'

tests:ensure :bash-get -u
tests:ensure tests:require vendor/src/vendor-a.bash/vendor-a.bash
tests:assert-stdout '123'
