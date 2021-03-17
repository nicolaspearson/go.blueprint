package main

import (
	"fmt"

	"github.com/nicolaspearson/go.blueprint/cmd/blueprint/config"
)

func main() {
	if err := config.LoadConfig("./config"); err != nil {
		panic(fmt.Errorf("invalid application configuration: %s", err))
	}

	fmt.Println(config.Config.ConfigVar)
}
