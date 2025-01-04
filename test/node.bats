#!/usr/bin/env bats

load common.sh

@test "test node is in PATH" {
	check_path node
}

@test "test npm packages are in PATH" {
	check_path ganache-cli gatsby npm vue yarn
}
