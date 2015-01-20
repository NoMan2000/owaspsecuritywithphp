-- Fragment begins: 11 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (11, 'Main', NOW(), 'dbdeploy', '11-companyOrderSeeds.sql');
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 254, 150, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 145, 65, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 215, 129, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 107, 55, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 344, 338, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 481, 20, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 172, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 347, 137, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 434, 333, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 147, 105, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 171, 2, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 263, 81, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 348, 157, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 86, 40, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 173, 104, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 58, 54, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 33, 13, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 157, 114, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 382, 100, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 79, 33, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 23, 3, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 181, 136, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 170, 72, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 316, 122, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 169, 67, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 371, 195, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 73, 48, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 255, 80, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 109, 80, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 312, 5, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 174, 142, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 425, 300, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 284, 173, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 474, 92, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 281, 150, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 417, 0, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 19, 1, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 398, 269, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 488, 401, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 301, 125, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 52, 17, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 150, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 262, 62, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 309, 262, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 218, 79, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 445, 356, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 14, 9, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 203, 128, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 306, 102, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 128, 27, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 45, 5, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 414, 244, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 378, 183, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 207, 205, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 262, 208, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 103, 20, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 107, 89, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 274, 195, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 471, 102, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 8, 6, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 495, 341, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 453, 80, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 156, 12, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 21, 14, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 391, 103, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 23, 21, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 16, 3, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 466, 361, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 180, 145, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 296, 256, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 327, 146, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 184, 160, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 187, 54, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 160, 22, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 186, 110, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 371, 60, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 207, 70, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 425, 36, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 235, 191, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 470, 198, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 144, 144, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 460, 433, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 417, 326, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 295, 281, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 74, 46, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 427, 83, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 170, 164, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 256, 88, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 427, 355, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 500, 367, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 114, 1, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 339, 280, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 239, 79, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 426, 254, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 241, 227, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 50, 33, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 462, 229, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 213, 183, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 301, 112, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 325, 114, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 355, 242, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 294, 99, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 204, 188, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 238, 26, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 180, 55, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 485, 377, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 15, 3, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 243, 43, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 372, 191, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 297, 98, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 435, 73, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 174, 95, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 110, 66, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 368, 309, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 185, 167, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 52, 30, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 186, 119, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 64, 7, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 202, 53, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 70, 34, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 222, 34, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 42, 21, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 345, 298, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 20, 16, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 164, 126, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 172, 96, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 271, 94, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 151, 55, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 88, 11, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 193, 31, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 466, 103, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 9, 2, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 403, 206, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 369, 261, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 414, 266, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 161, 62, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 411, 4, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 368, 331, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 270, 63, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 204, 134, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 286, 276, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 73, 63, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 149, 117, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 27, 2, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 456, 194, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 187, 74, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 381, 146, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 423, 80, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 272, 1, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 475, 343, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 454, 340, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 363, 310, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 387, 111, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 251, 77, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 82, 47, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 255, 105, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 397, 188, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 240, 224, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 485, 134, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 354, 176, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 215, 3, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 117, 94, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 270, 239, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 349, 122, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 357, 134, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 474, 173, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 422, 19, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 488, 399, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 41, 41, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 191, 27, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 403, 18, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 147, 62, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 248, 14, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 269, 132, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 217, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 9, 8, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 15, 11, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 482, 256, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 22, 11, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 330, 165, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 445, 400, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 104, 99, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 159, 2, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 307, 110, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 311, 200, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 87, 38, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 226, 200, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 209, 194, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 498, 456, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 474, 263, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 401, 109, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 338, 331, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 1, 0, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 165, 62, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 433, 220, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 416, 378, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 322, 202, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 179, 92, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 38, 19, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 444, 43, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 371, 159, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 181, 1, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 118, 52, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 478, 383, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 203, 141, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 182, 35, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 315, 69, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 426, 381, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 215, 125, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 191, 94, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 393, 100, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 238, 94, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 372, 327, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 449, 441, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 72, 59, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 188, 58, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 9, 6, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 216, 130, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 372, 254, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 250, 240, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 135, 130, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 284, 87, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 178, 133, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 162, 41, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 284, 144, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 62, 37, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 301, 13, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 273, 12, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 248, 222, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 479, 64, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 358, 158, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 174, 104, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 139, 28, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 37, 15, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 257, 112, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 168, 103, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 125, 4, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 272, 215, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 247, 30, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 61, 23, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 210, 147, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 102, 54, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 351, 323, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 258, 199, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 264, 153, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 17, 4, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 397, 28, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 453, 121, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 183, 102, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 178, 164, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 270, 70, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 4, 0, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 306, 73, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 7, 6, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 253, 145, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 287, 273, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 390, 108, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 267, 202, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 389, 373, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 20, 11, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 49, 32, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 7, 2, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 90, 9, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 294, 229, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 60, 11, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 258, 222, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 310, 83, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 113, 90, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 123, 48, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 468, 79, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 2, 2, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 410, 105, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 111, 68, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 456, 234, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 114, 59, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 461, 433, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 92, 62, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 19, 13, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 171, 130, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 376, 235, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 18, 4, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 462, 114, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 260, 132, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 316, 147, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 200, 155, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 244, 139, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 14, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 305, 162, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 151, 33, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 372, 40, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 157, 150, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 78, 74, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 84, 11, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 28, 11, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 184, 131, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 217, 134, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 46, 1, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 93, 64, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 232, 145, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 336, 276, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 448, 399, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 340, 337, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 228, 92, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 238, 89, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 66, 20, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 411, 161, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 495, 206, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 419, 74, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 41, 41, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 361, 348, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 448, 317, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 301, 64, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 438, 59, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 116, 4, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 266, 41, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 128, 70, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 147, 103, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 275, 6, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 13, 0, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 427, 204, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 242, 6, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 281, 244, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 298, 76, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 431, 15, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 125, 73, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 498, 346, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 122, 15, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 9, 3, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 422, 208, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 242, 0, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 429, 107, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 114, 20, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 226, 94, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 213, 122, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 197, 33, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 460, 298, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 158, 34, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 296, 41, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 238, 106, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 469, 210, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 104, 34, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 357, 72, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 359, 35, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 229, 87, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 392, 57, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 144, 114, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 26, 11, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 199, 88, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 334, 184, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 487, 158, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 326, 145, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 185, 74, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 101, 96, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 90, 2, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 189, 187, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 142, 122, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 204, 141, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 282, 62, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 342, 3, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 252, 112, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 44, 27, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 334, 314, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 64, 20, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 203, 2, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 193, 75, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 214, 33, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 45, 44, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 250, 188, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 339, 281, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 300, 113, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 3, 2, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 440, 340, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 454, 120, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 33, 13, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 476, 166, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 444, 433, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 192, 87, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 407, 402, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 438, 366, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 88, 39, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 19, 12, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 90, 82, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 96, 43, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 75, 17, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 371, 74, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 103, 75, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 122, 70, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 81, 74, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 315, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 15, 15, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 431, 282, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 402, 121, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 434, 115, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 491, 177, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 444, 1, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 264, 43, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 464, 170, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 94, 47, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 151, 71, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 83, 25, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 168, 83, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 375, 13, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 44, 16, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 246, 227, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 355, 324, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 352, 138, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 324, 144, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 264, 95, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 434, 207, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 151, 124, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 218, 62, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 3, 0, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 4, 1, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 79, 45, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 248, 66, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 112, 23, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 340, 65, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 105, 28, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 37, 14, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 117, 114, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 268, 98, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 219, 197, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 369, 25, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 27, 25, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 349, 332, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 130, 85, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 115, 16, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 330, 153, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 208, 65, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 342, 168, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 282, 213, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 474, 153, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 181, 122, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 418, 141, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 164, 10, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 251, 3, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 98, 67, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 476, 293, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 429, 6, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 205, 110, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 25, 17, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 351, 211, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 393, 293, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 268, 226, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 340, 174, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 23, 9, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 352, 41, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 386, 206, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 244, 229, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 45, 31, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 198, 59, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 58, 5, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 97, 63, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 221, 77, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 369, 99, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 230, 114, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 150, 29, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 32, 20, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 6, 1, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 441, 229, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 182, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 249, 218, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 100, 48, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 68, 11, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 313, 261, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 192, 4, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 71, 67, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 254, 248, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 487, 92, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 117, 7, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 263, 25, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 216, 169, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 449, 444, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 313, 138, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 141, 122, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 246, 4, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 223, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 309, 58, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 362, 339, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 404, 49, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 41, 30, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 485, 450, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 45, 4, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 355, 120, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 399, 161, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 480, 55, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 162, 62, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 60, 14, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 394, 212, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 52, 26, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 152, 94, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 335, 33, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 423, 350, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 76, 65, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 57, 43, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 234, 97, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 126, 126, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 252, 226, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 280, 75, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 160, 27, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 364, 230, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 60, 17, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 311, 37, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 83, 14, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 86, 83, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 189, 111, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 218, 157, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 418, 189, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 403, 65, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 64, 63, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 102, 97, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 205, 162, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 124, 70, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 271, 219, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 91, 13, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 113, 62, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 394, 243, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 459, 222, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 41, 41, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 477, 123, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 470, 13, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 444, 282, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 8, 8, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 289, 269, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 47, 15, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 204, 129, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 7, 4, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 313, 61, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 181, 130, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 224, 121, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 186, 171, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 406, 23, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 150, 16, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 318, 243, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 384, 56, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 25, 8, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 359, 22, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 485, 227, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 273, 17, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 149, 116, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 170, 13, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 136, 119, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 81, 17, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 173, 50, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 90, 70, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 409, 201, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 266, 27, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 166, 11, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 371, 304, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 454, 127, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 45, 30, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 235, 17, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 458, 20, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 152, 26, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 499, 314, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 3, 1, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 270, 29, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 255, 220, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 174, 48, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 274, 221, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 400, 216, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 45, 20, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 35, 35, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 349, 107, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 6, 0, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 13, 6, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 352, 327, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 295, 261, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 69, 43, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 224, 156, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 201, 150, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 372, 36, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 276, 188, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 376, 288, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 216, 132, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 197, 58, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 111, 66, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 292, 278, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 130, 118, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 11, 10, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 442, 394, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 360, 264, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 376, 362, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 476, 55, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 460, 82, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 488, 211, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 106, 45, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 348, 78, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 298, 135, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 108, 29, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 24, 16, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 270, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 339, 212, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 356, 27, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 267, 214, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 478, 341, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 43, 2, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 80, 37, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 201, 103, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 276, 201, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 267, 13, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 254, 41, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 11, 8, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 81, 32, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 342, 171, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 408, 115, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 222, 103, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 72, 58, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 326, 162, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 379, 99, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 93, 18, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 299, 47, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 328, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 239, 102, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 268, 267, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 438, 438, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 114, 41, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 281, 224, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 491, 451, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 432, 138, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 136, 93, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 477, 293, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 181, 68, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 388, 344, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 327, 322, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 18, 6, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 96, 47, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 327, 19, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 90, 82, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 259, 111, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 9, 3, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 348, 241, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 229, 201, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 411, 84, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 468, 76, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 241, 118, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 37, 32, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 102, 81, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 476, 42, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 185, 127, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 177, 132, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 218, 56, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 378, 107, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 310, 147, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 469, 149, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 25, 13, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 57, 17, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 490, 78, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 494, 259, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 54, 31, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 159, 120, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 334, 73, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 307, 138, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 276, 276, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 87, 61, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 484, 219, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 1, 1, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 339, 286, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 50, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 390, 283, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 288, 129, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 68, 52, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 82, 79, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 232, 202, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 134, 9, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 462, 373, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 443, 227, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 98, 56, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 362, 51, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 337, 148, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 243, 208, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 495, 406, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 353, 282, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 180, 26, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 178, 111, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 156, 117, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 111, 104, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 136, 110, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 243, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 282, 250, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 387, 156, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 222, 218, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 488, 411, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 378, 69, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 92, 85, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 304, 12, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 477, 356, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 70, 13, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 425, 57, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 92, 86, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 203, 28, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 64, 20, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 454, 216, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 195, 92, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 448, 156, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 382, 15, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 326, 287, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 370, 44, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 188, 43, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 154, 135, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 215, 18, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 148, 116, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 226, 223, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 21, 19, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 412, 207, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 60, 23, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 64, 47, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 236, 77, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 195, 172, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 25, 20, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 434, 82, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 237, 120, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 215, 6, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 13, 1, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 3, 3, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 482, 362, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 466, 423, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 143, 24, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 380, 143, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 149, 121, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 467, 234, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 67, 61, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 291, 21, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 167, 7, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 212, 194, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 101, 70, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 492, 182, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 246, 218, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 180, 113, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 361, 78, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 276, 60, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 499, 474, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 418, 316, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 125, 38, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 116, 24, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 195, 193, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 324, 142, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 322, 223, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 73, 57, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 368, 176, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 484, 83, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 390, 267, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 304, 116, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 39, 19, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 91, 21, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 162, 123, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 319, 207, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 6, 3, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 398, 8, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 233, 183, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 234, 122, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 278, 45, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 76, 59, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 310, 104, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 477, 170, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 104, 59, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 8, 3, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 409, 339, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 287, 124, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 156, 34, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 203, 78, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 296, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 453, 349, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 291, 15, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 25, 1, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 179, 43, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 420, 410, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 112, 54, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 54, 39, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 494, 8, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 133, 86, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 131, 61, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 341, 62, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 63, 6, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 435, 44, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 212, 3, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 465, 52, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 311, 203, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 327, 2, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 227, 98, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 86, 69, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 250, 229, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 477, 226, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 197, 195, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 409, 94, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 252, 174, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 452, 388, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 403, 352, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 401, 19, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 377, 291, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 432, 205, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 163, 35, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 491, 216, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 24, 1, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 113, 106, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 103, 29, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 105, 44, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 36, 24, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 328, 241, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 256, 165, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 266, 54, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 492, 453, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 3, 0, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 321, 202, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 273, 266, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 104, 41, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 108, 93, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 426, 165, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 494, 36, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 62, 61, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 481, 144, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 202, 88, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 251, 92, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 306, 234, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 29, 21, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 451, 195, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 393, 260, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 467, 379, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 378, 250, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 136, 60, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 265, 243, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 66, 13, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 212, 24, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 290, 91, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 408, 382, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =3;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 432, 343, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 415, 305, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 409, 236, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 96, 92, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 295, 0, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 281, 277, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 200, 37, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 336, 261, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 95, 34, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 199, 115, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 348, 264, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 68, 5, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 407, 203, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 288, 134, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 342, 261, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 438, 341, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 146, 27, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 275, 224, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 102, 13, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 190, 76, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 444, 317, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 353, 73, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 495, 40, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 449, 23, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 186, 13, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 140, 96, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 204, 62, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 129, 69, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 219, 102, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 343, 29, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 351, 92, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 212, 154, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 324, 119, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =15;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 239, 196, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 484, 162, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 41, 27, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 313, 234, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 354, 350, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 201, 24, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 406, 269, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 499, 196, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 474, 316, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 212, 93, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 10, 9, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 165, 79, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 482, 42, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =28;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 255, 248, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 53, 10, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 209, 97, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 53, 6, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 266, 25, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 173, 80, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 123, 87, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 468, 461, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 2, 2, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =9;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 365, 292, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 75, 25, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 265, 167, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 367, 306, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 397, 9, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 326, 319, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 69, 11, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 312, 92, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 265, 240, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 57, 48, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 352, 247, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 84, 75, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 7, 3, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 185, 61, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 173, 139, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 344, 26, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 342, 229, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 359, 353, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =36;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 20, 17, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 176, 18, groups.id, groups.companies_id, 3
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 121, 72, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 307, 84, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 425, 3, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 23, 9, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 147, 128, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 74, 12, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 34, 22, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 27, 12, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 245, 85, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 500, 146, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =19;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 413, 182, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 383, 279, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 489, 21, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =4;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 286, 61, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 262, 248, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 178, 159, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 72, 19, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 161, 34, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 327, 46, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 428, 301, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 387, 191, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 98, 84, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 22, 15, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 107, 63, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 405, 367, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 187, 96, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =11;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 324, 75, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 494, 331, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 350, 346, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 254, 203, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 21, 11, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 390, 134, groups.id, groups.companies_id, 19
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 97, 41, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 384, 82, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 98, 58, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 69, 14, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 213, 11, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =20;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 483, 465, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 283, 148, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 108, 68, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 152, 64, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 311, 109, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 238, 6, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 292, 271, groups.id, groups.companies_id, 1
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 356, 297, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 262, 35, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =23;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 57, 7, groups.id, groups.companies_id, 20
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 28, 5, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =7;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 146, 56, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =24;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 333, 232, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =6;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 374, 85, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =2;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 489, 461, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 430, 320, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =33;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 385, 260, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 53, 50, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 304, 274, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 237, 95, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 97, 53, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 89, 28, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 403, 107, groups.id, groups.companies_id, 4
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 382, 228, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =29;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 285, 48, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =25;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 413, 262, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =38;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 101, 5, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 10, 3, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =32;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 148, 20, groups.id, groups.companies_id, 15
        FROM groups
        WHERE groups.id =37;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 51, 42, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 11, 3, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 18, 2, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 261, 91, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 412, 201, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 85, 83, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 402, 315, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 244, 132, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =22;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 232, 28, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =31;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 445, 131, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =27;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 342, 138, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 325, 279, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 451, 227, groups.id, groups.companies_id, 8
        FROM groups
        WHERE groups.id =18;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 296, 156, groups.id, groups.companies_id, 10
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 327, 164, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =34;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 40, 29, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 132, 132, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =8;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 301, 292, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 485, 449, groups.id, groups.companies_id, 2
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 450, 77, groups.id, groups.companies_id, 6
        FROM groups
        WHERE groups.id =40;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 168, 114, groups.id, groups.companies_id, 5
        FROM groups
        WHERE groups.id =26;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 77, 43, groups.id, groups.companies_id, 18
        FROM groups
        WHERE groups.id =21;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 68, 4, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =35;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 154, 106, groups.id, groups.companies_id, 9
        FROM groups
        WHERE groups.id =16;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 497, 425, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =1;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 90, 2, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =39;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 402, 255, groups.id, groups.companies_id, 12
        FROM groups
        WHERE groups.id =13;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 494, 347, groups.id, groups.companies_id, 17
        FROM groups
        WHERE groups.id =12;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 237, 98, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =5;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 359, 61, groups.id, groups.companies_id, 14
        FROM groups
        WHERE groups.id =30;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 277, 80, groups.id, groups.companies_id, 16
        FROM groups
        WHERE groups.id =17;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 305, 152, groups.id, groups.companies_id, 13
        FROM groups
        WHERE groups.id =10;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 65, 0, groups.id, groups.companies_id, 11
        FROM groups
        WHERE groups.id =14;
INSERT INTO orders(unfulfilled, fulfilled, groups_id, groups_users_companies_id, customers_id) 
        SELECT 173, 74, groups.id, groups.companies_id, 7
        FROM groups
        WHERE groups.id =27;

UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 11
	                         AND delta_set = 'Main';
-- Fragment ends: 11 --
-- Fragment begins: 12 --
INSERT INTO changelog
                                (change_number, delta_set, start_dt, applied_by, description) VALUES (12, 'Main', NOW(), 'dbdeploy', '12-userPermissions.sql');

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetSuper'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.* TO 'widgetAdmin'@'%' IDENTIFIED BY 'somepassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.groups TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword'; 
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.users TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCorporate'@'%' IDENTIFIED BY 'somepassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.customers TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON widgets.orders TO 'widgetCustomer'@'%' IDENTIFIED BY 'somepassword';


UPDATE changelog
	                         SET complete_dt = NOW()
	                         WHERE change_number = 12
	                         AND delta_set = 'Main';
-- Fragment ends: 12 --
