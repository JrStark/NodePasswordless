-- -----------------------------
-- table post
-- -----------------------------

INSERT INTO "posts" ("title", "description_courte", "description_longue", "image", "enabled", "user_id", "category_id") VALUES
('Un article pour tester', "une description courte de l'article", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto iste accusamus officia sunt voluptates esse unde delectus cupiditate quaerat. Voluptates saepe eligendi quisquam id, explicabo culpa itaque rerum neque expedita rem reprehenderit! Asperiores dicta, veritatis minus ea deleniti magni aspernatur porro, necessitatibus possimus vitae optio dignissimos natus exercitationem quaerat ipsam.", "/public/images/image1.jpg", 1, 1);

INSERT INTO "categories" ("name", "description", "image", "enabled", "user_id", "category_id") VALUES
('Categorie n°1', 'ceci est une description', 'public/images/images02.jpg', 1, 1, 1);

INSERT INTO "users" ("first_name", "last_name", "email", "token", "enabled") VALUES
('Toto', 'Lartichaut', 'hello.iters@gmail.com', 'e38ec985-a9e4-4ad6-9057-6667f5b9e12c', 1),
('Tata', 'Banana', 'jerry.estelle.dumont@gmail.com', '94e3662ccd954ef9ba02d7a6e25704ab', 1);

INSERT INTO "roles" ("name", "level") VALUES
('User', 1),
('Visitor', 0),
('Admin', 3),
('Author', 2);