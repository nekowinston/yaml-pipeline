#!/usr/bin/env bash

# required CLI tools:
# - yq (https://github.com/mikefarah/yq) - to build JSON from YAML
# - jq (https://github.com/stedolan/jq) - to modify JSON

# each palette
palettes=(
  "frappe"
  "latte"
  "macchiato"
  "mocha"
)

# loop over each
for palette in "${palettes[@]}"; do
  # get the palette, and the style
  cat "./src/palettes/${palette}.yaml" "./src/config.yaml" | \
  # pipe it into yq, to convert to JSON
    yq -o json | \
  # and use jq to only select the `alfredtheme` key, saving to ./dist
   jq -r "{colors: .colors}" > "./dist/Catppuccin-${palette}.json"
done
