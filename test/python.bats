#!/usr/bin/env bats

load common.sh

@test "test python is in PATH" {
	check_path python
}

@test "test poetry is in PATH" {
	check_path poetry
}

@test "python is properly vendored" {
	ls -al /vendor/python
	[ -d "/vendor/python/lib/python3.13/site-packages" ]
}

@test "test pip packages are in PATH" {
	check_path beet gallery-dl scdl yt-dlp
}
