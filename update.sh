#!/bin/bash
set -eo pipefail

declare -A base=(
	[alpine]='alpine'
)

variants=(
	alpine
)

#min_version='3.3'


# version_greater_or_equal A B returns whether A >= B
#function version_greater_or_equal() {
#	[[ "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1" || "$1" == "$2" ]];
#}

dockerRepo="monogramm/docker-taiga-events"
latests=(
    master
)

# Remove existing images
echo "reset docker images"
find ./images -maxdepth 1 -type d -regextype sed -regex '\./images/.*\+' -exec rm -r '{}' \;

echo "update docker images"
travisEnv=
for latest in "${latests[@]}"; do
	version=$latest

	# Only add versions >= "$min_version"
	#if version_greater_or_equal "$version" "$min_version"; then

        for variant in "${variants[@]}"; do
            # Create the version+variant directory with a Dockerfile.
            dir="images/$version/$variant"
            if [ -d "$dir" ]; then
                continue
            fi

            echo "generating $latest [$version] $variant"
            mkdir -p "$dir"

            template="Dockerfile-${base[$variant]}.template"
            cp "$template" "$dir/Dockerfile"

            # Replace the variables.
            sed -ri -e '
                s/%%VARIANT%%/'"$variant"'/g;
                s/%%VERSION%%/'"$latest"'/g;
            ' "$dir/Dockerfile"

            # Copy the scripts
            for name in entrypoint.sh config.json; do
                cp "docker-$name" "$dir/$name"
                chmod 755 "$dir/$name"
            done

            travisEnv='\n    - VERSION='"$version"' VARIANT='"$variant$travisEnv"

            if [[ $1 == 'build' ]]; then
                tag="$version-$variant"
                echo "Build Dockerfile for ${tag}"
                docker build -t "${dockerRepo}:${tag}" "${dir}"
            fi
        done

	#fi

done

# update .travis.yml
travis="$(awk -v 'RS=\n\n' '$1 == "env:" && $2 == "#" && $3 == "Environments" { $0 = "env: # Environments'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml
