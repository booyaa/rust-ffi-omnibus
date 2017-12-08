#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;
use FFI::Raw;

# my $lib_path = "../target/debug/";
my $lib_path = "";
my $prefix = "lib"; # same for linux, empty for win32
my $extension = ".dylib"; # ".dll" for win32 / ".so" for linux
$lib_path = $lib_path . $prefix . "string_arguments" . $extension;

my $how_many_characters = FFI::Raw->new (
    $lib_path, # library
    "how_many_characters", # function
    FFI::Raw::uint, # return type
    FFI::Raw::str # argument types
);

say $how_many_characters->call("göes to élevên");