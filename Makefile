all: config
	stack build

install: config
	stack install

config: package.yaml stack.yaml

clean:
	rm -f e.cabal stack.yaml package.yaml

##############################################################################################################

package.yaml: Config.dhall
	echo '(./Config.dhall).package' | dhall-to-yaml >package.yaml

stack.yaml: Config.dhall
	echo '(./Config.dhall).stack' | dhall-to-yaml >stack.yaml
