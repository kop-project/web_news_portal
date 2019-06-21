insert into admins (id, username, password, active)
values (1, 'admin', '$2a$08$K4caitFlhvgf7kEVptW.kutBVpq54bQmt.tJ8OxkGgWhNs44vLv3a', true);

insert into user_role (user_id, roles)
values (1, 'ADMIN');