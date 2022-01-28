# README

# Commands run associated with a given commit
Generated articles model
```
rails g model article title content:text slug
```

Added JSON serializer - after adding indicated gem
```
bundle
rails g serializer article title content slug
```