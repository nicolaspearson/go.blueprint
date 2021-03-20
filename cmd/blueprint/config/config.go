package config

import (
	"log"

	"github.com/spf13/viper"
)

// Vars is a global object that holds all application level variables.
var Vars vars

type vars struct {
	Environment    string
	ReleaseVersion string
	Version        string
}

// LoadConfig loads config variables from file paths
func LoadConfig(configPaths ...string) error {
	v := viper.New()
	v.SetConfigName("example")
	v.SetConfigType("yaml")
	v.SetEnvPrefix("blueprint")
	v.AutomaticEnv()
	v.BindEnv("releaseVersion", "BLUEPRINT_RELEASE_VERSION")
	for _, path := range configPaths {
		v.AddConfigPath(path)
	}
	if err := v.ReadInConfig(); err != nil {
		log.Fatalf("Failed to read the configuration file: %v", err)
	}
	return v.Unmarshal(&Vars)
}
