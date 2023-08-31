package main

import (
	"os"
)

const (
	PORT = 8080
)

var redisHost = "localhost"

func main() {
	if os.Getenv("redisHost") != "" {
		redisHost = os.Getenv("redisHost")
	}

	redisClient := NewRedisClient(redisHost)
	defer redisClient.Close()

	httpHandler := NewHttpHandler(redisClient)
	httpServer := NewHttpServer(httpHandler)
	httpServer.Listen(PORT)
}
