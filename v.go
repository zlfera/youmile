package main

import jsoniter "github.com/json-iterator/go"

//	jsoniter "github.com/json-iterator/go"

var (
	url1 = "http://123.127.88.167:8888/tradeClient/observe/specialList"
)

type A struct {
	SpecialName string `json:"specialName"`
	SpecialNo   string `json:"specialNo"`
}

func a(url string) (aa []A) {
	u, _ := goquery.NewDocument(url)
	u1 := u.Text()
	u2 := []byte(u1)
	jsoniter.Unmarshal(u2, &aa)
	return aa
}
func main() {

	for {
		a := a(url1)
		if len(a) == 0 {
			break
		} else {
			for _, j := range a {

			}

		}

	}
}
