setup:
	gem install jazzy
	(cd Example; pod install)

build_docs:
	jazzy \
  --objc \
  --author Textile \
  --author_url https://textile.io \
  --github_url https://github.com/textileio/ios-textile \
  --umbrella-header Textile/classes/TextileApi.h \
  --framework-root . \
  --module Textile
