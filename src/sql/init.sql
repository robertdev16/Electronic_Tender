INSERT INTO user(email, firstName, lastName, username, password) VALUES ('admin@mum.edu', 'admin', 'mum', 'admin@mum.edu', '$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe');
INSERT INTO user(email, firstName, lastName, username, password) VALUES ('guest@mum.edu', 'guest', 'mum', 'guest@mum.edu', '$2a$10$0.ESlGysrPaiW5HaapKwoehzWt5AibgbPPOvMhDv8D6H26QQ/CwhS');
INSERT INTO user(email, firstName, lastName, username, password) VALUES ('geb.meh@gmail.com', 'Gebremedhn', ' ', 'geb.meh@gmail.com', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS');
INSERT INTO user(email, firstName, lastName, username, password) VALUES ('grmahun1@gmail.com', 'Grmahun', ' ', 'grmahun1@gmail.com', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS');
INSERT INTO user(email, firstName, lastName, username, password) VALUES ('zzheng@mum.edu', 'Zhitian', ' ', 'zzheng@mum.edu', '$2a$10$mAligLCL4vxdrWESQO366utD0xrGMA2bSG5rOhMRR4C.U.Kn.h9eS');

INSERT INTO user_roleset (User_id, roleSet) VALUES (1, 'ROLE_ADMIN');
INSERT INTO user_roleset (User_id, roleSet) VALUES (2, 'ROLE_EMPLOYEE');
INSERT INTO user_roleset (User_id, roleSet) VALUES (3, 'ROLE_MEMBER');
INSERT INTO user_roleset (User_id, roleSet) VALUES (4, 'ROLE_ORGANIZATION');
INSERT INTO user_roleset (User_id, roleSet) VALUES (5, 'ROLE_EMPLOYEE');

INSERT INTO category (name, description) VALUES ('Construction', 'About construction and related machinery, building materials supplies');
INSERT INTO category (name, description) VALUES ('Education & Training', 'About education and training related areas');
INSERT INTO category (name, description) VALUES ('Computer & Accessories', 'About computer, accessories, electrical and electronic supplies');
INSERT INTO category (name, description) VALUES ('Industrial Supplies', 'About industrial materials and related supplies');
INSERT INTO category (name, description) VALUES ('Food & Beverage', 'About food and beverage areas');