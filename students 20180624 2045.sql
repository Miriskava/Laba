--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.4.201.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 24.06.2018 20:45:02
-- Версия сервера: 5.5.5-10.1.31-MariaDB
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE students;

--
-- Удалить таблицу `document`
--
DROP TABLE IF EXISTS document;

--
-- Удалить таблицу `common`
--
DROP TABLE IF EXISTS common;

--
-- Удалить таблицу `specialty`
--
DROP TABLE IF EXISTS specialty;

--
-- Удалить таблицу `faculty`
--
DROP TABLE IF EXISTS faculty;

--
-- Удалить таблицу `image`
--
DROP TABLE IF EXISTS image;

--
-- Удалить таблицу `user`
--
DROP TABLE IF EXISTS user;

--
-- Установка базы данных по умолчанию
--
USE students;

--
-- Создать таблицу `user`
--
CREATE TABLE user (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  role varchar(255) NOT NULL DEFAULT 'user',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Хранение данных для авторизации';

--
-- Создать индекс `username` для объекта типа таблица `user`
--
ALTER TABLE user
ADD UNIQUE INDEX username (username);

--
-- Создать таблицу `image`
--
CREATE TABLE image (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  title int(11) NOT NULL COMMENT 'Описание',
  name int(11) NOT NULL COMMENT 'Имя сохранения в бд',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Хранение картинок о всех достижениях до поступления в ВУЗ';

--
-- Создать таблицу `faculty`
--
CREATE TABLE faculty (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name_fac text NOT NULL,
  dean text NOT NULL,
  deputy_dean text NOT NULL,
  phone text NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Таблица факультетов';

--
-- Создать таблицу `specialty`
--
CREATE TABLE specialty (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_fac int(10) UNSIGNED NOT NULL,
  name_spec text NOT NULL COMMENT 'Название специальности',
  short_name text NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Таблица специальностей';

--
-- Создать внешний ключ
--
ALTER TABLE specialty
ADD CONSTRAINT FK_specialty_faculty_id FOREIGN KEY (id_fac)
REFERENCES faculty (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `common`
--
CREATE TABLE common (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  surname text NOT NULL COMMENT 'Фамилия',
  name text NOT NULL COMMENT 'Имя',
  patronymic text NOT NULL COMMENT 'Отчество',
  date_birth date NOT NULL COMMENT 'Дата рождения',
  place_birth text NOT NULL COMMENT 'Место рождения',
  status text NOT NULL COMMENT 'Семейное положение',
  university text NOT NULL COMMENT 'Место обучения',
  id_faculty int(10) UNSIGNED NOT NULL COMMENT 'Факультет',
  id_specialty int(10) UNSIGNED NOT NULL COMMENT 'Направление',
  year_rec year(4) NOT NULL COMMENT 'Год поступления',
  phone_number text NOT NULL COMMENT 'Номер телефона',
  email text NOT NULL COMMENT 'Адрес электронной почты',
  address text NOT NULL COMMENT 'Место жительства',
  network text NOT NULL COMMENT 'Адрес в соц. сетях',
  id_image int(10) UNSIGNED NOT NULL COMMENT 'Фото профиля',
  id_user int(10) UNSIGNED NOT NULL COMMENT 'Связующий ключ',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Хранение общей информации о студенте';

--
-- Создать индекс `id_user` для объекта типа таблица `common`
--
ALTER TABLE common
ADD UNIQUE INDEX id_user (id_user);

--
-- Создать внешний ключ
--
ALTER TABLE common
ADD CONSTRAINT FK_common_faculty_id FOREIGN KEY (id_faculty)
REFERENCES faculty (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE common
ADD CONSTRAINT FK_common_image_id FOREIGN KEY (id_image)
REFERENCES image (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE common
ADD CONSTRAINT common_ibfk_1 FOREIGN KEY (id_user)
REFERENCES user (id);

--
-- Создать таблицу `document`
--
CREATE TABLE document (
  id int(10) NOT NULL AUTO_INCREMENT,
  id_common int(10) UNSIGNED NOT NULL,
  type text NOT NULL COMMENT 'Тип документа',
  title text NOT NULL COMMENT 'Название/тема',
  year year(4) NOT NULL COMMENT 'год сдачи/получения',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Файлы документов студента';

--
-- Создать внешний ключ
--
ALTER TABLE document
ADD CONSTRAINT FK_document_common_id FOREIGN KEY (id_common)
REFERENCES common (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Вывод данных для таблицы user
--
-- Таблица students.user не содержит данных

-- 
-- Вывод данных для таблицы image
--
-- Таблица students.image не содержит данных

-- 
-- Вывод данных для таблицы faculty
--
INSERT INTO faculty VALUES
(1, 'Инженерно-экономический факультет', '', '', ''),
(2, 'Автомеханический факультет', '', '', '');

-- 
-- Вывод данных для таблицы common
--
-- Таблица students.common не содержит данных

-- 
-- Вывод данных для таблицы specialty
--
-- Таблица students.specialty не содержит данных

-- 
-- Вывод данных для таблицы document
--
-- Таблица students.document не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;