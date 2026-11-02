CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,   -- Book Accessories | Collectibles | Decor | Keychains
  description TEXT NOT NULL,
  price INTEGER NOT NULL,   -- INR
  original_price INTEGER,   -- INR, shown struck-through
  material TEXT,
  dimensions TEXT,
  image TEXT NOT NULL       -- path under /public
);
INSERT OR IGNORE INTO products VALUES
(1,'Castle Bookmark','Book Accessories','Magical bookmark designed for fans who want a whimsical touch while reading.',150,199,'PLA','(16 x 5 x 0.2) cm','/img/castle-bookmark.webp'),
(2,'Nimbus 2000','Collectibles','Nimbus 2000 miniature, created as a decorative collectible prop.',899,1199,'PLA','(30 x 5 x 15) cm','/img/nimbus-2000.webp'),
(3,'Demadog','Collectibles','Demadog figure, made as a detailed collectible for fans of the Upside Down.',649,799,'PLA','(14 x 8 x 7) cm','/img/demadog.webp'),
(4,'Iron Throne','Decor','Iron Throne model, recreated as a collectible display artifact.',799,999,'PLA','(16 x 10 x 8) cm','/img/iron-throne.webp'),
(5,'Golden Snitch Book Page Holder','Collectibles','Book page holder, designed for readers and collectors.',199,299,'PLA','(15 x 3 x 1) cm','/img/golden-snitch-book-page-holder.webp'),
(6,'Groot','Collectibles','Groot figure, made as a decorative collectible for superhero fans.',449,549,'PLA','(12 x 7 x 7) cm','/img/groot.webp'),
(7,'Demogorgon Bookmark','Book Accessories','A chilling addition to your reading adventures. This Demogorgon bookmark creeps over your pages, bringing a touch of the Upside Down to your favorite books.',99,129,'PLA','(10 x 4 x 0.3) cm','/img/demogorgon-bookmark.webp'),
(8,'Tatooine Diorama','Decor','A snapshot of the twin sunsets. This miniature landscape captures the rugged beauty of the desert planet where stories began. A silent tribute to hope and destiny.',799,999,'PLA','','/img/tatooine-diorama.webp'),
(9,'Hanging Keys (Set of 3)','Decor','Capture the magic of the Sorcerer''s Stone. These intricate flying keys are frozen in mid-flight, ready to unlock memories of the Boy Who Lived. Enchantment for your bookshelf.',150,200,'PLA','','/img/hanging-keys-set-of-3.webp'),
(10,'Thing Hand','Collectibles','3D-printed replica of Thing Hand, designed as a collectible desk artifact for fans of the series.',599,699,'PLA','(14 x 10 x 8) cm','/img/thing-hand.webp'),
(11,'Max Bookmark','Collectibles','Bookmark themed around Max, made for readers who love the series.',199,249,'PLA','(15 x 4 x 0.3) cm','/img/max-bookmark.webp'),
(12,'Golden Snitch','Book Accessories','3D-printed Golden Snitch made as a collectible decorative artifact.',349,499,'PLA','(5 x 25 x 5) cm','/img/golden-snitch.webp'),
(13,'Sorting Hat','Book Accessories','Sorting Hat model, recreated as a detailed collectible for fans.',349,499,'PLA','(7 x 8 x 8) cm','/img/sorting-hat.webp'),
(14,'Deathly Hallows Wall Hanging','Collectibles','Decorative frame featuring the Deathly Hallows symbol.',299,399,'PLA','(12 x 12 x 4) cm','/img/deathly-hallows-wall-hanging.webp'),
(15,'Darth Vader','Decor','The embodiment of power and precision. This meticulously crafted bust of the Dark Lord of the Sith doubles as a functional pen stand. A commanding presence for any desk where order is paramount.',599,799,'PLA','','/img/darth-vader.webp'),
(16,'Hogwarts Bookmark','Book Accessories','Hogwarts-themed bookmark with a magical fandom theme, suitable for readers and collectors.',150,199,'PLA','(15 x 4 x 0.3) cm','/img/hogwarts-bookmark.webp'),
(17,'Sorting Hat Keychain','Keychains','Let the Sorting Hat guide your daily adventures. This compact keychain artifact is a subtle reminder of where you belong in the wizarding world. Meticulously detailed to represent the ancient hat''s wisdom and personality, it''s a small piece of magic for your keys.',79,99,'PLA ','(4 x 7 x 0.3) cm','/img/sorting-hat-keychain.webp'),
(18,'Grace','Keychains','A tribute to scientific curiosity and cosmic friendship. This meticulously crafted figure of Ryland Grace from Project Hail Mary captures the spirit of the man who saved two worlds. Whether as a detailed collectible or a portable keychain, it''s a reminder that we are all made of starstuff.',249,299,'PLA','(8 x 4 x 4)cm','/img/grace.webp'),
(19,'Grogu','Decor','The Child, known to many as Grogu, is a powerful force-sensitive being. This meticulously crafted artifact captures his curious and calm essence. A symbol of hope and the bond between protector and ward, perfect for any Star Wars fan''s collection.',299,399,'PLA ','(4.5 x 5 x 3.5) cm','/img/grogu.webp'),
(20,'Dragon Eggs','Decor','A set of three legendary dragon eggs, meticulously crafted to capture the essence of ancient power. These artifacts represent the heritage of the Targaryen bloodline, each with a unique texture reflecting the elements of fire and shadow. Perfect for any Mother of Dragons'' desk or a collector of epic sagas.',499,599,'PLA ','(3 x 3 x 8) cm','/img/dragon-eggs.webp'),
(21,'Shaded Hogwarts Bookmark','Book Accessories','A sophisticated grey-white-black shaded Harry Potter themed bookmark. Designed for the minimalist witch or wizard who appreciates a subtle touch of magic in their daily reading. This premium artifact is built for those whose identity is forged in the stories they read.',199,299,'PLA ','(16 x 6 x 0.3) cm','/img/shaded-hogwarts-bookmark.webp'),
(22,'Deathly Hallows Piece','Collectibles','The Elder Wand, the Resurrection Stone, and the Cloak of Invisibility. This geometric symbol represents the ultimate mastery over fate. A subtle, powerful nod to the most ancient magic.',149,NULL,'PLA','','/img/deathly-hallows-piece.webp'),
(23,'HP Face Keychain 1','Keychains','Carry a piece of your story wherever you go. This minimalist silhouette of the Boy Who Lived is a subtle, durable token for those who still wait for their letter.',79,99,'PLA','','/img/hp-face-keychain-1.webp'),
(24,'GOT Bookmark','Book Accessories','Never lose your place in the Seven Kingdoms again with this premium GOT-themed bookmark. Featuring intricate sigils and a sleek design, this artifact is built for those whose identity is forged in the stories they read. A subtle yet powerful statement piece for your collection.',199,299,'PLA ','(16 x 6 x 0.3) cm','/img/got-bookmark.webp'),
(25,'Stranger Things Wall Hanging','Decor','Bring a piece of the Upside Down into your world with this iconic Stranger Things wall hanging. Designed with a minimalist yet haunting aesthetic, this piece captures the mysterious vibe of Hawkins. A must-have for those who find beauty in the strange and unusual.',299,NULL,'PLA','(10 x 10 x 0.5) cm','/img/stranger-things-wall-hanging.webp');
