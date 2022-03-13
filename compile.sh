#!/bin/zsh

export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.9.2-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# rm -rf ./antlr

antlr4 -no-listener example.g4 -o antlr/

javac antlr/*.java

cd antlr 

grun example prog ../tests/test1.txt -gui