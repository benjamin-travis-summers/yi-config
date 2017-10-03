all: stack.yaml package.yaml
	stack build

install: stack.yaml package.yaml
	stack install

clean:
	rm -f e.cabal stack.yaml package.yaml

##############################################################################################################

package.yaml: package.dhall
	dhall-to-yaml <package.dhall >package.yaml

stack.yaml: stack.dhall
	dhall-to-yaml <stack.dhall >stack.yaml
