 
INSERT INTO user(username,password) VALUES ('guest@mum.edu','$2a$10$0.ESlGysrPaiW5HaapKwoehzWt5AibgbPPOvMhDv8D6H26QQ/CwhS');
INSERT INTO user(username,password) VALUES ('admin@mum.edu','$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe');
 
INSERT INTO user_roleset (User_Id, roleSet) VALUES (1, 'ROLE_MEMBER');
INSERT INTO user_roleset (username, authority) VALUES (2, 'ROLE_ADMIN');