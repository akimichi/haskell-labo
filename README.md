haskell-labo
============

## docker

まず最初にdockerイメージを生成します。

~~~
docker build -t="emile/haskell-labo:v1" .
~~~

haskell のコードをテストする

~~~
docker run -it --rm  --workdir="/workspace/haskell" emile/haskell-labo:v1 /bin/bash -c "stack test"
~~~

コンテナにログインする

~~~
docker run -it  --workdir="/workspace" ric/functionaljs:v1 bash --login -i
root@ca7528c7f2e5:/workspace# cd nodejs && gulp test 
root@ca7528c7f2e5:/workspace# mocha --harmony test
root@ca7528c7f2e5:/workspace# cd scala && sbt test
root@ca7528c7f2e5:/workspace# cd haskell && stack test 
~~~


1. テストの実行

   > haskell-labo$ runhaskell test/Spec.hs

   > $ cabal configure --enable-tests

   > $ cabal build

   > $cabal test


