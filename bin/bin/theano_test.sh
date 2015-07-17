#!/bin/bash

THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python ~/bin/theano_check1.py

THEANO_FLAGS=mode=FAST_RUN,device=gpu,floatX=float32 python ~/bin/theano_check2.py
