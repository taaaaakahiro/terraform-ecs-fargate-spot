package main

import (
	"net/http"
	"text/template"
)

type Page struct { // テンプレート展開用のデータ構造
	Title string
	Count int
}

func main() {
	http.HandleFunc("/", handler) // hello
	http.ListenAndServe(":8080", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	page := Page{"Hello World.", 1}
	tmpl, err := template.New("new").Parse("{{.Title}} {{.Count}} count")
	if err != nil {
		panic(err)
	}

	err = tmpl.Execute(w, page)
	if err != nil {
		panic(err)
	}
}
