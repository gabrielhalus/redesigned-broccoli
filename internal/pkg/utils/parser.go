package utils

import (
	"log"
	"os/exec"
)

// parseConfigurationFile
func Parse(configurationFile string) (data string, err error) {
	jsonData, err := exec.Command("crossplane", "parse", configurationFile).Output()
	if err != nil {
		log.Fatal(err)
		return "", err
	}

	return string(jsonData), nil
}
