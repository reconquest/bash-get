tests:make-tmp-dir tool

tests:clone -r ../get tool/get
tests:clone -r ../vendor tool/vendor

tests:make-tmp-dir src

tests:ensure git init project

tests:cd project

function :bash-get() {
    bash $(tests:get-tmp-dir)/tool/get "${@}"
}

function :create-vendor-stub() {
    local dir=$(tests:get-tmp-dir)/src/$1

    tests:ensure mkdir -p $dir

    cd $dir

    tests:ensure git init
    tests:ensure ls -al
    tests:ensure printf "echo ${1%*/}" \> ${1%*/}
    tests:ensure git add .
    tests:ensure git commit -m 'initial commit'

    cd $(tests:get-tmp-dir)
}
