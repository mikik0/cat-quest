OS   := $(shell uname | awk '{print tolower($$0)}')
ARCH := $(shell case $$(uname -m) in (x86_64) echo amd64 ;; (aarch64) echo arm64 ;; (*) echo $$(uname -m) ;; esac)

DEV_DIR := $(shell pwd)
BIN_DIR := $(DEV_DIR)/bin

TERMEXTRACT := $(abspath $(BIN_DIR)/pytermextract-0_01)

termaxtract:
	@cd $(BIN_DIR)
	@wget http://gensen.dl.itc.u-tokyo.ac.jp/soft/pytermextract-0_01.zip
	@unzip pytermextract-0_01.zip
	@cd pytermextract-0_01/
	@python3 setup.py install

pip:
	@pip3 install -r requirements.txt

run:
	@python3 main.py
