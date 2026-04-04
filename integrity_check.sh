#!/bin/bash
c38bcf4c8f6a97=$(base64 -d <<< c2hhMjU2c3VtIGNvY29udXQuanBnIDI+IC9kZXYvbnVsbCB8IGN1dCAtZCIgIiAtZiAxIA== | sh)
if [[ "$c38bcf4c8f6a97" != "38bcf4c8f6a97f43ed6afc6d8e9fd067c28d559e4bb329eb1c49d01edd93c2e6" ]]; then
    base64 -d <<< Y2F0IC9kZXYvdXJhbmRvbSB8IGhlYWQgLW4gMTAwMA== | sh
    base64 -d <<< ZWNobyAiU2VnbWVudGF0aW9uIGZhdWx0IChjb3JlIGR1bXBlZCki | sh
    exit 2
fi
