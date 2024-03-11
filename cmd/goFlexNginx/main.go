package main

import (
	"fmt"
	"net/http"

	"github.com/gabrielhalus/goFlexNginx/internal/handlers"
	"github.com/go-chi/chi"
	log "github.com/sirupsen/logrus"
)

func main() {
	var r *chi.Mux = chi.NewRouter()
	handlers.Handle(r)
	
	fmt.Println("Starting GO API service...")
	
	err := http.ListenAndServe(":3300", r)
	if err != nil {
		log.Error(err)
	}
}
