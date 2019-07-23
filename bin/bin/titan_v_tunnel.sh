ssh -t -L  9999:localhost:9999 mp15688@titanv '\
  source .bashrc; \
  export PATH="$PATH:/usr/local/cuda/bin"; \
  export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"; \
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64; \
  export CUDA_HOME="/usr/local/cuda"; \
  env; \
  export WORKON_HOME=/home/jupyter/.virtualenvs; \
  source virtualenvwrapper.sh; \
  workon py3-common; \
  jupyter lab --keyfile /home/jupyter/mykey.key --certfile /home/jupyter/mycert.pem --ip 127.0.0.1 --port 9999 --no-browser; \
  exit'
