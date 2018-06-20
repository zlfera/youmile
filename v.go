package main

import (
	"fmt"

	jsoniter "github.com/json-iterator/go"
)

var (
	//	url1 = "http://220.248.203.59:8686/rtp/data/race/getAllRaceMarketing.jsp"

	//url2 = "http://220.248.203.59:8686/rtp/data/race/getRaceMeeting.jsp?id="
	//url3 = "http://220.248.203.59:8686/rtp/data/race/getRaceTacheDetail.jsp?id="
	//url1 = "http://123.127.88.167:8888/tradeClient/observe/specialList"
	u    = `[{"specialName":"国家临储玉米竞价交易","specialNo":"1155"},{"specialName":"国家临储玉米竞价交易","specialNo":"115"}]`
	url2 = "qwe"
)

type A struct {
	SpecialName string `json:"specialName"`
	SpecialNo   string `json:"specialNo"`
}

func a(url string) (aa []A) {
	//u, _ := goquery.NewDocument(url)
	//u1 := u.Text()
	u2 := []byte(url)
	jsoniter.Unmarshal(u2, &aa)
	return aa
}
func main() {

	//	url1 = url2 + "3"
	//fmt.Println(url1)
	//b := a(url1)
	//for _, j := range b {
	//	u2 := url2 + j[0]
	//	fmt.Println(u2)
	//	c := a(u2)
	//	s := [1]int{3}
	//	fmt.Println(len(s))

	//	}
	//fmt.Println(b)
	m := a(u)

	chs := make(chan A)
	for _, j := range m {

		go aa(j, chs)
		<-chs

	}

	//for value := range chs {
	//value := <-chs
	//fmt.Println(value)
	//}
	//fmt.Println(reflect.TypeOf(chs))

	//ddd := []byte("123")
	//fmt.Println(reflect.TypeOf(ddd))
	fmt.Println(12357)

}
func aa(j A, ch chan A) {
	u2 := url2 + j.SpecialNo
	ud := a(u2)
	for len(a(u)) != 0 {

	}

	ch <- j
	fmt.Println(ud)

}
