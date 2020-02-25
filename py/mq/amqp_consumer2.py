# -*- coding: utf-8 -*-

from amqplib import client_0_8 as amqp

conn = amqp.Connection(host="localhost:5672", userid="guest", password="guest", virtual_host="/", insist=True)
chan = conn.channel()

chan.queue_declare(queue="po_box", durable=True, exclusive=False, auto_delete=False)
chan.exchange_declare(exchange="sorting_room", type="direct", durable=True, auto_delete=False,)
chan.queue_bind(queue="po_box", exchange="sorting_room", routing_key="jason")

def recv_callback(msg):
    print('Received: ' + str(msg.body) + ' from channel #' + str(msg.channel.channel_id))
    print >> open("txt_44.txt","a+"), msg.body
    msg.channel.basic_ack(delivery_tag = msg.delivery_tag)

chan.basic_consume(queue='po_box', no_ack=False, callback=recv_callback, consumer_tag="testtag")
while True:
    chan.wait()
chan.basic_cancel("testtag")

chan.close()
conn.close()

