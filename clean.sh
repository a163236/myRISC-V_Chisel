#!/usr/bin/bash

// firファイル消去
for i in $(find *.fir);do
    rm $i
done

// jsonファイル消去
for i in $(find *.json);do
    rm $i
done

// verilogファイル消去
for i in $(find *.v);do
    rm $i
done