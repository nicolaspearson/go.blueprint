package main

import (
	"testing"

	"github.com/nicolaspearson/go.blueprint/cmd/blueprint/config"
	"github.com/stretchr/testify/assert"
)

func TestDummy(t *testing.T) {
	assert.Equal(t, 1, 1)
}

func TestLoadConfig(t *testing.T) {
	if err := config.LoadConfig("../../config"); err != nil {
		assert.Error(t, err)
	}
	assert.Equal(t, "Dummy Value", config.Config.ConfigVar)
}
