# use whatever python and nosetests are in current env
VERSION?=''

build:
	python$(VERSION) setup.py build_ext --inplace

develop: build
	python$(VERSION) setup.py develop

install:
	python$(VERSION) setup.py install

generate:
	python$(VERSION) tools/generate.py > talib/func.pyx

clean:
	rm -rf build talib/func*.so talib/abstract*.so talib/common*.so talib/*.pyc

perf:
	python$(VERSION) tools/perf_talib.py

test:
	LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH} nosetests
