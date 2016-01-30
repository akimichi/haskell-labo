haskell-labo
============

## テストを実行する

ローカル環境に haskellの開発環境が適切に設定されていれば、下記のコマンドでテストを実行できる。

~~~
$ stack test
~~~~

## dockerでテストを実行する

ローカル環境に haskellが適切に設定されていない場合、dockerを使ってテストを実行できる。

まず最初にdockerイメージを生成します。

~~~
docker build -t="emile/haskell-labo:v1" .
~~~

haskell のコードをテストする

~~~
docker run -it --rm  --workdir="/workspace" emile/haskell-labo:v1 /bin/bash -c "stack test"
~~~

コンテナにログインして、コンテナ内でテストを実行する。

~~~
docker run -it  --workdir="/workspace" emile/haskell-labo:v1 bash --login -i
root@ca7528c7f2e5:/workspace# stack test 
~~~
