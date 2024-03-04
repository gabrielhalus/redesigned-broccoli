package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/gabrielhalus/goFlexNginx/api"
	"github.com/gabrielhalus/goFlexNginx/internal/pkg/utils"
	log "github.com/sirupsen/logrus"
)

const nginxConfLocation string = "/etc/nginx/nginx.conf"

func GetNginxConf(w http.ResponseWriter, r *http.Request) {
	var configDetails string
	configDetails, err := utils.Parse(nginxConfLocation)
	if err != nil {
		log.Error(err)
		api.InternalErrorHandler(w)
		return
	}
	
	var response = api.NginxConfigurationResponse{
		Code: 200,
		Data: configDetails,
	}
	
	w.Header().Set("Content-Type", "application/json")
	err = json.NewEncoder(w).Encode(response)
	if err != nil {
		log.Error(err)
		api.InternalErrorHandler(w)
		return
	}
}
