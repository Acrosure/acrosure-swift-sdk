//
//  constant.swift
//  AcrosureSDKTests
//
//  Created by Aikdanai Sidhikosol on 10/10/2561 BE.
//  Copyright © 2561 Acrosure. All rights reserved.
//

let TEST_PUBLIC_TOKEN = "tokn_sample_public"
let TEST_SECRET_TOKEN = "tokn_sample_secret"
let TEST_API_URL = "https://api.phantompage.com"

let SUBMIT_APP_DATA = [
    "product_id": "prod_contractor",
    "basic_data": [
        "contract_value": 10000000,
        "existing_property_value": 3000000,
        "gross_floor_area": 15000,
        "project_type": "Residential",
        "contractor_grade": "A"
    ],
    "package_options": nil,
    "additional_data": [
        "principal": [
            "name": "บริษัท ผู้ว่าจ้าง จำกัด",
            "address": [
                "address_no": "1",
                "moo": "2",
                "village": "วิลเลจ 3",
                "alley": "",
                "lane": "ลาดพร้าว 4",
                "street": "ลาดพร้าว",
                "minor_district": "",
                "subdistrict": "จอมพล",
                "district": "จตุจักร",
                "province": "กรุงเทพมหานคร",
                "postal_code": "10900"
            ]
        ],
        "contractor": [
            "name": "บริษัท ผู้รับเหมา จำกัด",
            "title": "นาย",
            "first_name": "สมชาย",
            "last_name": "สายชม",
            "tax_id": "1111111111119",
            "branch": "สมุทรปราการ",
            "phone": "0811111111",
            "email": "somchai@email.com",
            "address": [
                "address_no": "1",
                "moo": "2",
                "village": "วิลเลจ 3",
                "alley": "",
                "lane": "ลาดพร้าว 4",
                "street": "ลาดพร้าว",
                "minor_district": "",
                "subdistrict": "จอมพล",
                "district": "จตุจักร",
                "province": "กรุงเทพมหานคร",
                "postal_code": "10900"
            ]
        ],
        "delivery": [
            "name": "นายสมชาย สายชม",
            "policy_postal": false,
            "address": [
                "address_no": "1",
                "moo": "2",
                "village": "วิลเลจ 3",
                "alley": "",
                "lane": "ลาดพร้าว 4",
                "street": "ลาดพร้าว",
                "minor_district": "",
                "subdistrict": "จอมพล",
                "district": "จตุจักร",
                "province": "กรุงเทพมหานคร",
                "postal_code": "10900"
            ]
        ],
        "project_name": "โครงการ อโครบิวดิ้ง",
        "project_site": [
            "subdistrict": "จอมพล",
            "district": "จตุจักร",
            "province": "กรุงเทพมหานคร"
        ],
        "project_effective_date": "2018-10-01",
        "project_expiry_date": "2019-10-01",
        "project_duration": 365,
        "warranty_duration": 5,
        "warranty_expiry_date": "2018-10-06",
        "payment_type": "ONLINE",
        "policy_code": "",
        "files": nil
    ]
    ] as [String : Any?]

let CONFIRM_APP_DATA = [
    "product_id": "prod_fire",
    "basic_data": [
        "building_area_sq_m": 100,
        "building_material": "FULL_CONCRETE",
        "building_type": "SINGLE_HOUSE",
        "coverage_year": 1,
        "effective_date": "2018-10-02"
    ],
    "package_options": nil,
    "additional_data": [
        "is_insured_building_owner": true,
        "building_address": [
            "address_no": "1",
            "moo": "2",
            "village": "วิลเลจ 3",
            "alley": "",
            "lane": "ลาดพร้าว 4",
            "street": "ลาดพร้าว",
            "minor_district": "",
            "subdistrict": "จอมพล",
            "district": "จตุจักร",
            "province": "กรุงเทพมหานคร",
            "postal_code": "10900"
        ],
        "building_roof_structure": "เหล็ก",
        "building_roof_type": "กระเบื้อง",
        "building_second_floor_type": "",
        "building_total_floors": 2,
        "insured_person": [
            "type": "1",
            "title": "นาย",
            "first_name": "มานะ",
            "last_name": "มุ่งมั่น",
            "birthdate": "1988-10-14",
            "id_card": "1489900087857",
            "branch_name": "",
            "address": nil,
            "phone": "0861234567",
            "email": "customer@example.com",
            "custom_beneficiary": false,
            "beneficiary_person": nil
        ],
        "other_insured_person_1": nil
    ]
    ] as [String : Any?]
