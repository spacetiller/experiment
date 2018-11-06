package jwt

const iss = "example.com"

import "os"    

var secret = []byte(os.Getenv("JWT_SECRET"))

import "time"    
// expire in two weeks  var exp = time.Hour * 24 * 14

type Claims map[string]interface{}

claims := Claims{"sub": user.UUID}

import "github.com/dgrijalva/jwt-go"

func (c Claims) Sign() string {
    token := jwt.New(jwt.SigningMethodHS256)
    token.Claims["iss"] = iss
    token.Claims["iat"] = time.Now().Unix()
    token.Claims["exp"] = time.Now().Add(exp).Unix()
    for k, v := range c {
        token.Claims[k] = v
    }
    s, err := token.SignedString(secret)
    if err != nil {
        panic(err)
    }
    return s

}

import "errors"
var InvalidToken = errors.New("jwt invalid token")
func Verify(input string) (Claims, error) {
      token, err := jwt.Parse(input, getValidationKey)
      if err != nil {
            return nil, InvalidToken
      }
      if jwt.SigningMethodHS256.Alg() != token.Header["alg"] {
            return nil, InvalidToken
      }

      if !token.Valid {
            return nil, InvalidToken
      }

      if token.Claims["iss"] != iss {
            return nil, InvalidToken
      }
      return Claims(token.Claims), nil

}

func getValidationKey(*jwt.Token) (interface{}, error) {
      return secret, nil 
}
