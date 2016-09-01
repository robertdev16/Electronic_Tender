INSERT INTO address (streetName, apartmentNumber, city, state, zipCode, country) VALUES ('1000 North 4th St.', 'MR 721', 'Fairfield', 'IA', '52557-1996', 'US');
INSERT INTO address (streetName, apartmentNumber, city, state, zipCode, country) VALUES ('1000 North 4th St.', 'MR 722', 'Fairfield', 'IA', '52557-1996', 'US');
INSERT INTO address (streetName, apartmentNumber, city, state, zipCode, country) VALUES ('1000 North 4th St.', 'MR 723', 'Fairfield', 'IA', '52557-1996', 'US');
INSERT INTO address (streetName, apartmentNumber, city, state, zipCode, country) VALUES ('1000 North 4th St.', 'MR 724', 'Fairfield', 'IA', '52557-1996', 'US');
INSERT INTO address (streetName, apartmentNumber, city, state, zipCode, country) VALUES ('1000 North 4th St.', 'MR 725', 'Fairfield', 'IA', '52557-1996', 'US');

INSERT INTO phone (area, prefix, number) VALUES ('641', '472', '6661');
INSERT INTO phone (area, prefix, number) VALUES ('641', '472', '6662');
INSERT INTO phone (area, prefix, number) VALUES ('641', '472', '6663');
INSERT INTO phone (area, prefix, number) VALUES ('641', '472', '6664');
INSERT INTO phone (area, prefix, number) VALUES ('641', '472', '6665');


INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('admin@mum.edu', 'admin', 'mum', 'admin@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 1, 1);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('guest@mum.edu', 'guest', 'mum', 'guest@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 2, 2);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('geb.meh@gmail.com', 'Gebremedhn', ' ', 'geb.meh@gmail.com', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 3, 3);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('grmahun1@gmail.com', 'Grmahun', ' ', 'grmahun1@gmail.com', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 4, 4);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('zzheng@mum.edu', 'Zhitian', ' ', 'zzheng@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 5, 5);

INSERT INTO user_roleset (User_id, roleSet) VALUES (1, 'ROLE_ADMIN');
INSERT INTO user_roleset (User_id, roleSet) VALUES (2, 'ROLE_EMPLOYEE');
INSERT INTO user_roleset (User_id, roleSet) VALUES (3, 'ROLE_MEMBER');
INSERT INTO user_roleset (User_id, roleSet) VALUES (4, 'ROLE_ORGANIZATION');
INSERT INTO user_roleset (User_id, roleSet) VALUES (5, 'ROLE_EMPLOYEE');

INSERT INTO employee (birthday, gender, user_id) VALUES ('1999-09-09', 'Male', 2);
INSERT INTO employee (birthday, gender, user_id) VALUES ('2001-01-01', 'Male', 3);

INSERT INTO member (user_id) VALUES (3);
INSERT INTO member (user_id, organizationName, licenseFileName) VALUES (4, 'SpringFuns.Org', '20160831123000license.png');

INSERT INTO category (name, description) VALUES ('Construction', 'About construction and related machinery, building materials supplies');
INSERT INTO category (name, description) VALUES ('Education & Training', 'About education and training related areas');
INSERT INTO category (name, description) VALUES ('Computer & Accessories', 'About computer, accessories, electrical and electronic supplies');
INSERT INTO category (name, description) VALUES ('Industrial Supplies', 'About industrial materials and related supplies');
INSERT INTO category (name, description) VALUES ('Food & Beverage', 'About food and beverage areas');

INSERT INTO category_member (selectedCategories_id, subscribedMembers_id) VALUES (1, 1);
INSERT INTO category_member (selectedCategories_id, subscribedMembers_id) VALUES (3, 1);
INSERT INTO category_member (selectedCategories_id, subscribedMembers_id) VALUES (4, 1);
INSERT INTO category_member (selectedCategories_id, subscribedMembers_id) VALUES (2, 2);
INSERT INTO category_member (selectedCategories_id, subscribedMembers_id) VALUES (3, 2);
INSERT INTO category_member (selectedCategories_id, subscribedMembers_id) VALUES (5, 2);

--INSERT INTO tender (publishUser_id, phone_id, address_id, refId, agency, contactPerson, contactEmail, postDate, deadline, title, description) VALUES (1, 1);


