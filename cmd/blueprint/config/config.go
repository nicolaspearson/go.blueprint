package config

import (
	"fmt"

	"github.com/spf13/viper"
)

// Config is a global object that holds all application level variables.
var Config appConfig

type appConfig struct {
	ConfigVar string
}

// LoadConfig loads config variables from file paths
func LoadConfig(configPaths ...string) error {
	v := viper.New()
	v.SetConfigName("example")
	v.SetConfigType("yaml")
	v.SetEnvPrefix("blueprint")
	v.AutomaticEnv()
	for _, path := range configPaths {
		v.AddConfigPath(path)
	}
	if err := v.ReadInConfig(); err != nil {
		return fmt.Errorf("failed to read the configuration file: %s", err)
	}
	return v.Unmarshal(&Config)
}
