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

--username is the same as email, and initial password is '123456'
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('admin@mum.edu', 'admin', 'mum', 'admin@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 1, 1);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('guest@mum.edu', 'guest', 'mum', 'guest@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 2, 2);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('geb.meh@gmail.com', 'Gebremedhn', ' ', 'geb.meh@gmail.com', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 3, 3);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('grmahun1@gmail.com', 'Grmahun', ' ', 'grmahun1@gmail.com', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 4, 4);
INSERT INTO user(email, firstName, lastName, username, password, address_id, phone_id) VALUES ('zzheng@mum.edu', 'Zhitian', ' ', 'zzheng@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS', 5, 5);

INSERT INTO user_roleset (User_id, roleSet) VALUES (1, 'ROLE_ADMIN');
INSERT INTO user_roleset (User_id, roleSet) VALUES (1, 'ROLE_EMPLOYEE');
INSERT INTO user_roleset (User_id, roleSet) VALUES (2, 'ROLE_EMPLOYEE');
INSERT INTO user_roleset (User_id, roleSet) VALUES (3, 'ROLE_MEMBER');
INSERT INTO user_roleset (User_id, roleSet) VALUES (4, 'ROLE_MEMBER');
INSERT INTO user_roleset (User_id, roleSet) VALUES (4, 'ROLE_ORGANIZATION');
INSERT INTO user_roleset (User_id, roleSet) VALUES (5, 'ROLE_EMPLOYEE');

INSERT INTO employee (birthday, gender, user_id) VALUES ('2002-02-02', 'Male', 1);
INSERT INTO employee (birthday, gender, user_id) VALUES ('1999-09-09', 'Male', 2);
INSERT INTO employee (birthday, gender, user_id) VALUES ('2001-01-01', 'Male', 5);

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

INSERT INTO tender (publishUser_id, phone_id, address_id, refId, attachmentFileName, agency, contactPerson, contactEmail, postDate, deadline, title, description) VALUES (1, 3, 2, 'SFET-398123', '20160831123000license.png', 'Sydney Trains', 'George Rozycki', 'jerzy.rozycki@transport.nsw.gov.au', '2016-05-27 12:56:32', '2016-12-31', 'Electrical and Comms installation services', 'As part of the Sydney Trains Station Refresh Program, Town Hall station modernisation works are being undertaken. This project provides improved access and aesthetics benefitting passenger traffic flows and station presentation. Sydney Trains is seeking tenders from experienced and suitably qualified organisations who can provide Electrical and Comms Installation Services to perform the following works at Town Hall Station platforms - platform lighting upgrade, Comms upgrade, Fire and Life Safety upgrade. The tender is tentatively scheduled to be released in August/September 2016.');
INSERT INTO tender (publishUser_id, phone_id, address_id, refId, agency, contactPerson, contactEmail, postDate, deadline, title, description) VALUES (1, 5, 3, 'SFET-936521', 'Ministry of Health', 'Tim Sweeney', 'timothy.sweeney@health.nsw.gov.et', '2016-02-04 15:38:02', '2016-12-31', 'Nursing and Midwifery graduate certificate online courses', 'The Health Education and Training Institute (HETI), in partnership with the NSW Ministry of Health, will be looking to offer three distinct Open Requests for Tender (RFT) via eTendering for the provision of Nursing and Midwifery graduate certificate online courses for the NSW Health system.');
INSERT INTO tender (publishUser_id, phone_id, address_id, refId, agency, contactPerson, contactEmail, postDate, deadline, title, description) VALUES (2, 2, 1, 'SFET-790361', 'Transport for NSW', 'PSU Procurement', 'psu.procurement@projects.transport.nsw.gov.au', '2016-07-22 10:11:52', '2016-10-20', 'Electrical transmission and distribution equipment', 'The Power Supply Upgrade Program is designed to ensure Sydney rail network is able to meet expected power requirements to support future timetables and air-conditioned fleet. The program involves upgrades to substations, section huts, overhead wiring and feeders as well the construction of new infrastrucutre across the network.');
INSERT INTO tender (publishUser_id, phone_id, address_id, refId, agency, contactPerson, contactEmail, postDate, deadline, title, description) VALUES (2, 2, 1, 'SFET-101112', 'A and T Engineering', 'PSU Procurement', 'steven.la@transport.nsw.gov.au', '2016-08-22 19:35:50', '2016-11-20', 'Industrial Machinery Maintenance', 'TA and T Engineering and Safety PLC has been set up to fill the gap seen in various Industries in the area of Industrial Machinery Maintenance, Installation, Preventive Maintenance and Safe Practices. We provide services in the following area.');
INSERT INTO tender (publishUser_id, phone_id, address_id, refId, agency, contactPerson, contactEmail, postDate, deadline, title, description) VALUES (2, 2, 1, 'SFET-261516', 'A and T Engineering', 'PSU Procurement', 'steven.la@transport.nsw.gov.au', '2016-08-22 19:38:22', '2016-12-01', 'Construction', 'Ethio Telecom invites all interested and eligible bidders by this National competitive Bid. Construction of Nine Watch tower at Addis Ababa, Akaki Warehouse');


INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (3, 1);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (4, 1);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (2, 2);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (1, 3);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (4, 3);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (1, 4);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (4, 4);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (1, 5);
INSERT INTO category_tender (categoryList_id, tenderList_id) VALUES (4, 5);

