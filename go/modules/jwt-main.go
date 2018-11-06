package main

import (
	"fmt"
    "net/http" 
    "strings" 
    "example.com/project/jwt" 
)

var NotAuthorized = errors.New("not authorized")

func verify(r *http.Request) (jwt.Claims, error) {
    auth := r.Headers.Get("Authorization")
    if auth == "" {
        return nil, NotAuthorized
    }

    parts := strings.Split(auth, " ")
    if len(parts) != 2 || parts[0] != "Bearer" {
        return nil, NotAuthorized
    }

    claims, err := jwt.Verify(parts[1])
    if err != nil {
        return nil, NotAuthorized
    }
    return claims, nil 
}

func ModifyResource(w http.ResponseWriter, r *http.Request) {
  claims, err := verify(r)
 if err != nil {
      http.Error(w, err.Error(), 401)
      return 
  }

  if !CanModifyResource(claims, r) {
      http.Error(w, "not authorized", 403)
      return 
  }
 // do stuff

}
