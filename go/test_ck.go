package main

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"sync"
	"time"

	"github.com/ClickHouse/clickhouse-go/v2"
	"github.com/ClickHouse/clickhouse-go/v2/lib/driver"
)

var hosts = []string{"127.0.0.1:9001" }

func randtype() string {
	num := rand.Int31n(100)
	return fmt.Sprintf("type%d", num)
}

func main() {
	conn, err := clickhouse.Open(&clickhouse.Options{
		Addr:             hosts,
		DialTimeout:      time.Second,
		MaxOpenConns:     10,
		MaxIdleConns:     5,
		ConnOpenStrategy: clickhouse.ConnOpenRoundRobin,
	})

	if err != nil {
		log.Fatal(err)
	}

	var wg sync.WaitGroup
	for i := 0; i < 100; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			var batch driver.Batch
			var err error
			if batch, err = conn.PrepareBatch(context.TODO(), "INSERT INTO company_db.events"); err != nil {
				log.Fatal(err)
			}
			for i := 0; i < 50_000; i++ {
				if err = batch.Append(
					time.Now(),
					rand.Int63(),
					randtype(),
				); err != nil {
					log.Fatal(err)
				}
			}
			if err = batch.Send(); err != nil {
				log.Fatal(err)
			}
		}()
		time.Sleep(time.Second)
	}
	wg.Wait()
}


