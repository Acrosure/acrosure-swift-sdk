//
//  constant.swift
//  AcrosureSDKExample
//
//  Created by Aikdanai Sidhikosol on 12/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

import Foundation
import SwiftyJSON

let TEST_PUBLIC_TOKEN = "tokn_sample_public"
let TEST_SECRET_TOKEN = "tokn_sample_secret"
let TEST_API_URL = "https://api.phantompage.com"

let APP_DATA = JSON([
    "product_id": "prod_ta",
    "basic_data": [
        "countries": ["GERMANY", "JAPAN"],
        "policy_date": "2018-12-11",
        "expiry_date": "2018-12-18",
        "policy_unit": "D"
    ],
    "package_options": [
        "insurer_count": 2
    ],
    "additional_data": [
        "customer_title": "MR.",
        "customer_first_name": "MANA",
        "customer_last_name": "MUNGMARN",
        "company_name": "-",
        "card_type": "I",
        "id_card": "1489900087857",
        "email": "developer@example.com",
        "phone": "0810000000",
        "insurer_list": [
            [
                "title": "MR.",
                "first_name": "MANA",
                "last_name": "MUNGMARN",
                "card_type": "I",
                "id_card": "1489900087857",
                "birthdate": "1988-10-14",
                "email": "developer@example.com",
                "phone": "0812345678",
                "nominee": "",
                "relationship": "",
                "address": [
                    "address_no": "1",
                    "moo": "2",
                    "village": "VILLAGE",
                    "alley": "",
                    "lane": "LAD PRAO 4",
                    "street": "LAD PRAO",
                    "minor_district": "",
                    "subdistrict": "Chomphon",
                    "district": "Chatuchak",
                    "province": "Bangkok",
                    "postal_code": "10900"
                ]
            ],
            [
                "title": "MR.",
                "first_name": "MANEE",
                "last_name": "MUNGMARN",
                "card_type": "I",
                "id_card": "1682086540364",
                "birthdate": "1988-12-31",
                "email": "developer@example.com",
                "phone": "0812345678",
                "nominee": "MR. MANOCH MUNGMARN",
                "relationship": "Brother/Sister",
                "address": [
                    "address_no": "1",
                    "moo": "2",
                    "village": "VILLAGE",
                    "alley": "",
                    "lane": "LAD PRAO 4",
                    "street": "LAD PRAO",
                    "minor_district": "",
                    "subdistrict": "Chomphon",
                    "district": "Chatuchak",
                    "province": "Bangkok",
                    "postal_code": "10900"
                ]
            ]
        ]
    ]
])
