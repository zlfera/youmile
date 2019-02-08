package main

import (
	"fmt"
	"regexp"
	"strconv"

	"github.com/PuerkitoBio/goquery"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	jsoniter "github.com/json-iterator/go"
)

var (
	url1 = "http://123.127.88.167:8888/tradeClient/observe/specialList"
	url2 = "http://123.127.88.167:8888/tradeClient/observe/requestList?specialNo="
)

type A struct {
	SpecialName string `json:"specialName"`
	SpecialNo   string `json:"specialNo"`
}
type B struct {
	SpecialName        string `json:"specialName"`
	Status             string `json:"status"`
	CountdownStartTime string `json:"countdownStartTime"`
	SpecialNo          string `json:"specialNo"`
	Section            string `json:"section"`
	Rows               []C    `json:rows`
}

type C struct {
	StatusID            string `json:"statusId"`
	GradeName           string `json:"gradeName"`
	Num                 string `json:"num"`
	RequestAlias        string `json:"requestAlias"`
	RequestBuyDepotName string `json:"requestBuyDepotName"`
	VarietyName         string `json:"varietyName"`
	RequestNo           string `json:"requestNo"`
	StatusName          string `json:"statusName"`
	CurrentPrice        string `json:"currentPrice"`
	RemainSeconds       string `json:"remainSeconds"`
	BasePrice           string `json:"basePrice"`
}

func a(url string) (aa []A) {
	u, _ := goquery.NewDocument(url)
	u1 := u.Text()
	u2 := []byte(u1)
	jsoniter.Unmarshal(u2, &aa)
	return aa

}
func b(url string) (bb B) {
	u, _ := goquery.NewDocument(url)
	u1 := u.Text()
	u2 := []byte(u1)
	jsoniter.Unmarshal(u2, &bb)
	return bb
}
func grain_task(special_no string) {
	// do some thing
	for {
		url2 := url2 + special_no
		b := b(url2)
		if b.Status == "no" || b.Status == "end" {
			break
		}
		if b.Status == "yes" {
			for _, d := range b.Rows {
				var y string
				x := d.RequestAlias
				i, _ := strconv.Atoi(d.RemainSeconds)
				if i <= 3 {
					if len(x) <= 12 || len(x) == 13 {
						exp := regexp.MustCompile(`^\d+`)
						y = exp.FindString(x)
						if y == "" {
							y = "00"
						}
					} else {
						y = x[12:13]
						fmt.Println(y)
					}
				} else {
					continue
				}
				// postgres
			}
		} else {
			continue
		}
	}

}
func main() {
	//db, err := gorm.Open("postgres", "postgresql://4c6f1112-eba0-4f53-9a57-f2c45cad8fa7-user:pw-56572bb2-3191-4417-9da4-0a2ed09880ea@postgres-free-tier-1.gigalixir.com:5432/4c6f1112-eba0-4f53-9a57-f2c45cad8fa7")
	//defer db.Close()
	//if err != nil {
	//log.Fatal(fmt.Sprint("数据库连接%s", err.Error()))
	//}
	list_no := make(map[string]string)

	for {
		text := a(url1)
		if len(text) == 0 {
			fmt.Println("交易结束")
			break
		}

		for _, v := range text {
			_, ok := list_no[v.SpecialNo]
			if ok {
				continue
			} else {
				list_no[v.SpecialNo] = v.SpecialNo
				go grain_task(v.SpecialNo)

			}
		}

	}

}
