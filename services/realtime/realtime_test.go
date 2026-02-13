package main

import "testing"

func TestPlaceholder(t *testing.T) {
	if 2+2 != 4 {
		t.Fatal("math is broken")
	}
}
