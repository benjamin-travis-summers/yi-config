all: stack.yaml package.yaml
	stack build

install: stack.yaml package.yaml
	stack install

clean:
	rm -f e.cabal stack.yaml package.yaml

##############################################################################################################

package.yaml: CONFIG
	echo '(./CONFIG).package' | dhall-to-yaml >package.yaml

stack.yaml: CONFIG
	echo '(./CONFIG).stack' | dhall-to-yaml >stack.yaml
