package main

import (
	"log"
	"net/http"

	"github.com/dexera/dexera/services/bff/internal/health"
)

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/healthz", health.Handler)

	log.Println("bff listening on :3001")
	if err := http.ListenAndServe(":3001", mux); err != nil {
		log.Fatal(err)
	}
}
