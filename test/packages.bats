#!/usr/bin/env bats

load common.sh

@test "test fedora packages are in PATH" {
	check_path 7z bats cargo git hadolint helm kubectl lz4 make nmap shellcheck stow vim zsh xz
}

@test "test cloudposse packages are in PATH" {
	check_path doctl kind packer terraform terraform-docs terragrunt tflint
}

@test "test boilr is in PATH" {
	check_path boilr
}

@test "test codium is in PATH" {
	check_path codium
}

@test "test cdktf is in PATH" {
	check_path cdktf
}

@test "test exo is in PATH" {
	check_path exo
}

@test "test flux is in PATH" {
	check_path flux
}

@test "test helm-docs is in PATH" {
	check_path helm-docs
}

@test "test kubebuilder is in PATH" {
	check_path kubebuilder
}

@test "test kubeseal is in PATH" {
	check_path kubeseal
}

@test "test kustomize is in PATH" {
	check_path kustomize
}

@test "test librewolf is in PATH" {
	check_path librewolf
}

@test "test ngrok is in PATH" {
	check_path ngrok
}

@test "test phantomjs is in PATH" {
	check_path phantomjs
}

@test "test starship is in PATH" {
	check_path starship
}
